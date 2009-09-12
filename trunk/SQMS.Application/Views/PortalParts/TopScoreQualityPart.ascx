<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TopScoreQualityPart.ascx.cs" Inherits="SQMS.Application.Views.PortalParts.TopScoreQualityPart" %>
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
                        <td style="width:20%" align="left">采集时间</td>
                        <td align="left">作业单位</td>
                        <td align="right">评分</td>
                        <td align="center">操作</td>
                </tr>
                <%
                foreach (DataRow item in dtPart.Rows)
                {
                        %>
                        <tr style="height:25px">
                                <td  align="left"><%=Convert.ToDateTime(item["CREATED"]).ToString("yyyy-MM-dd") %></td>
                                <td align="left"><a href="../Basedata/OrganizationView.aspx?p=orgview&id=<%=ConvertUtil.ToStringOrDefault(item["ORGID"]) %>">
                                <%=ConvertUtil.ToStringOrDefault(item["ORGNAME"])%></a></td>
                                <td align="right"><%=ConvertUtil.ToStringOrDefault(item["QUALITYLEVEL"]) %></td>
                                <td align="center"><a href="../Quality/QualityAppraisal.aspx?p=qualityappraisal&id=<%=item["QMID"] %>">质量评估</a></td>
                        </tr>
                        <%
                }
                %>
                  <tr>
                        <td colspan="4" valign="middle" align="right"><a href="../Quality/QualityAppraisalList.aspx?p=qalist">更多...</a></td>
                </tr>
                </table>
                <%
        }
         %>
</div>