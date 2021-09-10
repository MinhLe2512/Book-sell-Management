using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//using BTL.KetNoiSQL;
using BTL.KetNoiMySQL;

namespace BTL
{
    public partial class DangNhap : System.Web.UI.Page
    {
        userKhachHang ukh = new userKhachHang();
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected bool checkInput()
        {
            if (string.IsNullOrEmpty(txtAccount.Text.Trim()))
            {
               // Response.Write("<script>alert('Tên tài khoản không được để trống');</script>");
                accError.InnerHtml = "tài khoản ko được để trống";
                return false;
            }
            else
            {
                accError.InnerHtml = "";
            }
            if (string.IsNullOrEmpty(txtPassword.Text.Trim()))
            {
               // Response.Write("<script>alert('Mật khẩu không được để trống');</script>");
                passError.InnerHtml = "Mật khẩu không được để trống";
                return false;
            }
            else
            {
                passError.InnerHtml = "";
            }
            return true;
        }
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (checkInput() == true)
            {
                //mật khẩu mấu user là aaaa:12345 ; qae:12345
                DataTable tb = new DataTable();
                tb = ukh.DangNhap(txtAccount.Text.Trim(), txtPassword.Text.Trim());
                if (tb.Rows.Count > 0)
                {
                    Session["loginAccount"] = txtAccount.Text.Trim();
                    Session["userName"] = tb.Rows[0]["userName"];
                    Session["userID"] = tb.Rows[0]["userID"];
                    Session["avatarUser"] = "images/" + tb.Rows[0]["urlAvatarPicture"];
                    string url =Session["urlTruocLogin"].ToString();
                    if(url!="" && url.IndexOf("/DangNhap.aspx")==-1 && url.IndexOf("/DangKy.aspx")==-1)
                       Response.Redirect(url);
                    else
                      Response.Redirect("TrangChu.aspx");
                   
                } 
                else
                {
                    Response.Write("<script>alert('Tài khoản hoặc mật khẩu không chính xác');</script>");
                    return;
                }
              
              
            }
        }
    }
}