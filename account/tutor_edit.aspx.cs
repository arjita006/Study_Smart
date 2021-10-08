using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
public partial class account_tutor_edit : System.Web.UI.Page
{
    Admin_Login al = new Admin_Login();
    DataTable dt = new DataTable();
    int tid;
    protected void Page_Load(object sender, EventArgs e)
    {
        string uemail = Convert.ToString(Session["log_tutor"]);
        string sql;
        sql = "exec tutorpro @tutor_email='" + uemail + "',@action=5";
        dt = al.select(sql);
        tid = Convert.ToInt32(dt.Rows[0]["tutor_id"]);
        if (!IsPostBack)
        {
            txttutor.Text = dt.Rows[0]["tutor_name"].ToString();
            txtemail.Text = dt.Rows[0]["tutor_email"].ToString();
            txtqualification.Text = dt.Rows[0]["tutor_qualification"].ToString();
            txtphone.Text = dt.Rows[0]["tutor_phno"].ToString();
            txtaddress.Text = dt.Rows[0]["tutor_address"].ToString();
            txtcity.Text = dt.Rows[0]["tutor_city"].ToString();
            txtstate.Text = dt.Rows[0]["tutor_state"].ToString();
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
        string qualification = txtqualification.Text;
        string address = txtaddress.Text;
        try
        {
            if (phno != "" && address != "" && city != "" && state != "")
            {
                if (pass == "")
                {
                    sql1 = "exec tutorpro @tutor_qualification='" + qualification + "', @tutor_phno='" + phno + "',@tutor_address='" + address + "',@tutor_city='" + city + "',@tutor_state='" + state + "',@id=" + tid + ",@action=7";
                }
                else
                {
                    sql1 = "exec tutorpro @tutor_qualification='" + qualification + "',@tutor_pass='" + pass + "', @tutor_phno='" + phno + "',@tutor_address='" + address + "',@tutor_city='" + city + "',@tutor_state='" + state + "',@id=" + tid + ",@action=6";
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
            Session["log_tutor"] = null;
            Response.Redirect("~/website/index.aspx");
        }
        catch (Exception ex)
        {
        }
    }
}