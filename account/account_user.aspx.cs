using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class account_account_index : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Label1.Text = "WELCOME " + Convert.ToString(Session["u_name"]);

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