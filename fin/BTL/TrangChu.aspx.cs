using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
//using BTL.KetNoiSQL;
using BTL.KetNoiMySQL;

namespace BTL
{
    public partial class TrangChu : System.Web.UI.Page
    {
        clsDHforDisplay dh = new clsDHforDisplay();
        int i = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            get4DHisSale();
            get6DHbyTypeID_3();
            get4DHbyTypeID_4();
            get6DHbyTypeID_5();
            get6DHbyTypeID_6();
        }
        protected void get4DHisSale()
        {
            lnkDHSale.Attributes.Add("href", "/DongHo.aspx?role=sale");
            rpt4DHisSale.DataSource = dh.get4DHSale();
            rpt4DHisSale.DataBind();
        }
        protected void get6DHbyTypeID_3()//lấy dữ liệu cho content 3
        {
          
            DataTable tb = new DataTable();
           
            while(i<500)
            {
                tb = dh.get6DHbyTypeID(i);
                i++;
                if (tb.Rows.Count > 0)
                {
                    string title=tb.Rows[0]["nameTypeDH"].ToString();
                    //lblContent3.Text = title;
                    lnkTitleContent3.Text = title;
                    lnkTitleContent3.Attributes.Add("href", "/DongHo.aspx?searchByTypeID=" + tb.Rows[0]["typeDHid"].ToString());
                    rptContent3.DataSource = tb;
                    rptContent3.DataBind();
                    break; 
                }
               
            }      
        }
        protected void get4DHbyTypeID_4()//lấy dữ liệu cho content 4
        {

            DataTable tb = new DataTable();

            while (i < 500)
            {
                tb = dh.get4DHbyTypeID(i);
                i++;
                if (tb.Rows.Count > 0)
                {
                    string title = tb.Rows[0]["nameTypeDH"].ToString();
                    //lblContent4.Text = title;
                    lnkTitileContent4.Text = title;
                    lnkTitileContent4.Attributes.Add("href", "/DongHo.aspx?searchByTypeID=" + tb.Rows[0]["typeDHid"].ToString());
                    rptContent4.DataSource = tb;
                    rptContent4.DataBind();
                    break;
                }
                
            }
        }
        protected void get6DHbyTypeID_5()//lấy dữ liệu cho content 5
        {
            DataTable tb = new DataTable();
            while (i < 500)
            {
                tb = dh.get6DHbyTypeID(i);
                i++;
                if (tb.Rows.Count > 0)
                {
                    string title = tb.Rows[0]["nameTypeDH"].ToString();
                    //lblContent5.Text = title;
                    lnkTitleContent5.Text = title;
                    lnkTitleContent5.Attributes.Add("href", "/DongHo.aspx?searchByTypeID=" + tb.Rows[0]["typeDHid"].ToString());
                    rptContent5.DataSource = tb;
                    rptContent5.DataBind();
                    break;
                }

            }
        }
        protected void get6DHbyTypeID_6()//lấy dữ liệu cho content 6
        {
            DataTable tb = new DataTable();
            while (i < 500)
            {
                tb = dh.get6DHbyTypeID(i);
                i++;
                if (tb.Rows.Count > 0)
                {
                    string title = tb.Rows[0]["nameTypeDH"].ToString();
                    //lblContent6.Text = title;
                    lnkTitleContent6.Text = title;
                    lnkTitleContent6.Attributes.Add("href", "/DongHo.aspx?searchByTypeID=" + tb.Rows[0]["typeDHid"].ToString());
                    rptContent6.DataSource = tb;
                    rptContent6.DataBind();
                    break;
                }

            }
        }
    }
}