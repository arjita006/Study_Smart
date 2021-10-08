using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
public partial class website_index : System.Web.UI.Page
{
    Admin_Login al = new Admin_Login();
    DataTable dt = new DataTable();
    protected void Page_Load(object sender, EventArgs e)
    {
       
        if (!IsPostBack)
        {
            string s = "Select count(user_id) from user_registeration";
            int z = al.count(s);
            Label1.Text = z.ToString();
            string s1 = "Select count(tutor_id) from tutor_registeration";
            int z1 = al.count(s1);
            Label4.Text = z1.ToString();
            string s2 = "select sum(download) down from ( select download from question_board1 union select download from question_mock union select download from  tbl_notes)t";
            int z2 = al.count(s2);
            Label3.Text = z2.ToString();
            string s3 = "select count(id) from feedback";
            int z3 = al.count(s3);
            Label2.Text = z3.ToString();
            string sql = "select top 3 * from feedback";
            dt = al.select(sql);
            if (dt.Rows.Count > 0)
            {
                txtmsg.Text = dt.Rows[0]["user_msg"].ToString();
                lblname.Text = dt.Rows[0]["user_name"].ToString();
                txtmsg1.Text = dt.Rows[1]["user_msg"].ToString();
                lblname1.Text = dt.Rows[1]["user_name"].ToString();
                }
        }
    }
    public void fun()
    {
        Response.Redirect("viewquestionpaper.aspx");
    }

    protected void lnk9_Click(object sender, EventArgs e)
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
    protected void lnk10_Click(object sender, EventArgs e)
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
    protected void lnk11_Click(object sender, EventArgs e)
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
    protected void lnk12_Click(object sender, EventArgs e)
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
    protected void lnk1_Click(object sender, EventArgs e)
    {
        try
        {
            Session["class"] = "9";
            Response.Redirect("latestnotes.aspx");
        }
        catch (Exception ex)
        {
        }
    }
    protected void lnk2_Click(object sender, EventArgs e)
    {
        try
        {
            Session["class"] = "10";
            Response.Redirect("latestnotes.aspx");
        }
        catch (Exception ex)
        {
        }
    }
    protected void lnk3_Click(object sender, EventArgs e)
    {
        try
        {
            Session["class"] = "11";
            Response.Redirect("latestnotes.aspx");
        }
        catch (Exception ex)
        {
        }
    }
    protected void lnk4_Click(object sender, EventArgs e)
    {
        try
        {
            Session["class"] = "12";
            Response.Redirect("latestnotes.aspx");
        }
        catch (Exception ex)
        {
        }
    }
    protected void LinkButton5_Click(object sender, EventArgs e)
    {
        try
        {
            Session["class"] = "9";
            Response.Redirect("latestmockpaper.aspx");
        }
        catch (Exception ex)
        {
        }
    }
    protected void LinkButton8_Click(object sender, EventArgs e)
    {
        try
        {
            Session["class"] = "10";
            Response.Redirect("latestquestion.aspx");
        }
        catch (Exception ex)
        {
        }
    }
    protected void LinkButton6_Click(object sender, EventArgs e)
    {
        try
        {
            Session["class"] = "11";
            Response.Redirect("latestmockpaper.aspx");
        }
        catch (Exception ex)
        {
        }
    }
    protected void LinkButton7_Click(object sender, EventArgs e)
    {
        try
        {
            Session["class"] = "12";
            Response.Redirect("latestquestion.aspx");
        }
        catch (Exception ex)
        {
        }
    }
}
   