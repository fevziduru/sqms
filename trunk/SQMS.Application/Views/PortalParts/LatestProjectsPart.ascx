<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LatestProjectsPart.ascx.cs" Inherits="SQMS.Application.Views.PortalParts.LatestProjectsPart" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="EasyDev.Util" %>

<div style="width:100%;height:100%">


<%
        DataTable dtPart = this.ViewData.Tables[0];
        if (dtPart != null)
        {
                %>
                <table cellpadding="0" cellspacing="0" style="width:100%;height:100%">                
                <tr style="height:25px">
                        <td style="width:20%">创建时间</td>
                        <td>项目名称</td>
                </tr>
                <%
                foreach (DataRow item in dtPart.Rows)
                {
                        %>
                        <tr style="height:25px">
                                <td><%=Convert.ToDateTime(item["CREATED"]).ToString("yyyy-MM-dd") %></td>
                                <td><a href="../Project/ProjectView.aspx?p=projectview&id=<%=ConvertUtil.ToStringOrDefault(item["PROJECTID"]) %>">
                                <%=ConvertUtil.ToStringOrDefault(item["PROJECTNAME"])%></a></td>
                        </tr>
                        <%
                }
                %>
                <tr>
                        <td colspan="2" valign="middle" align="right"><a href="../Project/ProjectList.aspx?p=projectlist">更多...</a></td>
                </tr>
                </table>
                <%
        }
         %>
</div>