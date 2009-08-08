<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/Main.Master" AutoEventWireup="true" CodeBehind="OperationView.aspx.cs" Inherits="SQMS.Application.Views.Basedata.OperationView" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div>
     <table>
        <tr>
            <td><asp:Button runat="server" ID="Button1" Text="删除" OnClick="btnDelete_OnClick"/></td>
            <td><asp:Button runat="server" ID="Button2" Text="编辑" OnClick="btnEdit_OnClick"/></td>
        </tr>
    </table>
    <table>
        <tr>
            <td style="width:110px">操作编码：</td>
            <td style="width:330px"><asp:Label ID="lblOpCode" runat="server" ></asp:Label></td>
            <td style="width:110px">操作名称：</td>
            <td style="width:330px"><asp:Label ID="lblOpName" runat="server" ></asp:Label></td>
        </tr>
        <tr>
            <td>备注：</td>
            <td colspan="3"><asp:Label ID="lblMemo" runat="server" 
                    Height="181px" Width="488px" ></asp:Label></td>
        </tr>
    </table>
    <table>
        <tr>
            <td><asp:Button runat="server" ID="btnDelete" Text="删除" OnClick="btnDelete_OnClick"/></td>
            <td><asp:Button runat="server" ID="Button3" Text="编辑" OnClick="btnEdit_OnClick"/></td>
        </tr>
    </table>
    
    </div>

</asp:Content>
