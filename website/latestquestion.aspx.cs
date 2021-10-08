using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
public partial class website_latestquestion : System.Web.UI.Page
{
    Admin_Login al = new Admin_Login();

    DataTable dt = new DataTable();
    DateTime date, date1;
    string d1, d2;
    string c;
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            c = Convert.ToString(Session["class"]);
            date = DateTime.Now;
            date1 = DateTime.Now.AddMonths(-2);
            d1 = Convert.ToDateTime(date).ToString("yyyy/MM/dd");
            d2 = Convert.ToDateTime(date1).ToString("yyyy/MM/dd");
            int id;
            string s;
            if (!IsPostBack)
            {
                if (c == "10")
                {
                    string sql = "select paper_name,paper_file,paper_id,paper_image,paper_year,class_name,lang_name from question_board1 where  class_name='" + c + "' and  (entry_date>='" + d2 + "' or entry_date<='" + d1 + "') ";
                    dt = al.select(sql);
                    gvr_latestquestion.DataSource = dt.DefaultView;
                    gvr_latestquestion.DataBind();
                }
                else
                {
                    string sql = "select paper_name,paper_file,paper_id,paper_image,paper_year,class_name,lang_name from question_board1 where class_name='" + c + "' and ( entry_date>='" + d2 + "' or entry_date<='" + d1 + "' ) ";
                    dt = al.select(sql);
                    gvr_latestquestion.DataSource = dt.DefaultView;
                    gvr_latestquestion.DataBind();
                }
            }

            if (Request.QueryString["paper"] != null)
            {
                string downloadPath = Request.QueryString["paper"].ToString();
                id = Convert.ToInt32(Request.QueryString["id"]);
                if (Session["log_user"] != null)
                {
                    if (c == "10")
                    {
                        s = "update  question_board1 set download=(select isnull(max(download),0)+1 from question_board1 where paper_id=" + id + ") where paper_id=" + id + "";
                        int z = al.insert(s);
                        Response.Redirect(downloadPath);
                    }

                    else
                    {
                        s = "update  question_board1 set download=(select isnull(max(download),0)+1 from question_board1 where paper_id=" + id + ") where paper_id=" + id + "";
                        int z = al.insert(s);
                        Response.Redirect(downloadPath);
                    }
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "notify", "alert('Please sign in first');", true);
                }

            }
        }
        catch (Exception ex)
        {
        }
    
    }
    protected void gvr_latestquestion_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        try
        {
            gvr_latestquestion.PageIndex = e.NewPageIndex;
            if (Session["SortedView"] != null)
            {
                gvr_latestquestion.DataSource = Session["SortedView"];
                gvr_latestquestion.DataBind();
            }
            else
            {
                bind_class();
            }
        }
        catch (Exception ex)
        {
        }
    }

    private void bind_class()
    {
        try
        {
            dt.Clear();
            dt = al.select("exec ques_board @action=2");
            if (dt.Rows.Count > 0)
            {
                gvr_latestquestion.DataSource = dt;
                gvr_latestquestion.DataBind();
            }
            else
            {
                gvr_latestquestion.DataSource = null;
                gvr_latestquestion.DataBind();
            }
        }
        catch (Exception ex)
        {
        }
    }
}