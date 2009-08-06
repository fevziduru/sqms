<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/Main.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="SQMS.Application.Views.Security.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
用户登录<br />
用户名:<asp:TextBox ID="txtPassport" runat="server" /><br />
密码:<asp:TextBox ID="txtPassword" runat="server" TextMode="Password" /><br />
<asp:Button ID="btnLogin" runat="server" OnClick="btnLogin_OnClick" Text="登录" /><br />
</asp:Content>
