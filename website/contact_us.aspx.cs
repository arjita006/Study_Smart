using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
public partial class website_contact_us : System.Web.UI.Page
{

    Admin_Login ad = new Admin_Login();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            string name = txtname.Text;
            string email = txtemail1.Text;
            string msg = txtmsg.Text;
            if (!string.IsNullOrEmpty(name.Trim()) && !string.IsNullOrEmpty(email.Trim()) && !string.IsNullOrEmpty(msg.Trim()))
            {
                string sql = "exec tblpro @user_name='" + name + "',@user_email='" + email + "',@message='" + msg + "',@action=1";
                int x = ad.insert(sql);
                if (x > 0)
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "notify", "alert('Inserted successfully');", true);

                }
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "notify", "alert('Failed To Insert');", true);

            }
            txtmsg.Text = "";
            txtemail1.Text = "";
            txtname.Text = "";

        }
        catch (Exception ex)
        {
        }
    }
}