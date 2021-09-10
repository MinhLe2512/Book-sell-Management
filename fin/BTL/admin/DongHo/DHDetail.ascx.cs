using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//using BTL.KetNoiSQL;
using BTL.KetNoiMySQL;

namespace BTL.admin.DongHo
{
    public partial class DHDetail : System.Web.UI.UserControl
    {
        clsDongHo dh = new clsDongHo();
        protected void Page_Load(object sender, EventArgs e)
        {
                LoadDataDropDownList1();
                LoadWatchDetail();
                LoadDataDropDownList();
        }
        void LoadDataDropDownList()//load các loại đồng hồ cho view 1 để thêm watch detatail
        {
            drpWatchCategory2.DataSource = dh.GetList();
            drpWatchCategory2.DataValueField = "typeDHid";
            drpWatchCategory2.DataTextField = "nameTypeDH";
            drpWatchCategory2.DataBind();
        }
        void LoadDataDropDownList1()//load các loại đồng hồ cho view 0 để lọc watch detail đang có
        {
            drpWatchCategory.DataSource = dh.GetList();
            drpWatchCategory.DataValueField = "typeDHid";
            drpWatchCategory.DataTextField = "nameTypeDH";
            drpWatchCategory.DataBind();
        }
        void LoadWatchDetail()
        {
            rptWatchDetails.DataSource = dh.GetListWatchDetailByCate(int.Parse(drpWatchCategory.SelectedValue.ToString()));
            rptWatchDetails.DataBind();
        }
        protected void msgDel(object sender, System.EventArgs e)
        {
            ((LinkButton)sender).Attributes["onclick"] = "return confirm('Bạn có chắc chắn muốn xóa bỏ đồng hồ này?')";
        }

