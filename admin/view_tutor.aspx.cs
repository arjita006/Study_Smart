using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Drawing;
public partial class view_tutor : System.Web.UI.Page
{
    Admin_Login ad = new Admin_Login();
    DataTable dt = null;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bind_tutor();
        }
    }
    private void bind_tutor()
    {
        try
        {
            dt = ad.select("exec tutorpro @action=2");
            if (dt.Rows.Count > 0)
            {
                gvr_tutor.DataSource = dt;
                gvr_tutor.DataBind();
            }
            else
            {
                gvr_tutor.DataSource = null;
                gvr_tutor.DataBind();
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

            DataSet ds = ad.search("exec tutorpro @action=3 ,@id=" + id + "");
            if (!object.Equals(ds, null))
            {
                if (ds.Tables[0].Rows.Count > 0)
                {

                    gvr_tutor.DataSource = ds;
                    gvr_tutor.DataBind();
                }
            }
            return ds;
        }
       
    
    protected void gvr_tutor_RowEditing(object sender, GridViewEditEventArgs e)
    {
        try
        {
            gvr_tutor.EditIndex = e.NewEditIndex;
            if (ViewState["search"] != null)
            {
                bind_search();
            }
            else
            {
                bind_tutor();
            }
            SetFocus(gvr_tutor);
        }
        catch (Exception ex)
        {
        }
    }
    protected void gvr_tutor_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        try
        {
            gvr_tutor.EditIndex = -1;
            if (ViewState["search"] != null)
            {
                bind_search();
            }
            else
            {
                bind_tutor();
            }
        }
        catch (Exception ex)
        {
        }
    }
    protected void gvr_tutor_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            int delid = Convert.ToInt32(gvr_tutor.DataKeys[(int)e.RowIndex].Values[0]);
            DataTable dt = ad.select("delete from tutor_registeration  where tutor_id=" + delid + " ");
            gvr_tutor.EditIndex = -1;
            bind_tutor();
        }
        catch (Exception ex)
        {
        }
    }
    protected void gvr_tutor_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        try
        {
            int id = Convert.ToInt32(gvr_tutor.DataKeys[(int)e.RowIndex].Values[0]);
            TextBox name = gvr_tutor.Rows[e.RowIndex].Cells[1].Controls[0] as TextBox;
            TextBox email = gvr_tutor.Rows[e.RowIndex].Cells[2].Controls[0] as TextBox;
            TextBox pass = gvr_tutor.Rows[e.RowIndex].Cells[3].Controls[0] as TextBox;
            TextBox phno = gvr_tutor.Rows[e.RowIndex].Cells[4].Controls[0] as TextBox;
            TextBox add = gvr_tutor.Rows[e.RowIndex].Cells[5].Controls[0] as TextBox;
            TextBox city = gvr_tutor.Rows[e.RowIndex].Cells[6].Controls[0] as TextBox;
            TextBox state = gvr_tutor.Rows[e.RowIndex].Cells[7].Controls[0] as TextBox;
            DataTable dt = ad.select("update tutor_registeration set tutor_name='" + name.Text + "' ,tutor_email='" + email.Text + "',tutor_password='" + pass.Text + "',tutor_phno='" + phno.Text + "',tutor_address='" + add.Text + "',tutor_city='" + city.Text + "',tutor_state='" + state.Text + "' where tutor_id=" + id + " ");
            gvr_tutor.EditIndex = -1;
            if (ViewState["search"] != null)
            {
                bind_search();
            }
            else
            {
                bind_tutor();
            }
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
    protected void gvr_tutor_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        try
        {
            gvr_tutor.PageIndex = e.NewPageIndex;
            if (Session["SortedView"] != null)
            {
                gvr_tutor.DataSource = Session["SortedView"];
                gvr_tutor.DataBind();
            }
            else
            {
                bind_tutor();
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

    protected void gvr_tutor_Sorting(object sender, GridViewSortEventArgs e)
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
            bind_tutor();
            DataView sortedView = new DataView(dt);
            sortedView.Sort = e.SortExpression + " " + sortingDirection;
            Session["SortedView"] = sortedView;
            gvr_tutor.DataSource = sortedView;
            gvr_tutor.DataBind();
        }
        catch (Exception ex)
        {
        }
    }
    }
