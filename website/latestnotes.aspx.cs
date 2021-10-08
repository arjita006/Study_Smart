using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class website_latestnotes : System.Web.UI.Page
{
    Admin_Login al = new Admin_Login();
    
    DataTable dt = new DataTable();
    DateTime date,date1;
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
                string sql = "select notes_name,notes_file,notes_id,notes_image,class_name,lang_name from tbl_notes where  class_name='" + c + "' and (entry_date>='" + d2 + "' or entry_date<='" + d1 + "') ";
                dt = al.select(sql);
                gvr_latestnotes.DataSource = dt.DefaultView;
                gvr_latestnotes.DataBind();
            }

            if (Request.QueryString["paper"] != null)
            {
                string downloadPath = Request.QueryString["paper"].ToString();
                id = Convert.ToInt32(Request.QueryString["id"]);
                if (Session["log_user"] != null)
                {
                    s = "update  tbl_notes set download=(select isnull(max(download),0)+1 from tbl_notes where notes_id=" + id + ") where notes_id=" + id + "";
                    int z = al.insert(s);
                    Response.Redirect(downloadPath);

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
    protected void gvr_latestnotes_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        try
        {
            gvr_latestnotes.PageIndex = e.NewPageIndex;
            if (Session["SortedView"] != null)
            {
                gvr_latestnotes.DataSource = Session["SortedView"];
                gvr_latestnotes.DataBind();
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
            dt = al.select("exec notes @action=2");
            if (dt.Rows.Count > 0)
            {
                gvr_latestnotes.DataSource = dt;
                gvr_latestnotes.DataBind();
            }
            else
            {
                gvr_latestnotes.DataSource = null;
                gvr_latestnotes.DataBind();
            }
        }
        catch (Exception ex)
        {
        }
    }
}