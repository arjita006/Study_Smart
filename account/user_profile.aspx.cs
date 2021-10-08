using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
public partial class account_user_profile : System.Web.UI.Page
{
    Admin_Login al = new Admin_Login();
    DataTable dt = new DataTable();
    protected void Page_Load(object sender, EventArgs e)
    {
        string uemail = Convert.ToString(Session["log_user"]);
        string sql;
        sql = "exec userpro @user_email='" + uemail + "',@action=5";
        dt = al.select(sql);
        txtuser.Text = dt.Rows[0]["user_name"].ToString();
        txtemail.Text = dt.Rows[0]["user_email"].ToString();
        txtphone.Text = dt.Rows[0]["user_phno"].ToString();
        txtcity.Text = dt.Rows[0]["user_city"].ToString();
        txtstate.Text = dt.Rows[0]["user_state"].ToString();
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