<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/Main.Master" AutoEventWireup="true" CodeBehind="QualityAppraisal.aspx.cs" Inherits="SQMS.Application.Views.Quality.QualityAppraisal" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div>
    <table style="width:100%">
        <tr>
            <td align="right"><a href="QualityAppraisalList.aspx?p=qalist&id=<%=MPID %>">返回到列表</a></td>
        </tr>
        <tr>
            <td align="center">
                <fieldset>
                    <asp:Button runat="server" Width="110px" ID="Button5" Text="保存" OnClick="btnSave_Click"/>
                </fieldset>
            </td>
        </tr>
    </table>
    <br />
    
    <fieldset>
    <legend>质量控制信息</legend>
    <table style="width:100%">
        <tr>
                <td style="width:110px">质控编码：</td>
                <td style="width:330px"><asp:Label ID="lblQMCode" runat="server" ></asp:Label></td>
                <td style="width:110px">作业单位：</td>
                <td style="width:330px"><asp:Label ID="lblWorkUnit" runat="server" ></asp:Label></td>
        </tr>
        <tr>
                <td>负责人：</td>
                <td><asp:Label ID="lblChargePerson" runat="server" ></asp:Label></td>
                <td>应急处理责任人：</td>
                <td><asp:Label ID="lblEmergencyPerson" runat="server" ></asp:Label></td>
        </tr>
        <tr>
                <td>巡查人：</td>
                <td><asp:Label ID="lblCheckPerson" runat="server" ></asp:Label></td>
                <td>状态：</td>
                <td><asp:Label ID="lblStatus" runat="server" ></asp:Label></td>
        </tr>
        <tr>
                <td>采集点经度：</td>
                <td><asp:Label ID="lblLng" runat="server" ></asp:Label></td>
                <td>采集点纬度：</td>
                <td><asp:Label ID="lblLat" runat="server" ></asp:Label></td>
        </tr>
        <tr>
                <td>采集点图片：</td>
                <td colspan="3">
                        <iframe frameborder="0" style="border-color:#888;border-width:3;overflow:hidden" runat="server" id="imgQuality"></iframe>
                </td>
        </tr>
        <tr>
                <td>采集点视频：</td>
                <td colspan="3"><asp:LinkButton ID="lbVideo" runat="server"></asp:LinkButton></td>
        </tr>
        <tr>
                <td>质量评分：</td>
                <td colspan="3"><asp:TextBox ID="txtQualityLevel" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
                <td>类型：</td>
                <td colspan="3"><asp:Label ID="lblType" runat="server" ></asp:Label></td>
        </tr>
        
        <tr>
            <td>备注：</td>
            <td colspan="3"><asp:Label ID="lblMemo" runat="server" Height="181px" Width="488px" ></asp:Label></td>
        </tr>
    </table>
    </fieldset>
    
    <br />
    <table style="width:100%">
        <tr>
            <td align="center">
                <fieldset>
                    <asp:Button runat="server" Width="110px" ID="Button1" Text="保存" OnClick="btnSave_Click"/>
                </fieldset>
            </td>
        </tr>
    </table>
    
    </div>
</asp:Content>
