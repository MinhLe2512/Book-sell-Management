using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//using BTL.KetNoiSQL;
using BTL.KetNoiMySQL;

namespace BTL
{
    public partial class ChiTietWatch : System.Web.UI.Page
    {
        string id = "";
        clsDHforDisplay dh = new clsDHforDisplay();
        clsComment cm = new clsComment();
        protected void Page_Load(object sender, EventArgs e)
        {
            id = Request["NameDHid"];
            if (id != null)
            {
                LoadDetailProduct();
                loadComments();
            }
             else {
                    Response.Write("<script>alert('rất tiếc đã xảy ra lỗi');<script/>");
                    Response.Redirect("/");
             }
            
        }
       
        void loadComments()
        {
            DataTable dt = new DataTable();
            dt = cm.getCommentsByWatchID(int.Parse(id));
            if (dt.Rows.Count > 0)
            {
                ltSoluongComment.Text = dt.Rows.Count.ToString();

                DataTable tb = new DataTable();
                dt.Columns.Add("soLikeComment", typeof(string));
                for(int i=0;i<dt.Rows.Count;i++)
                {
                    tb = cm.NumberLikeComment(int.Parse(dt.Rows[i]["commentID"].ToString()));
                    if (tb.Rows.Count > 0)
                    {
                        dt.Rows[i]["soLikeComment"] = tb.Rows.Count.ToString() + " - ";
                    }
                    else
                    {
                        dt.Rows[i]["soLikeComment"] = "";
                    }
                }

                listComments.DataSource = dt;
                listComments.DataBind();
            }
            else ltSoluongComment.Text ="0";
            avatarUserInputComment.ImageUrl = Session["avatarUser"].ToString();
        }
        protected String isHaveLike(Object commentID)
        {
            if (int.Parse(Session["userID"].ToString()) != -1)
            {
                if (cm.UserHaveLikeComment(int.Parse(Session["userID"].ToString()), int.Parse(commentID.ToString())))
                    return "<strong style=\"color:blue\">Like</strong>";
                else return "<span style=\"color:#3c3b3b\">Like</span>"; 
            }
            else
                return "<span style=\"color:#3c3b3b\">Like</span>";
        }
        void LoadDetailProduct()
        {
            DataTable dt = new DataTable();
            dt = dh.getInforDHbyID(int.Parse(id));
            if (dt.Rows.Count > 0)
            {
                lnkNameTypeDH.Text = dt.Rows[0]["nameTypeDH"].ToString();
                lnkNameTypeDH.Attributes.Add("href", "/DongHo.aspx?searchByTypeID=" + dt.Rows[0]["typeDHid"].ToString());
                ltImage.Text = "<img src='/images/" + dt.Rows[0]["urlPicture"].ToString() + "' />";
                ltNameDH.Text = dt.Rows[0]["nameTypeDH"].ToString()+" "+ dt.Rows[0]["code"].ToString();
                ltPrice.Text = string.Format("{0:N0}",long.Parse(dt.Rows[0]["price"].ToString()));
                //ltImage_MuaNgay.Text = "<img src='/images/Capture17.png' />";
                ltImage_MuaTraGop.Text= "<img src='/images/Capture18.png' />";
                ltThuongHieu.Text = dt.Rows[0]["xuatXu"].ToString();
                ltXuatXu.Text = dt.Rows[0]["xuatXu"].ToString();
                ltKieuDang.Text = dt.Rows[0]["kieuDang"].ToString();
                ltNangLuong.Text = dt.Rows[0]["nangLuong"].ToString();
                ltDoChiuNuoc.Text = dt.Rows[0]["doChiuNuoc"].ToString();
                ltChatLieuMat.Text = dt.Rows[0]["chatLieuMat"].ToString();
                ltDuongKinhMat.Text = dt.Rows[0]["duongKinhMat"].ToString();
                ltChatLieuDay.Text = dt.Rows[0]["chatLieuDay"].ToString();
                ltSizeDay.Text = dt.Rows[0]["sizeDay"].ToString();
                ltHangSanXuat2.Text = dt.Rows[0]["hangSanXuat"].ToString();
                ltChatLieuDay2.Text = dt.Rows[0]["chatLieuDay"].ToString();
                ltChatLieuMat2.Text = dt.Rows[0]["chatLieuMat"].ToString();
                ltChatLieuVo2.Text = dt.Rows[0]["chatLieuVo"].ToString();
                ltDuongKinhVo2.Text = dt.Rows[0]["duongKinhVo"].ToString();
                ltDoChongNuoc2.Text = dt.Rows[0]["doChiuNuoc"].ToString();
                ltBaoHanh2.Text = dt.Rows[0]["timeBaoHanh"].ToString();
                ltNangLuong2.Text = dt.Rows[0]["nangLuong"].ToString();
                ltThuongHieu2.Text = dt.Rows[0]["xuatXu"].ToString();
                ltThuongHieuChiTiet.Text = dt.Rows[0]["thuongHieu"].ToString();
                btnMua.CommandArgument = dt.Rows[0]["chiTietDHid"].ToString();
                idWatch = int.Parse(dt.Rows[0]["chiTietDHid"].ToString());

                rptDHLienQuan.DataSource = dh.get6DHbyTypeID(int.Parse(dt.Rows[0]["typeDHid"].ToString()));
                rptDHLienQuan.DataBind();
            }
        }
        protected void btnMua_Click(object sender, EventArgs e)
        {
            string id = ((ImageButton)sender).CommandArgument.ToString();
            List<clsGioHang> arr = (List<clsGioHang>)Session["giohang"];
            DataTable dt = new DataTable();
            dt = dh.getInforDHbyID(int.Parse(id));
            if (arr.Count == 0)
            {
                arr = new List<clsGioHang>();
                arr.Add(new clsGioHang() { id = dt.Rows[0]["chiTietDHid"].ToString(), img = dt.Rows[0]["urlPicture"].ToString(), name = dt.Rows[0]["nameTypeDH"].ToString() + " " + dt.Rows[0]["code"].ToString(), price = dt.Rows[0]["price"].ToString(), totalMoney = dt.Rows[0]["price"].ToString(), number = "1" });
                Session["giohang"] = arr;
                Page.Response.Redirect(Page.Request.Url.ToString(), true);
            }
            else
            {
                bool isChoosed = false;
                foreach (clsGioHang sp in arr)
                {
                    if (sp.id == id)
                    {
                        sp.number = (Int32.Parse(sp.number) + 1).ToString();
                        sp.totalMoney = (long.Parse(sp.totalMoney) +  long.Parse(sp.price)).ToString();
                        isChoosed = true;
                        break;
                    }
                }
                if (isChoosed == false)
                {
                    arr.Add(new clsGioHang() { id = dt.Rows[0]["chiTietDHid"].ToString(), img = dt.Rows[0]["urlPicture"].ToString(), name = dt.Rows[0]["nameTypeDH"].ToString() + " " + dt.Rows[0]["code"].ToString(), price = dt.Rows[0]["price"].ToString(), totalMoney = dt.Rows[0]["price"].ToString(), number = "1" });

                    Session["giohang"] = arr;
                    Page.Response.Redirect(Page.Request.Url.ToString(), true);
                }
                else
                {
                    Session["giohang"] = arr;
                    Page.Response.Redirect(Page.Request.Url.ToString(), true);
                }
            }

            Page.Response.Redirect(Page.Request.Url.ToString(), true);
        }
        int idWatch = -1;
        protected void btnAddComment_Click(object sender, EventArgs e)
        {
            //if (String.IsNullOrEmpty(txtAddComment.Text.Trim())) { 
            //((Button)sender).Attributes["onclick"] = "return alert(' Bạn chưa nhập comment')";
            //    return;
            //}
            //Page.ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Bạn phải nhập comment');",false);
            //btnAddComment.Attributes.Add("onclick", "alert('" + "lỗi" + "');return false;");
            //    Session["userID"];
            
            if (int.Parse(Session["userID"].ToString()) != -1)
            {
                if (string.IsNullOrEmpty(txtAddComment.Text.Trim()))
                {
                    Response.Write("<script>alert('Bình luận không được để trống');</script>");
                    return;
                }
                cm.Insert(int.Parse(Session["userID"].ToString()), idWatch, DateTime.Now, txtAddComment.Text.Trim(), -1);
            }
            else
            {
                Response.Write("<script>alert('Bạn phải đăng nhập để thêm bình luận');</script>");
                return;
            }

           Response.Redirect(Request.Url.ToString());
        }
       
            

        //RequiredFieldtxtAddComment.IsValid = true;
        int commentID = -1;
        protected void listComments_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            switch (e.CommandName.ToString())
            {
                case "Like":
                    commentID = int.Parse(e.CommandArgument.ToString());
                    try
                    {
                        if (int.Parse(Session["userID"].ToString()) != -1) 
                            cm.InsertUserLike(int.Parse(Session["userID"].ToString()), commentID);
                        else
                        {
                            Response.Write("<script>alert('Bạn phải đăng nhập để like bình luận');</script>");
                            return;
                        }
                    }
                    catch (Exception)
                    {
                        //khi user mà bấm like rồi mà bấm like lần nữa là bỏ like comment đó
                        cm.UserBoLike(int.Parse(Session["userID"].ToString()), commentID);
                    }
                    Response.Redirect(Request.Url.ToString());
                    break;
                //case "Reply":
                //        txtAddComment.Attributes["TextMode"] = "MultiLine";
                //        txtAddComment.Attributes["Rows"] = "6";
                //        txtAddComment.Attributes["Wrap"] = "true";
                        
                //    break;
            }

        }
    }
}