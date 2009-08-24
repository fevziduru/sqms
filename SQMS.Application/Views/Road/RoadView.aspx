<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/Main.Master" AutoEventWireup="true" CodeBehind="RoadView.aspx.cs" Inherits="SQMS.Application.Views.Road.RoadView" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div>
         <table width="100%">
        <tr>
            <td align="right"><a href="EmployeeList.aspx?p=employeelist">返回到列表</a></td>
        </tr>
        <tr>
            <td align="center">
                <fieldset>
                    <asp:Button Width="110" runat="server" ID="Button4" Text="新增" OnClick="btnNew_Click"/>&nbsp;&nbsp;
                    <asp:Button Width="110" runat="server" ID="Button3" Text="编辑" OnClick="btnEdit_Click"/>&nbsp;&nbsp;
                    <asp:Button Width="110" runat="server" ID="Button1" Text="删除" OnClick="btnDelete_OnClick"/>
                </fieldset>
            </td>
        </tr>
    </table>    
    <br />
        <br />
        <fieldset>
            <legend>路段基本信息</legend>
            <table style="width: 100%">
            <tr>
                <td style="width:110">路段名称：</td>
                <td><asp:Label ID="lblRoadName" runat="server" ></asp:Label></td>
                <td style="width:110">路段编码：</td>
                <td><asp:Label ID="lblRoadCode" runat="server" ></asp:Label></td>
            </tr>
                
                <tr>
                    <td>所属项目：</td>
                    <td colspan="3"><asp:Label runat="server" ID="lblProject"></asp:Label></td>
                </tr>
                <tr>
                    <td>路段类型：</td>
                    <td><asp:Label ID="lblRoadType" runat="server"></asp:Label></td>
                    <td>作业时间：</td>
                    <td><asp:Label ID="lblWorkTime" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <td>作业开始时间：</td>
                    <td><asp:Label ID="lblWorkBeginTime" runat="server"></asp:Label></td>
                    <td>作业结束时间：</td>
                    <td><asp:Label ID="lblWorkEndTime" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <td>工作人数：</td>
                    <td><asp:Label ID="lblWorkerNum" runat="server"></asp:Label></td>
                    <td>人均工作量：</td>
                    <td><asp:Label ID="lblAvgWorkAmount" runat="server"></asp:Label></td>
                </tr>
                <tr>
                <td>状态：</td>
                <td colspan="3"><asp:Label ID="lblIsvoid" runat="server"></asp:Label></td>                    
                </tr>
                <tr>
                    <td>备注：</td>
                    <td colspan="3"><asp:Label ID="lblMemo" runat="server" ></asp:Label></td>
                </tr>
            </table>
        </fieldset>
        
         <table width="100%">
        <tr>
            <td align="center">
                <fieldset>
                    <asp:Button Width="110" runat="server" ID="Button2" Text="新增" OnClick="btnNew_Click"/>&nbsp;&nbsp;
                    <asp:Button Width="110" runat="server" ID="Button5" Text="编辑" OnClick="btnEdit_Click"/>&nbsp;&nbsp;
                    <asp:Button Width="110" runat="server" ID="Button6" Text="删除" OnClick="btnDelete_OnClick"/>
                </fieldset>
            </td>
        </tr>
    </table>    
    <br />
    </div>
</asp:Content>
