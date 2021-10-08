using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.HtmlControls;
using System.Web.UI.DataVisualization.Charting;
public partial class admin_dashboard : System.Web.UI.Page
{
    Admin_Login al = new Admin_Login();
    DataSet ds = new DataSet();
    DataTable dt = new DataTable();
    DataTable dt2 = new DataTable();
    public SqlConnection con = null;
     object[] arr;
    object[] arr2;
    object[] arr3;
    int i, j, k, m, p,r,sum=0;
    SqlDataAdapter da = new SqlDataAdapter();

    object[] questionid = new object[2];

    protected void Page_Load(object sender, EventArgs e)
    {
        registered_user();
        download();
        contact();
        tutor_registeration();
        lbltotal.Text = "Total number of Teachers Registered:"+ sum.ToString();
        feedback();
        dt.Clear();
        //string sql = "select count(*) from blog_ques";
        //int i = (int)al.count(sql);
        //string sql2 = "select user_id,question,question_id from blog_ques";
       
        //dt = al.select(sql2);
        //k = i;

        chart();
        contact_us();
     
    }
    public void registered_user()
    {
        try
        {
            string sql = "select Count(user_id) from user_registeration";
            int r = (int)al.count(sql);
            lbluser.Text = r.ToString();
        }
        catch (Exception ex)
        {
        }
    }
    public void contact()
    {
        try
        {
            string sql = "select Count(contact_id) from contact_us";
            int r = (int)al.count(sql);
            lblcontact.Text = r.ToString();
        }
        catch (Exception ex)
        {
        }
    }
    public void download()
    {
        try
        {
            string sql = "select sum(download) down from ( select download from question_board1 union select download from question_mock union select download from tbl_notes)t";
            int r = (int)al.count(sql);
            lbldown.Text = r.ToString();
        }
        catch (Exception ex)
        {
        }
    }
    public void tutor_registeration()
    {
        try
        {
            string sql = "SELECT tutor_state,tutor_city,tutor_qualification,count(tutor_name) as no_tutors from tutor_registeration group by tutor_state,tutor_city,tutor_qualification ";
            dt = al.select(sql);
            rpttutor.DataSource = null;
            rpttutor.DataSource = dt.DefaultView;
            rpttutor.DataBind();
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                sum = sum + Convert.ToInt32(dt.Rows[i]["no_tutors"]);
            }
            //r = Convert.ToInt32(dt.Columns.Count.ToString());
            dt.Columns.Clear();
        }
        catch (Exception ex)
        {
        }
    }
    public void feedback()
    {
        try
        {
            dt.Clear();
            string sql = "select top 10 user_email,user_msg from feedback order by entry_date desc ";
            dt = al.select(sql);
            if (dt.Rows.Count > 0)
            {
                gvr_feed.DataSource = dt;
                gvr_feed.DataBind();


            }
            else
            {
                gvr_feed.DataSource = null;
                gvr_feed.DataBind();
            }

        }
        catch (Exception ex)
        {
        }
    }
         protected void gvr_feed_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        try
        {
            gvr_feed.PageIndex = e.NewPageIndex;
            if (Session["SortedView"] != null)
            {
                gvr_feed.DataSource = Session["SortedView"];
                gvr_feed.DataBind();
            }
            else
            {
                feedback();
            }
        }
        catch (Exception ex)
        {
        }
    }
         public void contact_us()
         {
             try
             {
                 dt.Clear();
                 string sql = "select user_name,user_email,user_message from contact_us order by entry_date desc ";
                 dt = al.select(sql);
                 if (dt.Rows.Count > 0)
                 {
                     gvr_contact.DataSource = dt;
                     gvr_contact.DataBind();


                 }
                 else
                 {
                     gvr_contact.DataSource = null;
                     gvr_contact.DataBind();
                 }
             }
             catch (Exception ex)
             {
             }
         }
         protected void gvr_contact_PageIndexChanging(object sender, GridViewPageEventArgs e)
         {
             try
             {
                 gvr_feed.PageIndex = e.NewPageIndex;
                 if (Session["SortedView"] != null)
                 {
                     gvr_contact.DataSource = Session["SortedView"];
                     gvr_contact.DataBind();
                 }
                 else
                 {
                     contact_us();
                 }
             }
             catch (Exception ex)
             {
             }
         }



         public void chart()
         {
             try
             {
                 dt.Columns.Clear();
                 dt.Clear();
                 string s = "Select  * from(select  datename(year,a.dwn_date) as year1,sum(isnull(a.download,0))as download1,datename(year,b.dwn_date) as year2,sum(isnull(b.download,0))as download2,datename(year,c.dwn_date) as year3,sum(isnull(c.download,0))as download3 from question_board1 a inner join tbl_notes b on a.class_id=b.class_id inner join question_mock c on  a.class_id=c.class_id group by datename(year,b.dwn_date),datename(year,a.dwn_date),datename(year,c.dwn_date))abc where year1 is not null and year2 is not null and year3 is not null order by download1 desc ";
                 dt = al.select(s);

                 Chart1.Series[0].ChartType = SeriesChartType.Column;
                 Chart1.Series[0].AxisLabel = "Months";
                 Chart1.ChartAreas["ChartArea1"].AxisY.Title = "Number of downloads";
                 Chart1.ChartAreas["ChartArea1"].AxisY.TitleFont = new System.Drawing.Font("Arial", 12f, System.Drawing.FontStyle.Bold);
                 Chart1.ChartAreas["ChartArea1"].AxisX.TitleFont = new System.Drawing.Font("Arial", 12f, System.Drawing.FontStyle.Bold);
                 Chart1.ChartAreas["ChartArea1"].AxisX.TitleForeColor = System.Drawing.Color.White;
                 Chart1.ChartAreas["ChartArea1"].AxisY.TitleForeColor = System.Drawing.Color.White;
                 Chart1.ChartAreas["ChartArea1"].AxisY.TextOrientation = TextOrientation.Rotated90;
                 Chart1.ChartAreas["ChartArea1"].AxisX.LabelStyle.Angle = 45;

                 Chart1.DataSource = dt;
                 Chart1.DataBind();

             }
             catch (Exception ex)
             {
 
         }
          }
}
