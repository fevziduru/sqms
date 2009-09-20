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
                        <input type="button" runat="server" style="width:110px" ID="btnViewMPTop"  value="查看位置"/>&nbsp;&nbsp;
                        <asp:Button runat="server" Width="110px" ID="Button7" Text="质量评估" OnClick="btnQuality_OnClick"/>&nbsp;&nbsp;
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
            <td>重要性：</td>
            <td><asp:Label ID="lblImportance" runat="server" ></asp:Label></td>
        </tr>
          <tr>
            <td>所属路段：</td>
            <td><asp:Label ID="lblRoad" runat="server" ></asp:Label></td>
            <td>监控时间段：</td>
            <td><asp:Label ID="lblTimeSchema" runat="server" ></asp:Label></td>
        </tr>
         <tr>
                <td>序号：</td>
                <td><asp:Label ID="lblOrderInRoad"  Width="210" runat="server" ></asp:Label></td>  
            <%--<td>经度：</td>
            <td><asp:Label ID="lblLng"  Width="210" runat="server" ></asp:Label></td>  
            <td>纬度：</td>
            <td><asp:Label ID="lblLat" Width="210" runat="server" ></asp:Label></td>--%>
        </tr>
        <tr>
            <td>浮动距离：</td>
            <td><asp:Label ID="lblFloatDist"  Width="210" runat="server" ></asp:Label></td>              
            <td>缩放级别：</td>
            <td><asp:Label ID="lblMapLevel"  Width="210" runat="server" ></asp:Label></td>              
        </tr>
           <tr>
            <td>状态：</td>
            <td colspan="3"><asp:Label ID="lblIsvoid" runat="server" ></asp:Label></td>
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
                        <input type="button" runat="server" style="width:110px" ID="btnViewMPBottom"  value="查看位置"/>&nbsp;&nbsp;
                        <asp:Button runat="server" Width="110px" ID="LinkButton1" Text="质量评估" OnClick="btnQuality_OnClick"/>&nbsp;&nbsp;
                        <asp:Button runat="server" Width="110px" ID="Button3" Text="新增" OnClick="btnNew_OnClick"/>&nbsp;&nbsp;
                        <asp:Button runat="server" Width="110px" ID="Button4" Text="编辑" OnClick="btnEdit_OnClick"/>&nbsp;&nbsp;
                        <asp:Button runat="server" Width="110px" ID="Button6" Text="删除" OnClick="btnDelete_OnClick"/>
                </fieldset>
            </td>
        </tr>
    </table>
    
    </div>  
</asp:Content>
