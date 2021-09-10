using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Collections.Specialized;
//using BTL.KetNoiSQL;
using BTL.KetNoiMySQL;

namespace BTL
{
    public partial class DongHo : System.Web.UI.Page
    {
        clsDHforDisplay dh = new clsDHforDisplay();
        protected void Page_Load(object sender, EventArgs e)
        {
            string searchKey = "";
            searchKey=Request["searchKeys"];
            string role = Request["role"];
            string searchByType = Request["searchByTypeID"];
            DataTable tb = new DataTable();
           
                if (searchKey != null)
                {
                    
                    //tìm kiếm theo mã đồng hồ trước
                    tb = dh.get20DHbyCode(searchKey);
                    if (tb.Rows.Count > 0)
                    {
                        rptContentWatchs.DataSource = tb;
                        rptContentWatchs.DataBind();
                    }
                    else
                    {
                        //tìm kiếm theo mã đh mà ko có thì tìm theo tên loại đồng hồ
                        tb = dh.get20DHbyTypeName(searchKey);
                        if (tb.Rows.Count > 0)
                        {
                            rptContentWatchs.DataSource = tb;
                            rptContentWatchs.DataBind();
                        }
                        else
                        {
                            Response.Write("<script>alert('Không có kết quả trùng khớp với tìm kiếm của bạn');</script>");
                            get20Watch();
                        }

                    }
                } 
                else if (role== "sale")
                {
                    tb = dh.get20DHSale();
                    if (tb.Rows.Count > 0)
                    {
                        rptContentWatchs.DataSource = tb;
                        rptContentWatchs.DataBind();
                    }
                    else
                    {
                        Response.Write("<script>alert('Hiện tại không có đồng hồ nào đang giảm giá');</script>");
                        get20Watch();
                    }
                }
                else if(searchByType != null)
                {
                    tb = dh.get20DHbyTypeID(int.Parse(searchByType));
                    if (tb.Rows.Count > 0)
                    {
                        rptContentWatchs.DataSource = tb;
                        rptContentWatchs.DataBind();
                    }
                    else
                    {
                        Response.Write("<script>alert('Không có kết quả trùng khớp');</script>");
                        get20Watch();
                    }
                }
                else
                    get20Watch();
            
        }
        protected void get20Watch()
        {              
            DataTable tb = new DataTable();
            tb = dh.get20DH();
            rptContentWatchs.DataSource = tb;
            rptContentWatchs.DataBind();
        }
        //protected void get20Watch()
        //{
        //    int i = 0;
        //    int soLuong = 0;
        //    Response.Write("<script>alert('bắt đầu hàm');</script>");
        //    DataTable tbSource = new DataTable();
        //    tbSource.Columns.Add(new DataColumn("nameTypeDH", typeof(string)));
        //    tbSource.Columns.Add(new DataColumn("code", typeof(string)));
        //    tbSource.Columns.Add(new DataColumn("price", typeof(long)));
        //    tbSource.Columns.Add(new DataColumn("urlPicture", typeof(string)));
        //    for (i = 0; soLuong < 6 || i < 50; i++)
        //    {
        //        DataTable tb = new DataTable();
        //        tb = dh.get4DHbyTypeID(i);
        //        if (tb.Rows.Count > 0)
        //        {
        //            //tbSource.Merge(tb);
        //            foreach (DataRow row in tb.Rows)
        //            {
        //                DataRow itemRow = tbSource.NewRow();
        //                itemRow["nameTypeDH"] = row["nameTypeDH"];
        //                itemRow["code"] = row["code"];
        //                itemRow["price"] = row["price"];
        //                itemRow["urlPicture"] = row["urlPicture"];
        //                tbSource.Rows.Add(itemRow);
        //            }

        //            soLuong++;
        //        }
        //    }

        //    rptContentWatchs.DataSource = tbSource;
        //    rptContentWatchs.DataBind();
        //    Response.Write("<script>alert('song hàm');</script>");
        //}
    }
}