<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/Main.Master" AutoEventWireup="true" CodeBehind="OperationView.aspx.cs" Inherits="SQMS.Application.Views.Basedata.OperationView" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div>
     <table style="width:100%">
     <tr>
            <td align="right"><a href="OperationList.aspx?p=operationlist">返回到列表</a></td>
        </tr>
        <tr>
            <td align="center">
                <fieldset>
                <asp:Button runat="server" ID="Button4" Width="110px"  Text="新增" OnClick="btnNew_OnClick"/>&nbsp;&nbsp;
                <asp:Button runat="server" ID="Button2" Width="110px"  Text="编辑" OnClick="btnEdit_OnClick"/>&nbsp;&nbsp;
                <asp:Button runat="server" ID="Button1" Width="110px"  Text="删除" OnClick="btnDelete_OnClick"/>
                </fieldset>
            </td>
        </tr>
    </table>
    <br />
    
    <fieldset>
    <legend>操作基本信息</legend>
    <table style="width:100%">
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
    </fieldset>    
    <br />
    
    <table style="width:100%">
        <tr>
            <td align="center">
                <fieldset>
                <asp:Button runat="server" Width="110px"  ID="Button3" Text="新增" OnClick="btnNew_OnClick"/>&nbsp;&nbsp;
                <asp:Button runat="server" Width="110px"  ID="Button5" Text="编辑" OnClick="btnEdit_OnClick"/>&nbsp;&nbsp;
                <asp:Button runat="server" Width="110px" ID="Button6" Text="删除" OnClick="btnDelete_OnClick"/>
                </fieldset>
            </td>
        </tr>
    </table>
    
    </div>

</asp:Content>
