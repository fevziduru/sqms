<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MonitorPointScoreKPIPart.ascx.cs" Inherits="SQMS.Application.Views.PortalParts.MonitorPointScoreKPIPart" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="EasyDev.Util" %>
<!-- Dependencies -->
<!-- Sam Skin CSS for TabView -->
<link rel="stylesheet" type="text/css" href="../../Resources/Scripts/Controls/yui/build/assets/skins/sam/tabview.css" />
<!-- JavaScript Dependencies for Tabview: -->

<script type="text/javascript" src="../../Resources/Scripts/Controls/yui/build/yahoo-dom-event/yahoo-dom-event.js"></script>

<script type="text/javascript" src="../../Resources/Scripts/Controls/yui/build/element/element-min.js"></script>

<!-- Source file for TabView -->

<script type="text/javascript" src="../../Resources/Scripts/Controls/yui/build/tabview/tabview-min.js"></script>


<div class="yui-skin-sam">
<script type="text/javascript">
                var myTabs = new YAHOO.widget.TabView("mpdata");  
        </script>

        <div id="mpdata" class="yui-navset">
                <ul class="yui-nav">
                        <li class="selected"><a href="#tab1"><em>周趋势</em></a></li>
                        <li><a href="#tab2"><em>月趋势</em></a></li>
                        <li><a href="#tab3"><em>年趋势</em></a></li>
                </ul>
                <div class="yui-content">
                        <div>
                        <%
                                DataTable currDt = DataSetUtil.GetDataTableFromDataSet(this.ViewData, "WeekTrend");
                                
                                 %>
                                <!--周趋势-->
                                <div  style="border:solid 1px #fefefe;font-size:x-small">
                                <table cellpadding="0" cellspacing="0" style="width:100%">
                                <tr style="height:25px;font-weight:bold;background-color:#C7E6F4;font-size:x-small">
                                        <td align="left" valign="middle">监控点</td>
                                        <td align="left" valign="middle">负责人</td>
                                        <td style="width:60px" align="center">趋势</td>
                                </tr>
                                <%
                                        foreach (DataRow row in currDt.Rows)
                                        {
                                                %>
                                                <tr style="font-size:x-small;height:25">
                                                        <td align="left" valign="middle"><a href='../Quality/MonitorPointView.aspx?p=mpview&id=<%=ConvertUtil.ToStringOrDefault(row["MPID"]) %>'><%=ConvertUtil.ToStringOrDefault(row["MPNAME"]) %></a></td>
                                                        <td align="left" valign="middle"><a href="../Basedata/EmployeeView.aspx?P=empview&id=<%=ConvertUtil.ToStringOrDefault(row["EMPID"]) %>"><%=ConvertUtil.ToStringOrDefault(row["CHARGEPERSON"]) %></a></td>
                                                        <td style="width:60px" align="center" valign="middle">
                                                                <%
                                                                        if (ConvertUtil.ToDecimal(row["trend"]) > 0)
                                                                        { 
                                                                                %>
                                                                                <img alt="" src="../../Resources/Images/app/portal_kpi_up.gif" />
                                                                                <%
                                                                        }
                                                                        else if (ConvertUtil.ToDecimal(row["trend"]) < 0)
                                                                        { 
                                                                                %>
                                                                                <img alt="" src="../../Resources/Images/app/portal_kpi_down.gif" />
                                                                                <%
                                                                        }
                                                                        else
                                                                        {
                                                                                    %>
                                                                                    <span style="font-weight:bolder;color:Gray">－</span>
                                                                                    <%
                                                                        }                                                        
                                                 %>
                                                                
                                                                
                                                        </td>
                                                </tr>
                                                <%
                                        }                                        
                                         %>
                                        
                                </table>
                                </div>
                        </div>
                        <div>
                                <!--月趋势-->
                                <div  style="border:solid 1px #fefefe;font-size:x-small">
                                <table cellpadding="0" cellspacing="0" style="width:100%">
                                <tr style="height:25px;font-weight:bold;background-color:#C7E6F4;font-size:x-small">
                                        <td align="left" valign="middle">监控点</td>
                                        <td align="left" valign="middle">负责人</td>
                                        <td style="width:60px" align="center">趋势</td>
                                </tr>
                                <%
                                        currDt = DataSetUtil.GetDataTableFromDataSet(this.ViewData, "MonthTrend");
                                        foreach (DataRow row in currDt.Rows)
                                        {
                                                %>
                                                <tr style="font-size:x-small;height:25">
                                                        <td align="left" valign="middle"><a href='../Quality/MonitorPointView.aspx?p=mpview&id=<%=ConvertUtil.ToStringOrDefault(row["MPID"]) %>'><%=ConvertUtil.ToStringOrDefault(row["MPNAME"]) %></a></td>
                                                        <td align="left" valign="middle"><a href="../Basedata/EmployeeView.aspx?P=empview&id=<%=ConvertUtil.ToStringOrDefault(row["EMPID"]) %>"><%=ConvertUtil.ToStringOrDefault(row["CHARGEPERSON"]) %></a></td>
                                                        <td style="width:60px" align="center" valign="middle">
                                                                <%
                                                                        if (ConvertUtil.ToDecimal(row["trend"]) > 0)
                                                                        { 
                                                                                %>
                                                                                <img alt="" src="../../Resources/Images/app/portal_kpi_up.gif" />
                                                                                <%
                                                                        }
                                                                        else if (ConvertUtil.ToDecimal(row["trend"]) < 0)
                                                                        { 
                                                                                %>
                                                                                <img alt="" src="../../Resources/Images/app/portal_kpi_down.gif" />
                                                                                <%
                                                                        }
                                                                        else
                                                                        {
                                                                                    %>
                                                                                    <span style="font-weight:bolder;color:Gray">－</span>
                                                                                    <%
                                                                        }                                                        
                                                 %>
                                                                
                                                                
                                                        </td>
                                                </tr>
                                                <%
                                        }                                        
                                         %>
                                        
                                </table>
                                </div>
                        </div>
                        <div>
                                <!--年趋势-->
                                <div style="border:solid 1px #fefefe;font-size:x-small">
                                <table cellpadding="0" cellspacing="0" style="width:100%">
                                <tr style="height:25px;font-weight:bold;background-color:#C7E6F4;font-size:x-small">
                                        <td align="left" valign="middle">监控点</td>
                                        <td align="left" valign="middle">负责人</td>
                                        <td style="width:60px" align="center">趋势</td>
                                </tr>
                                <%
                                        currDt = DataSetUtil.GetDataTableFromDataSet(this.ViewData, "YearTrend");
                                        foreach (DataRow row in currDt.Rows)
                                        {
                                                %>
                                                <tr style="font-size:x-small;height:25">
                                                        <td align="left" valign="middle"><a href='../Quality/MonitorPointView.aspx?p=mpview&id=<%=ConvertUtil.ToStringOrDefault(row["MPID"]) %>'><%=ConvertUtil.ToStringOrDefault(row["MPNAME"]) %></a></td>
                                                        <td align="left" valign="middle"><a href="../Basedata/EmployeeView.aspx?P=empview&id=<%=ConvertUtil.ToStringOrDefault(row["EMPID"]) %>"><%=ConvertUtil.ToStringOrDefault(row["CHARGEPERSON"]) %></a></td>
                                                        <td style="width:60px" align="center" valign="middle">
                                                                <%
                                                                        if (ConvertUtil.ToDecimal(row["trend"]) > 0)
                                                                        { 
                                                                                %>
                                                                                <img valign="absmiddle" alt="" src="../../Resources/Images/app/portal_kpi_up.gif" />
                                                                                <%
                                                                        }
                                                                        else if (ConvertUtil.ToDecimal(row["trend"]) < 0)
                                                                        { 
                                                                                %>
                                                                                <img valign="absmiddle" alt="" src="../../Resources/Images/app/portal_kpi_down.gif" />
                                                                                <%
                                                                        }
                                                                        else
                                                                        {
                                                                                    %>
                                                                                    <span style="font-weight:bolder;color:Gray">－</span>
                                                                                    <%
                                                                        }                                                        
                                                 %>
                                                                
                                                                
                                                        </td>
                                                </tr>
                                                <%
                                        }                                        
                                         %>
                                        
                                </table>
                                </div>
                        </div>
                </div>
        </div>
        <div style="text-align: right; margin: 5 5">
                <a href="#">更多</a>
        </div>
</div>