        long price = 0, quantity =0 , doChiuNuoc=0;
        double sale =0 , sizeDay=0 , duongKinhMat=0, duongKinhVo=0, timeBaoHanh=0;
        protected bool checkInput()
        {          
            if (string.IsNullOrEmpty(txtCode.Text.Trim()))
            {
                Response.Write("<script>alert('Mã số đồng hồ không được để trống');</script>");
                return false;
            }         
            if (string.IsNullOrEmpty(txtKieuDang.Text.Trim()))
            {
                Response.Write("<script>alert('Kiểu dáng đồng hồ không được để trống');</script>");
                return false;
            }
            //------------------------
            if (string.IsNullOrEmpty(txtPrice.Text.Trim()))
            {
                Response.Write("<script>alert('Giá của đồng hồ không được để trống');</script>");
                return false;
            }
            try
            {
                price=long.Parse(txtPrice.Text.Trim());
                if(price<=0)
                {
                    Response.Write("<script>alert('Giá của đồng hồ phải là số nguyên lớn hơn 0');</script>");
                    return false;
                }
            }
            catch(Exception)
            {
                Response.Write("<script>alert('Giá của đồng hồ phải là số nguyên lớn hơn 0');</script>");
                return false;
            }
            //------------------------
            if (string.IsNullOrEmpty(txtSale.Text.Trim()))
            {
                sale = 0;
            }
            else
            { 
                try
                {
                    sale = double.Parse(txtSale.Text.Trim());
                    if (sale < 0 || sale>100)
                    {
                        Response.Write("<script>alert('Mức giảm giá phải là số thực từ 0 đến 100');</script>");
                        return false;
                    }
                }
                catch (Exception)
                {
                    Response.Write("<script>alert('Mức giảm giá phải là số thực từ 0 đến 100');</script>");
                    return false;
                }
            }
            //------------------------
            if (string.IsNullOrEmpty(txtQuantity.Text.Trim()))
            {
                Response.Write("<script>alert('Số lượng đồng hồ không được để trống');</script>");
                return false;
            }
            try
            {
                quantity = long.Parse(txtQuantity.Text.Trim());
                if (quantity <= 0)
                {
                    Response.Write("<script>alert('Số lượng đồng hồ phải là số nguyên lớn hơn 0');</script>");
                    return false;
                }
            }
            catch (Exception)
            {
                Response.Write("<script>alert('Số lượng đồng hồ phải là số nguyên lớn hơn 0');</script>");
                return false;
            }
            //------------------------
            if (string.IsNullOrEmpty(txtDoChiuNuoc.Text.Trim()))
            {
                doChiuNuoc = 0;
            }
            else
            {
                try
                {
                    doChiuNuoc = long.Parse(txtDoChiuNuoc.Text.Trim());
                    if (doChiuNuoc <= 0)
                    {
                        Response.Write("<script>alert('Độ chịu nước phải là số nguyên dương');</script>");
                        return false;
                    }
                }
                catch (Exception)
                {
                    Response.Write("<script>alert('Độ chịu nước phải là số nguyên dương');</script>");
                    return false;
                }
            }
            //------------------------
            if (string.IsNullOrEmpty(txtDuongKinhMat.Text.Trim()))
            {
                duongKinhMat = 0;
            }
            else
            {
                try
                {
                    duongKinhMat = double.Parse(txtDuongKinhMat.Text.Trim());
                    if (duongKinhMat <= 0)
                    {
                        Response.Write("<script>alert('Đường kính mặt phải là số thực lớn hơn 0');</script>");
                        return false;
                    }
                }
                catch (Exception)
                {
                    Response.Write("<script>alert('Đường kính mặt phải là số thực lớn hơn 0');</script>");
                    return false;
                }
            }
            //------------------------
            if (string.IsNullOrEmpty(txtSizeDay.Text.Trim()))
            {
                sizeDay = 0;
            }
            else
            {
                try
                {
                    sizeDay = double.Parse(txtSizeDay.Text.Trim());
                    if (sizeDay <= 0)
                    {
                        Response.Write("<script>alert('Kích cỡ dây phải là số thực lớn hơn 0');</script>");
                        return false;
                    }
                }
                catch (Exception)
                {
                    Response.Write("<script>alert('Kích cỡ dây phải là số thực lớn hơn 0');</script>");
                    return false;
                }
            }
            //------------------------
            if (string.IsNullOrEmpty(txtDuongKinhVo.Text.Trim()))
            {
                duongKinhVo = 0;
            }
            else
            {
                try
                {
                    duongKinhVo = double.Parse(txtDuongKinhVo.Text.Trim());
                    if (duongKinhVo <= 0)
                    {
                        Response.Write("<script>alert('Đường kính vỏ phải là số thực lớn hơn 0');</script>");
                        return false;
                    }
                }
                catch (Exception)
                {
                    Response.Write("<script>alert('Đường kính vỏ phải là số thực lớn hơn 0');</script>");
                    return false;
                }
            }
            //------------------------
            if (string.IsNullOrEmpty(txtTimeBaoHanh.Text.Trim()))
            {
                timeBaoHanh = 0;
            }
            else
            {
                try
                {
                    timeBaoHanh = double.Parse(txtTimeBaoHanh.Text.Trim());
                    if (timeBaoHanh <= 0)
                    {
                        Response.Write("<script>alert('Thời gian bảo hành phải là số thực lớn hơn 0');</script>");
                        return false;
                    }
                }
                catch (Exception)
                {
                    Response.Write("<script>alert('Thời gian bảo hành phải là số thực lớn hơn 0');</script>");
                    return false;
                }
            }
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
                        file = fUpImage.FileName.Replace(file, "ALTWatch" + DateTime.Now.Hour + DateTime.Now.Year + DateTime.Now.Month + DateTime.Now.Day + DateTime.Now.Minute + DateTime.Now.Second + typefile);
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
                if (hdInsert.Value == "insert")
                {
                    if (fUpImage.FileName.Length <= 0)
                    {
                        Response.Write("<script>alert('Ảnh đồng hồ không được để trống');</script>");
                        return;
                    }
                    bool active = chkActive.Checked ? true : false;                  
                    dh.InsertDatail(int.Parse(drpWatchCategory2.SelectedValue.ToString()), txtCode.Text.Trim(),price,sale, file,quantity, DateTime.Now, txtKieuDang.Text.Trim(), txtNangLuong.Text.Trim(),doChiuNuoc, txtChatLieuMat.Text.Trim(),duongKinhMat, txtChatLieuDay.Text.Trim(),sizeDay, txtChatLieuVo.Text.Trim(),duongKinhVo,timeBaoHanh, active);                   
                }
                else
                {//cập nhật data
                                    
                        bool active = chkActive.Checked ? true : false;
                        dh.UpdateDatailWatch(int.Parse(hdDetailID.Value.ToString()), int.Parse(drpWatchCategory2.SelectedValue.ToString()), txtCode.Text.Trim(), price, sale, file, quantity, txtKieuDang.Text.Trim(), txtNangLuong.Text.Trim(), doChiuNuoc, txtChatLieuMat.Text.Trim(), duongKinhMat, txtChatLieuDay.Text.Trim(), sizeDay, txtChatLieuVo.Text.Trim(), duongKinhVo, timeBaoHanh, active);
                }
                Response.Redirect(Request.Url.ToString());
            }
        }
        protected void lnkAddNew_Click(object sender, EventArgs e)
        {
            txtNangLuong.Text = "1";
            txtDoChiuNuoc.Text = "1";
            txtChatLieuMat.Text = "1";
            txtDuongKinhMat.Text = "1";
            txtSizeDay.Text = "1";
            txtChatLieuVo.Text = "1";
            txtDuongKinhVo.Text = "1";
            txtTimeBaoHanh.Text = "1";
            hdInsert.Value = "insert";
            mulDetailWatch.ActiveViewIndex = 1;
        }
        protected void rptWatchDetails_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            DataTable dt = new DataTable();
            dt = dh.GetListWatchDetails_by_DelID(int.Parse(e.CommandArgument.ToString()));
            switch (e.CommandName.ToString())
            {
                case "Update":
                    if (dt.Rows.Count > 0)
                    {                      
                        drpWatchCategory2.SelectedValue = dt.Rows[0]["typeDHid_pk"].ToString();                    
                        txtCode.Text = dt.Rows[0]["code"].ToString();
                        txtPrice.Text = dt.Rows[0]["price"].ToString();
                        txtSale.Text = dt.Rows[0]["sale"].ToString();
                        hdImage.Value = dt.Rows[0]["urlPicture"].ToString();
                        imgViewDH.Src = "/images/" + dt.Rows[0]["urlPicture"].ToString();
                        imgViewDH.Style.Add("display", "block");
                        hdDetailID.Value = e.CommandArgument.ToString();
                        txtQuantity.Text = dt.Rows[0]["quantity"].ToString();
                        txtKieuDang.Text = dt.Rows[0]["kieuDang"].ToString();
                        txtNangLuong.Text = "1";
                        txtDoChiuNuoc.Text = "1";
                        txtChatLieuMat.Text = "1";
                        txtDuongKinhMat.Text = "1";
                        txtChatLieuDay.Text = dt.Rows[0]["chatLieuDay"].ToString();
                        txtSizeDay.Text = "1";
                        txtChatLieuVo.Text = "1";
                        txtDuongKinhVo.Text = "1";
                        txtTimeBaoHanh.Text = "1";

                        //chkActive.Checked = ((bool)dt.Rows[0]["active"]) ? true : false;
                        chkActive.Checked = true;

                        hdInsert.Value = "update";
                        mulDetailWatch.ActiveViewIndex = 1;
                    }
                    break;
                case "Delete":
                    if (dt.Rows.Count > 0)
                    {
                        //xóa bỏ image trong thư mục images

                        if (System.IO.File.Exists(Server.MapPath("~/images/" + dt.Rows[0]["urlPicture"])) == true)
                        {
                            System.IO.File.Delete(Server.MapPath("~/images/" + dt.Rows[0]["urlPicture"]));
                        }

                        //xóa dữ liệu trong sql server
                        try
                        {
                            dh.DeleteWatchDetail(int.Parse(e.CommandArgument.ToString()));
                        }catch(Exception )
                        {
                            Response.Write("<script>alert('Không thể xóa');</script>");

                        }
                        //Response.Redirect(Request.Url.ToString());

                    }
                    break;
                default: int a = 9; break;
            }
        }

        protected void drpWatchCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadWatchDetail();
        }
    }
}