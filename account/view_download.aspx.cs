using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
public partial class account_view_download : System.Web.UI.Page
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
        gvr_view.PageIndex = e.NewPageIndex;
        try
        {
            if (Session["SortedView"] != null)
            {
                gvr_view.DataSource = Session["SortedView"];
                gvr_view.DataBind();
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
        string email=Convert.ToString(Session["log_user"]);
        dt.Clear();
        dt = al.select("exec user_downloadpro @user_email='"+email+"', @action=1");
        try
        {
            if (dt.Rows.Count > 0)
            {
                gvr_view.DataSource = dt;
                gvr_view.DataBind();
            }
            else
            {
                gvr_view.DataSource = null;
                gvr_view.DataBind();
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
            Session["log_user"] = null;
            Response.Redirect("~/website/index.aspx");
        }
        catch (Exception ex)
        {
        }
    }
}