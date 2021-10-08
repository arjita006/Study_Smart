using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Drawing;
using System.Data;
using System.Web.UI.WebControls;

public partial class website_master : System.Web.UI.MasterPage
{
    Admin_Login ad = new Admin_Login();
    DataTable dt = new DataTable();
    DataTable dt1 = new DataTable();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Convert.ToString(Session["log_user"]) != "")
        {
            LinkButton1.Visible = false;
            LinkButton4.Visible = true;
            LinkButton2.Visible = false;
            LinkButton3.Visible = false;
            LinkButton5.Visible = true;
        }
        else if( Convert.ToString(Session["log_tutor"]) != "")
        {
            LinkButton1.Visible = false;
            LinkButton4.Visible = true;
            LinkButton2.Visible = false;
            LinkButton3.Visible = false;
            LinkButton5.Visible = true;

        }
    }
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        try
        {
            string name = txtuser.Text;
            string email = txtemail.Text;
            string pass = txtpass.Text;
            string confirmpass = txtconfirm.Text;
            string phno = txtphone.Text;
            string city = txtcity.Text;
            string state = txtstate.Text;
            if (!string.IsNullOrEmpty(name.Trim()) && !string.IsNullOrEmpty(email.Trim()) && !string.IsNullOrEmpty(pass.Trim()) && !string.IsNullOrEmpty(phno.Trim()) && !string.IsNullOrEmpty(city.Trim()) && !string.IsNullOrEmpty(state.Trim()))
            {
                if (pass.Equals(confirmpass) == true)
                {
                    string sql = "exec userpro @user_name='" + name + "',@user_email='" + email + "',@user_pass='" + pass + "',@user_phno='" + phno + "',@user_city='" + city + "',@user_state='" + state + "',@action=1";
                    int x = ad.insert(sql);
                    if (x > 0)
                    {
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "notify", "alert('Registered Successfully');", true);

                        Response.Redirect("index.aspx");
                    }
                }
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "notify", "alert('Failed To Insert');", true);


                txtemail.Text = "";
                txtuser.Text = "";
                txtpass.Text = "";
                txtconfirm.Text = "";
                txtphone.Text = "";
                txtcity.Text = "";
                txtstate.Text = "";

            }
        }
        catch (Exception ex)
        {
        }
        }

    protected void Button2_Click(object sender, EventArgs e)
    {
        try
        {
            string email1 = "", email2 = "", uname = "", tname = "";
            string email = txtmail.Text;
            string pass1 = txtpassord.Text;
            if (!string.IsNullOrEmpty(email.Trim()) && !string.IsNullOrEmpty(pass1.Trim()))
            {
                string sql1 = "select user_email, user_name from user_registeration where user_email='" + email + "' and user_password='" + pass1 + "' ";
                dt = ad.select(sql1);
                string sql2 = "select tutor_email, tutor_name from tutor_registeration where tutor_email='" + email + "' and tutor_password='" + pass1 + "'";
                dt = ad.select(sql2);

                if (dt.Rows.Count > 0)
                {

                    email1 = (dt.Rows[0]["user_email"]).ToString();
                    email2 = (dt.Rows[0]["tutor_email"]).ToString();
                    uname = (dt.Rows[0]["user_name"]).ToString();
                    tname = (dt.Rows[0]["tutor_name"]).ToString();
                    Session["log_user"] = email1;
                    Session["log_tutor"] = email2;
                    Session["u_name"] = uname;
                    Session["t_name"] = tname;
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "notify", "alert('Welcome To The Site');", true);

                    Response.Redirect("index.aspx");

                }


                else
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "notify", "alert('Invalid Email Address Or Password');", true);
                    txtmail.Text = "";
                    txtpassord.Text = "";
                }
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "notify", "alert('Please enter the Email Address and Password');", true);
                txtmail.Text = "";
                txtpassord.Text = "";
            }

        }
        catch (Exception ex)
        {
        }
    }

    protected void btntutor_Click(object sender, EventArgs e)
    {
        try
        {
            string name = tutname.Text;
            string email = tutemail.Text;
            string pass = tutpass.Text;
            string confirmpass = tutcpass.Text;
            string phno = tutphone.Text;
            string quali = tutqualification.Text;
            string address = tutaddress.Text;
            string city = tutcity.Text;
            string state = tutstate.Text;
            if (!string.IsNullOrEmpty(name.Trim()) && !string.IsNullOrEmpty(email.Trim()) && !string.IsNullOrEmpty(pass.Trim()) && !string.IsNullOrEmpty(phno.Trim()) && !string.IsNullOrEmpty(city.Trim()) && !string.IsNullOrEmpty(state.Trim()))
            {
                if (pass.Equals(confirmpass) == true)
                {
                    string sql = "exec tutorpro @tutor_name='" + name + "',@tutor_email='" + email + "',@tutor_qualification='" + quali + "',@tutor_pass='" + pass + "',@tutor_phno='" + phno + "',@tutor_address='" + address + "',@tutor_city='" + city + "',@tutor_state='" + state + "',@action=1";
                    int x = ad.insert(sql);
                    if (x > 0)
                    {

                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "notify", "alert('Registered successfully');", true);

                    }
                }
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "notify", "alert('Failed To Insert');", true);

            }
        }
        catch (Exception ex)
        {
        }
    }
    protected void LinkButton4_Click(object sender, EventArgs e)
    {
        try
        {
            Session["log_user"] = "";
            LinkButton1.Visible = true;
            LinkButton2.Visible = true;
            LinkButton3.Visible = true;
            LinkButton4.Visible = false;
            LinkButton5.Visible = false;
        }
        catch (Exception ex)
        {
        }
    }


    protected void LinkButton6_Click(object sender, EventArgs e)
    {
        try
        {
            Session["class"] = "9";
            Response.Redirect("viewcontent.aspx");
        }
        catch (Exception ex)
        {
        }
    }
    protected void LinkButton7_Click(object sender, EventArgs e)
    {
        try
        {
            Session["class"] = "10";
            Response.Redirect("viewcontent.aspx");
        }
        catch (Exception ex)
        {
        }
    }
    protected void LinkButton8_Click(object sender, EventArgs e)
    {
        try
        {
            Session["class"] = "11";
            Response.Redirect("viewcontent.aspx");
        }
        catch (Exception ex)
        {
        }
    }
    protected void LinkButton9_Click(object sender, EventArgs e)
    {
        try
        {
            Session["class"] = "12";
            Response.Redirect("viewcontent.aspx");
        }
        catch (Exception ex)
        {
        }
    }
    protected void LinkButton5_Click(object sender, EventArgs e)
    {
        try
        {
            LinkButton1.Visible = true;
            LinkButton2.Visible = true;
            LinkButton3.Visible = true;
            LinkButton4.Visible = false;
            if ((Session["log_user"].ToString()) != "")
            {
                Response.Redirect("~/account/account_user.aspx");
            }
            else if((Session["log_tutor"].ToString()) != "")
            {
                Response.Redirect("~/account/account_tutor.aspx");
            }
        }
        catch (Exception ex)
        {
        }
    }
    }

