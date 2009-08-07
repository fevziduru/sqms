<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/Main.Master" AutoEventWireup="true" CodeBehind="OperationEdit.aspx.cs" Inherits="SQMS.Application.Views.Basedata.OperationEdit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div>
    操作编码：<asp:TextBox ID="lblOpCode" runat="server" ></asp:TextBox><br />
    操作名称：<asp:TextBox ID="lblOpName" runat="server" ></asp:TextBox><br />
    备注：<asp:TextBox ID="lblOpMemo" runat="server" ></asp:TextBox><br />
    <asp:Button runat="server" ID="btnSave" Text="保存" OnClick="btnSave_Click"/>
    </div>
    
</asp:Content>
