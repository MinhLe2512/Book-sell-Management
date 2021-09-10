using System;
using System.Collections.Generic;
using System.Data;
using MySql.Data.MySqlClient;
using System.Linq;
using System.Web;

namespace BTL.KetNoiMySQL
{
    public class clsComment
    {
        public void Insert(int userId, int watchID, DateTime date, string content, int idCommentReplid)
        {
            MySqlCommand sqlCom;
            if(idCommentReplid==-1)
                sqlCom = new MySqlCommand("insert into comments(userID_pk, chiTietDHid_pk, createDate, content, active, idCommentReplied) values(@userid,@watchid,@date,@content,1,null)");
            else
                sqlCom = new MySqlCommand("insert into comments(userID_pk, chiTietDHid_pk, createDate, content, active, idCommentReplied) values(@userid,@watchid,@date,@content,1,@idCommentReplied)");
            sqlCom.CommandType = CommandType.Text;
            sqlCom.Parameters.AddWithValue("@userid", userId);
            sqlCom.Parameters.AddWithValue("@watchid", watchID);
            sqlCom.Parameters.AddWithValue("@date", date);
            sqlCom.Parameters.AddWithValue("@content", content);
            sqlCom.Parameters.AddWithValue("@idCommentReplied", idCommentReplid);
            connectSQL.ExecuteNoneQuery(sqlCom);
        }
        public DataTable getCommentsByWatchID(int id)
        {
            string query = @"select * from comments,users where userID=userID_pk and chiTietDHid_pk="+id;
            MySqlCommand cmd = new MySqlCommand(query);
            cmd.CommandType = CommandType.Text;
            return connectSQL.GetData(cmd);

        }
        public void InsertUserLike(int userId, int commentID)
        {
            MySqlCommand sqlCom;
            sqlCom = new MySqlCommand("insert into userLikeComment values(@userid,@comid)");
            sqlCom.CommandType = CommandType.Text;
            sqlCom.Parameters.AddWithValue("@userid", userId);
            sqlCom.Parameters.AddWithValue("@comid", commentID);
            connectSQL.ExecuteNoneQuery(sqlCom);
        }
        public bool UserHaveLikeComment(int userId, int commentID)
        {
            MySqlCommand sqlCom;
            sqlCom = new MySqlCommand("select * from userLikeComment where userID_pk=@userid and commentID_pk=@comid");
            sqlCom.CommandType = CommandType.Text;
            sqlCom.Parameters.AddWithValue("@userid", userId);
            sqlCom.Parameters.AddWithValue("@comid", commentID);
            DataTable dt= connectSQL.GetData(sqlCom);
            if (dt.Rows.Count > 0)
                return true;
            else
                return false;
        }
        public void UserBoLike(int userId, int commentID)
        {
            MySqlCommand sqlCom;
            sqlCom = new MySqlCommand("DELETE from userLikeComment where  userID_pk=@userid and commentID_pk=@comid");
            sqlCom.CommandType = CommandType.Text;
            sqlCom.Parameters.AddWithValue("@userid", userId);
            sqlCom.Parameters.AddWithValue("@comid", commentID);
            connectSQL.ExecuteNoneQuery(sqlCom);
        }
        public DataTable NumberLikeComment(int commentID)
        {
            string query = "select * from userLikeComment where commentID_pk=" + commentID;
            MySqlCommand cmd = new MySqlCommand(query);
            cmd.CommandType = CommandType.Text;
            return connectSQL.GetData(cmd);
        }
    }
}