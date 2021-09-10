<%@ Page Title="" Language="C#" MasterPageFile="~/HeaderFooter.Master" AutoEventWireup="true" CodeBehind="DongHo.aspx.cs" Inherits="BTL.DongHo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="style/DongHo.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="watch_content">
        <%--============================ left menu button========================= --%>
        <div class="side_left_menu" hidden>
            <div class="side_left_menu_title">
                Lựa chọn
            </div>
            <div class="side_left_menu_content">
                <div class="side_left_menu_wrap-content">
                    <div class="side_left_menu_list">
                        <div>
                            <p>THƯƠNG HIỆU</p>
                        </div>
                        <div class="component_role_watch">
                            <div class="checkbox"><input type="checkbox" name="" value="" /></div>
                            <div><span>Đồng hồ Epos Swiss</span></div><br/></div>
                        <div class="component_role_watch">
                            <div class="checkbox"><input type="checkbox" name="" value="" /></div>
                            <div><span>Đồng hồ Atlantic Swiss</span></div><br/></div>
                        <div class="component_role_watch">
                            <div class="checkbox"><input type="checkbox" name="" value="" /></div>
                            <div><span>Đồng hồ Diamond D</span></div><br/></div>
                        <div class="component_role_watch">
                            <div class="checkbox"><input type="checkbox" name="" value="" /></div>
                            <div><span>Đồng hồ Aries Gold</span></div><br/></div>
                        <div class="component_role_watch">
                            <div class="checkbox"><input type="checkbox" name="" value="" /></div>
                            <div><span>Đồng hồ Jacques Lemans</span></div><br/></div>
                        <div class="component_role_watch">
                            <div class="checkbox"><input type="checkbox" name="" value="" /></div>
                            <div><span>Đồng hồ QQ</span></div><br/></div>

                    </div>
                    <div class=" side_left_menu_list">
                        <div>
                            <p>DÀNH CHO</p>
                        </div>
                        <div class="component_role_watch">
                            <div class=""><input type="checkbox" name="" value="" /></div>
                            <div><span>Đồng hồ nam</span></div><br/></div>
                        <div class="component_role_watch">
                            <div class="checkbox"><input type="checkbox" name="" value="" /></div>
                            <div><span>Đồng hồ nữ</span></div><br/></div>
                        <div class="component_role_watch">
                            <div class="checkbox"><input type="checkbox" name="" value="" /></div>
                            <div><span>Đồng hồ đôi</span></div>
                        </div>

                    </div>
                    <div class=" side_left_menu_list">
                        <div>
                            <p>KHOẢNG GIÁ</p>
                        </div>
                        <div class="component_role_watch">
                            <div class="checkbox"><input type="checkbox" name="" value="" /></div>
                            <div><span>Giá < 2 triệu</span></div><br/></div>
                        <div class="component_role_watch">
                            <div class="checkbox"><input type="checkbox" name="" value="" /></div>
                            <div><span>Giá từ 2 - 5 triệu</span></div><br/></div>
                        <div class="component_role_watch">
                            <div class="checkbox"><input type="checkbox" name="" value="" /></div>
                            <div><span>Giá từ 5 - 10 triệu</span></div><br/></div>
                        <div class="component_role_watch">
                            <div class="checkbox"><input type="checkbox" name="" value="" /></div>
                            <div><span>Giá từ 10 - 20 triệu</span></div><br/></div>
                        <div class="component_role_watch">
                            <div class="checkbox"><input type="checkbox" name="" value="" /></div>
                            <div><span>Giá > 20 triệu</span></div><br/></div>

                    </div>
                    <div class=" side_left_menu_list">
                        <div>
                            <p>LOẠI DÂY</p>
                        </div>
                        <div class="component_role_watch">
                            <div class="checkbox"><input type="checkbox" name="" value="" /></div>
                            <div><span>Dây da</span></div><br/></div>
                        <div class="component_role_watch">
                            <div class="checkbox"><input type="checkbox" name="" value="" /></div>
                            <div><span>Thép không gỉ</span></div><br/></div>
                        <div class="component_role_watch">
                            <div class="checkbox"><input type="checkbox" name="" value="" /></div>
                            <div><span>Mạ vàng</span></div><br/></div>
                        <div class="component_role_watch">
                            <div class="checkbox"><input type="checkbox" name="" value="" /></div>
                            <div><span>Mạ đồng</span></div><br/></div>
                        <div class="component_role_watch">
                            <div class="checkbox"><input type="checkbox" name="" value="" /></div>
                            <div><span>Cao su</span></div><br/></div>
                        <div class="component_role_watch">
                            <div class="checkbox"><input type="checkbox" name="" value="" /></div>
                            <div><span>Dây nhựa</span></div><br/></div>
                        <div class="component_role_watch">
                            <div class="checkbox"><input type="checkbox" name="" value="" /></div>
                            <div><span>Dây vải du</span></div><br/></div>
                        <div class="component_role_watch">
                            <div class="checkbox"><input type="checkbox" name="" value="" /></div>
                            <div><span>Hợp kim thép</span></div><br/></div>

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
