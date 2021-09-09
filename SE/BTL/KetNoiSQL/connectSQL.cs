using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace BTL.KetNoiSQL
{
    public class connectSQL
    {
        static SqlConnection GetConnection()
        {
            string ConnectionString = ConfigurationManager.ConnectionStrings["db_Watchs"].ConnectionString;
            SqlConnection con = new SqlConnection(ConnectionString);
            con.Open();
            return con;
        }
        public static void ExecuteNoneQuery(SqlCommand cmd)//dung cho insert, update, delete
        {
            if (cmd.Connection != null)
            {
                cmd.ExecuteNonQuery();
            }
            else
            {
                using (SqlConnection con = GetConnection())
                {
                    cmd.Connection = GetConnection();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
        }
        public static DataTable GetData(SqlCommand cmd)//dung cho lenh select
        {
            if (cmd.Connection != null)
            {
                using (DataSet ds = new DataSet())
                {
                    using (SqlDataAdapter da = new SqlDataAdapter())
                    {
                        da.SelectCommand = cmd;
                        da.Fill(ds);
                        return ds.Tables[0];
                    }
                }
            }
            else
            {
                using (SqlConnection con = GetConnection())
                {
                    using (DataSet ds = new DataSet())
                    {
                        using (SqlDataAdapter da = new SqlDataAdapter())
                        {
                            cmd.Connection = con;
                            da.SelectCommand = cmd;
                            da.Fill(ds);
                            con.Close();
                            return ds.Tables[0];
                        }
                    }
                }
            }
        }
    }
}