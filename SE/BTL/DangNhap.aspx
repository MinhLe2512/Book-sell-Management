<%@ Page Title="" Language="C#" MasterPageFile="~/HeaderFooter.Master" AutoEventWireup="true" CodeBehind="DangNhap.aspx.cs" Inherits="BTL.DangNhap" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="style/DangNhap.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="wrap_sigUp" style="background-image:url('./images/bg3.jpg');width:100%;">
        <div style="width:100%;height:20px;"></div>
    <div class="wrapper-dangky"  style="width: 1048px;margin: 0 auto;">
		<div class="fl-left  wrapp-itemLeft">
			<div><span>Đăng nhập</span></div>
			<div>
				<p>Đăng nhập để theo dõi đơn hàng, lưu</p>
				<p>danh sách sản phẩm yêu thích, nhận</p>
				<p>nhiều ưu đãi hấp dẫn.</p>
			</div>
			<div>
				<img style="width:400px;"  src="/images/photo-1-1461343345675.jpg"/>
			</div>
		</div>
		<div class="fl-left wrapp-itemRight">
			<div class="Sigup-itemRight-title">
				<div class="fl-left Sigup-title Sigup-title1"><a href="#"><span>Đăng nhập</span></a></div>
				<div class="fl-left Sigup-title"><a href="DangKy.aspx"><span class="itemSigup-Dangnhap">Đăng ký</span></a></div>
			</div>
			<div>
				<div class="nes">
					<span>Tài khoản</span>
					 <asp:TextBox ID="txtAccount" placeholder="     Nhập tài khoản" runat="server"  CssClass="text input inputAcc"></asp:TextBox>
                    <div id="accError" runat="server" class="accError"></div>
				</div>
				<div class="nes1">
					<span>Mật khẩu</span>
					 <asp:TextBox ID="txtPassword" placeholder="     Nhập mật khẩu" runat="server" TextMode="Password" CssClass="text input inputPass"></asp:TextBox>
                    <div id="passError" runat="server" class="passError"></div>
				</div>
				<div class="qmk">
					<span>Quên mật khẩu?  </span><a href="#" style="color:blue;">Nhấn vào đây</a>
				</div>
				<div class="Login-cacNut">
					<div class="login-nut">
					 <asp:LinkButton ID="btnCreateAccount" runat="server" class="btnCreateAccount" OnClick="btnLogin_Click">Đăng Nhập</asp:LinkButton>
					</div>
					<div class="login-nut">
						<a href="#"><img src="/images/Capture24.PNG"/></a>
					</div>
					<div class="login-nut">
						<a href="#"><img src="/images/Capture25.PNG"/></a>
					</div>
					<div class="login-nut">
						<a href="#"><img src="/images/Capture26.PNG"/></a>
					</div>
				</div>
				
			</div>
		</div>
	</div>

    </div>
  <script type="text/javascript">
        let inputAcc = document.getElementsByClassName('inputAcc');
        inputAcc[0].addEventListener('keyup', function () {
            if (inputAcc[0].value.toString().trim() !== '') {
                document.getElementsByClassName('accError')[0].innerHTML = '';
            }
            else {
                document.getElementsByClassName('accError')[0].innerHTML = 'tài khoản ko được để trống';
            }
      });

       let inputPass = document.getElementsByClassName('inputPass');
        inputPass[0].addEventListener('keyup', function () {
            if (inputPass[0].value.toString().trim() !== '') {
                document.getElementsByClassName('passError')[0].innerHTML = '';
            }
            else {
                document.getElementsByClassName('passError')[0].innerHTML = 'mật khẩu ko được để trống';
            }
        });
    </script>
</asp:Content>
