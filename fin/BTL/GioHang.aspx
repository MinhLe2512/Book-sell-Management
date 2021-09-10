<%@ Page Title="" Language="C#" MasterPageFile="~/HeaderFooter.Master" AutoEventWireup="true" CodeBehind="GioHang.aspx.cs" Inherits="BTL.GioHang" enableEventValidation="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="style/GioHang.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <div class="wrapper"  style="width:92vw;max-width: 1257px;margin: 0 auto;"> 
            <div class="gioHang_title"><span>GIỎ HÀNG</span>(<asp:Label ID="TotalWatch" runat="server" Text="0"></asp:Label> sản phẩm)</div>
            <asp:MultiView ID="mul" runat="server" ActiveViewIndex="0">
                <asp:View ID="v1" runat="server">
                    <div class="gioHang_isEmpty">	               
		                <div class="gioHang_content">
			                <div><img src="./images/Capture29.PNG"/></div>
			                <div><p>Không có sản phẩm nào trong giỏ hàng của bạn.</p></div>
			                <div class="btnBuy"><a href="./DongHo.aspx">Tiếp tục mua sắm</a></div>
		                </div>
                    </div>
                </asp:View>
                <asp:View ID="v2" runat="server">
                    <div class="dsWatchBuy" style="width:100%;background-color:white;padding-bottom:10px;">
                        <table>
                         <thead>
                            <tr class="tblTitle" style="background-color:#b9b9b9;">
                                <th style="width:15%;">Sản phẩm</th>
                                <th style="width:20%">Tên sản phẩm</th>
                                <th style="width:10%;">Mô tả</th>
                                <th style="width:15%;">Số lượng</th>
                                <th style="width:15%;">Đơn Giá</th>
                                <th style="width:15%;">Thành tiền</th>
                                <th style="width:10%;"></th>
                            </tr>
                        </thead>
                        <tbody>

                        <asp:ListView ID="DsGiohang" runat="server">
                            <ItemTemplate>
                                <tr>
                                    <td><img width="100" src="/images/<%# Eval("img") %>" alt="" style="width:100px;"></td>
                                    <td><p><%# Eval("name") %></p></td>
                                    <td><a href='/ChiTietWatch.aspx?NameDHid=<%#:Eval("id") %>' style="color:blue;">Chi tiết</a> </td>
                                    <td><%# Eval("number") %>
                                        
                                        <asp:Button runat="server" CssClass="btn btn-miadd" CommandArgument='<%# Eval("id") %>' Text="-" OnClick="btnMinusNumber_click" />
                                            <asp:Button runat="server" CssClass="btn btn-miadd" CommandArgument='<%# Eval("id") %>' Text="+" OnClick="btnAddNumber_click" />
                                    </td>
                                    <td><%# string.Format("{0:N0}",long.Parse(Eval("price").ToString())) %>đ</td>
                                    <td><%# string.Format("{0:N0}", long.Parse(Eval("totalMoney").ToString())) %>đ</td>
                                    <td>
                                        <div class="input-append">
                                            <asp:Button runat="server" CssClass="btn btn-remove" CommandArgument='<%# Eval("id") %>' Text="X" OnClick="btnRemove_Click" />
                                        </div>
                                    </td>

                                </tr>
                            </ItemTemplate>
                        </asp:ListView>
                        <tr>
                            <td colspan="7" style="text-align:right;padding-right:25px;">Tổng tiền: <asp:Label ID="TotalPriceProduct" runat="server" Text="Label"></asp:Label>đ	</td>                         
                        </tr>
                        </tbody>
                        </table>

                        <br />
                        <div class="btnBuy" ><a href="./DongHo.aspx">Tiếp tục mua sắm</a></div>
                        <div class="btnBuy"><a href="./ThanhToan.aspx">Thanh toán</a></div>

                </div>
            </asp:View>
        </asp:MultiView>
     </div>
</asp:Content>
