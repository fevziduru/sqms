<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/Main.Master" AutoEventWireup="true" CodeBehind="Portal.aspx.cs" Inherits="SQMS.Application.Views.Common.Portal" %>
<%@ Register src="../PortalParts/LatestQualityDataPart.ascx" tagname="LatestQualityDataPart" tagprefix="uc1" %>
<%@ Register src="../PortalParts/LatestProjectsPart.ascx" tagname="LatestProjectsPart" tagprefix="uc2" %>
<%@ Register src="../PortalParts/EmployeeManagementPart.ascx" tagname="EmployeeManagementPart" tagprefix="uc3" %>
<%@ Register src="../PortalParts/TopScoreQualityPart.ascx" tagname="TopScoreQualityPart" tagprefix="uc4" %>
<%@ Register src="../PortalParts/MPScoreTrendPart.ascx" tagname="MPScoreTrendPart" tagprefix="uc5" %>
<%@ Register src="../PortalParts/MPScoreTrandPart2.ascx" tagname="MPScoreTrandPart2" tagprefix="uc6" %>
<%@ Register src="../PortalParts/MonitorPointScoreKPIPart.ascx" tagname="MonitorPointScoreKPIPart" tagprefix="uc7" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

        <!-- Dependencies -->
        <script type="text/javascript" src="../../Resources/Scripts/Controls/yui/build/yahoo-dom-event/yahoo-dom-event.js"></script>
        <script type="text/javascript" src="../../Resources/Scripts/Controls/yui/build/element/element-min.js"></script>
        <script type="text/javascript" src="../../Resources/Scripts/Controls/yui/build/datasource/datasource-min.js"></script>
        <script type="text/javascript" src="../../Resources/Scripts/Controls/yui/build/event/event-min.js"></script>                
        <script type="text/javascript" src="../../Resources/Scripts/Controls/yui/build/json/json-min.js"></script>
        <!-- Source files -->
        <script type="text/javascript" src="../../Resources/Scripts/Controls/yui/build/charts/charts-min.js"></script>
        
        <!-- Dependencies -->
        

        <!-- Source file for TabView -->
        <script type="text/javascript" src="../../Resources/Scripts/Controls/yui/build/tabview/tabview-min.js"></script>  
<script type="text/javascript">
        function getOs() {
                var OsObject = "";
                if (navigator.userAgent.indexOf("MSIE") > 0) {
                        return "MSIE";
                }
                if (isFirefox = navigator.userAgent.indexOf("Firefox") > 0) {
                        return "Firefox";
                }
                if (isSafari = navigator.userAgent.indexOf("Safari") > 0) {
                        return "Safari";
                }
                if (isCamino = navigator.userAgent.indexOf("Camino") > 0) {
                        return "Camino";
                }
                if (isMozilla = navigator.userAgent.indexOf("Gecko/") > 0) {
                        return "Gecko";
                }

        }
        window.onload = function() {
        if (getOs() === "MSIE") {                        
                        document.getElementById("projecttrend").style.display = "none";
                }
        }
</script>
<table cellpadding="3" cellspacing="5" border="0" style="width:100%;font-size:x-small">
<tr>
        <td valign="top" style="width:55%">
        <div>
          <fieldset style="margin: 8 5">
                <legend>监控点质量走势</legend>
                <uc6:MPScoreTrandPart2 ID="MPScoreTrandPart21" runat="server" />
                </fieldset>
        
          <fieldset style="margin: 8 5">
                <legend>最新未评分的质量信息</legend>
                        <uc1:LatestQualityDataPart ID="LatestQualityDataPart1" runat="server" />
                </fieldset>
        </div>
        </td> 
        
        <td  align="left" valign="top" style="width:45%">
        <div>
        
        <fieldset style="margin:8 5">
                <legend>监控点质量趋势</legend>
                <uc7:MonitorPointScoreKPIPart ID="MonitorPointScoreKPIPart1" runat="server" />
        </fieldset>
         
                  <fieldset id="projecttrend"  style="margin: 8 5">
                <legend>项目质量走势</legend>
                <uc5:MPScoreTrendPart ID="MPScoreTrendPart1" runat="server" />
                </fieldset>
        <fieldset style="margin: 8 5">        
                <legend>质控数据评分前五名</legend>
                <uc4:TopScoreQualityPart ID="TopScoreQualityPart1" runat="server" />
                </fieldset>
               
                <fieldset style="margin: 8 5">
                <legend>最新项目信息</legend>
                        <uc2:LatestProjectsPart ID="LatestProjectsPart1" runat="server" />
                </fieldset>
                
                 <fieldset style="margin: 8 5">
                <legend>职员及其角色账号快速管理</legend>
                        <uc3:EmployeeManagementPart ID="EmployeeManagementPart1" runat="server" />
                </fieldset>
                
                
        </div>
       
        </td>
     
      
        </tr>
</table>
</asp:Content>
