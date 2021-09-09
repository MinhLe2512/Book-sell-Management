using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;

namespace BTL.KetNoiSQL
{
    public class controlAdmin
    {
        public void Insert(string adminName, int gioiTinh, string image, string password, string address,string phone,string email,string acc)
        {
            SqlCommand sqlCom;
            if (gioiTinh == 1)
            {
                sqlCom = new SqlCommand("insert into users values(@name,1,@image,@password,@address,@phone,@email,@acc,null,1)");
            }
            else
            {
                sqlCom = new SqlCommand("insert into users values(@name,0,@image,@password,@address,@phone,@email,@acc,null,1)");
            }
            sqlCom.CommandType = CommandType.Text;
            sqlCom.Parameters.AddWithValue("@name", adminName);
            sqlCom.Parameters.AddWithValue("@password", BuildPassword(password));
            sqlCom.Parameters.AddWithValue("@image", image);
            sqlCom.Parameters.AddWithValue("@address", address);
            sqlCom.Parameters.AddWithValue("@phone", phone);
            sqlCom.Parameters.AddWithValue("@email", email);
            sqlCom.Parameters.AddWithValue("@acc", acc);
            connectSQL.ExecuteNoneQuery(sqlCom);
        }
        public void update(string account,string adminName, int gioiTinh, string image, string password, string address, string phone, string email)
        {
            SqlCommand sqlCom;
            if (gioiTinh == 1)
            {
                sqlCom = new SqlCommand("update users set userName=@name,gioiTinh=1,urlAvatarPicture=@image,password=@password,address=@address,phone=@phone,email=@email where account=@acc");
            }
            else
            {
                sqlCom = new SqlCommand("update users set userName=@name,gioiTinh=0,urlAvatarPicture=@image,password=@password,address=@address,phone=@phone,email=@email where account=@acc");
            }
            sqlCom.CommandType = CommandType.Text;
            sqlCom.Parameters.AddWithValue("@name", adminName);
            sqlCom.Parameters.AddWithValue("@password", BuildPassword(password));
            sqlCom.Parameters.AddWithValue("@image", image);
            sqlCom.Parameters.AddWithValue("@address", address);
            sqlCom.Parameters.AddWithValue("@phone", phone);
            sqlCom.Parameters.AddWithValue("@email", email);
            sqlCom.Parameters.AddWithValue("@acc", account);
            connectSQL.ExecuteNoneQuery(sqlCom);
        }
        //update ko password -password không đổi.
        public void update(string account, string adminName, int gioiTinh, string image, string address, string phone, string email)
        {
            SqlCommand sqlCom;
            if (gioiTinh == 1)
            {
                sqlCom = new SqlCommand("update users set userName=@name,gioiTinh=1,urlAvatarPicture=@image,address=@address,phone=@phone,email=@email where account=@acc");
            }
            else
            {
                sqlCom = new SqlCommand("update users set userName=@name,gioiTinh=0,urlAvatarPicture=@image,address=@address,phone=@phone,email=@email where account=@acc");
            }
            sqlCom.CommandType = CommandType.Text;
            sqlCom.Parameters.AddWithValue("@name", adminName);
            sqlCom.Parameters.AddWithValue("@image", image);
            sqlCom.Parameters.AddWithValue("@address", address);
            sqlCom.Parameters.AddWithValue("@phone", phone);
            sqlCom.Parameters.AddWithValue("@email", email);
            sqlCom.Parameters.AddWithValue("@acc", account);
            connectSQL.ExecuteNoneQuery(sqlCom);
        }
        public void changePassword(string account, string password_new)
        {
            SqlCommand sqlCom;
           
            sqlCom = new SqlCommand("update users set password=@password where account=@acc");
            
            sqlCom.CommandType = CommandType.Text;
            sqlCom.Parameters.AddWithValue("@password", BuildPassword(password_new));
            sqlCom.Parameters.AddWithValue("@acc", account);
            connectSQL.ExecuteNoneQuery(sqlCom);
        }
        public DataTable getInforAdminByAcc(string account)
        {
            string query = @"select * from users where account=N'" + account.Trim()+"'";
            SqlCommand cmd = new SqlCommand(query);
            cmd.CommandType = CommandType.Text;
            return connectSQL.GetData(cmd);

        }
        public DataTable Login(string username, string password)
        {
            SqlCommand sqlcom = new SqlCommand("select * from users where account=@username and password=@pass and isAdmin=1");
            sqlcom.CommandType = CommandType.Text;
            sqlcom.Parameters.AddWithValue("@username", username);
            sqlcom.Parameters.AddWithValue("@pass", BuildPassword(password));
            //sqlcom.Parameters.AddWithValue("@pass", password);
            return connectSQL.GetData(sqlcom);
        }
        protected string BuildPassword(string input)
        {
            MD5 md5Hasher = MD5.Create();
            byte[] data = md5Hasher.ComputeHash(Encoding.Default.GetBytes(input));
            System.Text.StringBuilder sBuilder = new StringBuilder();
            for (int i = 0; i < data.Length; i++)
            {
                sBuilder.Append(data[i].ToString("x2"));

            }
            return sBuilder.ToString();
        }
    }
}