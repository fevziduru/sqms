<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/Main.Master" AutoEventWireup="true" CodeBehind="EquipmentView.aspx.cs" Inherits="SQMS.Application.Views.Basedata.EquipmentView" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div>
    <table style="width:100%">
        <tr>
            <td align="right"><a href="EquipmentList.aspx?p=equlist">返回到列表</a></td>
        </tr>
        <tr>
            <td align="center">
                <fieldset>
                    <asp:Button runat="server" Width="110px" ID="Button5" Text="新增" OnClick="btnNew_OnClick"/>
                    <asp:Button runat="server" Width="110px" ID="Button2" Text="编辑" OnClick="btnEdit_OnClick"/>&nbsp;&nbsp;
                    <asp:Button runat="server" Width="110px" ID="Button1" Text="删除" OnClick="btnDelete_OnClick"/>
                </fieldset>
            </td>
        </tr>
    </table>
    <br />
    
    <fieldset>
    <legend>设备基本信息</legend>
    <table style="width:100%">
        <tr>
            <td style="width:110px">设备编码：</td>
            <td style="width:330px"><asp:Label ID="lblEquCode" runat="server" ></asp:Label></td>
            <td style="width:110px">设备名称：</td>
            <td style="width:330px"><asp:Label ID="lblEquName" runat="server" ></asp:Label></td>
        </tr>
        <tr>
            <td>设备标识：</td>
            <td colspan="3"><asp:Label ID="lblEquIdentify" runat="server" ></asp:Label></td>
        </tr>
        <tr>
            <td>状态：</td>
            <td colspan="3"><asp:Label ID="lblIsvoid" runat="server" ></asp:Label></td>
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
                    <asp:Button runat="server" Width="110px" ID="Button6" Text="新增" OnClick="btnNew_OnClick"/>
                    <asp:Button runat="server" Width="110px" ID="Button4" Text="编辑" OnClick="btnEdit_OnClick"/>&nbsp;&nbsp;
                    <asp:Button runat="server" Width="110px" ID="Button3" Text="删除" OnClick="btnDelete_OnClick"/>&nbsp;&nbsp;                    
                </fieldset>
            </td>
        </tr>
    </table>
    
    </div>

</asp:Content>
