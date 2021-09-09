<%@ Page Title="" Language="C#" MasterPageFile="~/HeaderFooter.Master" AutoEventWireup="true" CodeBehind="ThanhToan.aspx.cs" Inherits="BTL.ThanhToan" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="style/ThanhToan.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="bill_info">
	    <p class="title">THÔNG TIN THANH TOÁN</p>
        <asp:ValidationSummary ValidationGroup="checkInput" ForeColor="Red" ID="ValidationSummary1" runat="server" />
	    <table>
		    <tr>
			    <td></td>
			    <td>
				    <span class="red">Lưu ý:</span> Mục <span class="red">(*)</span> là bắt buộc phải ghi
			    </td>
		    </tr>
		    <tr>
			    <td>Họ và tên <span class="red">(*)</span>:</td>
			    <td>
                    <asp:TextBox ID="customer_name" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" Display="None" runat="server" ControlToValidate="customer_name"
                        ErrorMessage="Bạn phải nhập họ tên" ValidationGroup="checkInput"></asp:RequiredFieldValidator>
			    </td>
		    </tr>
		    <tr>
			    <td>Điện thoại <span class="red">(*)</span>:</td>
			    <td>
                    <asp:TextBox TextMode="Number" ID="customer_phone" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" Display="None" runat="server" ControlToValidate="customer_phone"
                        ErrorMessage="Bạn phải nhập số điện thoại" ValidationGroup="checkInput"></asp:RequiredFieldValidator>
                    <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="Điện thoại phải gồm 10 hoặc 11 số"  ValidationGroup="checkInput"
                EnableClientScript="true" ClientValidationFunction="checkPhoneNumber" ControlToValidate="customer_phone" Display="None" ></asp:CustomValidator>
			    </td>
		    </tr>
		    <tr>
			    <td>Địa chỉ <span class="red">(*)</span>:</td>
			    <td>
                     <asp:TextBox ID="customer_address" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" Display="None" runat="server" ControlToValidate="customer_address"
                        ErrorMessage="Bạn phải nhập số địa chỉ" ValidationGroup="checkInput"></asp:RequiredFieldValidator>
			    </td>
		    </tr>
		    <tr>
			    <td>Email:</td>
			    <td>
                     <asp:TextBox ID="customer_email" runat="server"></asp:TextBox>
                     <asp:CustomValidator ID="CustomValidator2" runat="server" ErrorMessage="Email không hợp lệ"  ValidationGroup="checkInput"
                EnableClientScript="true" ClientValidationFunction="checkEmail" ControlToValidate="customer_email" Display="None" ></asp:CustomValidator>
			    </td>
		    </tr>
		    <tr>
			    <td>Ghi chú:</td>
			    <td><asp:TextBox ID="ghi_chu" runat="server" TextMode="MultiLine"></asp:TextBox></td>
		    </tr>
	    </table>
        <asp:Button ValidationGroup="checkInput" ID="CODpayment" CssClass="CODpayment" runat="server" Text="THANH TOÁN KHI NHẬN HÀNG" OnClick="CODpayment_Click" />
	    <asp:Button ValidationGroup="checkInput" ID="ONLpayment" CssClass="ONLpayment" runat="server" Text="THANH TOÁN ONLINE" OnClick="ONLpayment_Click" />
	    
    </div>
    <div style="clear:both; border:0px;"></div>
    <script type="text/javascript">
        function checkPhoneNumber(sender, args) {
            let phone = document.getElementById('<%=customer_phone.ClientID%>').value;
            if (phone.length < 10 || phone.length > 11) {
                args.IsValid = false;
              // alert('Điện thoại gồm 10 hoặc 11 số');
               
            }
            else {
                // do your other validation tests here...
            }
        }
        function checkEmail(sender, args) {
            let mail = document.getElementById('<%=customer_email.ClientID%>').value;
            if (mail.length > 0) {
                const re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
                let kq = re.test(String(mail).toLowerCase());
                if (kq == false)
                    args.IsValid = false;               
            }
           
        }
    </script>
</asp:Content>
