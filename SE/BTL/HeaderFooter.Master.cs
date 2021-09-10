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
    public partial class HeaderFooter : System.Web.UI.MasterPage
    {
        clsDHforDisplay dh = new clsDHforDisplay();
        protected void Page_Load(object sender, EventArgs e)
        {
           
            get10NameTypeDH();
            List<clsGioHang> arr = (List<clsGioHang>)Session["giohang"];
            int soLuong=0;
            foreach (clsGioHang sp in arr)
            {
                soLuong += int.Parse(sp.number);
            }
            TotalWatchBuy.Text = soLuong.ToString();

            if(HttpContext.Current.Request.Url.AbsolutePath != "/DangNhap.aspx")
            {
                if (Request.UrlReferrer != null)
                    Session["urlTruocLogin"] = Request.UrlReferrer.ToString();
            }

            if (Session["loginAccount"].ToString() != "-1")
            {
                loginLogout.InnerHtml = "<a href=\" #\">" + Session["userName"].ToString() + "</a><span id =\"chia\">|</span ><a href=\"DangXuat.aspx\" style=\"color: #FFF200;\">Đăng xuất</a> ";
               Session["url"] = Page.Request.Url.ToString();
            }
            else
            {
                loginLogout.InnerHtml = "<a href=\" /DangNhap.aspx\">Đăng nhập</a><span id =\"chia\">|</span><a href =\"/DangKy.aspx\"> Đăng ký </a> ";
              
            }
            
        }
        protected void btnsearch_Click(object sender, EventArgs e)
        {
            string search = "/DongHo.aspx?searchKeys=" + txtsearch.Text;
            Response.Redirect(search);
        
        }
        protected void get10NameTypeDH()
        {
            rptDropdownMenu.DataSource = dh.get10TypeDH();
            rptDropdownMenu.DataBind();
        }
     
    }
}