using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MySql.Data.MySqlClient;
using System.Data;
using System.Security.Cryptography;
using System.Text;

namespace BTL.KetNoiMySQL
{
    public class userKhachHang
    {
        public void Insert(string Name, int gioiTinh, string password, string phone, string email, string acc,DateTime ngaySinh)
        {
            MySqlCommand sqlCom;
            if (gioiTinh == 1)
            {
                sqlCom = new MySqlCommand("insert into users(userName, gioiTinh, urlAvatarPicture, password, address, phone, email, account, ngaySinh, isAdmin) values(@name,1,null,@password,'',@phone,@email,@acc,@ngaysinh,0)");
            }
            else
            {
                sqlCom = new MySqlCommand("insert into users(userName, gioiTinh, urlAvatarPicture, password, address, phone, email, account, ngaySinh, isAdmin) values(@name,0,null,@password,'',@phone,@email,@acc,@ngaysinh,0)");
            }
            sqlCom.CommandType = CommandType.Text;
            sqlCom.Parameters.AddWithValue("@name", Name);
            sqlCom.Parameters.AddWithValue("@password", BuildPassword(password));
            sqlCom.Parameters.AddWithValue("@phone", phone);
            sqlCom.Parameters.AddWithValue("@email", email);
            sqlCom.Parameters.AddWithValue("@acc", acc);
            sqlCom.Parameters.AddWithValue("@ngaysinh", ngaySinh);
            connectSQL.ExecuteNoneQuery(sqlCom);
        }
        public DataTable getKhachHangByAcc(string account)
        {
            string query = @"select * from users where account=N'" + account.Trim() + "'";
            MySqlCommand cmd = new MySqlCommand(query);
            cmd.CommandType = CommandType.Text;
            return connectSQL.GetData(cmd);

        }
        public DataTable DangNhap(string username, string password)
        {
            MySqlCommand sqlcom = new MySqlCommand("select * from users where account=@username and password=@pass and isAdmin=0");
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