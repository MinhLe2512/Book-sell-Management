<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UserAdmin.ascx.cs" Inherits="BTL.admin.Users.UserAdmin" %>
<div class="wrap_users">
    <div class="DieuKhienAdmin">
        <div  class="btn">
            <asp:LinkButton ID="btnAminAdd" runat="server"   OnClick="btnAddNew_Click">Thêm mới</asp:LinkButton>
        </div>
        <div class="btn">
            <asp:LinkButton ID="btnEditInforAdmin"  runat="server" OnClick="btnEditInfor_Click">Sửa thông tin cá nhân</asp:LinkButton>
        </div>
        <div class="btn">
            <asp:LinkButton ID="lnkChangePass" runat="server" OnClick="lnkChangePass_Click" >Đổi password</asp:LinkButton>
        </div>
        <asp:HiddenField ID="hdInsert" runat="server" />
        <asp:HiddenField ID="hdImage" runat="server" />
        <asp:HiddenField ID="hdUserID" runat="server" />
    </div>
    <asp:MultiView ID="MultiViewUser" runat="server" ActiveViewIndex="0">
        <asp:View ID="View1" runat="server">
            <table style="width:100%" class="tblUsersAdmin">
                 <tr>
                    <td style="width:100px">Account:</td>
                    <td style="width:10px"></td>
                    <td>
                        <asp:TextBox ID="txtAcc" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtAcc"
                         ErrorMessage="* Account không được để trống" CssClass="errorInput" ValidationGroup="checkInput"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td style="width:100px">Họ và tên:</td>
                    <td style="width:10px"></td>
                    <td>
                        <asp:TextBox ID="txtAdminName" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtAdminName"
                         ErrorMessage="* Họ tên không được để trống" CssClass="errorInput" ValidationGroup="checkInput"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                 <tr>
                    <td style="width:100px">Giới tính:</td>
                    <td style="width:10px"></td>
                    <td>
                        <asp:DropDownList ID="drpGioiTinh" runat="server">
                            <asp:ListItem Value="0">Nam</asp:ListItem>
                            <asp:ListItem Value="1">Nữ</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                 <tr>
                        <td style="width:100px">Ảnh đại diện:</td>
                         <td style="width:10px"></td>
                         <td>
                             <asp:FileUpload ID="fUpImage" runat="server" onchange="showImageChoosed(this)" />
                         </td>
                    </tr>
                <tr>
                        <td> </td>
                        <td><img src="#" id="avatar_add_view" class="avatar_add_view"/></td>
                        <td></td>
                 </tr>
                <tr>
                    <td style="width:100px">Password:</td>
                    <td style="width:10px"></td>
                    <td>
                        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtPassword"
                         ErrorMessage="* Password không được để trống" CssClass="errorInput" ValidationGroup="checkInput"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td style="width:100px">Địa chỉ:</td>
                    <td style="width:10px"></td>
                    <td>
                        <asp:TextBox ID="txtDiaChi" runat="server" ></asp:TextBox>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtDiaChi"
                         ErrorMessage="* Địa chỉ không được để trống" CssClass="errorInput" ValidationGroup="checkInput"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                 <tr>
                    <td style="width:100px">Điện thoại:</td>
                    <td style="width:10px"></td>
                    <td>
                        <asp:TextBox ID="txtDT" runat="server" ></asp:TextBox>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtDT"
                         ErrorMessage="* Điện thoại không được để trống" CssClass="errorInput" ValidationGroup="checkInput"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                 <tr>
                    <td style="width:100px">email:</td>
                    <td style="width:10px"></td>
                    <td>
                        <asp:TextBox ID="txtEmail" runat="server" ></asp:TextBox>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtEmail"
                         ErrorMessage="* Email không được để trống" CssClass="errorInput" ValidationGroup="checkInput"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td style="width:100px"></td>
                    <td style="width:10px"></td>
                    <td><asp:Button ValidationGroup="checkInput" ID="btnUpdate" runat="server" class="btnUpdateData" Text="Thêm mới" OnClick="btnUpdate_Click" /> </td><!---->
                </tr>
            </table>
        </asp:View>
        <asp:View ID="View2" runat="server">
            <table class="tblUsersAdmin tblUsersChangePass">
                <tr>
                    <td class="label_field">Nhập mật khẩu cũ:</td>
                    <td>
                        <asp:TextBox TextMode="Password" ID="txtMkCu" runat="server" CssClass="input_TK_field"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" CssClass="errorInput" runat="server" ErrorMessage="* Mật khẩu cũ không được để trống" ValidationGroup="changeMK" ControlToValidate="txtMkCu"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="label_field">Nhập mật khẩu mới:</td>
                    <td>
                        <asp:TextBox TextMode="Password" ID="txtMkMoi" runat="server" CssClass="input_TK_field"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" CssClass="errorInput" runat="server" ErrorMessage="* Mật khẩu mới không được để trống" ValidationGroup="changeMK" ControlToValidate="txtMkMoi"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="label_field">Nhập lại mật khẩu mới:</td>
                    <td>
                        <asp:TextBox TextMode="Password" ID="txtMkMoi2" runat="server" CssClass="input_TK_field"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" CssClass="errorInput" runat="server" ErrorMessage="* Phải nhập lại mật khẩu mới"  ValidationGroup="changeMK" ControlToValidate="txtMkMoi2"></asp:RequiredFieldValidator>
                    <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage=""
                EnableClientScript="true" ClientValidationFunction="check2InputMK" ControlToValidate="txtMkMoi2" Display="Dynamic" ></asp:CustomValidator>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <asp:Button ID="btnChangeMK" runat="server" CssClass="btnUpdateData" ValidationGroup="changeMK" Text="Đổi mật khẩu" OnClick="btnChangeMK_Click" />
                    </td>
                </tr>
            </table>
        </asp:View>
    </asp:MultiView>
    
</div>
<script>
    function showImageChoosed(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();

                reader.onload = function (e) {
                    document.getElementById("avatar_add_view").setAttribute('src', e.target.result);
                    document.getElementById("avatar_add_view").setAttribute('style', "max-width: 200px;max-height: 200px;;display:block;");
                }
                
            reader.readAsDataURL(input.files[0]);
            }
    }
     function check2InputMK(sender, args) {
        let mk1 = document.getElementById('<%=txtMkMoi.ClientID%>').value;
        let mk2 = document.getElementById('<%=txtMkMoi2.ClientID%>').value;
        if (mk1 != mk2) {
            args.IsValid = false;
            alert('Mật khẩu mới không giống mật khẩu nhập lại mật khẩu mới');
            document.getElementById('<%=txtMkMoi2.ClientID%>').value = "";
        }
        else {
            // do your other validation tests here...
        }
    }
</script>