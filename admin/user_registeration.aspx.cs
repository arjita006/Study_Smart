using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
public partial class user_registeration : System.Web.UI.Page
{
    Admin_Login ad = new Admin_Login();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        try
        {
            string name = txtuser.Text;
            string email = txtemail.Text;
            string pass = txtpass.Text;
            string phno = txtphone.Text;
            string city = txtcity.Text;
            string state = txtstate.Text;
            if (!string.IsNullOrEmpty(name.Trim()) && !string.IsNullOrEmpty(email.Trim()) && !string.IsNullOrEmpty(pass.Trim()) && !string.IsNullOrEmpty(phno.Trim()) && !string.IsNullOrEmpty(city.Trim()) && !string.IsNullOrEmpty(state.Trim()))
            {
                string sql = "exec userpro @user_name='" + name + "',@user_email='" + email + "',@user_pass='" + pass + "',@user_phno='" + phno + "',@user_city='" + city + "',@user_state='" + state + "',@action=1";
                int x = ad.insert(sql);
                if (x > 0)
                {
                    lblmsg.Text = "Inserted Successfully";
                }
                else
                {
                    lblmsg.Text = "Failed to insert";
                }
            }
            else
            {
                lblmsg.Text = "Please fill all the details";
            }
            txtcity.Text = "";
            txtemail.Text = "";
            txtpass.Text = "";
            txtphone.Text = "";
            txtstate.Text = "";
            txtuser.Text = "";

        }
        catch (Exception ex)
        {
        }
    }
}