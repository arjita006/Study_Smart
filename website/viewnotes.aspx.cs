using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;
using System.Drawing;

public partial class website_viewnotes : System.Web.UI.Page
{
    Admin_Login al = new Admin_Login();
    MemoryStream ms = null;
    DataTable dt = new DataTable();
    DataSet ds = new DataSet();
    DateTime date, date1;
    string d1, d2;
    string nclass, nlang;
    string s3, s1, s2;
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            int id;
            string s;
            string logstudent;
            if (Request.QueryString["paper"] != null)
            {
                string downloadPath = Request.QueryString["paper"].ToString();
                id = Convert.ToInt32(Request.QueryString["id"]);
                logstudent = Convert.ToString(Session["log_user"]);
                string category = "Notes";
                if (Session["log_user"] != null)
                {
                    DateTime date3 = DateTime.Now;
                    s = "update  tbl_notes set download=(select isnull(max(download),0)+1 from tbl_notes where notes_id=" + id + "),dwn_date='" + date3 + "' where notes_id=" + id + "";
                    int z = al.insert(s);
                    s1 = "select notes_file from tbl_notes where notes_id=" + id + "";
                    dt = al.select(s1);
                    string file_name = dt.Rows[0]["notes_file"].ToString();
                    dt.Clear();
                    s2 = "select * from user_downloads where user_email='" + logstudent + "' and file_name='" + file_name + "' and category='" + category + "' ";
                    dt = al.select(s2);
                    if (dt.Rows.Count > 0)
                    {
                        s3 = " update  user_downloads set download=(select isnull(max(download),0)+1 from user_downloads where  user_email='" + logstudent + "' and file_name='" + file_name + "' and category='" + category + "') where  user_email='" + logstudent + "' and file_name='" + file_name + "' and category='" + category + "'";
                    }
                    else
                    {
                        s3 = "insert into user_downloads(user_email, file_name,category,download) values('" + logstudent + "','" + file_name + "','" + category + "'," + 1 + ")";
                    }
                    int k = al.insert(s3);
                    dt.Clear();


                    Response.Redirect(downloadPath);

                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "notify", "alert('Please sign in first');", true);
                }

            }
            if (!IsPostBack)
            {
                bind_class();
                bindlang();
                bindclass();
            }
        }
        catch (Exception ex)
        {
        }
    }
    
 private void bind_class()
    {
     try
     {
        dt.Clear();
        dt = al.select("exec notes @action=2");
        if (dt.Rows.Count > 0)
        {
            gvr_notes.DataSource = dt;
            gvr_notes.DataBind();
        }
        else
        {
            gvr_notes.DataSource = null;
            gvr_notes.DataBind();

        }
     }
     catch (Exception ex)
     {
     }
    }
 private void bindlang()
 {
     try
     {
         string sql;
         sql = "exec lang @action=3";
         dt.Rows.Clear();
         rdllanguage.Items.Clear();
         dt = al.select(sql);
         if (dt.Rows.Count > 0)
         {
             DataRow dr = dt.NewRow();
             rdllanguage.DataTextField = "lang_name";
             rdllanguage.DataValueField = "lang_id";
             rdllanguage.DataSource = dt;
             rdllanguage.DataBind();
         }
     }
     catch (Exception ex)
     {
     }
 }
    private void bindclass()
    {
        try
        {
            string sql;
            sql = "exec class1 @action=3";
            dt.Rows.Clear();
            rdlclass.Items.Clear();
            dt = al.select(sql);
            if (dt.Rows.Count > 0)
            {
                DataRow dr = dt.NewRow();
                rdlclass.DataTextField = "class_name";
                rdlclass.DataValueField = "class_id";
                rdlclass.DataSource = dt;
                rdlclass.DataBind();
            }
        }
        catch (Exception ex)
        {
        }
    }
    protected void Button1_Click(Object sender, EventArgs e)
    {

    }
    protected void gvr_notes_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        try
        {
            gvr_notes.PageIndex = e.NewPageIndex;
            if (Session["SortedView"] != null)
            {
                gvr_notes.DataSource = Session["SortedView"];
                gvr_notes.DataBind();
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

    protected void rdlclass_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            string c, l, sql, d;
            c = rdlclass.SelectedValue.ToString();
            ViewState["mclass"] = c.ToString();
            d = Convert.ToString(ViewState["mdown"]);
            l = Convert.ToString(ViewState["mlang"]);

            if (d == "Most Downloaded")
            {
                if (l != "")
                {
                    sql = "select notes_name,notes_file,notes_id,notes_image,class_name,lang_name from tbl_notes where class_id='" + c + "' and lang_id='" + l + "' order by download desc";

                }
                else
                {
                    sql = "select notes_name,notes_file,notes_id,notes_image,class_name,lang_name from tbl_notes where class_id='" + c + "' order by download desc ";

                }
                dt.Rows.Clear();
                dt = al.select(sql);
                gvr_notes.DataSource = dt.DefaultView;
                gvr_notes.DataBind();
            }
            else if (d == "Recently Uploaded")
            {
                if (l != "")
                {
                    sql = "select notes_name,notes_file,notes_id,notes_image,class_name,lang_name from tbl_notes where  class_id='" + c + "' and lang_id='" + l + "' and (entry_date>='" + d2 + "' or entry_date<='" + d1 + "')";

                }
                else
                {
                    sql = "select notes_name,notes_file,notes_id,notes_image,class_name,lang_name from tbl_notes where class_id='" + c + "' and (entry_date>='" + d2 + "' or entry_date<='" + d1 + "')";

                }
                dt.Rows.Clear();
                dt = al.select(sql);
                gvr_notes.DataSource = dt.DefaultView;
                gvr_notes.DataBind();
            }
            else if (d == "")
            {
                if (l != "")
                {
                    sql = "select notes_name,notes_file,notes_id,notes_image,class_name,lang_name from tbl_notes where class_id='" + c + "' and lang_id='" + l + "' ";

                }
                else
                {
                    sql = "select notes_name,notes_file,notes_id,notes_image,class_name,lang_name from tbl_notes where class_id='" + c + "' ";

                }
                dt.Rows.Clear();
                dt = al.select(sql);
                gvr_notes.DataSource = dt.DefaultView;
                gvr_notes.DataBind();
            }

        }
        catch (Exception ex)
        {
        }
    }

    protected void rdllanguage_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            string c, l, sql, d;
            l = rdllanguage.SelectedValue.ToString();
            ViewState["mlang"] = l.ToString();
            d = Convert.ToString(ViewState["mdown"]);
            c = Convert.ToString(ViewState["mclass"]);
            if (d == "Most Downloaded")
            {
                if (c != "")
                {
                    sql = "select notes_name,notes_file,notes_id,notes_image,class_name,lang_name from tbl_notes where lang_id='" + l + "' and class_id='" + c + "'order by download desc";

                }
                else
                {
                    sql = "select notes_name,notes_file,notes_id,notes_image,class_name,lang_name from tbl_notes where lang_id='" + l + "' order by download desc";

                }
                dt.Rows.Clear();
                dt = al.select(sql);
                gvr_notes.DataSource = dt.DefaultView;
                gvr_notes.DataBind();
            }
            else if (d == "Recently Uploaded")
            {
                if (c != "")
                {
                    sql = "select notes_name,notes_file,notes_id,notes_image,class_name,lang_name from tbl_notes where lang_id='" + l + "' and class_id='" + c + "' and (entry_date>='" + d2 + "' or entry_date<='" + d1 + "')";


                }
                else
                {
                    sql = "select notes_name,notes_file,notes_id,notes_image,class_name,lang_name from tbl_notes where lang_id='" + l + "' and (entry_date>='" + d2 + "' or entry_date<='" + d1 + "') ";

                }
                dt.Rows.Clear();
                dt = al.select(sql);
                gvr_notes.DataSource = dt.DefaultView;
                gvr_notes.DataBind();

            }
            else if (d == "")
            {
                if (c != "")
                {
                    sql = "select notes_name,notes_file,notes_id,notes_image,class_name,lang_name from tbl_notes where lang_id='" + l + "' and class_id='" + c + "'";

                }
                else
                {
                    sql = "select notes_name,notes_file,notes_id,notes_image,class_name,lang_name from tbl_notes where lang_id='" + l + "' ";

                }
                dt.Rows.Clear();
                dt = al.select(sql);
                gvr_notes.DataSource = dt.DefaultView;
                gvr_notes.DataBind();

            }
        }
        catch (Exception ex)
        {
        }
    }

    protected void rdldownload1_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            string d, s = "", l, c;

            c = Convert.ToString(ViewState["mclass"]);
            l = Convert.ToString(ViewState["mlang"]);
            d = rdldownload1.SelectedValue.ToString();
            ViewState["mdown"] = d.ToString();

            if (d == "Recently Uploaded")
            {
                if (c != "")
                {
                    if (l != "")
                    {
                        s = "select notes_name,notes_file,notes_id,notes_image,class_name,lang_name from tbl_notes where  lang_id='" + l + "' and class_id='" + c + "' and (entry_date>='" + d2 + "' or entry_date<='" + d1 + "')";


                    }
                    else if (l == "")
                    {

                        s = "select notes_name,notes_file,notes_id,notes_image,class_name,lang_name from tbl_notes where  where lang_id='" + l + "' and (entry_date>='" + d2 + "' or entry_date<='" + d1 + "')";
                    }
                }
                else if (c == "")
                {
                    if (l != "")
                    {
                        s = "select notes_name,notes_file,notes_id,notes_image,class_name,lang_name from tbl_notes  where class_id='" + c + "' and (entry_date>='" + d2 + "' or entry_date<='" + d1 + "')";

                    }
                    else if (l == "")
                    {

                        s = "select notes_name,notes_file,notes_id,notes_image,class_name,lang_name from tbl_notes where ( entry_date>='" + d2 + "' or entry_date<='" + d1 + "') ";
                    }

                }
                dt.Rows.Clear();
                dt = al.select(s);
                gvr_notes.DataSource = dt.DefaultView;
                gvr_notes.DataBind();
            }
            else if (d == "Most Downloaded")
            {

                if (c != "")
                {
                    if (l != "")
                    {
                        s = "select notes_name,notes_file,notes_id,notes_image,class_name,lang_name from tbl_notes where lang_id='" + l + "' and class_id='" + c + "' and order by download desc";

                    }
                    else if (l == "")
                    {

                        s = "select notes_name,notes_file,notes_id,notes_image,class_name,lang_name from tbl_notes where  class_id='" + c + "'  and order by download desc";
                    }
                }
                else if (c == "")
                {
                    if (l != "")
                    {
                        s = "select notes_name,notes_file,notes_id,notes_image,class_name,lang_name from tbl_notes where lang_id='" + l + "' and order by download desc";

                    }
                    else if (l == "")
                    {

                        s = "select notes_name,notes_file,notes_id,notes_image,class_name,lang_name from tbl_notes order by download desc ";
                    }
                    dt.Rows.Clear();
                    dt = al.select(s);
                    gvr_notes.DataSource = dt.DefaultView;
                    gvr_notes.DataBind();
                }

            }


        }
        catch (Exception ex)
        {
        }
    }
}