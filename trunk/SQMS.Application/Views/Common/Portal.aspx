<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/Main.Master" AutoEventWireup="true" CodeBehind="Portal.aspx.cs" Inherits="SQMS.Application.Views.Common.Portal" %>
<%@ Register src="../PortalParts/LatestQualityDataPart.ascx" tagname="LatestQualityDataPart" tagprefix="uc1" %>
<%@ Register src="../PortalParts/LatestProjectsPart.ascx" tagname="LatestProjectsPart" tagprefix="uc2" %>
<%@ Register src="../PortalParts/EmployeeManagementPart.ascx" tagname="EmployeeManagementPart" tagprefix="uc3" %>
<%@ Register src="../PortalParts/TopScoreQualityPart.ascx" tagname="TopScoreQualityPart" tagprefix="uc4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<h2>这里是应用程序主入口页面</h2>
<table cellpadding="0" cellspacing="0" border="0" style="width:100%;height:100%">
<tr>
        <td align="center" valign="top">
                <uc1:LatestQualityDataPart ID="LatestQualityDataPart1" runat="server" />
        </td>
        <td align="center" valign="top">
                <uc2:LatestProjectsPart ID="LatestProjectsPart1" runat="server" />
        </td>
</tr>
<tr>
        <td align="center" valign="top">
                <uc3:EmployeeManagementPart ID="EmployeeManagementPart1" runat="server" />
        </td>
        <td align="center" valign="top">
                <uc4:TopScoreQualityPart ID="TopScoreQualityPart1" runat="server" />
        </td>
</tr>
</table>
</asp:Content>
