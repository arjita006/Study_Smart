using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
public partial class account_user_edit : System.Web.UI.Page
{
    Admin_Login al = new Admin_Login();
    DataTable dt = new DataTable();
      int uid;
    protected void Page_Load(object sender, EventArgs e)
    {
        string uemail = Convert.ToString(Session["log_user"]);
            string sql;
            sql = "exec userpro @user_email='" + uemail + "',@action=5";
            dt = al.select(sql);
            uid = Convert.ToInt32(dt.Rows[0]["user_id"]);
            if (!IsPostBack)
            {
                txtuser.Text = dt.Rows[0]["user_name"].ToString();
                txtemail.Text = dt.Rows[0]["user_email"].ToString();
                txtphone.Text = dt.Rows[0]["user_phno"].ToString();
                txtcity.Text = dt.Rows[0]["user_city"].ToString();
                txtstate.Text = dt.Rows[0]["user_state"].ToString();
            }
        
    }
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        string sql1;
        int z;
        string pass = txtpass.Text;
        string phno = txtphone.Text;
        string city = txtcity.Text;
        string state = txtstate.Text;
        try
        {
            if (phno != "" && city != "" && state != "")
            {
                if (pass == "")
                {
                    sql1 = "exec userpro @user_phno='" + phno + "',@user_city='" + city + "',@user_state='" + state + "',@id=" + uid + ",@action=7";
                }
                else
                {
                    sql1 = "exec userpro @user_pass='" + pass + "', @user_phno='" + phno + "',@user_city='" + city + "',@user_state='" + state + "',@id=" + uid + ",@action=6";
                }
                z = al.insert(sql1);
                if (z > 0)
                {
                    lblmsg1.Text = "Updated Sucessfully";
                }
                else
                {
                    lblmsg1.Text = "Failed to update";
                }
            }
            else
            {
                lblmsg1.Text = "Please fill the Phone number,city ,state";
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