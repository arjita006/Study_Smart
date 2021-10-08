using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;
using System.Drawing;
using System.Web.UI.HtmlControls;

public partial class website_viewcontent : System.Web.UI.Page
{
    Admin_Login al = new Admin_Login();
    LinkButton lnk = null;
    DataTable dt = new DataTable();
    DataTable dt1 = new DataTable();
    DataSet ds = new DataSet();
    string ch_name,c;
    string sql, sql1;
    int i,i1=0;
    protected void Page_Load(object sender, EventArgs e)
    {

       
       
            if (!IsPostBack)
            {
                string c1 = Session["class"].ToString();
                string s = "Select chapter_name,topic_name,answer,image from content where class_name='" + c1 + "'";
                dt1 = al.select(s);
                string ch = dt1.Rows[0]["chapter_name"].ToString();
                dt1.Clear();
                string q = "Select topic_name,answer,image from content where chapter_name='" + ch + "' and class_name='" + c1 + "'";
                dt1 = al.select(q);
                repeater1.DataSource = dt1.DefaultView;
                repeater1.DataBind();
                link();

            }
            if (  Convert.ToString( Session["class"]) == "9")
            {
                lnkbtn9.Visible = false;
            }
            if ( Convert.ToString( Session["class"])== "10")
            {
                lnkbtn10.Visible = false;
            }
            if (Convert.ToString(Session["class"]) == "11")
            {
                lnkbtn11.Visible = false;
            }
            if (Convert.ToString(Session["class"]) == "12")
            {
                lnkbtn12.Visible = false;
            }
            dynamiclnk(Convert.ToInt32(ViewState["chapterCount"]), (DataTable)ViewState["chapterName"]);
       
    }
    public void link()
    {
        try
        {
            dt1.Clear();
            c = (string)(Session["class"]);
            sql1 = "select  count(distinct(chapter_name)) from content where class_name='" + c + "'";
            sql = "select distinct(chapter_name) from content where class_name='" + c + "'order by chapter_name desc";
            dt = al.select(sql);
            i = al.count(sql1);
            ViewState["chapterCount"] = i;
            ViewState["chapterName"] = dt;
        }
        catch (Exception ex)
        {
        }
    }
    public void dynamiclnk(int i,DataTable dt)
    {
        try
        {
            for (int a = 0; a < i; a++)
            {
                Panel1.Controls.Add(new LiteralControl("<br/>"));
                LinkButton lnk = new LinkButton();
                lnk.ID = "lnk" + a;
                lnk.Text = dt.Rows[a]["chapter_name"].ToString();
                ch_name = lnk.Text;
                lnk.Click += Clicked;
                Panel1.Controls.Add(lnk);
            }
        }
        catch (Exception ex)
        {
        }
       
            }
    private void Clicked(object sender, EventArgs e)
    {
        try
        {
            string class_name = ((LinkButton)sender).Text.Trim();
            c = (string)(Session["class"]);
            dt1.Clear();
            string s = "Select topic_name,answer,image from content where chapter_name='" + class_name + "' and class_name='" + c + "'";
            dt1 = al.select(s);
            repeater1.DataSource = dt1.DefaultView;
            repeater1.DataBind();
        }
        catch (Exception ex)
        {
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            Response.Redirect("feedback.aspx");
        }
        catch (Exception ex)
        {
        }
    }
    protected void lkbtn9_Click(object sender, EventArgs e)
    {
        try
        {
            lnkbtn9.Visible = false;
            lnkbtn10.Visible = true;
            lnkbtn11.Visible = true;
            lnkbtn12.Visible = true;
            Session["class"] = "9";
            string s = "Select chapter_name,topic_name,answer,image from content where class_name='" + 9 + "'";
            dt1 = al.select(s);
            string ch = dt1.Rows[0]["chapter_name"].ToString();
            dt1.Clear();
            string q = "Select topic_name,answer,image from content where chapter_name='" + ch + "' and class_name='" + 9 + "'";
            dt1 = al.select(q);
            repeater1.DataSource = dt1.DefaultView;
            repeater1.DataBind();
            Panel1.Controls.Clear();
            link();
            dynamiclnk(Convert.ToInt32(ViewState["chapterCount"]), (DataTable)ViewState["chapterName"]);
            i1++;
        }
        catch (Exception ex)
        {
        }
    }
    protected void lkbtn10_Click(object sender, EventArgs e)
    {
        try
        {
            lnkbtn10.Visible = false;
            lnkbtn9.Visible = true;
            lnkbtn11.Visible = true;
            lnkbtn12.Visible = true;
            Session["class"] = "10";
            string s = "Select chapter_name,topic_name,answer,image from content where class_name='" + 10 + "'";
            dt1 = al.select(s);
            string ch = dt1.Rows[0]["chapter_name"].ToString();
            dt1.Clear();
            string q = "Select topic_name,answer,image from content where chapter_name='" + ch + "' and class_name='" + 10+ "'";
            dt1 = al.select(q);
            repeater1.DataSource = dt1.DefaultView;
            repeater1.DataBind();
            Panel1.Controls.Clear();
            link();
            dynamiclnk(Convert.ToInt32(ViewState["chapterCount"]), (DataTable)ViewState["chapterName"]);
            i1++;
        }
        catch (Exception ex)
        {
        }
    }
    protected void lkbtn11_Click(object sender, EventArgs e)
    {
        try
        {
            lnkbtn11.Visible = false;
            lnkbtn10.Visible = true;
            lnkbtn9.Visible = true;
            lnkbtn12.Visible = true;
            Session["class"] = "11";
            string s = "Select chapter_name,topic_name,answer,image from content where class_name='" + 11 + "'";
            dt1 = al.select(s);
            string ch = dt1.Rows[0]["chapter_name"].ToString();
            dt1.Clear();
            string q = "Select topic_name,answer,image from content where chapter_name='" + ch + "' and class_name='" + 11 + "'";
            dt1 = al.select(q);
            repeater1.DataSource = dt1.DefaultView;
            repeater1.DataBind();
            Panel1.Controls.Clear();
            link();
            dynamiclnk(Convert.ToInt32(ViewState["chapterCount"]), (DataTable)ViewState["chapterName"]);
            i1++;
        }
        catch (Exception ex)
        {
        }
    }
    protected void lkbtn12_Click(object sender, EventArgs e)
    {
        try
        {
            lnkbtn12.Visible = false;
            lnkbtn10.Visible = true;
            lnkbtn11.Visible = true;
            lnkbtn9.Visible = true;
            Session["class"] = "12";
            string s = "Select chapter_name,topic_name,answer,image from content where class_name='" + 12 + "'";
            dt1 = al.select(s);
            string ch = dt1.Rows[0]["chapter_name"].ToString();
            dt1.Clear();
            string q = "Select topic_name,answer,image from content where chapter_name='" + ch + "' and class_name='" + 12 + "'";
            dt1 = al.select(q);
            repeater1.DataSource = dt1.DefaultView;
            repeater1.DataBind();
            Panel1.Controls.Clear();
            link();
            dynamiclnk(Convert.ToInt32(ViewState["chapterCount"]), (DataTable)ViewState["chapterName"]);
            i1++;
        }
        catch (Exception ex)
        {
        }
    }
}