using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
public partial class account_tutor_profile : System.Web.UI.Page
{
    Admin_Login al = new Admin_Login();
    DataTable dt = new DataTable();
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            string uemail = Convert.ToString(Session["log_tutor"]);
            string sql;
            sql = "exec tutorpro @tutor_email='" + uemail + "',@action=5";
            dt = al.select(sql);
            txttutor.Text = dt.Rows[0]["tutor_name"].ToString();
            txtemail.Text = dt.Rows[0]["tutor_email"].ToString();
            txtqualification.Text = dt.Rows[0]["tutor_qualification"].ToString();
            txtphone.Text = dt.Rows[0]["tutor_phno"].ToString();
            txtaddress.Text = dt.Rows[0]["tutor_address"].ToString();
            txtcity.Text = dt.Rows[0]["tutor_city"].ToString();
            txtstate.Text = dt.Rows[0]["tutor_state"].ToString();
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