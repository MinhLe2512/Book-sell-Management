using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net.Mail;
using System.Security.Cryptography;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//using BTL.KetNoiSQL;
using BTL.KetNoiMySQL;

namespace BTL.admin.Users
{
    public partial class UserAdmin : System.Web.UI.UserControl
    {
        controlAdmin admin = new controlAdmin();
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnAddNew_Click(object sender, EventArgs e)
        {
            txtAcc.Text = "";
            hdInsert.Value = "add";
            txtAdminName.Text = "";
           // drpGioiTinh.SelectedValue = "";
            txtPassword.Text = "";
            txtDiaChi.Text = "";
            txtDT.Text = "";
            txtEmail.Text = "";
            txtAcc.Enabled = true;
            txtPassword.Enabled = true;

            RequiredFieldValidator4.Enabled = true;
            RequiredFieldValidator6.Enabled = true;
            btnUpdate.Text = "Thêm mới";
            MultiViewUser.ActiveViewIndex = 0;
        }
        protected void btnEditInfor_Click(object sender, EventArgs e)
        {
            hdInsert.Value = "editInfor";
            DataTable tb = new DataTable();
            tb = admin.getInforAdminByAcc(Session["username"].ToString());
           
            if (tb.Rows.Count > 0)
            {
                txtAcc.Text = "";
                txtAdminName.Text = tb.Rows[0]["userName"].ToString();
                if (tb.Rows[0]["gioiTinh"].ToString().Trim() == "True")
                    drpGioiTinh.SelectedValue = "1";
                else drpGioiTinh.SelectedValue = "0";
                txtPassword.Text = "";
                txtDiaChi.Text = tb.Rows[0]["address"].ToString();
                txtDT.Text = tb.Rows[0]["phone"].ToString();
                txtEmail.Text = tb.Rows[0]["email"].ToString();
                txtAcc.Enabled = false;
                txtPassword.Enabled = false;
            }

            RequiredFieldValidator4.Enabled = false;
            RequiredFieldValidator6.Enabled = false;
            btnUpdate.Text = "Cập nhật";
            MultiViewUser.ActiveViewIndex = 0;
        }
        protected bool checkInput()
        {
            if (string.IsNullOrEmpty(txtAdminName.Text.Trim()))
            {
                Response.Write("<script>alert('Tên không được để trống');</script>");
                return false;
            }
            
            if (string.IsNullOrEmpty(txtDiaChi.Text.Trim()))
            {
                Response.Write("<script>alert('Địa chỉ không được để trống');</script>");
                return false;
            }
            //
            if (string.IsNullOrEmpty(txtDT.Text.Trim()))
            {
                Response.Write("<script>alert('Số điện thoại không được để trống');</script>");
                return false;
            }
           
            //if (!Regex.Match(txtDT.Text.Trim(), "/((09|03|07|08|05)+([0-9]{8})\b)/g").Success)
            //if (!Regex.Match(txtDT.Text.Trim(),@"^0\d{10}").Success)
            //{
            //Response.Write("<script>alert('Số điện thoại không hợp lệ, chỉ gồm số nguyên dương và có 10 chữ số');</script>");
            //return false;
            //}
            //
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
           
            return true;
        }
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            //upload image
            string typefile = "";
            string file = hdImage.Value;//nếu là update data thì vẫn là file image cũ, nếu ko set giá trị cho biến file thì url file của image cũ sẽ mất trong sql server
            if (fUpImage.FileName.Length > 0)
            {
                if (fUpImage.PostedFile.ContentLength < 5000000)//dưới 5 mb
                {
                    if (fUpImage.PostedFile.ContentType.Equals("image/jpeg") || fUpImage.PostedFile.ContentType.Equals("image/x-png") || fUpImage.PostedFile.ContentType.Equals("image/png") || fUpImage.PostedFile.ContentType.Equals("image/gif") || fUpImage.PostedFile.ContentType.Equals("application/x-shockwave-flash"))
                    {
                        typefile = System.IO.Path.GetExtension(fUpImage.FileName).ToLower();
                        file = System.IO.Path.GetFileName(fUpImage.PostedFile.FileName);
                        file = fUpImage.FileName.Replace(file, "AvatarAdmin" + DateTime.Now.Hour + DateTime.Now.Year + DateTime.Now.Month + DateTime.Now.Day + DateTime.Now.Minute + DateTime.Now.Second + typefile);
                        fUpImage.PostedFile.SaveAs(Server.MapPath("~/images/") + file); //lưu vào forder images trong project

                    }
                }
            }
            //kiểm tra image mới có là image cũ, khi update nếu chọn file mới thì xóa bỏ file cũ đi
            if (!file.Equals(hdImage.Value))
            {
                if (!hdImage.Value.Equals(""))
                {
                    if (System.IO.File.Exists(Server.MapPath("~/images/" + hdImage.Value)) == true)
                    {
                        System.IO.File.Delete(Server.MapPath("~/images/" + hdImage.Value));
                    }
                }
            }
            if (checkInput())
            { //them moi data
                if (hdInsert.Value == "add")
                {
                    if (string.IsNullOrEmpty(txtPassword.Text.Trim()))
                    {
                        Response.Write("<script>alert('Mật khẩu không được để trống');</script>");
                        return;
                    }
                    if (string.IsNullOrEmpty(txtAcc.Text.Trim()))
                    {
                        Response.Write("<script>alert('Tên tài khoản không được để trống');</script>");
                        return;
                    }
                    DataTable tb = new DataTable();
                    tb = admin.getInforAdminByAcc(txtAcc.Text.Trim());
                    if (tb.Rows.Count > 0)
                    {
                        Response.Write("<script>alert('Tên tài khoản đã tồn tại, vui lòng đặt tên khác');</script>");
                        return;
                    }
                    admin.Insert(txtAdminName.Text.Trim(), int.Parse(drpGioiTinh.SelectedValue.ToString()),file, txtPassword.Text.Trim(), txtDiaChi.Text.Trim(), txtDT.Text.Trim(), txtEmail.Text.Trim(), txtAcc.Text.Trim());
                }
                else
                {//cập nhật data
                    Session["avatarAdmin"] = file;
                    Session["userAdminname"] = txtAdminName.Text.Trim();
                    //cập nhật khi password thay đổi
                    if (!string.IsNullOrEmpty(txtPassword.Text.Trim()))
                        admin.update(Session["username"].ToString(), txtAdminName.Text.Trim(), int.Parse(drpGioiTinh.SelectedValue.ToString()), file, txtPassword.Text.Trim(), txtDiaChi.Text.Trim(), txtDT.Text.Trim(), txtEmail.Text.Trim());
                    //cập nhật khi password ko đổi
                   else
                        admin.update(Session["username"].ToString(), txtAdminName.Text.Trim(), int.Parse(drpGioiTinh.SelectedValue.ToString()), file, txtDiaChi.Text.Trim(), txtDT.Text.Trim(), txtEmail.Text.Trim());

                }
                Response.Redirect(Request.Url.ToString());
            }
        }
        protected void btnChangeMK_Click(object sender, EventArgs e)
        {
            DataTable tb = new DataTable();
            tb =admin.Login(Session["username"].ToString(),txtMkCu.Text.Trim());

            if (tb.Rows.Count > 0)
            {
                string mk1 = txtMkMoi.Text.Trim();
                string mk2 = txtMkMoi2.Text.Trim();
                if (txtMkCu.Text.Trim() == mk1)
                {
                    Response.Write("<script>alert('Mật khẩu mới không được giống mật khẩu cũ');</script>");
                    return;
                }
                if (mk1 == mk2)
                {
                    admin.changePassword(Session["username"].ToString(), mk1);
                    Response.Write("<script>alert('Đổi mật khẩu thành công');</script>");
                }
                else
                {
                    //đã kiểm tra ở client.
                    Response.Write("<script>alert('Mật khẩu mới không giống nhập lại mật khẩu mới');</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Mật khẩu cũ không chính xác');</script>");
            }
        }
   


        protected void lnkChangePass_Click(object sender, EventArgs e)
        {
            MultiViewUser.ActiveViewIndex = 1;
        }
    }
}