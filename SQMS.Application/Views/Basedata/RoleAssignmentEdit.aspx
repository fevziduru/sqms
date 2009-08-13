<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/Main.Master" AutoEventWireup="true" CodeBehind="RoleAssignmentEdit.aspx.cs" Inherits="SQMS.Application.Views.Basedata.RoleAssignmentEdit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<fieldset>
<legend>角色基本资料</legend>
<table>
    <tr>
        <td>角色名称：</td>
        <td><asp:TextBox ID="txtRoleName" runat="server"></asp:TextBox></td>
        <td>角色编码：</td>
        <td><asp:TextBox ID="txtRoleCode" runat="server"></asp:TextBox></td>
    </tr>
    <tr>
        <td>状态：</td>
        <td colspan="3"><asp:CheckBox ID="cbIsvoid" runat="server" /></td>
    </tr>
    <tr>
        <td>备注：</td>
        <td colspan="3"><asp:TextBox ID="txtMemo" runat="server" TextMode="MultiLine" 
                Height="154px" Width="342px"></asp:TextBox></td>
    </tr>
</table>
</fieldset>

<fieldset>
    <legend>角色授权信息</legend>
        
</fieldset>

</asp:Content>
