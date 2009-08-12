<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/Main.Master" AutoEventWireup="true" CodeBehind="ResourceView.aspx.cs" Inherits="SQMS.Application.Views.Basedata.ResourceView" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div>
    <table style="width:100%">
        <tr>
            <td align="right"><a href="ResourceList.aspx?p=reslist">返回到列表</a></td>
        </tr>
        <tr>
            <td align="center">
                <fieldset>
                    <asp:Button runat="server" Width="110px" ID="Button2" Text="编辑" OnClick="btnEdit_OnClick"/>&nbsp;&nbsp;
                    <asp:Button runat="server" Width="110px" ID="btnInactiveTop" Text="禁用" OnClick="btnDelete_OnClick"/>&nbsp;&nbsp;
                    <asp:Button runat="server" Width="110px" ID="btnActiveTop" Text="启用" OnClick="btnActive_OnClick"/>
                </fieldset>
            </td>
        </tr>
    </table>
    <br />
    
    <fieldset>
    <legend>资源基本信息</legend>
    <table style="width:100%">
        <tr>
            <td style="width:110px">资源名称：</td>
            <td style="width:330px"><asp:Label ID="lblResName" runat="server" ></asp:Label></td>
            <td style="width:110px">资源编码：</td>
            <td style="width:330px"><asp:Label ID="lblResCode" runat="server" ></asp:Label></td>            
        </tr>
        <tr>
            <td>资源标识：</td>
            <td><asp:Label ID="lblResIdentity" runat="server" ></asp:Label></td>
            <td>资源路径：</td>
            <td><asp:Label ID="lblViewName" runat="server" ></asp:Label></td>
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
                    <asp:Button runat="server" Width="110px" ID="btnInactiveBottom" Text="编辑" OnClick="btnEdit_OnClick"/>&nbsp;&nbsp;
                    <asp:Button runat="server" Width="110px" ID="Button3" Text="禁用" OnClick="btnDelete_OnClick"/>&nbsp;&nbsp;                    
                    <asp:Button runat="server" Width="110px" ID="btnActiveBottom" Text="启用" OnClick="btnActive_OnClick"/>
                </fieldset>
            </td>
        </tr>
    </table>
    
    </div>
</asp:Content>
