using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//using BTL.KetNoiSQL;
using BTL.KetNoiMySQL;

namespace BTL
{
    public partial class ThanhToan : System.Web.UI.Page
    {
        clsDonHang dh = new clsDonHang();
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        private void Thanh_Toan(int kieuThanhToan)
        {
            var hoten = customer_name.Text.ToString().Trim();
            var sdt = customer_phone.Text.Trim();
            var diaChi = customer_address.Text.Trim();
            var email = customer_email.Text.Trim();
            var ghiChu = ghi_chu.Text.Trim();
            dh.InsertDonDatHang(ghiChu, kieuThanhToan, hoten, sdt, email, diaChi);

            List<clsGioHang> arr = (List<clsGioHang>)Session["giohang"];
            foreach (clsGioHang sp in arr)
            {
                dh.InsertChiTietDonDatHang(int.Parse(sp.id),int.Parse(sp.number));
            }
            Session["giohang"] = new List<clsGioHang>();
            Response.Redirect("GioHang.aspx");
        }
        protected void CODpayment_Click(object sender, EventArgs e)
        {
            Thanh_Toan(1);
        }

        protected void ONLpayment_Click(object sender, EventArgs e)
        {
            Thanh_Toan(2);
        }
    }
}