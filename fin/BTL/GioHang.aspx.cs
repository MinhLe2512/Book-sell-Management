using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BTL
{
    public partial class GioHang : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
          
                long totalprice = 0;
                List<clsGioHang> arr = (List<clsGioHang>)Session["giohang"];
                if (arr.Count > 0)
                {

                    int soLuong = 0;
                    foreach (clsGioHang sp in arr)
                    {
                        totalprice += long.Parse(sp.totalMoney);
                        soLuong += int.Parse(sp.number);
                    }
                    DsGiohang.DataSource = arr;
                    DsGiohang.DataBind();
                    TotalWatch.Text = soLuong.ToString();
                    TotalPriceProduct.Text = string.Format("{0:N0}", totalprice).ToString();
                    mul.ActiveViewIndex = 1;
                }
                else
                    mul.ActiveViewIndex = 0;

        }
        protected void btnRemove_Click(object sender, EventArgs e)
        {
            string id = ((Button)sender).CommandArgument.ToString();
            List<clsGioHang> arr = (List<clsGioHang>)Session["giohang"];
            foreach (clsGioHang sp in arr)
            {
                if (sp.id == id)
                {
                    arr.Remove(sp);
                    break;

                }
            }
            Session["giohang"] = arr;
            DsGiohang.DataSource = arr;
            DsGiohang.DataBind();

            Page.Response.Redirect(Page.Request.Url.ToString(), true);
        }
        protected void btnAddNumber_click(object sender, EventArgs e)
        {
            string id = ((Button)sender).CommandArgument.ToString();
            List<clsGioHang> arr = (List<clsGioHang>)Session["giohang"];
            foreach (clsGioHang sp in arr)
            {
                if (sp.id == id)
                {
                    sp.number = (Int32.Parse(sp.number) + 1).ToString();
                    sp.totalMoney = (long.Parse(sp.totalMoney) + long.Parse(sp.price)).ToString();
                    break;

                }
            }
            Session["giohang"] = arr;
            DsGiohang.DataSource = arr;
            DsGiohang.DataBind();

            Page.Response.Redirect(Page.Request.Url.ToString(), true);
        }
        protected void btnMinusNumber_click(object sender, EventArgs e)
        {
            string id = ((Button)sender).CommandArgument.ToString();
            List<clsGioHang> arr = (List<clsGioHang>)Session["giohang"];
            foreach (clsGioHang sp in arr)
            {
                if (sp.id == id)
                {
                    if (int.Parse(sp.number) > 0)
                    {
                        sp.number = (Int32.Parse(sp.number) - 1).ToString();
                        sp.totalMoney = (long.Parse(sp.totalMoney) - long.Parse(sp.price)).ToString();
                    }
                    
                    break;

                }
            }
            Session["giohang"] = arr;
            DsGiohang.DataSource = arr;
            DsGiohang.DataBind();

            Page.Response.Redirect(Page.Request.Url.ToString(), true);
        }
    }
}