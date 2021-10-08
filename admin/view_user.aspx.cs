using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Drawing;

public partial class view_user : System.Web.UI.Page
{
    Admin_Login ad = new Admin_Login();

    DataTable dt = null;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bind_user();
        }
    }
    private void bind_user()
    {
        try
        {
            dt = ad.select("exec userpro @action=2");
            if (dt.Rows.Count > 0)
            {
                gvr_user.DataSource = dt;
                gvr_user.DataBind();
            }
            else
            {
                gvr_user.DataSource = null;
                gvr_user.DataBind();
            }
        }
        catch (Exception ex)
        {
        }
    }
    private DataSet bind_search()
    {
       
            string id = "";
            if (ViewState["search"] != null)
                id = ViewState["search"].ToString();
            else
                id = txtsearch.Text;

            DataSet ds = ad.search("exec userpro @action=3 ,@id=" + id + "");
            if (!object.Equals(ds, null))
            {
                if (ds.Tables[0].Rows.Count > 0)
                {

                    gvr_user.DataSource = ds;
                    gvr_user.DataBind();
                }
            }
            // else
            //{
            //    gvr_class.DataSource = null;
            //    gvr_class.DataBind();
            //        lblmssg.Text="Not available in the record";
            //        lblmssg.ForeColor=Color.Red;
            //}
            return ds;
        
    }
    protected void gvr_user_RowEditing(object sender, GridViewEditEventArgs e)
    {
        try
        {
            gvr_user.EditIndex = e.NewEditIndex;
            if (ViewState["search"] != null)
            {
                bind_search();
            }
            else
            {
                bind_user();
            }
            SetFocus(gvr_user);
        }
        catch (Exception ex)
        {
        }
    }
    protected void gvr_user_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        try
        {
            gvr_user.EditIndex = -1;
            if (ViewState["search"] != null)
            {
                bind_search();
            }
            else
            {
                bind_user();
            }
        }
        catch (Exception ex)
        {
        }
    }
    protected void gvr_user_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        try
        {
            int id = Convert.ToInt32(gvr_user.DataKeys[(int)e.RowIndex].Values[0]);
            TextBox name = gvr_user.Rows[e.RowIndex].Cells[1].Controls[0] as TextBox;
            TextBox email = gvr_user.Rows[e.RowIndex].Cells[2].Controls[0] as TextBox;
            TextBox pass = gvr_user.Rows[e.RowIndex].Cells[3].Controls[0] as TextBox;
            TextBox phno = gvr_user.Rows[e.RowIndex].Cells[4].Controls[0] as TextBox;
            TextBox city = gvr_user.Rows[e.RowIndex].Cells[5].Controls[0] as TextBox;
            TextBox state = gvr_user.Rows[e.RowIndex].Cells[6].Controls[0] as TextBox;
            DataTable dt = ad.select("update user_registeration set user_name='" + name.Text + "' ,user_email='" + email.Text + "',user_password='" + pass.Text + "',user_phno='" + phno.Text + "',user_city='" + city.Text + "',user_state='" + state.Text + "' where user_id=" + id + " ");
            gvr_user.EditIndex = -1;
            if (ViewState["search"] != null)
            {
                bind_search();
            }
            else
            {
                bind_user();
            }
        }
        catch (Exception ex)
        {
        }
    }
    protected void gvr_user_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            int delid = Convert.ToInt32(gvr_user.DataKeys[(int)e.RowIndex].Values[0]);
            DataTable dt = ad.select("delete from user_registeration  where user_id=" + delid + " ");
            gvr_user.EditIndex = -1;
            bind_user();
        }
        catch (Exception ex)
        {
        }
    }
    protected void btnsearch_Click(object sender, EventArgs e)
    {
        try
        {
            DataSet ds = bind_search();
            if (!object.Equals(ds, null))
            {
                if (ds.Tables[0].Rows.Count > 0)
                {
                    ViewState["search"] = txtsearch.Text.Trim();
                    txtsearch.Text = " ";
                    lblmsg.Text = " ";


                }
                else
                {
                    lblmsg.Text = "Not available in the record";
                    lblmsg.ForeColor = Color.Red;
                }

            }
        }
        catch (Exception ex)
        {
        }
    }

    protected void gvr_user_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        try
        {
            gvr_user.PageIndex = e.NewPageIndex;
            if (Session["SortedView"] != null)
            {
                gvr_user.DataSource = Session["SortedView"];
                gvr_user.DataBind();
            }
            else
            {
                bind_user();
            }
        }
        catch (Exception ex)
        {
        }
    }
    public SortDirection dir
    {
        get
        {
            if (ViewState["directionstate"] == null)
            {
                ViewState["directionstate"] = SortDirection.Ascending;
            }
            return (SortDirection)ViewState["directionstate"];
        }
        set
        {
            ViewState["directionstate"] = value;
        }
    }



    protected void gvr_user_Sorting(object sender, GridViewSortEventArgs e)
    {
        try
        {
            string sortingDirection = string.Empty;
            if (dir == SortDirection.Ascending)
            {
                dir = SortDirection.Descending;
                sortingDirection = "Desc";

            }
            else
            {
                dir = SortDirection.Ascending;
                sortingDirection = "Asc";

            }
            bind_user();
            DataView sortedView = new DataView(dt);
            sortedView.Sort = e.SortExpression + " " + sortingDirection;
            Session["SortedView"] = sortedView;
            gvr_user.DataSource = sortedView;
            gvr_user.DataBind();
        }

        catch (Exception ex)
        {
        }
    }
}

   