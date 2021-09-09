<%@ Page Title="" Language="C#" MasterPageFile="~/HeaderFooter.Master" AutoEventWireup="true" CodeBehind="ChiTietWatch.aspx.cs" Inherits="BTL.ChiTietWatch" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="style/ChiTietWatch.css" rel="stylesheet" />
    <script type="text/javascript" src="scripts/jquery.min.js"></script>
    <script  src="scripts/jquery-ui.min.js" type="text/javascript"></script>
    <link href="style/jquery-ui.css"  rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <script type="text/javascript">
        function WebForm_OnSubmit() {
            if (typeof (ValidatorOnSubmit) == "function" && ValidatorOnSubmit() == false) {
                $("#validation_dialog").dialog({
                    title: "Thông báo!",
                    modal: true,
                    resizable: false,
                    buttons: {
                        Close: function () {
                            $(this).dialog('close');
                        }
                    }
                });
                return false;
            }
            return true;
        }
    </script>
   <div class="wrapper" id="WrapDetailWatch"  style="width:92vw;max-width: 1257px;margin: 0 auto;">
    <div class="container">
		<div class="head_Title">
			<a href="/">Trang chủ</a>
			<span>></span>
            <asp:LinkButton ID="lnkNameTypeDH" runat="server"></asp:LinkButton>
		</div>
        <div class="ctdh1">
			<div class="wrap_image fl-left">
				<a href="#"><asp:Literal ID="ltImage" runat="server"></asp:Literal></a> 
			</div>
			<div class="ctdh2">
				<div class="nameDH">
					<asp:Literal ID="ltNameDH" runat="server"></asp:Literal>
				</div>
				<div class="content_head fl-left">
					Giá bán: <font color="red" size="+2"><asp:Literal ID="ltPrice" runat="server"></asp:Literal> đ</font><br/>
                    <asp:ImageButton ID="btnMua" CssClass="btnMua" src="/images/Capture17.png" runat="server" CommandArgument="" OnClick="btnMua_Click"/>
					<a href="#"><asp:Literal ID="ltImage_MuaTraGop" runat="server"></asp:Literal></a><br/>
					<b>Thông số kỹ thuật</b>
					<p></p>
					<div class="tskt">
						<div class="fl-left tskt1">Thương Hiệu:</div>
						<div><asp:Literal ID="ltThuongHieu" runat="server"></asp:Literal></div>
					</div>
					<div class="tskt tskt2">
						<div class="fl-left tskt1">Xuất xứ:</div>
						<div><asp:Literal ID="ltXuatXu" runat="server"></asp:Literal></div>
					</div>
					<div class="tskt">
						<div class="fl-left tskt1">Kiểu dáng:</div>
						<div><asp:Literal ID="ltKieuDang" runat="server"></asp:Literal></div>
					</div>
					<div class="tskt tskt2">
						<div class="fl-left tskt1">Năng lượng:</div>
						<div><asp:Literal ID="ltNangLuong" runat="server"></asp:Literal></div>
					</div>
					<div class="tskt ">
						<div class="fl-left tskt1">Độ chịu nước:</div>
						<div><asp:Literal ID="ltDoChiuNuoc" runat="server"></asp:Literal> ATM</div>
					</div>
					<div class="tskt tskt2">
						<div class="fl-left tskt1">Chất liệu mặt:</div>
						<div><asp:Literal ID="ltChatLieuMat" runat="server"></asp:Literal></div>
					</div>
					<div class="tskt">
						<div class="fl-left tskt1">Đường kính mặt</div>
						<div><asp:Literal ID="ltDuongKinhMat" runat="server"></asp:Literal> mm</div>
					</div>
					<div class="tskt tskt2">
						<div class="fl-left tskt1">Chất liệu dây:</div>
						<div><asp:Literal ID="ltChatLieuDay" runat="server"></asp:Literal></div>
					</div>
					<div class="tskt ">
						<div class="fl-left tskt1">Size dây:</div>
						<div><asp:Literal ID="ltSizeDay" runat="server"></asp:Literal> mm</div>
					</div>
				</div>
				<div class=" fl-right menu_Choose_right">
					<div><b>Chọc cửa hàng gần bạn nhất</b></div>
					<div >
						<select class="chooses" name="Chọn thành phố">
							<option>Chọn thành phố</option>
						</select>
					</div>
					<div>
						<select class="chooses" name="Chọn quẩn huyện">
							<option>Chọn quẩn huyện</option>
						</select>
					</div>
					<div><p>Danh sách cửa hàng</p>.....</div>
			</div>
			</div>
		</div>
		<div class="chiTiet">
			<div class="chiTiet_Title"><b>Chi tiết sản phẩm</b></div>
			<div class="chiTiet_content">
				<span>Hãng sản xuất:</span> <asp:Literal ID="ltHangSanXuat2" runat="server"></asp:Literal><br/>
				<span>Chất liệu dây: </span> <asp:Literal ID="ltChatLieuDay2" runat="server"></asp:Literal><br/>
				<span>Chất liệu mặt: </span><asp:Literal ID="ltChatLieuMat2" runat="server"></asp:Literal><br/>
				<span>Chất liệu vỏ: </span><asp:Literal ID="ltChatLieuVo2" runat="server"></asp:Literal><br/>
				<span>Đường kính vỏ: </span><asp:Literal ID="ltDuongKinhVo2" runat="server"></asp:Literal> mm<br/>
				<span>Chống nước: </span><asp:Literal ID="ltDoChongNuoc2" runat="server"></asp:Literal> ATM<br/>
				<span>Bảo hành: </span><asp:Literal ID="ltBaoHanh2" runat="server"></asp:Literal> năm<br/>
				<span>Năng lượng sử dụng: </span><asp:Literal ID="ltNangLuong2" runat="server"></asp:Literal><br/>
				<span>Thương hiệu: </span><asp:Literal ID="ltThuongHieu2" runat="server"></asp:Literal><br/>
				<span>Tư vấn và đặt hàng: </span>098.668.xxxx<br/>
				<span>Thanh toán: </span>Trực tiếp khi nhận sản phẩm<br/>
			</div>
		</div>
		
		<div class="gioiThieu">
			<div class="gioiThieu_Title"><span>Giới thiệu thương hiệu</span></div>
			<div class="ThuongHieuChiTiet">
				<asp:Literal ID="ltThuongHieuChiTiet" runat="server"></asp:Literal>
			</div>
			<div class="wrap_comment">
				<div class="number_comment"><b><asp:Literal ID="ltSoluongComment" runat="server"></asp:Literal> Comments</b></div>
				<div class="img_comment"><asp:Image ID="avatarUserInputComment" class="avatarUserInputComment" runat="server" /></div>
				<div class="text_comment">
                    <%--<input type="text" placeholder="Add a comment..." />--%>
                    <asp:TextBox ID="txtAddComment" placeholder="     Thêm bình luận" CommandArgument="" runat="server"  CssClass="text input"></asp:TextBox>
                    <asp:RequiredFieldValidator ValidationGroup="checkPostComment" ID="RequiredFieldtxtAddComment" Display="None" ControlToValidate="txtAddComment" runat="server" ErrorMessage="Bạn phải nhập comment"></asp:RequiredFieldValidator>
				</div>
				<div class="post_comment">
                    <%--<button type="button">Post</button>--%>
                    <asp:Button ValidationGroup="checkPostComment"  ID="btnAddComment" runat="server" class="btnAddComment" Text="Post" OnClick="btnAddComment_Click" />
				</div>
		   </div>
            <div class="wrapper-comments">
                <asp:ListView ID="listComments" runat="server" OnItemCommand="listComments_ItemCommand">
                    <ItemTemplate>
                         <div class="comment-item">
                            <div class="comment">
                                <div class="anhUser">
                                    <img src='./images/<%#:Eval("urlAvatarPicture") %>' /> 
                           
                                </div>
                                <div class="contain-comment"> 
                                    <span class="nameUser"><asp:Literal ID="ltUserName" runat="server" Text='<%#:Eval("userName") %>'></asp:Literal></span>
                                    <p class="comment-content"><asp:Literal ID="ltCommentContent" runat="server" Text='<%#:Eval("content") %>'></asp:Literal></p>
                               </div>
                            </div>
                            <div class="btns"><%--ID="lnkLike"--%>
                                <span><asp:Literal ID="ltSoLike"  runat="server" Text='<%#:Eval("soLikeComment") %>'></asp:Literal></span><%--<a href="#" class="btnLike btn">like</a>--%>
                                <asp:LinkButton ID="lnkLike" CssClass="btnLike btn" runat="server" CommandName="Like" CommandArgument='<%#Eval("commentID") %>' ><%# isHaveLike(Eval("commentID")) %></asp:LinkButton> <%--CausesValidation="False" CausesValidation="False"--%>
                                <%--<a href="#" class="btnReply btn">reply</a>--%> 
                                <asp:LinkButton ID="lnkReply" CssClass="btnReply btn" runat="server" CommandName="Reply" CommandArgument='<%#Eval("commentID") %>' >Reply</asp:LinkButton>
                                <span class="date"><asp:Literal ID="ltDateComment" runat="server" Text='<%#:Eval("createDate") %>'></asp:Literal></span>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:ListView>

            <div class="DHKhac_title"><span>Sản Phẩm Khác</span></div>
            <asp:Repeater ID="rptDHLienQuan" runat="server">
                <HeaderTemplate>
                    <div class="DHKhac">
                      
                </HeaderTemplate>
                <ItemTemplate>
                     <div class="wrap-item-DHKhac">
                        <div class="item-DHKhac fl-left">
                            <a  title='<%#:Eval("nameTypeDH") %> <%#:Eval("code") %>' href='/ChiTietWatch.aspx?NameDHid=<%#:Eval("chiTietDHid") %>' >
                                <img src='./images/<%#:Eval("urlPicture") %>' />
                            </a><br>
                            <a href='/ChiTietWatch.aspx?NameDHid=<%#:Eval("chiTietDHid") %>' class="nameProductDongHo"><span><%#:Eval("nameTypeDH") %><br><%#:Eval("code") %></span></a>
                            <input type="button" value='<%#:string.Format("{0:N0}", Eval("price")) %> đ'>
                        </div>
                    </div>              
                </ItemTemplate>
                <FooterTemplate>
                    </div>
                </FooterTemplate>
            </asp:Repeater>      
		</div>
	</div>

    </div>


    <div id="validation_dialog" style="display: none">
        <%--<asp:ValidationSummary ValidationGroup="checkPostComment" ID="ValidationSummary1" runat="server"/>--%>
        <span>Bạn phải nhập nội dung comment!</span>
    </div>
   </div>
    <script type="text/javascript">
     /*   var btnMua = document.getElementsByClassName('btnMua');
        var thongBao = document.getElementById('addedCart');
        btnMua[0].addEventListener('click', function () {
            //thongBao.innerHTML = 'bạn đã mua';
            alert('bạn đã mua hàng');
        });*/
    </script>
</asp:Content>
