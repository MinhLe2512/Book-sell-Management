<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DHCategory.ascx.cs" Inherits="BTL.admin.DongHo.DHCategory" %>
<%@ Register Assembly="FreeTextBox" Namespace="FreeTextBoxControls" TagPrefix="FTB" %>
<div class="titile_watchs">Danh Sách Các Loại Đồng Hồ</div>
<asp:MultiView ID="mul" runat="server" ActiveViewIndex="0">
    <asp:View ID="v1" runat="server">
        <div class="btn_addNew">
                <asp:LinkButton ID="lnkAddNew" runat="server" OnClick="lnkAddNew_Click">Thêm mới</asp:LinkButton>
         </div>
        <div>
           <asp:Repeater ID="rptDHCategory" runat="server" OnItemCommand="rptDHCategory_ItemCommand">
                <HeaderTemplate>
                    <table style="width:100%;" class="tblDisplay">
                        <tr class="tbl_tr_title">
                            <td style="width:300px;">Loại Đồng Hồ</td>
                            <td style="width:300px;">Xuất xứ</td>
                            <td style="width:300px;">Hãng Sản Xuất</td>
                            <td style="width:100px;">Delete</td>
                        </tr>          
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <td><asp:LinkButton ID="lnkUpdate" runat="server" CommandName="Update" CommandArgument='<%#Eval("typeDHid") %>'> <%#:Eval("nameTypeDH") %></asp:LinkButton></td>
                        <td><%#:Eval("xuatXu") %></td>
                        <td><%#:Eval("hangSanXuat") %></td>
                       <td>
                            <asp:ImageButton OnLoad="messageDelete" ID="lnkDelete" style="width:18px; outline:none;" runat="server" ImageUrl="../../Images/icon-trash_can.png" CommandName="delete" CommandArgument='<%#Eval("typeDHid") %>'/>
                        </td>
                    </tr>

                </ItemTemplate>
                <FooterTemplate>
                  </table>
                </FooterTemplate>
            </asp:Repeater>
        </div>
         <div style="overflow: hidden;" id="contain_paging">
            <asp:Repeater ID="rptPages" runat="server"
                onitemcommand="rptPages_ItemCommand1">
                <ItemTemplate>
                    <asp:LinkButton ID="btnPage"
                     style="padding:1px 3px; margin:1px; background:#ccc; border:solid 1px #666; font:8pt tahoma;"
                     CommandName="Page" CommandArgument="<%# Container.DataItem %>"
                     runat="server">
                        <%# Container.DataItem %>
                    </asp:LinkButton>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </asp:View>
    <asp:View ID="v2" runat="server">
        <asp:HiddenField ID="hdCategoryID" runat="server" />
        <asp:HiddenField ID="hdInsert" runat="server" />
        <table  id="tblEditDH">
            <tr class="tr_tblAddNew">
                <td class="td_CateDH_title_addNew" style=" width: 120px;">Loại Đồng Hồ:</td>
                <td><asp:TextBox ValidationGroup="updateCateDH" ID="txtCategoryName" runat="server"></asp:TextBox></td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="None" ControlToValidate="txtCategoryName"
                    ErrorMessage="* Loại đồng hồ không được để trống" ValidationGroup="updateCateDH"></asp:RequiredFieldValidator>
            </tr>
            <tr class="tr_tblAddNew">
               <td class="td_CateDH_title_addNew" style=" width: 120px;">Xuất Xứ:</td>
                <td><asp:TextBox ValidationGroup="updateCateDH" ID="txtXuatxu" runat="server"></asp:TextBox></td> 
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Display="None" ControlToValidate="txtXuatxu"
                    ErrorMessage="* Xuất xứ không được để trống" ValidationGroup="updateCateDH"></asp:RequiredFieldValidator>
            </tr>
            <tr class="tr_tblAddNew">
                <td class="td_CateDH_title_addNew" style=" width: 120px;">Hãng sản xuất:</td>
                <td><asp:TextBox ValidationGroup="updateCateDH" ID="txtHSX" runat="server"></asp:TextBox></td> 
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" Display="None" ControlToValidate="txtHSX"
                    ErrorMessage="* Hãng sản xuất không được để trống" ValidationGroup="updateCateDH"></asp:RequiredFieldValidator>
            </tr>
            <tr class="tr_tblAddNew">
                <td class="td_CateDH_title_addNew" style=" width: 120px;">Thương hiệu:</td>
                 <td>
                     <FTB:FreeTextBox ID="txtContent" runat="server"></FTB:FreeTextBox>
                 </td>
            </tr>
            <tr class="tr_tblAddNew">
                <td></td>
                <td><asp:Button ValidationGroup="updateCateDH" ID="btnSave" runat="server" class="btnUpdateData" Text="Cập nhật" OnClick="btnSave_Click"/></td>
            </tr>
        </table>
       <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="updateCateDH" ForeColor="Red" CssClass="contain_err"/>

    </asp:View>
</asp:MultiView>