<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/Main.Master" AutoEventWireup="true" CodeBehind="RoleView.aspx.cs" Inherits="SQMS.Application.Views.Basedata.RoleView" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div>
        <p >
    角色编码：<asp:Label ID="lblRoleCode" runat="server" Text=""></asp:Label>
            <br />
            <br />
    角色名称：<asp:Label ID="lblRoleName" runat="server" Text=""></asp:Label>
            <br />
            <br />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:CheckBox ID="cbIsVoid" runat="server" Enabled="False" Text="是否禁用" />
            <br />
            <br />
            角色权限： 
            <asp:TextBox ID="tbPermission" runat="server" Height="115px" TextMode="MultiLine" 
                Width="471px"></asp:TextBox>
&nbsp;&nbsp;
            <br />
            <br />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    备注：<asp:TextBox ID="tbMemo" runat="server" Height="132px" style="margin-left: 10px" 
                TextMode="MultiLine" Width="464px" Enabled="False"></asp:TextBox>
            <br />
            <br />    
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;    
    <asp:Button runat="server" ID="btnDelete" Text="  删除  " OnClick="btnDelete_OnClick"/>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
            <asp:Button ID="ButtonEdit" runat="server" Text="  编辑    " 
                onclick="ButtonEdit_Click" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
            <asp:Button ID="ButtonBack2List" runat="server" Text="返回到列表" 
                onclick="ButtonBack2List_Click" />
            <br />
        </p>
    </div>

</asp:Content>
