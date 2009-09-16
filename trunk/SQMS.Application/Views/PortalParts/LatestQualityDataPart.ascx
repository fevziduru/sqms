<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LatestQualityDataPart.ascx.cs" Inherits="SQMS.Application.Views.PortalParts.LatestQualityDataPart" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="EasyDev.Util" %>
<div style="width:100%;height:100%;font-size:x-small">

<%
        DataTable dtPart = this.ViewData.Tables[0];
        if (dtPart != null)
        {
                %>
                <div style="border:solid 1px #fefefe">
                <table cellpadding="0" cellspacing="0" border="0" style="width:100%;height:100%;font-size:x-small;">
                <tr style="height:25px;font-weight:bold;background-color:#C7E6F4">
                        <td style="width:20%;font-weight:bold">采集时间</td>
                        <td>作业单位</td>
                        <td>操作</td>
                </tr>
                <%
                foreach (DataRow item in dtPart.Rows)
                {
                        %>
                        <tr style="height:25px;">
                                <td><%=Convert.ToDateTime(item["CREATED"]).ToString("yyyy-MM-dd") %></td>
                                <td><a href="../Basedata/OrganizationView.aspx?p=orgview&id=<%=ConvertUtil.ToStringOrDefault(item["ORGID"]) %>">
                                <%=ConvertUtil.ToStringOrDefault(item["ORGNAME"])%></a></td>
                                <td><a href="../Quality/QualityAppraisal.aspx?p=qualityappraisal&id=<%=item["QMID"] %>">质量评估</a></td>
                        </tr>
                        <%
                }
                %>
                  <tr>
                        <td colspan="3" valign="middle" align="right"><a href="../Quality/QualityAppraisalList.aspx?p=qalist">更多...</a></td>
                </tr>
                </table>
                </div>
                <%
        }
         %>
</div>