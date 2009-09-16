<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/Main.Master" AutoEventWireup="true" CodeBehind="Portal.aspx.cs" Inherits="SQMS.Application.Views.Common.Portal" %>
<%@ Register src="../PortalParts/LatestQualityDataPart.ascx" tagname="LatestQualityDataPart" tagprefix="uc1" %>
<%@ Register src="../PortalParts/LatestProjectsPart.ascx" tagname="LatestProjectsPart" tagprefix="uc2" %>
<%@ Register src="../PortalParts/EmployeeManagementPart.ascx" tagname="EmployeeManagementPart" tagprefix="uc3" %>
<%@ Register src="../PortalParts/TopScoreQualityPart.ascx" tagname="TopScoreQualityPart" tagprefix="uc4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<table cellpadding="5" cellspacing="5" border="0" style="width:100%;font-size:x-small">
<tr>
        <td align="center" valign="top" style="width:50%">
                <fieldset>
                <legend>最新未评分的质量信息</legend>
                        <uc1:LatestQualityDataPart ID="LatestQualityDataPart1" runat="server" />
                </fieldset>
        </td>
        <td align="center" valign="top" style="width:50%">
                <fieldset>
                <legend>最新项目信息</legend>
                        <uc2:LatestProjectsPart ID="LatestProjectsPart1" runat="server" />
                </fieldset>
        </td>
</tr>
<tr>
        <td align="center" valign="top" style="width:50%">
                <fieldset>
                <legend>职员及其角色账号快速管理</legend>
                        <uc3:EmployeeManagementPart ID="EmployeeManagementPart1" runat="server" />
                </fieldset>
        </td>
        <td align="center" valign="top" style="width:50%">
                <fieldset>
                <legend>质控数据评分前五名</legend>
                <uc4:TopScoreQualityPart ID="TopScoreQualityPart1" runat="server" />
                </fieldset>
        </td>
</tr>
</table>
</asp:Content>
