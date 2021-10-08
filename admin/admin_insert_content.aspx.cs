using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;
using System.Drawing;
using System.Text.RegularExpressions;

public partial class admin_insert_content : System.Web.UI.Page
{

    Admin_Login al = new Admin_Login();
    MemoryStream ms = null;
    DataTable dt = new DataTable();
    byte[] ar = null;
    string filename = string.Empty;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bindclass();
            bindlang();
        }
        if (!IsPostBack)
        {
            bind_class();
        }
    }

    private void bindclass()
    {
        string sql;
        sql = "exec class1 @action=3";
        dt.Rows.Clear();
        ddlclass.Items.Clear();
        dt = al.select(sql);
        if (dt.Rows.Count > 0)
        {
            DataRow dr = dt.NewRow();
            dr["class_name"] = "--select--";
            dr["class_id"] = "0";
            dt.Rows.InsertAt(dr, 0);
            ddlclass.DataTextField = "class_name";
            ddlclass.DataValueField = "class_id";
            ddlclass.DataSource = dt;
            ddlclass.DataBind();
        }
    }
    private void bindlang()
    {
        string sql;
        sql = "exec lang @action=3";
        dt.Rows.Clear();
        ddllanguage.Items.Clear();
        dt = al.select(sql);
        if (dt.Rows.Count > 0)
        {
            DataRow dr = dt.NewRow();
            dr["lang_name"] = "--select--";
            dr["lang_id"] = "0";
            dt.Rows.InsertAt(dr, 0);
            ddllanguage.DataTextField = "lang_name";
            ddllanguage.DataValueField = "lang_id";
            ddllanguage.DataSource = dt;
            ddllanguage.DataBind();
        }
    }
    public static string GetTextonly(string editorcontent)
    {
        string strtext = "";
        strtext = Regex.Replace(editorcontent, @"<(.|\n)*?>", string.Empty);
        return strtext;
    }
    protected void btnsubmit_Click(object sender, EventArgs e)
    {

        string chapter = txtchapter.Text;
        string topic = txttopic.Text;
        //hiddenlbl.Text = GetTextonly(txtanswer.Content);
        string answer = txtanswer.Content;
        string c = ddlclass.Text;
        string l = ddllanguage.Text;
        string c1 = ddlclass.Items[ddlclass.SelectedIndex].Text;
        int cl = Convert.ToInt32(ddlclass.SelectedValue);
        int lang = Convert.ToInt32(ddllanguage.SelectedValue);
        if (!string.IsNullOrEmpty(chapter.Trim()) && !string.IsNullOrEmpty(topic.Trim()) && !string.IsNullOrEmpty(answer.Trim()) && !string.IsNullOrEmpty(c.Trim()) && !string.IsNullOrEmpty(l.Trim()))
        {
            if (FileUpload1.HasFile)
            {
                if (FileUpload1.PostedFile.ContentType == "image/jpeg" || FileUpload1.PostedFile.ContentType == "image/png" || FileUpload1.PostedFile.ContentType == "image/gif")
                {
                    ar = new byte[FileUpload1.PostedFile.ContentLength];
                    FileUpload1.PostedFile.InputStream.Read(ar, 0, FileUpload1.PostedFile.ContentLength);
                    ms = new MemoryStream(ar);
                    filename = Path.GetFileName(FileUpload1.FileName);
                    string p = FileUpload1.PostedFile.ContentLength.ToString();
                    int a = Convert.ToInt32(p) / 1024;
                    if (a < 512)
                    {
                        FileUpload1.SaveAs(Server.MapPath("~/") + filename);
                        string sql = "exec content1 @classid=" + cl + ",@langid=" + lang + ",@chapter='" + chapter + "',@topic='" + topic + "',@answer='" + answer + "',@image=@image2,@classname='" + c1 + "',@action=1";
                        int z = al.insert1(sql, ms.ToArray());
                        if (z > 0)
                        {

                            lblmssg.Text = "Data inserted successfully";
                            lblmssg.ForeColor = Color.Green;
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
                        lblmsg.Visible = true;
                        lblmsg.Text = "Image should not be greater then 512 kb";
                    }


                }
                else 
                {
                    lblmsg.Visible = true;
                    lblmsg.Text = "Incorrect file extension";
                }
            }
            else
            {


                // using (BinaryReader br = new BinaryReader()))
                //{
                //ar= br.ReadBytes(FileUpload1.PostedFile.ContentLength);
                //}
                ar = File.ReadAllBytes(Server.MapPath("~/admin/images/pic.png"));
                ms = new MemoryStream(ar);
                string sql = "exec content1 @classid=" + cl + ",@langid=" + lang + ",@chapter='" + chapter + "',@topic='" + topic + "',@answer='" + answer + "',@image=@image2,@classname='" + c1 + "',@action=1";
                int z = al.insert1(sql, ms.ToArray());
                if (z > 0)
                {

                    lblmssg.Text = "Data inserted successfully";
                    lblmssg.ForeColor = Color.Green;
                    bind_class();

                }
                else
                {
                    lblmssg.Text = "Failed to insert";
                    lblmssg.ForeColor = Color.Red;
                }
            }
        }
        else
        {
            lblmssg.Text = "Please fill the details";
            lblmssg.ForeColor = Color.Red;
        }

        // txtchapter.Text = "";
        // txtsearch.Text = "";
        // txttopic.Text = "";
        //ddlclass.Text;
        //   //ddllanguage.Text="";
    }
    private void bind_class()
    {
        dt.Clear();
        dt = al.select("exec content1 @action=2");
        if (dt.Rows.Count > 0)
        {
            gvr_content.DataSource = dt;
            gvr_content.DataBind();
        }
        else
        {
            gvr_content.DataSource = null;
            gvr_content.DataBind();
        }
    }
    private DataSet bind_search()
    {
        string id = "";
        if (ViewState["search"] != null)
            id = ViewState["search"].ToString();
        else
            id = txtsearch.Text;

        DataSet ds = al.search("exec content1 @action=3 ,@id=" + id + "");
        if (!object.Equals(ds, null))
        {
            if (ds.Tables[0].Rows.Count > 0)
            {

                gvr_content.DataSource = ds;
                gvr_content.DataBind();
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

    protected void gvr_content_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gvr_content.EditIndex = e.NewEditIndex;
        //TextBox txt = (TextBox)gvr_content.Rows[e.NewEditIndex].FindControl("TextBox1");
        if (ViewState["search"] != null)
        {
            bind_search();
        }
        else
        {
            bind_class();
        }
    }
    protected void gvr_content_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        gvr_content.EditIndex = -1;
        if (ViewState["search"] != null)
        {
            bind_search();
        }
        else
        {
            bind_class();
        }
    }
    //protected void gvr_content_RowUpdating(object sender, GridViewUpdateEventArgs e)
    //{
    //    int id = Convert.ToInt32(gvr_content.DataKeys[(int)e.RowIndex].Values[0]);
    //    Label langid = gvr_content.Rows[e.RowIndex].Cells[1].Controls[0] as Label;
    //    Label classid = gvr_content.Rows[e.RowIndex].Cells[2].Controls[0] as Label;
    //    TextBox name = gvr_content.Rows[e.RowIndex].Cells[3].Controls[0] as TextBox;
    //    TextBox topic = gvr_content.Rows[e.RowIndex].Cells[4].Controls[0] as TextBox;
    //    TextBox answer = gvr_content.Rows[e.RowIndex].Cells[5].Controls[0] as TextBox;


    //    DataTable dt = al.select("update content set chapter_name='" + name.Text + "',topic_name='" + topic.Text + "',answer='"+answer.Text+"' where content_id=" + id + " ");
    //    gvr_content.EditIndex = -1;
    //    if (ViewState["search"] != null)
    //    {
    //        bind_search();
    //    }
    //    else
    //    {
    //        bind_class();
    //    }
    //}

    protected void gvr_content_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int delid = Convert.ToInt32(gvr_content.DataKeys[(int)e.RowIndex].Values[0]);
        DataTable dt = al.select("delete from content  where content_id=" + delid + " ");
        gvr_content.EditIndex = -1;
        bind_class();
    }
    protected void btnsearch_Click(object sender, EventArgs e)
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
    protected void gvr_content_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvr_content.PageIndex = e.NewPageIndex;
        if (Session["SortedView"] != null)
        {
            gvr_content.DataSource = Session["SortedView"];
            gvr_content.DataBind();
        }
        else
        {
            bind_class();
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
    protected void gvr_content_Sorting(object sender, GridViewSortEventArgs e)
    {
        //DataTable dts = (DataTable)ViewState["dirstate"];
        //if (dts.Rows.Count > 0)
        //{
        //    if (Convert.ToString(ViewState["sorteddr"]) == "asc")
        //    {
        //        dts.DefaultView.Sort = e.SortExpression + "Desc";
        //        ViewState["sorteddr"] = "Desc";
        //    }
        //    else
        //    {
        //        dts.DefaultView.Sort = e.SortExpression + "asc";
        //        ViewState["sorteddr"] = "asc";
        //    }

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
        gvr_content.DataSource = sortedView;
        gvr_content.DataBind();

    }
    protected void gvr_content_Updating1(object sender, GridViewUpdateEventArgs e)
    {
        int id = Convert.ToInt32(gvr_content.DataKeys[(int)e.RowIndex].Values[0]);
        Label langid = gvr_content.Rows[e.RowIndex].Cells[2].Controls[0] as Label;
        Label classid = gvr_content.Rows[e.RowIndex].Cells[1].Controls[0] as Label;
        TextBox name = gvr_content.Rows[e.RowIndex].Cells[3].Controls[0] as TextBox;
        TextBox topic = gvr_content.Rows[e.RowIndex].Cells[4].Controls[0] as TextBox;
        TextBox answer = gvr_content.Rows[e.RowIndex].Cells[5].Controls[0] as TextBox;
        FileUpload image = (gvr_content.Rows[e.RowIndex].Cells[6].FindControl("FileUpload2") as FileUpload);
        if (image.HasFile == true)
        {
            if (image.PostedFile.ContentType == "image/jpeg" || image.PostedFile.ContentType == "image/png" || image.PostedFile.ContentType == "image/gif" || image.PostedFile.ContentType == "image/jpg" || image.PostedFile.ContentType == "image/bmp")
            {
                filename = Path.GetFileName(image.PostedFile.FileName);
                string p = image.PostedFile.ContentLength.ToString();
                ar = new byte[image.PostedFile.ContentLength];
                image.PostedFile.InputStream.Read(ar, 0, image.PostedFile.ContentLength);
                ms = new MemoryStream(ar);
                int a = Convert.ToInt32(p) / 1024;
                if (a < 512)
                {
                    image.SaveAs(Server.MapPath("~/") + filename);
                    int k = al.insert1("update content set chapter_name='" + name.Text + "',topic_name='" + topic.Text + "',answer='" + answer.Text + "',image=@image2 where content_id=" + id + "", ms.ToArray());
                    if (k > 0)
                    {
                        //Label1.Text = "Updated Successfully";
                        gvr_content.EditIndex = -1;
                        if (ViewState["search"] != null)
                        {
                            bind_search();
                        }
                        else
                        {
                            bind_class();
                        }
                    }
                }
                

            }
        }
        else if (image.HasFile == false)
        {
            string sql = "update content set chapter_name='" + name.Text + "',topic_name='" + topic.Text + "',answer='" + answer.Text + "' where content_id=" + id + "";
            int z = al.insert1(sql, null);
            if (z > 0)
            {
                gvr_content.EditIndex = -1;
                if (ViewState["search"] != null)
                {
                    bind_search();
                }
                else
                {
                    bind_class();
                }
                ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('Updated Successfully')", true);
            }
        }
    }
}