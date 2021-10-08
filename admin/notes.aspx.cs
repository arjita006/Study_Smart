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

public partial class notes : System.Web.UI.Page
{
    Admin_Login al = new Admin_Login();
    MemoryStream ms = null;
    DataTable dt = new DataTable();
    byte[] ar = null;
    string filename = string.Empty;
    int user_id;
    MemoryStream mss = null;
    byte[] arr = null;
    string filename1 = string.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            bindclass();
            bindlang();
        }

        user_id = Convert.ToInt32(Session["user_id"]);
    }
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        try
        {
            ar = new byte[FileUpload1.PostedFile.ContentLength];
            FileUpload1.PostedFile.InputStream.Read(ar, 0, FileUpload1.PostedFile.ContentLength);
            arr = new byte[FileUpload2.PostedFile.ContentLength];
            FileUpload2.PostedFile.InputStream.Read(arr, 0, FileUpload2.PostedFile.ContentLength);
            mss = new MemoryStream(arr);
            ms = new MemoryStream(ar);
            string name = txtnotesname.Text;
            string c = ddlclass.Items[ddlclass.SelectedIndex].Text;
            string l = ddllang.Items[ddllang.SelectedIndex].Text;
            int cl = Convert.ToInt32(ddlclass.SelectedValue);
            int lang = Convert.ToInt32(ddllang.SelectedValue);
            if (!string.IsNullOrEmpty(name.Trim()) && !string.IsNullOrEmpty(c.Trim()) && !string.IsNullOrEmpty(l.Trim()))
            {
                if (FileUpload1.HasFile && FileUpload2.HasFile)
                {
                    filename = Path.GetFileName(FileUpload1.FileName);
                    filename1 = Path.GetFileName(FileUpload2.FileName);
                    if (check_ext(filename) && check_image(filename1))
                    {
                        string p = FileUpload1.PostedFile.ContentLength.ToString();
                        string i = FileUpload2.PostedFile.ContentLength.ToString();
                        int a = Convert.ToInt32(p) / 1024;
                        int b = Convert.ToInt32(i) / 1024;
                        if (a < 512 && b < 512)
                        {
                            string path = "~/admin/paperFolder/" + filename;
                            FileUpload1.SaveAs(Server.MapPath(path));
                            FileUpload2.SaveAs(Server.MapPath("~/") + filename1);
                            string sql = "exec notes @userid=" + user_id + ", @notesname='" + name + "',@notesfile='" + path + "',@notesimage=@image2,@langid=" + lang + ", @classid=" + cl + ",@classname='" + c + "',@langname='" + l + "', @action=1";
                            int z = al.insert1(sql, mss.ToArray());

                            if (z > 0)
                            {
                                lblmssg.Text = "Data inserted successfully";
                                lblmssg.ForeColor = Color.Green;
                            }
                            else
                            {
                                lblmssg.Text = "Failed to insert";
                                lblmssg.ForeColor = Color.Red;
                            }

                        }
                        else if (a > 512)
                        {
                            lblmsg.Visible = true;

                            lblmsg.Text = "File should not be more than 512 Mb";
                        }
                        else if (b > 512)
                        {
                            lblmsg1.Visible = true;
                            lblmsg1.Text = "Image should not be more than 512 Mb";

                        }

                    }
                    else if (check_ext(filename) == false && check_image(filename1) == true)
                    {
                        lblmsg.Visible = true;
                        lblmsg.Text = "Incorrect file extension";
                    }
                    else if (check_ext(filename) == true && check_image(filename1) == false)
                    {
                        lblmsg1.Visible = true;
                        lblmsg1.Text = "Incorrect image type";
                    }
                }
            }
            else
            {
                lblmssg.Text = "Please fill all the details";
                lblmssg.ForeColor = Color.Red;
            }
        }
        catch (Exception ex)
        {
        }
    }
    private bool check_ext(string filename)
    {
        string ext = Path.GetExtension(filename);
        switch (ext)
        {
            case ".docx":
                return true;
            case ".pdf":
                return true;
            case ".txt":
                return true;
            default:
                return false;
        }
    }
    private bool check_image(string filename)
    {
        string ext = Path.GetExtension(filename);
        switch (ext)
        {
            case ".jpeg":
                return true;
            case ".jpg":
                return true;
            case ".png":
                return true;
            case ".gif":
                return true;
            default:
                return false;
        }
    }
    private void bindclass()
    {
        try
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
            ddllang.Items.Clear();
            dt = al.select(sql);
            if (dt.Rows.Count > 0)
            {
                DataRow dr = dt.NewRow();
                dr["lang_name"] = "--select--";
                dr["lang_id"] = "0";
                dt.Rows.InsertAt(dr, 0);
                ddllang.DataTextField = "lang_name";
                ddllang.DataValueField = "lang_id";
                ddllang.DataSource = dt;
                ddllang.DataBind();
            }
        }
        catch (Exception ex)
        {
        }
    }
}