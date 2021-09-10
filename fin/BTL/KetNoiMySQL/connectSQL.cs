using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using MySql.Data.MySqlClient;
using System.Linq;
using System.Web;

namespace BTL.KetNoiMySQL
{
    public class connectSQL
    {
        static MySqlConnection GetConnection()
        {
            string ConnectionString = ConfigurationManager.ConnectionStrings["db_Store"].ConnectionString;
            MySqlConnection con = new MySqlConnection(ConnectionString);
            con.Open();
            return con;
        }
        public static void ExecuteNoneQuery(MySqlCommand cmd)//dung cho insert, update, delete
        {
            if (cmd.Connection != null)
            {
                cmd.ExecuteNonQuery();
            }
            else
            {
                using (MySqlConnection con = GetConnection())
                {
                    cmd.Connection = GetConnection();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
        }
        public static DataTable GetData(MySqlCommand cmd)//dung cho lenh select
        {
            if (cmd.Connection != null)
            {
                using (DataSet ds = new DataSet())
                {
                    using (MySqlDataAdapter da = new MySqlDataAdapter())
                    {
                        da.SelectCommand = cmd;
                        da.Fill(ds);
                        return ds.Tables[0];
                    }
                }
            }
            else
            {
                using (MySqlConnection con = GetConnection())
                {
                    using (DataSet ds = new DataSet())
                    {
                        using (MySqlDataAdapter da = new MySqlDataAdapter())
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