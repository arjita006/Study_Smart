using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
/// <summary>
/// Summary description for Admin_Login
/// </summary>
public class Admin_Login
{

    public SqlConnection con = null;
    public SqlCommand cmd = null;

    public SqlDataAdapter da = null;
    public DataTable dt = null;
    public SqlDataReader dr = null;
    public DataSet ds = null;
    public Admin_Login()
    {
        try
        {
            ds = new DataSet();
            dt = new DataTable();
            cmd = new SqlCommand();

            string sql = @"Data Source=LAPTOP-JQ3T7LE9;Initial Catalog=Project;User ID=sa;Password=arjita006";
            con = new SqlConnection(sql);
            con.Open();
        }
        catch (Exception ex)
        {
        }
    }
    public int insert1(string sql, byte[] arr)
    {
        int k = 0;

        try
        {
            if (ConnectionState.Closed == con.State)
            {
                con.Open();
            }
            cmd.CommandText = sql;
            cmd.Connection = con;
            if (arr != null)
                cmd.Parameters.Add("@image2", SqlDbType.VarBinary, Int32.MaxValue).Value = arr;
            k = cmd.ExecuteNonQuery();

        }
        catch (Exception ex)
        { }
        finally
        {
            con.Close();
            cmd.Dispose();
        }
        return k;
    }
    public int insert2(string sql, byte[] ar, byte[] arr)
    {
        int k = 0;

        try
        {
            if (ConnectionState.Closed == con.State)
            {
                con.Open();
            }
            cmd.CommandText = sql;
            cmd.Connection = con;
            cmd.Parameters.Add("@image2", SqlDbType.VarBinary, Int32.MaxValue).Value = ar;
            cmd.Parameters.Add("@image3", SqlDbType.VarBinary, Int32.MaxValue).Value = arr;
            k = cmd.ExecuteNonQuery();

        }
        catch (Exception ex)
        { }
        finally
        {
            con.Close();
            cmd.Dispose();
        }
        return k;
    }
    public int count(string sql)
    {
        int k = 0;
        try
        {

            if (ConnectionState.Closed == con.State)
            {
                con.Open();
            }
            cmd.CommandText = sql;
            cmd.Connection = con;
            k = (int)cmd.ExecuteScalar();

        }
        catch (Exception ex)
        { }
        finally
        {
            con.Close();
            cmd.Dispose();
        }
        return k;
    }

    public int login(string sql)
    {
        int k = 0;
        try
        {
            if (ConnectionState.Closed == con.State)
            {
                con.Open();
            }
            cmd.CommandText = sql;
            cmd.Connection = con;
            k = (int)cmd.ExecuteScalar();

        }
        catch (Exception ex)
        {
            // ex.Message();
        }
        finally
        {
            con.Close();
            cmd.Dispose();
        }
        return k;
    }
    public int checkdata(string sql)
    {
        int k = 0;
        try
        {
            if (ConnectionState.Closed == con.State)
            {
                con.Open();
            }
            cmd.CommandText = sql;
            cmd.Connection = con;
            k = (int)cmd.ExecuteScalar();

        }
        catch (Exception ex)
        {
            // ex.Message();
        }
        finally
        {
            con.Close();
            cmd.Dispose();
        }
        return k;
    }
    public int insert(string sql)
    {
        int k = 0;
        try
        {

            if (ConnectionState.Closed == con.State)
            {
                con.Open();
            }
            cmd.CommandText = sql;
            cmd.Connection = con;
            k = cmd.ExecuteNonQuery();

        }
        catch (Exception ex)
        { }
        finally
        {
            con.Close();
            cmd.Dispose();
        }
        return k;
    }

    public DataTable select(string sql)
    {
        cmd.Connection = con;

        try
        {
            if (ConnectionState.Closed == con.State)
            {
                con.Open();
            }

            cmd.CommandText = sql;
            da = new SqlDataAdapter(cmd);
            da.Fill(dt);
        }
        catch (Exception ex)
        { }
        finally
        {
            con.Close();
            cmd.Dispose();
        }
        return dt;
    }
    public DataSet search(string sql)
    {
        cmd.Connection = con;
        cmd.CommandText = sql;
        da = new SqlDataAdapter(cmd);
        da.Fill(ds);
        return ds;
    }

}