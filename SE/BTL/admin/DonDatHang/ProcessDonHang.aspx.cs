using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//using BTL.KetNoiSQL;
using BTL.KetNoiMySQL;

namespace BTL.admin.DonDatHang
{
    public partial class ProcessDonHang : System.Web.UI.Page
    {
        clsDonHang dh = new clsDonHang();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Request.QueryString["process"] == "getListDonHangXML")
                {
                    DataTable dtDonHang = GetListDonHang();

                    Response.Clear();
                    Response.ContentType = "text/xml; charset=utf-8";
                    //Response.ContentType = "text";
                    Response.Write(ConvertDatatableToXML(dtDonHang));
                    Response.End();
                }
                else if (Request.QueryString["process"] == "getChiTietDonHang")
                {
                    int iPK_iDonHangID = int.Parse(Request.QueryString["donHangID"]);
                    DataTable dtDetailDonHang = getDetailDonHangByID(iPK_iDonHangID);
                    Response.Clear();
                    Response.ContentType = "application/json; charset=utf-8";
                    Response.Write(DataTableToJsonObj(dtDetailDonHang));
                    Response.End();
                }
                else if (Request.QueryString["process"] == "editTinhTrang")
                {
                    int iPK_iDonHangID = int.Parse(Request.QueryString["donHangIDEdit"]);
                    int tinhTrang = int.Parse(Request.QueryString["tinhTrang"]);
                    dh.UpdateTinhTrangDonHang( iPK_iDonHangID, tinhTrang );
                    Response.Clear();
                    Response.ContentType = "application/json; charset=utf-8";
                    Response.Write("edit_success");
                    Response.End();
                }
            }
        }
        private DataTable GetListDonHang()
        {
            DataTable dtDonHang = new DataTable();// { TableName = "MyTableName" };
            dtDonHang = dh.GetListDonDatHang();
            return dtDonHang;
        }
        public string ConvertDatatableToXML(DataTable dt)
        {
            dt.TableName = "MyTableName";
            MemoryStream str = new MemoryStream();
            dt.WriteXml(str, true);
            str.Seek(0, SeekOrigin.Begin);
            StreamReader sr = new StreamReader(str);
            string xmlstr;
            xmlstr = sr.ReadToEnd();
            return (xmlstr);
        }
        private DataTable getDetailDonHangByID(int id)
        {
            DataTable tb = new DataTable();
            tb = dh.GetDetailDonDatHang( id );
            return tb;
        }
        public string DataTableToJsonObj(DataTable dt)
        {
            DataSet ds = new DataSet();
            ds.Merge(dt);
            StringBuilder JsonString = new StringBuilder();
            if (ds != null && ds.Tables[0].Rows.Count > 0)
            {
                JsonString.Append("[");
                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    JsonString.Append("{");
                    for (int j = 0; j < ds.Tables[0].Columns.Count; j++)
                    {
                        if (j < ds.Tables[0].Columns.Count - 1)
                        {
                            JsonString.Append("\"" + ds.Tables[0].Columns[j].ColumnName.ToString() + "\":" + "\"" + ds.Tables[0].Rows[i][j].ToString() + "\",");
                        }
                        else if (j == ds.Tables[0].Columns.Count - 1)
                        {
                            JsonString.Append("\"" + ds.Tables[0].Columns[j].ColumnName.ToString() + "\":" + "\"" + ds.Tables[0].Rows[i][j].ToString() + "\"");
                        }
                    }
                    if (i == ds.Tables[0].Rows.Count - 1)
                    {
                        JsonString.Append("}");
                    }
                    else
                    {
                        JsonString.Append("},");
                    }
                }
                JsonString.Append("]");
                return JsonString.ToString();
            }
            else
            {
                return null;
            }
        }
    }
}