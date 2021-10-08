using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using System.Data;

public partial class Admin : System.Web.UI.Page
{
    Admin_Login ad = new Admin_Login();
      DataTable dt = new DataTable();
    protected void Page_Load(object sender, EventArgs e)
    {
       
    }
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        try
        {
            int id = 0;
            string email = txtEmail.Text;
            string pass = txtPass.Text;

            string sql = "exec admin_log1 @Admin_Email='" + email + "',@Password= '" + pass + "',@action=1";
            int z = ad.login(sql);
            if (z > 0)
            {
                Response.Redirect("Admin_dashboard.aspx");
            }
            else
            {
                lblmssg.Text = "Invalid Email or Password";
                lblmssg.ForeColor = Color.Red;

            }
            string sql1 = "select Id from Admin_Login where @Admin_Email='" + email + "' and @Password='" + pass + "'";
            dt = ad.select(sql1);
            if (dt.Rows.Count > 0)
            {
                DataRow dr = dt.NewRow();
                id = Convert.ToInt32(dr[0]);
            }
            Session["user_id"] = id;
        }
        catch (Exception ex)
        {
        }
    }
}