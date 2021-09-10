<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="adminControl.ascx.cs" Inherits="BTL.admin.adminControl" %>
<div class="wrapper" style="width:100%; height:100%;">
    <div class="menu_side_left" >
        <div id="logo_adin">
            <img src="../Images/logo6.png" style="width:100%;" />
        </div>
        <ul id="menu">          
            <li><a href="administrator.aspx?choose=dongho">Sản phẩm</a></li>
            <li><a href="administrator.aspx?choose=userAdmin">Tài khoản</a></li>
            <li><a href="administrator.aspx?choose=donhang">Đơn hàng</a></li>
            <li><a href="administrator.aspx?choose=donhang">Chat</a></li>
        </ul>
    </div>
    <div style="margin-left: 225px;margin-right: 40px;">
       
            <div class="wrapAminLogined">
                <div class="nameAminLogined">
                    <div class="warp-pictureAdmin">
                        <img src='/images/<%=Session["avatarAdmin"] %>' alt="" />
                    </div>
            
                    <p><%=Session["userAdminname"] %></p>
                </div>
                <div style="padding-right: 15px;padding-left: 15px; padding-top:8px;">
                    <%--<asp:LinkButton ID="lnkExit" runat="server" >Thoát</asp:LinkButton>--%>
                    <asp:ImageButton ID="ImageButton1" runat="server" Width="30px" OnClick="lnkExit_Click" ImageUrl="../Images/sign_out.png"/>
                </div>
            </div>
            <div style="padding-top:100px;">
                <asp:PlaceHolder ID="LoadRegionAdmin" runat="server"></asp:PlaceHolder>
            </div>
    </div>
</div> 
