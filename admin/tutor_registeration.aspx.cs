using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
public partial class tutor_registeration : System.Web.UI.Page
{
    Admin_Login ad = new Admin_Login();
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        try
        {
            string name = txttutor.Text;
            string email = txtemail.Text;
            string pass = txtpass.Text;
            string phno = txtphone.Text;
            string add = txtaddress.Text;
            string city = txtcity.Text;
            string state = txtstate.Text;
            string qualification = txtqualification.Text;
            if (!string.IsNullOrEmpty(name.Trim()) && !string.IsNullOrEmpty(email.Trim()) && !string.IsNullOrEmpty(pass.Trim()) && !string.IsNullOrEmpty(phno.Trim()) && !string.IsNullOrEmpty(add.Trim()) && !string.IsNullOrEmpty(city.Trim()) && !string.IsNullOrEmpty(state.Trim()))
            {
                string sql = "exec tutorpro @tutor_name='" + name + "',@tutor_email='" + email + "',@tutor_qualification='" + qualification + "',@tutor_pass='" + pass + "',@tutor_phno='" + phno + "',@tutor_address='" + add + "',@tutor_city='" + city + "',@tutor_state='" + state + "',@action=1";
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
            txtaddress.Text = "";
            txtcity.Text = "";
            txtemail.Text = "";
            txtpass.Text = "";
            txtphone.Text = "";
            txtqualification.Text = "";
            txtstate.Text = "";
            txttutor.Text = "";
        }
        catch (Exception ex)
        {
        }
    }
}