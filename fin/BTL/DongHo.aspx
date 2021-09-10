<%@ Page Title="" Language="C#" MasterPageFile="~/HeaderFooter.Master" AutoEventWireup="true" CodeBehind="DongHo.aspx.cs" Inherits="BTL.DongHo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="style/DongHo.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="watch_content">
        <%--============================ left menu button========================= --%>
        <div class="side_left_menu" >
            <div class="side_left_menu_title">
                Lựa chọn
            </div>
            <div class="side_left_menu_content">
                <div class="side_left_menu_wrap-content">
                    <div class="side_left_menu_list">
                        <div>
                            <p>NHÓM MÀU</p>
                        </div>
                        <div class="component_role_watch">
                            <div class="checkbox"><input type="checkbox" name="" value="" /></div>
                            <div><span>Đỏ</span></div><br/></div>
                        <div class="component_role_watch">
                            <div class="checkbox"><input type="checkbox" name="" value="" /></div>
                            <div><span>Đen</span></div><br/></div>
                        <div class="component_role_watch">
                            <div class="checkbox"><input type="checkbox" name="" value="" /></div>
                            <div><span>Trắng</span></div><br/></div>
                        <div class="component_role_watch">
                            <div class="checkbox"><input type="checkbox" name="" value="" /></div>
                            <div><span>Vàng</span></div><br/></div>
                        <div class="component_role_watch">
                            <div class="checkbox"><input type="checkbox" name="" value="" /></div>
                            <div><span>Xanh lá</span></div><br/></div>
                        <div class="component_role_watch">
                            <div class="checkbox"><input type="checkbox" name="" value="" /></div>
                            <div><span>Khác</span></div><br/></div>

                    </div>
                    <div class=" side_left_menu_list">
                        <div>
                            <p>LOẠI</p>
                        </div>
                        <div class="component_role_watch">
                            <div class="checkbox"><input type="checkbox" name="" value="" /></div>
                            <div><span>Vòng cổ</span></div><br/></div>
                        <div class="component_role_watch">
                            <div class="checkbox"><input type="checkbox" name="" value="" /></div>
                            <div><span>Túi</span></div><br/></div>
                        <div class="component_role_watch">
                            <div class="checkbox"><input type="checkbox" name="" value="" /></div>
                            <div><span>Nhẫn</span></div><br/></div>
                        <div class="component_role_watch">
                            <div class="checkbox"><input type="checkbox" name="" value="" /></div>
                            <div><span>Trang trí</span></div><br/></div>
                        <div class="component_role_watch">
                            <div class="checkbox"><input type="checkbox" name="" value="" /></div>
                            <div><span>Khác</span></div><br/></div>

                    </div>
                    <div class=" side_left_menu_list">
                        <div>
                            <p>CHÂT LIỆU</p>
                        </div>
                        <div class="component_role_watch">
                            <div class="checkbox"><input type="checkbox" name="" value="" /></div>
                            <div><span>Vải</span></div><br/></div>
                        <div class="component_role_watch">
                            <div class="checkbox"><input type="checkbox" name="" value="" /></div>
                            <div><span>Len</span></div><br/></div>
                        <div class="component_role_watch">
                            <div class="checkbox"><input type="checkbox" name="" value="" /></div>
                            <div><span>Nhựa</span></div><br/></div>
                        <div class="component_role_watch">
                            <div class="checkbox"><input type="checkbox" name="" value="" /></div>
                            <div><span>Gỗ</span></div><br/></div>
                        <div class="component_role_watch">
                            <div class="checkbox"><input type="checkbox" name="" value="" /></div>
                            <div><span>Cao su</span></div><br/></div>
                        <div class="component_role_watch">
                            <div class="checkbox"><input type="checkbox" name="" value="" /></div>
                            <div><span>Kim loại</span></div><br/></div>
                        <div class="component_role_watch">
                            <div class="checkbox"><input type="checkbox" name="" value="" /></div>
                            <div><span>Cườm</span></div><br/></div>
                        <div class="component_role_watch">
                            <div class="checkbox"><input type="checkbox" name="" value="" /></div>
                            <div><span>Khác</span></div><br/></div>

                    </div>
                </div>
            </div>
        </div>
        <%-- =======end menu button===================== --%>
         <asp:Repeater ID="rptContentWatchs" runat="server">
                <HeaderTemplate>
                    <div class="wrap-list_watch_content">
                        <div class="navigation_content_watch">
                            <a href="/"><span>Trang chủ</span></a>
                            <b>/</b>
                            <a href="#"><span>Sản Phẩm</span></a>
                        </div>
                        <div class="wrap_menu_top_of_content">
                            <div class="item_menu_top_content">
                                <div class="checkbox"><input type="checkbox" name="" value="" /></div>
                                <div class=""><span>Giá dưới 2 chục nghìn</span></div><br/>
                            </div>
                            <div class="item_menu_top_content">
                                <div class=""><input type="checkbox" name="" value="" /></div>
                                <div class=""><span>Giá từ 2 - 5 chục nghìn</span></div><br/>
                            </div>
                            <div class="item_menu_top_content">
                                <div class=""><input type="checkbox" name="" value="" /></div>
                                <div class=""><span>Giá từ 5 chục nghìn - 1 trăm nghìn</span></div><br/>
                            </div>
                            <div class="item_menu_top_content">
                                <div class=""><input type="checkbox" name="" value="" /></div>
                                <div class=""><span>Giá từ 1 - 2 trăm nghìn</span></div><br/>
                            </div>
                            <div class="item_menu_top_content">
                                <div class=""><input type="checkbox" name="" value="" /></div>
                                <div class=""><span>Giá trên 2 trăm nghìn</span></div><br/>
                            </div>
                        </div>
                        <div class="container_content_watchs">  
                    </HeaderTemplate>
                    <ItemTemplate>
                         <div class="wrap_item_watch">
                            <a href='/ChiTietWatch.aspx?NameDHid=<%#:Eval("chiTietDHid") %>'><img width="55%" src='./images/<%#:Eval("urlPicture") %>' /></a><br/>
                            <a href='/ChiTietWatch.aspx?NameDHid=<%#:Eval("chiTietDHid") %>' class="nameProductDongHo">
                                <span><%#:Eval("nameTypeDH") %><br><%#:Eval("code") %></span>
                            </a>
                            <input type="button" value='<%#:string.Format("{0:N0}", Eval("price")) %> đ' />
                        </div>
                    </ItemTemplate>
                <FooterTemplate>
                     </div>
                    <div class="btn-Add">
                        <a href="#"><input type="button" value="Xem thêm +" /></a>
                    </div>
                </div>
                </FooterTemplate>
            </asp:Repeater>      









    </div>
</asp:Content>
