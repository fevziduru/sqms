<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AnchorContent.aspx.cs"
        Inherits="SQMS.Application.Views.Quality.AnchorContent" %>

<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="EasyDev.Util" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
        <title></title>
        <!-- Dependencies -->
        <!-- Sam Skin CSS for TabView -->
        <link rel="stylesheet" type="text/css" href="../../Resources/Scripts/Controls/yui/build/assets/skins/sam/tabview.css" />

        <!-- JavaScript Dependencies for Tabview: -->
        <script type="text/javascript" src="../../Resources/Scripts/Controls/yui/build/yahoo-dom-event/yahoo-dom-event.js"></script>
        <script type="text/javascript" src="../../Resources/Scripts/Controls/yui/build/element/element-min.js"></script>

        <!-- Source file for TabView -->
        <script type="text/javascript" src="../../Resources/Scripts/Controls/yui/build/tabview/tabview-min.js"></script>  
        <style type="text/css">
        img.framed { 
                padding: 10px; 
                border: 2px solid #CCC; 
                background-color: #FFF; 
        } 
        </style>
</head>
<body  class="yui-skin-sam" style="background-color:#fff">
        <form id="form1" runat="server">
        <div style="background-color:#fff">
        <script type="text/javascript">
                var myTabs = new YAHOO.widget.TabView("qualitydata");  
        </script>
        <div id="qualitydata" class="yui-navset">
                <ul class="yui-nav">   
                         <li class="selected"><a href="#tab1"><em>图片数据</em></a></li>   
                         <li><a href="#tab2"><em>视频数据</em></a></li>
                </ul>
                <div class="yui-content">   
                         <div>
                         <!--图片列表-->
                        <asp:DataList ID="lstImage" runat="server" RepeatColumns="5" RepeatDirection="Horizontal" ShowFooter="False" ShowHeader="False">
                                <ItemTemplate>
                                <div style="width:100%;height:100%;text-align:center;vertical-align:middle">
                                <table cellpadding="5" cellspacing="3" style="width:100%" border="0">
                                        <tr>
                                                <td colspan="2" align="center" valign="absmiddle">
                                                        <a title="原始图片" target="_blank" href='<%#Eval("MATERIAL")%>'><img alt='点击查看原图' src='../Components/ImagePipe.aspx?filename=<%#Eval("MATERIAL") %>' class="framed" /></a>
                                                </td>
                                        </tr>
                                        <tr>
                                                <td align="right">采集时间：</td>
                                                <td style="width:200px"><%#Convert.ToDateTime(Eval("CREATED")).ToString("yyyy-MM-dd hh:mm:ss") %></td>
                                        </tr>
                                        <tr>
                                                <td align="right">作业单位：</td>
                                                <td style="width:200px"><%#Eval("ORGNAME") %></td>
                                        </tr>
                                        <tr>
                                                <td align="right">负责人：</td>
                                                <td style="width:200px"><%#Eval("CHARGEPERSON") %></td>
                                        </tr>
                                        <tr>
                                                <td align="right">采集点经度：</td>
                                                <td style="width:200px"><%#Eval("LONGITUDE")%></td>
                                        </tr>
                                        <tr>
                                                <td align="right">采集点纬度：</td>
                                                <td style="width:200px"><%#Eval("LATITUDE")%></td>
                                        </tr>
                                </table>
                                </div>
                                </ItemTemplate>
                        </asp:DataList>
                         </div>   
                         <div>
                         <!--视频列表-->
                        <asp:DataList ID="lstVideo" runat="server" RepeatColumns="5" RepeatDirection="Horizontal" ShowFooter="False" ShowHeader="False">
                                <ItemTemplate>
                                <table cellpadding="5" cellspacing="3" style="width:100%" border="0">
                                        <tr>
                                                <td colspan="2" align="center" valign="absmiddle">
                                                            <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" id="MapVideo" width="280"
                                                                     height="180" codebase=" http://fpdownload.macromedia.com/get/flashplayer/current/swflash.cab" data='<%#Eval("VIDEOURL") %>'>
                                                                    <param name="movie" value="../../Resources/Swf/SimpleVideoPlay.swf?file=<%#Eval("VIDEOURL") %>" />
                                                                    <param name="quality" value="high" />
                                                                    <param name="bgcolor" value="#869ca7" />                                                            
                                                                    <param name="allowScriptAccess" value="sameDomain" />
                                                                    <embed src="../../Resources/SimpleVideoPlay.swf?file=<%#Eval("VIDEOURL") %>"
                                                                        quality="high" bgcolor="#869ca7" width="250" height="180" name="MapVideo" align="middle"
                                                                        play="true" loop="false" quality="high" allowscriptaccess="sameDomain" type="application/x-shockwave-flash"
                                                                        pluginspage=" http://www.adobe.com/go/getflashplayer"></embed>
                                                                </object>
                                                </td>
                                        </tr>
                                      <%--  <tr>
                                                <td colspan="2" style="text-align:right;"><a target="_blank" href='<%#Eval("MATERIAL")%>'>原始图片</a></td>
                                        </tr>--%>
                                        <tr>
                                                <td align="right">采集时间：</td>
                                                <td style="width:200px"><%#Convert.ToDateTime(Eval("CREATED")).ToString("yyyy-MM-dd hh:mm:ss") %></td>
                                        </tr>
                                        <tr>
                                                <td align="right">作业单位：</td>
                                                <td style="width:200px"><%#Eval("ORGNAME") %></td>
                                        </tr>
                                        <tr>
                                                <td align="right">负责人：</td>
                                                <td style="width:200px"><%#Eval("CHARGEPERSON") %></td>
                                        </tr>
                                        <tr>
                                                <td align="right">采集点经度：</td>
                                                <td style="width:200px"><%#Eval("LONGITUDE")%></td>
                                        </tr>
                                        <tr>
                                                <td align="right">采集点纬度：</td>
                                                <td style="width:200px"><%#Eval("LATITUDE")%></td>
                                        </tr>
                                </table>
                                </ItemTemplate>
                        </asp:DataList>
                         </div>
                </div>
        </div>
        </div>
        </form>
</body>
</html>
