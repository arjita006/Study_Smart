using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Drawing;
public partial class about_us : System.Web.UI.Page
{
    Admin_Login ad = new Admin_Login();
    DataTable dt = null;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bind_about();
        }

    }
    private void bind_about()
    {
        try
        {
            dt = ad.select("exec tblpro @action=2");
            if (dt.Rows.Count > 0)
            {
                gvr_about.DataSource = dt;
                gvr_about.DataBind();
            }
            else
            {
                gvr_about.DataSource = null;
                gvr_about.DataBind();
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

            DataSet ds = ad.search("exec tblpro @action=3 ,@id=" + id + "");
            if (!object.Equals(ds, null))
            {
                if (ds.Tables[0].Rows.Count > 0)
                {

                    gvr_about.DataSource = ds;
                    gvr_about.DataBind();
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
    protected void gvr_about_RowEditing(object sender, GridViewEditEventArgs e)
    {
        try
        {
            gvr_about.EditIndex = e.NewEditIndex;
            if (ViewState["search"] != null)
            {
                bind_search();
            }
            else
            {
                bind_about();
            }
            SetFocus(gvr_about);
        }
        catch (Exception ex)
        {
        }
    }
    protected void gvr_about_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            int delid = Convert.ToInt32(gvr_about.DataKeys[(int)e.RowIndex].Values[0]);
            DataTable dt = ad.select("delete from tbl_content where user_id=" + delid + " ");
            gvr_about.EditIndex = -1;
            bind_about();
        }
        catch (Exception ex)
        {
        }
    }
    protected void gvr_about_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        try
        {
            int id = Convert.ToInt32(gvr_about.DataKeys[(int)e.RowIndex].Values[0]);
            TextBox name = gvr_about.Rows[e.RowIndex].Cells[1].Controls[0] as TextBox;
            TextBox email = gvr_about.Rows[e.RowIndex].Cells[2].Controls[0] as TextBox;
            TextBox msg = gvr_about.Rows[e.RowIndex].Cells[3].Controls[0] as TextBox;
            DataTable dt = ad.select("update tbl_content set user_name='" + name.Text + "' ,user_email='" + email.Text + "',user_message='" + msg.Text + "' where contact_id=" + id + " ");
            gvr_about.EditIndex = -1;
            if (ViewState["search"] != null)
            {
                bind_search();
            }
            else
            {
                bind_about();
            }
        }
        catch (Exception ex)
        {
        }
    }
    protected void gvr_about_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        try
        {
            gvr_about.EditIndex = -1;
            if (ViewState["search"] != null)
            {
                bind_about();
            }
            else
            {
                bind_about();
            }
        }
        catch (Exception ex)
        {
        }
    }
    protected void gvr_about_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        try
        {
            gvr_about.PageIndex = e.NewPageIndex;
            if (Session["SortedView"] != null)
            {
                gvr_about.DataSource = Session["SortedView"];
                gvr_about.DataBind();
            }
            else
            {
                bind_about();
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

    protected void gvr_about_Sorting(object sender, GridViewSortEventArgs e)
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
            bind_about();
            DataView sortedView = new DataView(dt);
            sortedView.Sort = e.SortExpression + " " + sortingDirection;
            Session["SortedView"] = sortedView;
            gvr_about.DataSource = sortedView;
            gvr_about.DataBind();
        }
        catch (Exception ex)
        {
        }
    }
}