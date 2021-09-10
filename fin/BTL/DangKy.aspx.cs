using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//using BTL.KetNoiSQL;
using BTL.KetNoiMySQL;

namespace BTL
{
    public partial class DangKy : System.Web.UI.Page
    {
        userKhachHang uKH = new userKhachHang();
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected bool checkInput()
        {
            if (string.IsNullOrEmpty(txtHoTen.Text.Trim()))
            {
                Response.Write("<script>alert('Tên không được để trống');</script>");
                return false;
            }       
            if (string.IsNullOrEmpty(txtSDT.Text.Trim()))
            {
                Response.Write("<script>alert('Số điện thoại không được để trống');</script>");
                return false;
            }
            try
            {
                long.Parse(txtSDT.Text.Trim());
            }
            catch
            {
                Response.Write("<script>alert('Số điện thoại phải gồm các số nguyên');</script>");
                return false;
            }
            if (string.IsNullOrEmpty(txtEmail.Text.Trim()))
            {
                Response.Write("<script>alert('Email không được để trống');</script>");
                return false;
            }
            if (!Regex.Match(txtEmail.Text.Trim(), @"^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$").Success)
            {
                Response.Write("<script>alert('Email không hợp lệ');</script>");
                return false;
            }
            //
            if (string.IsNullOrEmpty(txtAccount.Text.Trim()))
            {
                Response.Write("<script>alert('Tên tài khoản không được để trống');</script>");
                return false;
            }
            if (string.IsNullOrEmpty(txtPassword.Text.Trim()))
            {
                Response.Write("<script>alert('Mật khẩu không được để trống');</script>");
                return false;
            }
           
          
            if (RadioBtnGioiTinh.SelectedValue == "")
            {
                Response.Write("<script>alert('Bạn chưa chọn giới tính');</script>");
                return false;
            }

            return true;
        }
        protected void btnCreate_Click(object sender, EventArgs e)
        {
            if (checkInput() == true)
            {
                DateTime ngaySinh=new DateTime(1900,1,1);
                if (!string.IsNullOrEmpty(txtNgaysinh.Text.Trim()))
                {
                    try
                    {
                        ngaySinh = DateTime.Parse(txtNgaysinh.Text.Trim());
                    }
                    catch (Exception)
                    {
                        Response.Write("<script>alert('Ngày sinh không hợp lệ');</script>");
                        return;
                    }
                }
                DataTable tb = new DataTable();
                tb =uKH.getKhachHangByAcc(txtAccount.Text.Trim());
                if (tb.Rows.Count > 0)
                {
                    Response.Write("<script>alert('Tài khoản đã tồn tại, vui lòng đặt tên khác');</script>");
                    return;
                }
                uKH.Insert(txtHoTen.Text.Trim(),int.Parse(RadioBtnGioiTinh.SelectedValue), txtPassword.Text.Trim(), txtSDT.Text.Trim(), txtEmail.Text.Trim(), txtAccount.Text.Trim(), ngaySinh);
                Response.Redirect("/DangKy.aspx");
            }
        }
    }
}