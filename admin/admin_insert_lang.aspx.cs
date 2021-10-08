using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using System.Data;
public partial class admin_insert_lang : System.Web.UI.Page
{
    Admin_Login ad = new Admin_Login();
    DataTable dt = null;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ddlstatus.Items.Add("Select Status");
            ddlstatus.Items.Add("ON");
            ddlstatus.Items.Add("OFF");
            bind_lang();
        }
        if (gvr_lang.EditIndex > -1)
        {
            SetFocus(gvr_lang);
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            string name = txtname.Text;
            string s = ddlstatus.Text;
            if (!string.IsNullOrEmpty(name.Trim()) && !string.IsNullOrEmpty(s.Trim()))
            {
                if (ad.checkdata("exec lang @lang_name='" + name + "',@action=2") == 0)
                {
                    string sql = "exec lang @lang_name='" + name + "',@lang_status= '" + s + "',@action=1";
                    int z = ad.insert(sql);
                    if (z > 0)
                    {
                        lblmssg.Text = "Language Inserted Succesfully";
                        lblmssg.ForeColor = Color.DarkGreen;
                        bind_lang();
                    }
                    else
                    {
                        lblmssg.Text = "Fail to insert";
                        lblmssg.ForeColor = Color.Red;
                    }
                }

                else
                {
                    lblmssg.Text = "Language already exist";
                    lblmssg.ForeColor = Color.Red;
                }
            }
            else
            {
                lblmssg.Text = "Please Fill The Details";
                lblmssg.ForeColor = Color.Red;
            }
            txtname.Text = "";
            ddlstatus.Text = Convert.ToString(ddlstatus.Items[0]);
        }
        catch (Exception ex)
        {
        }
    }
    private void bind_lang()
    {
        try
        {
            dt = ad.select("exec lang @action=4");
            //ViewState["dirstate"] = dt;
            //ViewState["sorteddr"] = "asc";
            if (dt.Rows.Count > 0)
            {
                gvr_lang.DataSource = dt;
                gvr_lang.DataBind();
            }
            else
            {
                gvr_lang.DataSource = null;
                gvr_lang.DataBind();
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

            DataSet ds = ad.search("exec lang @action=5 ,@id=" + id + "");
            if (!object.Equals(ds, null))
            {
                if (ds.Tables[0].Rows.Count > 0)
                {

                    gvr_lang.DataSource = ds;
                    gvr_lang.DataBind();
                }
            }
            // else
            //{
            //    gvr_lang.DataSource = null;
            //    gvr_lang.DataBind();
            //        lblmssg.Text="Not available in the record";
            //        lblmssg.ForeColor=Color.Red;
            //}
            return ds;
        
    }

    protected void gvr_lang_RowEditing(object sender, GridViewEditEventArgs e)
    {
        try
        {
            gvr_lang.EditIndex = e.NewEditIndex;
            if (ViewState["search"] != null)
            {
                bind_search();
            }
            else
            {
                bind_lang();
            }
            SetFocus(gvr_lang);
        }
        catch (Exception ex)
        {
        }
    }
    protected void gvr_lang_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        try
        {
            gvr_lang.EditIndex = -1;
            if (ViewState["search"] != null)
            {
                bind_search();
            }
            else
            {
                bind_lang();
            }
        }
        catch (Exception ex)
        {
        }
    }
    protected void gvr_lang_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        try
        {
            int id = Convert.ToInt32(gvr_lang.DataKeys[(int)e.RowIndex].Values[0]);
            TextBox name = gvr_lang.Rows[e.RowIndex].Cells[1].Controls[0] as TextBox;
            TextBox status = gvr_lang.Rows[e.RowIndex].Cells[2].Controls[0] as TextBox;
            DataTable dt = ad.select("update language2 set lang_name='" + name.Text + "',lang_status='" + status.Text + "' where lang_id=" + id + " ");
            gvr_lang.EditIndex = -1;
            if (ViewState["search"] != null)
            {
                bind_search();
            }
            else
            {
                bind_lang();
            }
        }
        catch (Exception ex)
        {
        }
    }
    protected void gvr_lang_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            int delid = Convert.ToInt32(gvr_lang.DataKeys[(int)e.RowIndex].Values[0]);
            DataTable dt = ad.select("delete from language2  where lang_id=" + delid + " ");
            gvr_lang.EditIndex = -1;
            bind_lang();
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
                        lblmsg2.Text = " ";
                    }
                    else
                    {
                        lblmsg2.Text = "Not available in the record";
                        lblmsg2.ForeColor = Color.Red;
                    }

                }
            }
            else
            {
                lblmsg2.Text = "Please Enter a ID to be Searched";
                lblmsg2.ForeColor = Color.Red;
            }
        }
        catch (Exception ex)
        {
        }
    }
    protected void gvr_lang_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        try
        {
            gvr_lang.PageIndex = e.NewPageIndex;
            if (Session["SortedView"] != null)
            {
                gvr_lang.DataSource = Session["SortedView"];
                gvr_lang.DataBind();
            }
            else
            {
                bind_lang();
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
    protected void gvr_lang_Sorting(object sender, GridViewSortEventArgs e)
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
            bind_lang();
            DataView sortedView = new DataView(dt);
            sortedView.Sort = e.SortExpression + " " + sortingDirection;
            Session["SortedView"] = sortedView;
            gvr_lang.DataSource = sortedView;
            gvr_lang.DataBind();

        }
        catch (Exception ex)
        {
        }
    }
}

