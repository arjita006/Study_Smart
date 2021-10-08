using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using System.Data;
public partial class admin_insert_class : System.Web.UI.Page
{
    Admin_Login ad = new Admin_Login();
    DataTable dt = null;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bind_class();
        }
    }
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        try
        {
            string name = txtclass.Text;
            if (!string.IsNullOrEmpty(name.Trim()))
            {
                if (ad.checkdata("exec class1 @class_name='" + name + "',@action=2") == 0)
                {

                    string sql = "exec class1 @class_name='" + name + "',@action=1";
                    int z = ad.insert(sql);
                    if (z > 0)
                    {
                        lblmssg.Text = "Inserted Successfully";
                        lblmssg.ForeColor = Color.DarkGreen;
                        bind_class();
                    }
                    else
                    {
                        lblmssg.Text = "Failed to insert";
                        lblmssg.ForeColor = Color.Red;
                    }
                }
                else
                {
                    lblmssg.Text = "Class already Exist";
                    lblmssg.ForeColor = Color.Red;
                }
            }
            else
            {
                lblmssg.Text = "Please Fill The fields";
                lblmssg.ForeColor = Color.Red;

            }
            txtclass.Text = "";

        }

        catch (Exception ex)
        {
        }
    }

    private void bind_class()
    {
        try
        {
            dt = ad.select("exec class1 @action=4");
            if (dt.Rows.Count > 0)
            {
                gvr_class.DataSource = dt;
                gvr_class.DataBind();
            }
            else
            {
                gvr_class.DataSource = null;
                gvr_class.DataBind();
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

            DataSet ds = ad.search("exec class1 @action=5 ,@id=" + id + "");
            if (!object.Equals(ds, null))
            {
                if (ds.Tables[0].Rows.Count > 0)
                {

                    gvr_class.DataSource = ds;
                    gvr_class.DataBind();
                }
            }


            return ds;
        
    }

    protected void gvr_class_RowEditing(object sender, GridViewEditEventArgs e)
    {
        try
        {
            gvr_class.EditIndex = e.NewEditIndex;
            if (ViewState["search"] != null)
            {
                bind_search();
            }
            else
            {
                bind_class();
            }
            SetFocus(gvr_class);
        }
        catch (Exception ex)
        {
        }
    }
    protected void gvr_class_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        try
        {
            gvr_class.EditIndex = -1;
            if (ViewState["search"] != null)
            {
                bind_search();
            }
            else
            {
                bind_class();
            }
        }
        catch (Exception ex)
        {
        }
    }
    protected void gvr_class_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        try
        {
            int id = Convert.ToInt32(gvr_class.DataKeys[(int)e.RowIndex].Values[0]);
            TextBox cls = gvr_class.Rows[e.RowIndex].Cells[1].Controls[0] as TextBox;
            DataTable dt = ad.select("update class set class_name='" + cls.Text + "' where class_id=" + id + " ");
            gvr_class.EditIndex = -1;
            if (ViewState["search"] != null)
            {
                bind_search();
            }
            else
            {
                bind_class();
            }
        }
        catch (Exception ex)
        {
        }
    }
    protected void gvr_class_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            int delid = Convert.ToInt32(gvr_class.DataKeys[(int)e.RowIndex].Values[0]);
            DataTable dt = ad.select("delete from class  where class_id=" + delid + " ");
            gvr_class.EditIndex = -1;
            bind_class();
        }
        catch (Exception ex)
        {
        }
    }
   

    protected void btnsearch_Click(object sender, EventArgs e)
    {
        try
        {
            string search = txtsearch.Text;

            if (!string.IsNullOrEmpty(search.Trim()))
            {
                DataSet ds = bind_search();
                if (!object.Equals(ds, null))
                {
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        ViewState["search"] = txtsearch.Text.Trim();
                        txtsearch.Text = " ";
                        lblmssg2.Text = " ";


                    }
                    else
                    {
                        lblmssg2.Text = "Not available in the record";
                        lblmssg2.ForeColor = Color.Red;
                    }

                }
            }
            else
            {
                lblmssg2.Text = "Please Enter a ID to search";
                lblmssg2.ForeColor = Color.Red;
            }
        }
        catch (Exception ex)
        {
        }
    }
    protected void gvr_class_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {

        try
        {

            gvr_class.PageIndex = e.NewPageIndex;
            if (Session["SortedView"] != null)
            {
                gvr_class.DataSource = Session["SortedView"];
                gvr_class.DataBind();
            }
            else
            {
                bind_class();
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
      

    
protected void gvr_class_Sorting(object sender, GridViewSortEventArgs e)
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
            bind_class();
            DataView sortedView = new DataView(dt);
            sortedView.Sort = e.SortExpression + " " + sortingDirection;
            Session["SortedView"] = sortedView;
            gvr_class.DataSource = sortedView;
            gvr_class.DataBind();

        }
        catch (Exception ex)
        {
        }

    }
    }

