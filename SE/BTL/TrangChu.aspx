<%@ Page Title="" Language="C#" MasterPageFile="~/HeaderFooter.Master" AutoEventWireup="true" CodeBehind="TrangChu.aspx.cs" Inherits="BTL.TrangChu" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="style/TrangChu.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <!-- Banner -->
    <div class='slider'>
        <img id='imgShow' width='100%' src='./images/3.jpg' />
       <%-- <ul id='stt' style="list-style: none;">
            <li>
                <a href='#' imgtarget='./images/1.jpg'></a>
            </li>
            <li>
                <a href='#' imgtarget='./images/2.jpg'></a>
            </li>
            <li>
                <a href='#' imgtarget='./images/3.jpg'></a>
            </li>
        </ul>--%>
    </div>
    <!-- End Banner -->



    <div class="wrapper"  style="width:92vw;max-width: 1257px;margin: 0 auto;">
        <!--====================== MENU content =================================== -->
        
        <!-- end menu content -->
          <!--============================section content2 ================-->
        <div class="container_titile_group_watch">

            <div class="group-watch">
                <div class="thuoc"></div>
                <div class="titile">
<%--                    <a href="#" style="text-transform: uppercase;">Sản phẩm đang giảm giá</a>--%>
                    <asp:LinkButton ID="lnkDHSale" runat="server" style="text-transform: uppercase;">Sản phẩm đang giảm giá</asp:LinkButton>
                </div>
                <div class="thuoc"></div>
            </div>
        </div>
       <!--  -->
        <asp:Repeater ID="rpt4DHisSale" runat="server">
                <HeaderTemplate>
                       <div id="content2" class="container_content2">
                </HeaderTemplate>
                <ItemTemplate>
                    <div class="wrap_item_content2">
                        <div class="item_content2">
                            <a title='<%#:Eval("nameTypeDH") %> <%#:Eval("code") %>' href='/ChiTietWatch.aspx?NameDHid=<%#:Eval("chiTietDHid") %>' style="text-align:center;">
                                <img height="250px" src='./images/<%#:Eval("urlPicture") %>' style="max-width:153px;" />
                            </a>
                            <ul class="sub-content2">
                                <li>
                                    <a href="#"><input class="content2_btnMua" type="button" value="Mua ngay" /></a>
                                </li>
                                <li><a href='/ChiTietWatch.aspx?NameDHid=<%#:Eval("chiTietDHid") %>'><b><%#:Eval("nameTypeDH") %></b></a></li>
                                <li><a href='/ChiTietWatch.aspx?NameDHid=<%#:Eval("chiTietDHid") %>'><b><%#:Eval("code") %></b></a></li>
                                <li><a href='/ChiTietWatch.aspx?NameDHid=<%#:Eval("chiTietDHid") %>'><span class="content2_price">Giá gốc: <%#:string.Format("{0:N0}", Eval("price")) %> đ</span></a></li>
                                <li><a href='/ChiTietWatch.aspx?NameDHid=<%#:Eval("chiTietDHid") %>'><b><font face="" color="red">Giá khuyến mãi: <%#:string.Format("{0:N0}",Eval("priceSale")) %> đ</font></b></a></li>
                            </ul>
                        </div>
                    </div>
                </ItemTemplate>
                <FooterTemplate>
                    </div>
                </FooterTemplate>
            </asp:Repeater>       
        <!--============================ end content2 ======================-->
          <!--=============================== content 3 ====================-->
            <div class="container_titile_group_watch">
                <div class="group-watch">
                    <div class="thuoc"></div>
                    <div class="titile">
                        <%--<a href="#"><asp:Label ID="lblContent3" runat="server" style="text-transform: uppercase;"></asp:Label></a>--%>
                        <asp:LinkButton ID="lnkTitleContent3" runat="server" style="text-transform: uppercase;"></asp:LinkButton>
                    </div>
                    <div class="thuoc"></div>
                </div>
            </div>
            <asp:Repeater ID="rptContent3" runat="server">
                <HeaderTemplate>

                    <div class="content3">
                </HeaderTemplate>
                <ItemTemplate>
                     <div class="wrap-item-content3">
                        <div class="item-content3 fl-left">
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
             <!--============================ end content3 ======================-->
          <!--=============================== content 4 ====================-->
            <div class="container_titile_group_watch">
                <div class="group-watch">
                    <div class="thuoc"></div>
                    <div class="titile">
                        <%--<a href="#"><asp:Label ID="lblContent4" runat="server" style="text-transform: uppercase;"></asp:Label></a>--%>
                        <asp:LinkButton ID="lnkTitileContent4" runat="server" style="text-transform: uppercase;"></asp:LinkButton>
                    </div>
                    <div class="thuoc"></div>
                </div>
            </div>
             <asp:Repeater ID="rptContent4" runat="server">
                <HeaderTemplate>
                    <div class="content3 conent4">
                        <div class="wrap-item-content3 item-content4-1">
                            <div class="item-content3 fl-left">
                                <a href="#"><img height="370" width="410" src="./images/1328276598_dong-ho-thuy-sy6.jpg" /></a><br>
                            </div>
                        </div>
                </HeaderTemplate>
                <ItemTemplate>
                     <div class="wrap-item-content3">
                        <div class="item-content3 fl-left">
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
            <!--=============================== content 5 ====================-->
            <div class="container_titile_group_watch">
                <div class="group-watch">
                    <div class="thuoc"></div>
                    <div class="titile">
                        <%--<a href="#"><asp:Label ID="lblContent5" runat="server" style="text-transform: uppercase;"></asp:Label></a>--%>
                        <asp:LinkButton ID="lnkTitleContent5" runat="server" style="text-transform: uppercase;"></asp:LinkButton>
                    </div>
                    <div class="thuoc"></div>
                </div>
            </div>
            <asp:Repeater ID="rptContent5" runat="server">
                <HeaderTemplate>

                    <div class="content3">
                </HeaderTemplate>
                <ItemTemplate>
                     <div class="wrap-item-content3">
                        <div class="item-content3 fl-left">
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
             <!--============================ end content5 ======================-->
            <!--=============================== content 6 ====================-->
            <div class="container_titile_group_watch">
                <div class="group-watch">
                    <div class="thuoc"></div>
                    <div class="titile">
                        <%--<a href="#"><asp:Label ID="lblContent6" runat="server" style="text-transform: uppercase;"></asp:Label></a>--%>
                        <asp:LinkButton ID="lnkTitleContent6" runat="server" style="text-transform: uppercase;"></asp:LinkButton>
                    </div>
                    <div class="thuoc"></div>
                </div>
            </div>
            <asp:Repeater ID="rptContent6" runat="server">
                <HeaderTemplate>

                    <div class="content3">
                </HeaderTemplate>
                <ItemTemplate>
                     <div class="wrap-item-content3">
                        <div class="item-content3 fl-left">
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
             <!--============================ end content6 ======================-->

    </div>

     <script>
       /*window.onload = function() {
            setInterval("switchImage()", 2000);
        }
        var current = 1;
        var numIMG = 3;

        function switchImage() {
            current++;
            document.images['imgShow'].src = './images/' + current + '.jpg';
            if (current == numIMG) {
                current = 0
            }
        }*/
          var varSetInterval;
        function runSlide(){
            varSetInterval=setInterval("switchImage()", 2000);
        }
         window.onload = runSlide;
        var current = 1;
        var numIMG = 3;

        function switchImage() {
            current++;
            document.images['imgShow'].src = './images/' + current + '.jpg';
            if (current == numIMG) {
                current = 0
            }
         }
         var img = document.getElementById('imgShow');
         img.addEventListener('mouseover', () => {
               clearInterval(varSetInterval);
         });
         img.addEventListener('mouseleave', () => {
               runSlide();
         });
        
    </script>
</asp:Content>
