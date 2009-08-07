<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/Main.Master" AutoEventWireup="true" CodeBehind="RoleView.aspx.cs" Inherits="SQMS.Application.Views.Basedata.RoleView" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div>
    角色编码：<asp:Label ID="lblRoleCode" runat="server" Text=""></asp:Label><br />
    角色名称：<asp:Label ID="lblRoleName" runat="server" Text=""></asp:Label><br />
    禁用：<asp:CheckBox ID="cbIsVoid" runat="server" Enabled="False" /><br />
    备注：<asp:Label ID="lblMemo" runat="server" Text=""></asp:Label><br />    
    <asp:Button runat="server" ID="btnDelete" Text="删除" OnClick="btnDelete_OnClick"/>
    </div>

</asp:Content>
