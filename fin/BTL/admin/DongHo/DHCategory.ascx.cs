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
    public partial class DHCategory : System.Web.UI.UserControl
    {
        clsDongHo dh = new clsDongHo();
        public int PageNumber
        {
            get
            {
                if (ViewState["PageNumber"] != null)
                    return Convert.ToInt32(ViewState["PageNumber"]);
                else
                    return 0;
            }
            set
            {
                ViewState["PageNumber"] = value;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
          
                LoadData();
  
        }
        void LoadData()
        {
            
            DataTable tb=dh.GetList();
            phanTrang(tb);
        }
        private void phanTrang(DataTable dt)
        {
            PagedDataSource pgitems = new PagedDataSource();
            System.Data.DataView dv = new System.Data.DataView(dt);//DataView để filter dữ liệu từ DataTable
            pgitems.DataSource = dv;
            pgitems.AllowPaging = true;
            pgitems.PageSize =3;
            pgitems.CurrentPageIndex = PageNumber;
            if (pgitems.PageCount > 1)
            {
                rptPages.Visible = true;
                System.Collections.ArrayList pages = new System.Collections.ArrayList();
                for (int i = 0; i < pgitems.PageCount; i++)
                    pages.Add((i + 1).ToString());
                rptPages.DataSource = pages;
                rptPages.DataBind();
            }
            else
            {
                rptPages.Visible = false;

            }

            rptDHCategory.DataSource = pgitems;
            rptDHCategory.DataBind();

        }
        protected void rptPages_ItemCommand1(object source, RepeaterCommandEventArgs e)
        {
            PageNumber = Convert.ToInt32(e.CommandArgument) - 1;
            LoadData();


        }
        protected void messageDelete(Object sender, System.EventArgs e)
        {
            ((ImageButton)sender).Attributes["onclick"] = "return confirm('Bạn có chắc muốn xóa loại đồng hồ này không?')";
        }
        protected void rptDHCategory_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            DataTable dt = new DataTable();
            // e là <asp:Repeater>
            switch (e.CommandName.ToString())
            {
                case "Update":
                    dt = dh.GetDHbyCategoryID(int.Parse(e.CommandArgument.ToString()));
                    if (dt.Rows.Count > 0)
                    {
                        txtCategoryName.Text = dt.Rows[0]["nameTypeDH"].ToString();
                        txtXuatxu.Text = dt.Rows[0]["xuatXu"].ToString();
                        txtHSX.Text = dt.Rows[0]["hangSanXuat"].ToString();
                        txtContent.Text = dt.Rows[0]["thuongHieu"].ToString();
                        hdCategoryID.Value = e.CommandArgument.ToString();
                        hdInsert.Value = "update";
                        mul.ActiveViewIndex = 1;
                    }
                    break;
                case "delete": //trước khi xóa xác nhận bằng hàm messageDelete
                    dt = dh.GetDHbyCategoryID(int.Parse(e.CommandArgument.ToString()));
                    if (dt.Rows.Count > 0)
                    {
                        dh.Delete(int.Parse(e.CommandArgument.ToString()));
                        Response.Redirect(Request.Url.ToString());
                    }
                    break;
            }
        }

        protected void lnkAddNew_Click(object sender, EventArgs e)
        {
            hdInsert.Value = "insert";
            mul.ActiveViewIndex = 1; //sẽ chạy qua view thứ 2
        }
        protected bool checkInput()
        {
            if (string.IsNullOrEmpty(txtCategoryName.Text.Trim()))
            {
                Response.Write("<script>alert('Tên loại đồng hồ không được để trống');</script>");
                return false;
            }
            if (string.IsNullOrEmpty(txtXuatxu.Text.Trim()))
            {
                Response.Write("<script>alert('Xuất xứ của loại đồng hồ không được để trống');</script>");
                return false;
            }
            if (string.IsNullOrEmpty(txtHSX.Text.Trim()))
            {
                Response.Write("<script>alert('Hãng sản xuất đồng hồ không được để trống');</script>");
                return false;
            }
            return true;
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {         
            if (hdInsert.Value == "insert")
            {
                if (checkInput())
                {
                   
                    dh.Insert(txtCategoryName.Text.Trim(),txtXuatxu.Text.Trim(), txtHSX.Text.Trim(), txtContent.Text.Trim());
                    Response.Redirect(Request.Url.ToString());//để tránh trường hợp thêm đi thêm lại dữ liệu khi nhập 1 lần và click save nhiều lần.
                }
            }
            else//update
            {
                if (checkInput())
                {
                    dh.Update(int.Parse(hdCategoryID.Value), txtCategoryName.Text.Trim(), txtXuatxu.Text.Trim(), txtHSX.Text.Trim(), txtContent.Text.Trim());
                    Response.Redirect(Request.Url.ToString());//để tránh trường hợp thêm đi thêm lại dữ liệu khi nhập 1 lần và click save nhiều lần.
                }

            }
        }
    }
}