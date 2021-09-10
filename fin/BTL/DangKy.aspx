<%@ Page Title="" Language="C#" MasterPageFile="~/HeaderFooter.Master" AutoEventWireup="true" CodeBehind="DangKy.aspx.cs" Inherits="BTL.DangKy" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="style/DanhKy.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="wrap_sigUp" style="background-image:url('./images/bg3.jpg');width:100%;">
        <div style="width:100%;height:20px;"></div>
      <div class="wrapper-dangky"  style="width: 1048px;margin: 0 auto;">
		<div class="fl-left wrapp-itemLeft">
			<div><span>Đăng ký</span></div>
			<div>
				<p>Tạo tài khoản để theo dõi đơn hàng, lưu</p>
				<p>danh sách sản phẩm yêu thích, nhận</p>
				<p>nhiều ưu đãi hấp dẫn.</p>
			</div>
			<div>
				<img style="width:400px;"   src="./images/photo-1-1461343345675.jpg"/>
			</div>
		</div>
		<div class="fl-left wrapp-itemRight">
			<div class="Sigup-itemRight-title">
				<div class="fl-left Sigup-title"><a href="DangNhap.aspx"><span class="itemSigup-Dangnhap">Đăng nhập</span></a></div>
				<div class="fl-left Sigup-title Sigup-title1"><a href="#"><span>Đăng ký</span></a></div>
				
			</div>
			<div>
                <div style="padding-left: 25px;padding-top: 15px;">Lưu ý: <span style="color:red;">*</span> - không được để trống.</div>
				<div class="nes">
					<span>Họ tên</span>
                    <asp:TextBox ID="txtHoTen" placeholder="     Nhập họ tên" runat="server"  CssClass="text input"></asp:TextBox>
				    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="txtHoTen"
                    ForeColor="Red" ValidationGroup="checkInputRegister"></asp:RequiredFieldValidator>
                </div>
                
				<div class="nes1">
					<span>SĐT</span>
                     <asp:TextBox ID="txtSDT" placeholder="     Nhập số điện thoại" runat="server"  CssClass="text input"></asp:TextBox>
				    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="txtSDT"
                    ForeColor="Red" ValidationGroup="checkInputRegister"></asp:RequiredFieldValidator>
                </div>
				<div class="nes4">
					<span>Email</span>
                     <asp:TextBox ID="txtEmail" placeholder="     Nhập email" runat="server"  CssClass="text input"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ControlToValidate="txtEmail"
                    ForeColor="Red" ValidationGroup="checkInputRegister"></asp:RequiredFieldValidator>
				</div>
                <div class="nes4-1">
					<span>Tài khoản</span>
                     <asp:TextBox ID="txtAccount" placeholder="     Nhập tài khoản" runat="server"  CssClass="text input"></asp:TextBox>
				     <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" ControlToValidate="txtAccount"
                    ForeColor="Red" ValidationGroup="checkInputRegister"></asp:RequiredFieldValidator>
                </div>
				<div class="nes5">
					<span>Mật khẩu</span>
                    <asp:TextBox ID="txtPassword" placeholder="     Nhập mật khẩu" runat="server" TextMode="Password"  CssClass="text input"></asp:TextBox>
				    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*" ControlToValidate="txtPassword"
                    ForeColor="Red" ValidationGroup="checkInputRegister"></asp:RequiredFieldValidator>
                </div>
				<div class="nes6">
					<span>Giới tính</span>
                     <asp:RadioButtonList ID="RadioBtnGioiTinh" runat="server">
                        <asp:ListItem Selected="False" Value="0">Nam</asp:ListItem>
                        <asp:ListItem Selected="False" Value="1">Nữ</asp:ListItem>
                    </asp:RadioButtonList>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*" ControlToValidate="RadioBtnGioiTinh"
                    ForeColor="Red" ValidationGroup="checkInputRegister"></asp:RequiredFieldValidator>
				</div>
				<div class="nes7">
					<span>Ngày sinh</span>
                   <asp:TextBox ID="txtNgaysinh" placeholder="     Nhập ngày sinh (dd/mm/yyyy)" runat="server"  CssClass="text input"></asp:TextBox>
				</div>
				
				<div class="nes9">
                    <asp:LinkButton ValidationGroup="checkInputRegister" ID="btnCreateAccount" runat="server" class="btnCreateAccount" OnClick="btnCreate_Click">Tạo tài khoản</asp:LinkButton>
				</div>
			</div>
		</div>
	  </div>
   </div>
</asp:Content>
