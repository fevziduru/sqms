<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/Main.Master" AutoEventWireup="true" CodeBehind="MonitorPointView.aspx.cs" Inherits="SQMS.Application.Views.Quality.MonitorPointView" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div>
      <table style="width:100%">
        <tr>
            <td align="right"><a href="MonitorPointList.aspx?p=mplist">返回到列表</a></td>
        </tr>
        <tr>
            <td align="center">
                <fieldset>
                    <asp:Button runat="server" Width="110px" ID="Button5" Text="新增" OnClick="btnNew_OnClick"/>&nbsp;&nbsp;
                    <asp:Button runat="server" Width="110px" ID="Button2" Text="编辑" OnClick="btnEdit_OnClick"/>&nbsp;&nbsp;
                    <asp:Button runat="server" Width="110px" ID="Button1" Text="删除" OnClick="btnDelete_OnClick"/>
                </fieldset>
            </td>
        </tr>
    </table>
    <br />
    
    <fieldset>
    <legend>监控点基本信息</legend>    
    <table style="width:100%">
        <tr>
            <td style="width:110px">监控点名称：</td>
            <td style="width:330px"><asp:Label ID="lblMPName" runat="server" ></asp:Label></td>
            <td style="width:110px">监控点编码：</td>
            <td style="width:330px"><asp:Label ID="lblMPCode" runat="server" ></asp:Label></td>
        </tr>
        
          <tr>
            <td>所属路段：</td>
            <td><asp:Label ID="lblRoad" runat="server" ></asp:Label></td>
            <td>监控时间段：</td>
            <td><asp:Label ID="lblTimeSchema" runat="server" ></asp:Label></td>
        </tr>
         <tr>
            <td>经度：</td>
            <td><asp:Label ID="lblLng"  Width="210" runat="server" ></asp:Label></td>  
            <td>纬度：</td>
            <td><asp:Label ID="lblLat" Width="210" runat="server" ></asp:Label></td>
        </tr>
        <tr>
            <td>备注：</td>
            <td colspan="3"><asp:Label ID="lblMemo" Width="210" runat="server" ></asp:Label></td>
        </tr>
    </table>
    </fieldset>
    <br />
      <table style="width:100%">
        <tr>
            <td align="center">
                <fieldset>
                    <asp:Button runat="server" Width="110px" ID="Button3" Text="新增" OnClick="btnNew_OnClick"/>
                    <asp:Button runat="server" Width="110px" ID="Button4" Text="编辑" OnClick="btnEdit_OnClick"/>&nbsp;&nbsp;
                    <asp:Button runat="server" Width="110px" ID="Button6" Text="删除" OnClick="btnDelete_OnClick"/>
                </fieldset>
            </td>
        </tr>
    </table>
    
    </div>  
</asp:Content>
