using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
public partial class website_latestmockpaper : System.Web.UI.Page
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
                //if (c == "9")
                //{
                //    string sql = "select m_paper_name,m_paper_file,m_paper_id,m_paper_image,class_name,lang_name from question_mock where entry_date>='" + d2 + "' and entry_date<='" + d1 + "' and class_name='" + c + "' ";
                //    dt = al.select(sql);
                //    repeater1.DataSource = dt.DefaultView;
                //    repeater1.DataBind();
                //}
                //else
                if (c == "9")
                {
                    string sql = "select m_paper_name,m_paper_file,m_paper_id,m_paper_img,m_paper_year,class_name,lang_name from question_mock where  class_name='" + c + "' and  (entry_date>='" + d2 + "' or entry_date<='" + d1 + "') ";
                    dt = al.select(sql);
                    gvr_latestmock.DataSource = dt.DefaultView;
                    gvr_latestmock.DataBind();
                }
                //else if (c == "11")
                //{
                //    string sql = "select m_paper_name,m_paper_file,m_paper_id,m_paper_image,class_name,lang_name from question_mock where entry_date>='" + d2 + "' and entry_date<='" + d1 + "' and class_name='" + c + "' ";
                //    dt = al.select(sql);
                //    repeater1.DataSource = dt.DefaultView;
                //    repeater1.DataBind();
                //}
                else
                {
                    string sql = "select m_paper_name,m_paper_file,m_paper_id,m_paper_img,m_paper_year,class_name,lang_name from question_mock where class_name='" + c + "' and ( entry_date>='" + d2 + "' or entry_date<='" + d1 + "' ) ";
                    dt = al.select(sql);
                    gvr_latestmock.DataSource = dt.DefaultView;
                    gvr_latestmock.DataBind();
                }
            }

            if (Request.QueryString["paper"] != null)
            {
                string downloadPath = Request.QueryString["paper"].ToString();
                id = Convert.ToInt32(Request.QueryString["id"]);
                if (Session["log_user"] != null)
                {
                    //if (c == "9")
                    //{
                    //    s = "update  question_mock set download=(select isnull(max(download),0)+1 from question_mock where m_paper_id=" + id + ") where m_paper_id=" + id + "";
                    //    int z = al.insert(s);
                    //    Response.Redirect(downloadPath);
                    //}
                    //else 
                    if (c == "9")
                    {
                        s = "update  question_mock set download=(select isnull(max(download),0)+1 from question_mock where m_paper_id=" + id + ") where m_paper_id=" + id + "";
                        int z = al.insert(s);
                        Response.Redirect(downloadPath);
                    }
                    //else if (c == "11")
                    //{
                    //    s = "update  question_mock set download=(select isnull(max(download),0)+1 from question_mock where m_paper_id=" + id + ") where m_paper_id=" + id + "";
                    //    int z = al.insert(s);
                    //    Response.Redirect(downloadPath);
                    //}
                    //else if(c=="12")
                    else
                    {
                        s = "update  question_mock set download=(select isnull(max(download),0)+1 from question_mock where m_paper_id=" + id + ") where m_paper_id=" + id + "";
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
    protected void gvr_latestmock_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        try
        {
            gvr_latestmock.PageIndex = e.NewPageIndex;
            if (Session["SortedView"] != null)
            {
                gvr_latestmock.DataSource = Session["SortedView"];
                gvr_latestmock.DataBind();
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
            dt = al.select("exec ques_mock @action=2");
            if (dt.Rows.Count > 0)
            {
                gvr_latestmock.DataSource = dt;
                gvr_latestmock.DataBind();
            }
            else
            {
                gvr_latestmock.DataSource = null;
                gvr_latestmock.DataBind();
            }
        }
        catch (Exception ex)
        {
        }
    }
    
    }
    