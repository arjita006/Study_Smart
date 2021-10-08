using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
public partial class account_tutor_viewupload : System.Web.UI.Page
{
    Admin_Login al = new Admin_Login();
    DataTable dt = new DataTable();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bind_class();
        }
    }

    protected void gvr_view_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvr_upload.PageIndex = e.NewPageIndex;
        try
        {
            if (Session["SortedView"] != null)
            {
                gvr_upload.DataSource = Session["SortedView"];
                gvr_upload.DataBind();
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
        string email=Convert.ToString(Session["log_tutor"]);
        dt.Clear();
        dt = al.select("select category,file_name from tutor_upload where user_email='"+email+"'");
        try
        {
            if (dt.Rows.Count > 0)
            {
                gvr_upload.DataSource = dt;
                gvr_upload.DataBind();
            }
            else
            {
                gvr_upload.DataSource = null;
                gvr_upload.DataBind();
            }
        }
        catch (Exception ex)
        {
        }
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        try
        {
            Session["log_tutor"] = null;
            Response.Redirect("~/website/index.aspx");
        }
        catch (Exception ex)
        {
        }
    }
}