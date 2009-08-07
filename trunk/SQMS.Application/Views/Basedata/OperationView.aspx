<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/Main.Master" AutoEventWireup="true" CodeBehind="OperationView.aspx.cs" Inherits="SQMS.Application.Views.Basedata.OperationView" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div>
    操作编码：<asp:Label ID="lblOpCode" runat="server" Text=""></asp:Label><br />
    操作名称：<asp:Label ID="lblOpName" runat="server" Text=""></asp:Label><br />
    备注：<asp:Label ID="lblOpMemo" runat="server" Text=""></asp:Label><br />    
    <asp:Button runat="server" ID="btnDelete" Text="删除" OnClick="btnDelete_OnClick"/>
    </div>

</asp:Content>
