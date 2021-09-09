<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DHDetail.ascx.cs" Inherits="BTL.admin.DongHo.DHDetail" %>


<style type="text/css">
    .auto-style1 {
        width: 143px;
    }
    .auto-style2 {
        width: 145px;
    }
</style>

<asp:MultiView ID="mulDetailWatch" runat="server" ActiveViewIndex="0">
    <asp:View ID="v0" runat="server"><!--view để hiển thị dữ liệu-->
        <div class="DetailWatchTitle titile_watchs"><b>Danh sách các đồng hồ</b></div>
        <div class="btn_addNew"><asp:LinkButton ID="lnkUpdate" runat="server" CssClass="addNewDetailDH" OnClick="lnkAddNew_Click" >Thêm mới</asp:LinkButton></div>
        <asp:DropDownList ID="drpWatchCategory" CssClass="drpWatchCategory" runat="server" AutoPostBack="true" OnSelectedIndexChanged="drpWatchCategory_SelectedIndexChanged"></asp:DropDownList>
       <div style="clear:both;margin-bottom: 15px;"></div>
        <asp:Repeater ID="rptWatchDetails" runat="server" OnItemCommand="rptWatchDetails_ItemCommand">
            <HeaderTemplate>
                <table style="width:100%;" class="rptHed tblDisplay" >
                    <tr  class="tbl_tr_title">
                        <td style="width:100px;">Image</td>
                        <td style="width:400px;">Mã Đồng Hồ</td>
                        <td style="width:100px;">giá</td>
                        <td style="width:100px;">giảm giá</td>
                        <td style="width:100px;">số lượng</td>
                        <td style="width:100px;">kiểu dáng</td>
                        <td style="width:100px;">Hiển thị</td>
                        <td>Edit</td>
                        <td>Delete</td>
                    </tr>
               
            </HeaderTemplate>
            <ItemTemplate>
                <tr class="rptItem">
                        <td><img src='/images/<%#:Eval("urlPicture") %>' style="width:100px;"/></td>
                        <td><%#:Eval("code") %></td>
                        <td><%#:string.Format("{0:N0}", Eval("price")) %> đ</td>
                        <td><%#:Eval("sale") %> %</td>
                        <td><%#:Eval("quantity") %></td>
                        <td><%#:Eval("kieuDang") %></td>
                        <td><%#:Eval("active") %></td>
                        <td>
                            <asp:LinkButton  CommandName="Update" CommandArgument='<%#:Eval("chiTietDHid") %>' CssClass="lnk" Text="" runat="server" ID="lnkUpdate" >
                                <asp:image Width="40px" imageurl="../../Images/icon_edit.png" runat="server"/>
                            </asp:LinkButton> 
                        </td>
                        <td>
                           <asp:LinkButton OnLoad="msgDel" ID="lnkDelete" CssClass="lnk"  CommandName="Delete" CommandArgument='<%#:Eval("chiTietDHid") %>' Text="" runat="server" >
                                <asp:image Width="30px" imageurl="../../Images/icon-trash_can.png" runat="server"/>
                            </asp:LinkButton> 
                        </td>
                </tr>
                
            </ItemTemplate>
            <AlternatingItemTemplate>
                <tr class="rptAlt">
                         <td><img src='/images/<%#:Eval("urlPicture") %>' style="width:100px;" /></td>
                        <td><%#:Eval("code") %></td>
                        <td><%#:string.Format("{0:N0}", Eval("price")) %> đ</td>
                        <td><%#:Eval("sale") %> %</td>
                        <td><%#:Eval("quantity") %></td>
                        <td><%#:Eval("kieuDang") %></td>
                        <td><%#:Eval("active") %></td>
                          <td>
                            <asp:LinkButton  CommandName="Update" CommandArgument='<%#:Eval("chiTietDHid") %>' CssClass="lnk" Text="" runat="server" ID="lnkUpdate" >
                                <asp:image Width="40px" imageurl="../../Images/icon_edit.png" runat="server"/>
                            </asp:LinkButton> 
                        </td>
                        <td>
                           <asp:LinkButton OnLoad="msgDel" ID="lnkDelete" CssClass="lnk"  CommandName="Delete" CommandArgument='<%#:Eval("chiTietDHid") %>' Text="" runat="server" >
                                <asp:image Width="30px" imageurl="../../Images/icon-trash_can.png" runat="server"/>
                            </asp:LinkButton> 
                        </td>
                </tr>
            </AlternatingItemTemplate>
            <FooterTemplate>
                </table>
            </FooterTemplate>
            
        </asp:Repeater>   
        <asp:HiddenField ID="hdInsert" runat="server" />
        <asp:HiddenField ID="hdDetailID" runat="server" />
        <asp:HiddenField ID="hdImage" runat="server" />
        <div style="margin-bottom:50px;" ></div>
    </asp:View> 
    <asp:View id="v1" runat="server"><!--view để thêm dữ liệu hoặc cập nhật-->
        <div class="DetailWatchTitle titile_watchs"><b>Thêm mới đồng hồ</b></div>
        <table style="width:100%" id="tblEditDH">
            <tr class="tr_tblAddNew">
                <td class="auto-style2">Loại đồng hồ:</td>
                 <td ></td>
                 <td>
                     <asp:DropDownList ID="drpWatchCategory2" CssClass="drpWatchCategory drpWatchCategoryToAdd" runat="server"></asp:DropDownList>
                 </td>
            </tr>
            <tr class="tr_tblAddNew">
                <td class="auto-style2">Mã đồng hồ:</td>
                 <td></td>
                 <td>
                     <asp:TextBox ValidationGroup="editDH" ID="txtCode" runat="server" style="width:500px" CssClass="text"></asp:TextBox>
                 </td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" Display="None" runat="server" ControlToValidate="txtCode"
                    ErrorMessage="* Mã đồng hồ không được để trống" ValidationGroup="editDH"></asp:RequiredFieldValidator>
            </tr>
            <tr class="tr_tblAddNew">
                <td class="auto-style2">Giá:</td>
                 <td></td>
                 <td>
                    <asp:TextBox ValidationGroup="editDH" ID="txtPrice" placeholder="(nhập số nguyên dương)" runat="server"  style="width:500px" CssClass="text"></asp:TextBox>
                 </td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" Display="None" runat="server" ControlToValidate="txtPrice"
                    ErrorMessage="* Giá đồng hồ không được để trống" ValidationGroup="editDH"></asp:RequiredFieldValidator>
            </tr>
             <tr class="tr_tblAddNew">
                <td class="auto-style2">Giảm giá:</td>
                 <td></td>
                 <td>
                    <asp:TextBox ValidationGroup="editDH" ID="txtSale" placeholder="(nhập số thực từ 0 đến 100 - đơn vị %)" runat="server"  style="width:500px" CssClass="text"></asp:TextBox>
                 </td>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator3" Display="None" runat="server" ControlToValidate="txtSale"
                    ErrorMessage="* Giảm giá đồng hồ không được để trống" ValidationGroup="editDH"></asp:RequiredFieldValidator>
            </tr>
             <tr class="tr_tblAddNew">
                <td class="auto-style2">Ảnh</td>
                 
                 <td>
                     <asp:FileUpload ValidationGroup="editDH" ID="fUpImage" runat="server"  CssClass="uploadImage"/>
                 </td>
                 <td>
                    <img id="imgViewDH" class="imgViewDH" src="#" alt="image chossed" runat="server"/>

                 </td>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator4" Display="None" runat="server" ControlToValidate="fUpImage"
                    ErrorMessage="* Ảnh đồng hồ không được để trống" ValidationGroup="editDH"></asp:RequiredFieldValidator>
            </tr>
            <tr class="tr_tblAddNew">
                <td class="auto-style2">Số lượng:</td>
                 <td></td>
                 <td>
                    <asp:TextBox ValidationGroup="editDH" ID="txtQuantity" placeholder="(nhập số nguyên dương)" runat="server"  style="width:500px" CssClass="text"></asp:TextBox>
                 </td>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator5" Display="None" runat="server" ControlToValidate="txtQuantity"
                    ErrorMessage="* Số lượng đồng hồ không được để trống" ValidationGroup="editDH"></asp:RequiredFieldValidator>
            </tr>
            <tr class="tr_tblAddNew">
                <td class="auto-style2">Kiểu dáng:</td>
                 <td></td>
                 <td>
                    <asp:TextBox ValidationGroup="editDH" ID="txtKieuDang" runat="server"  style="width:500px" CssClass="text"></asp:TextBox>
                 </td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" Display="None" runat="server" ControlToValidate="txtKieuDang"
                    ErrorMessage="* Kiểu dáng đồng hồ không được để trống" ValidationGroup="editDH"></asp:RequiredFieldValidator>
            </tr>
            <tr class="tr_tblAddNew">
                <td class="auto-style2">Năng Lượng:</td>
                 <td></td>
                 <td>
                     <asp:TextBox ValidationGroup="editDH" ID="txtNangLuong" runat="server" style="width:500px"></asp:TextBox>
                 </td>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator7" Display="None" runat="server" ControlToValidate="txtNangLuong"
                    ErrorMessage="* Năng lượng đồng hồ không được để trống" ValidationGroup="editDH"></asp:RequiredFieldValidator>
            </tr>
            <tr class="tr_tblAddNew">
                <td class="auto-style2">Độ chịu Nước:</td>
                 <td></td>
                 <td>
                    <asp:TextBox ValidationGroup="editDH" ID="txtDoChiuNuoc" placeholder="(nhập số nguyên dương - đơn vị ATM)" runat="server"  style="width:500px" CssClass="text"></asp:TextBox>
                 </td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" Display="None" runat="server" ControlToValidate="txtDoChiuNuoc"
                    ErrorMessage="* Độ chịu nước không được để trống" ValidationGroup="editDH"></asp:RequiredFieldValidator>
            </tr>
            <tr class="tr_tblAddNew">
                <td class="auto-style2">Chất liệu mặt:</td>
                 <td></td>
                 <td>
                    <asp:TextBox ValidationGroup="editDH" ID="txtChatLieuMat" runat="server"  style="width:500px" CssClass="text"></asp:TextBox>
                 </td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" Display="None" runat="server" ControlToValidate="txtChatLieuMat"
                    ErrorMessage="* Chất liệu mặt không được để trống" ValidationGroup="editDH"></asp:RequiredFieldValidator>
            </tr>
            <tr class="tr_tblAddNew">
                <td class="auto-style2">Đường kính mặt:</td>
                 <td></td>
                 <td>
                    <asp:TextBox ValidationGroup="editDH" ID="txtDuongKinhMat" placeholder="(nhập số thực lớn hơn 0 - đơn vị mm)" runat="server"  style="width:500px" CssClass="text"></asp:TextBox>
                 </td>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator10" Display="None" runat="server" ControlToValidate="txtDuongKinhMat"
                    ErrorMessage="* Đường kính mặt không được để trống" ValidationGroup="editDH"></asp:RequiredFieldValidator>
            </tr>
            <tr class="tr_tblAddNew">
                <td class="auto-style2">Chất Liệu Dây:</td>
                 <td></td>
                 <td>
                    <asp:TextBox ValidationGroup="editDH" ID="txtChatLieuDay" runat="server"  style="width:500px" CssClass="text"></asp:TextBox>
                 </td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" Display="None" runat="server" ControlToValidate="txtChatLieuDay"
                    ErrorMessage="* Chất liệu dây không được để trống" ValidationGroup="editDH"></asp:RequiredFieldValidator>
            </tr>
            <tr class="tr_tblAddNew">
                <td class="auto-style2">Kích cỡ dây:</td>
                 <td></td>
                 <td>
                    <asp:TextBox ValidationGroup="editDH" ID="txtSizeDay" placeholder="(nhập số thực lớn hơn 0 - đơn vị mm)" runat="server"  style="width:500px" CssClass="text"></asp:TextBox>
                 </td>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator12" Display="None" runat="server" ControlToValidate="txtSizeDay"
                    ErrorMessage="* Kích cỡ dây không được để trống" ValidationGroup="editDH"></asp:RequiredFieldValidator>
            </tr>
            <tr class="tr_tblAddNew">
                <td class="auto-style2">Chất liệu vỏ:</td>
                 <td></td>
                 <td>
                    <asp:TextBox ValidationGroup="editDH" ID="txtChatLieuVo" runat="server"  style="width:500px" CssClass="text"></asp:TextBox>
                 </td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator13" Display="None" runat="server" ControlToValidate="txtChatLieuVo"
                    ErrorMessage="* Chất liệu vỏ không được để trống" ValidationGroup="editDH"></asp:RequiredFieldValidator>
            </tr>
            <tr class="tr_tblAddNew">
                <td class="auto-style2">Đường kính vỏ:</td>
                 <td></td>
                 <td>
                    <asp:TextBox ValidationGroup="editDH" ID="txtDuongKinhVo" placeholder="(nhập số thực lớn hơn 0 - đơn vị mm)" runat="server"  style="width:500px" CssClass="text"></asp:TextBox>
                 </td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator14" Display="None" runat="server" ControlToValidate="txtDuongKinhVo"
                    ErrorMessage="* Đường kính vỏ không được để trống" ValidationGroup="editDH"></asp:RequiredFieldValidator>
            </tr>
            <tr class="tr_tblAddNew">
                <td class="auto-style2">Thời gian bảo hành:</td>
                 <td></td>
                 <td>
                    <asp:TextBox ValidationGroup="editDH" ID="txtTimeBaoHanh" placeholder="(nhập số thực lớn hơn 0 - đơn vị năm)" runat="server"  style="width:500px" CssClass="text"></asp:TextBox>
                 </td>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator15" Display="None" runat="server" ControlToValidate="txtTimeBaoHanh"
                    ErrorMessage="* Thời gian bảo hành không được để trống" ValidationGroup="editDH"></asp:RequiredFieldValidator>
            </tr>           
            <tr class="tr_tblAddNew">
                <td class="auto-style2">Có hiển thị ?:</td>
                 <td></td>
                 <td>
                     <asp:CheckBox ID="chkActive" runat="server" />
                 </td>
            </tr>   
            <tr class="tr_tblAddNew">
                <td class="auto-style2"></td>
                 <td></td>
                 <td>
                     <asp:Button ID="btnUpdate" runat="server" ValidationGroup="editDH" class="btnUpdateData" Text="Cập nhật" OnClick="btnUpdate_Click" />
                 </td>
            </tr>
        </table>
        <asp:ValidationSummary ID="ValidationSummary1" runat="server"  ValidationGroup="editDH" ForeColor="Red" CssClass="contain_err"/>
    </asp:View>
</asp:MultiView>
<script>
     var uploadimage = document.getElementsByClassName('uploadImage')[0];
    if (uploadimage != undefined)
        uploadimage.onchange = function () {
        readURL(this);
        };
    function readURL(input) {
             if (input.files && input.files[0]) {
               var reader = new FileReader();

                 reader.onload = function (e) {
                     document.getElementsByClassName('imgViewDH')[0].setAttribute('src', e.target.result);
                     document.getElementsByClassName('imgViewDH')[0].setAttribute('style', "max-width: 100px;max-height: 150px;;display:block;");
                 }
                
               reader.readAsDataURL(input.files[0]);
             }
    }
</script>