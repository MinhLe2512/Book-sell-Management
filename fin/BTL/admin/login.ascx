<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="login.ascx.cs" Inherits="BTL.admin.login" %>

<div id="login">
    <h1 id="welcomeToLoginAdmintrative">Chào mừng bạn đến với phần quản trị website!</h1>
    <div class="regionUserName">
        <div>Account:</div>
        <div><asp:TextBox ValidationGroup="checklogin" style="outline:none;" ID="txtUserName" runat="server"></asp:TextBox></div>
        
        <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUserName"
            ErrorMessage="* Account không được để trống" ValidationGroup="checklogin"></asp:RequiredFieldValidator>
    </div> 
    <div class="regionPassword">
        <div>Password:</div>
        <div>   <asp:TextBox ValidationGroup="checklogin" style="outline:none;" ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox> </div>
        <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPassword"
            ErrorMessage="* Password không được để trống" ValidationGroup="checklogin"></asp:RequiredFieldValidator>
    </div>   
    <div class="buttonlogin">
        <asp:LinkButton ValidationGroup="checklogin" ID="btnLoginAdmin" runat="server" Text="Login" OnClick="btnLogin_Click" ></asp:LinkButton>
    </div>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server"  ValidationGroup="checklogin" ForeColor="Red"/>
</div>
