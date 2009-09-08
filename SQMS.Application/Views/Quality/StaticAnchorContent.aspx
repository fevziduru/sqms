<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StaticAnchorContent.aspx.cs"
        Inherits="SQMS.Application.Views.Quality.StaticAnchorContent" %>

<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="EasyDev.Util" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
        <title></title>
</head>
<body>
        <form id="form1" runat="server">
        <div>
                <asp:DataList ID="lstImage" runat="server" RepeatColumns="5" RepeatDirection="Horizontal" ShowFooter="False" ShowHeader="False">
                        <ItemTemplate>
                        <table cellpadding="5" cellspacing="3" style="width:100%" border="0">
                                <tr>
                                        <td colspan="2"><iframe frameborder="0" src='../Components/ImagePipe.aspx?filename=<%#Eval("MATERIAL") %>'></iframe></td>
                                </tr>
                                <tr>
                                        <td colspan="2" style="text-align:right;"><a target="_blank" href='<%#Eval("MATERIAL")%>'>原始图片</a></td>
                                </tr>
                                <tr>
                                        <td>采集时间：</td>
                                        <td style="width:200px"><%#Convert.ToDateTime(Eval("CREATED")).ToString("yyyy-MM-dd hh:mm:ss") %></td>
                                </tr>
                                <tr>
                                        <td>作业单位：</td>
                                        <td style="width:200px"><%#Eval("ORGNAME") %></td>
                                </tr>
                                <tr>
                                        <td>负责人：</td>
                                        <td style="width:200px"><%#Eval("CHARGEPERSON") %></td>
                                </tr>
                                <tr>
                                        <td>采集点经度：</td>
                                        <td style="width:200px"><%#Eval("LONGITUDE")%></td>
                                </tr>
                                <tr>
                                        <td>采集点纬度：</td>
                                        <td style="width:200px"><%#Eval("LATITUDE")%></td>
                                </tr>
                        </table>
                        </ItemTemplate>
                </asp:DataList>
                
                <hr /><br />
                <asp:DataList ID="lstVideo" runat="server" RepeatColumns="5" RepeatDirection="Horizontal" ShowFooter="False" ShowHeader="False">
                        <ItemTemplate>
                        <table cellpadding="5" cellspacing="3" style="width:100%" border="0">
                                <tr>
                                        <td colspan="2">
                                                    <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" id="MapVideo" width="280"
                                                             height="180" codebase=" http://fpdownload.macromedia.com/get/flashplayer/current/swflash.cab" data='<%#Eval("VIDEOURL") %>'>
                                                            <param name="movie" value="../../Resources/SimpleVideoPlay.swf?file=<%#Eval("VIDEOURL") %>" />
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
                                        <td>采集时间：</td>
                                        <td style="width:200px"><%#Convert.ToDateTime(Eval("CREATED")).ToString("yyyy-MM-dd hh:mm:ss") %></td>
                                </tr>
                                <tr>
                                        <td>作业单位：</td>
                                        <td style="width:200px"><%#Eval("ORGNAME") %></td>
                                </tr>
                                <tr>
                                        <td>负责人：</td>
                                        <td style="width:200px"><%#Eval("CHARGEPERSON") %></td>
                                </tr>
                                <tr>
                                        <td>采集点经度：</td>
                                        <td style="width:200px"><%#Eval("LONGITUDE")%></td>
                                </tr>
                                <tr>
                                        <td>采集点纬度：</td>
                                        <td style="width:200px"><%#Eval("LATITUDE")%></td>
                                </tr>
                        </table>
                        </ItemTemplate>
                </asp:DataList>
                
           <%--     <table style="width: 100%">
                        <%
                                DataTable dtQuality = DataSetUtil.GetDataTableFromDataSet(this.ViewData, srv.BOName);
                                if (dtQuality != null)
                                {
                                        //输出图片
                                        for (int i = 0; i < dtQuality.Rows.Count; i++)
                                        {
                                                if (i % 5 == 0)
                                                {
                                                        if (i > 0)
                                                        { 
                                                                %>
                                                                </tr>
                                                                <%
                                                        }
                                                        %>                                                        
                                                        <tr>
                                                        <td>
                                                                <!--内容区域-->
                                                                <table>
                                                                        <tr>
                                                                        <%
                                                                                string imageFile = 
                                                                         %>
                                                                                <td><iframe frameborder="0" src="../Components/ImagePipe.aspx?filename=<%= %>"></iframe></td>
                                                                        </tr>
                                                                </table>
                                                        </td>
                                                        <%
                                                }
                                                else
                                                {
                                                                %>
                                                                <td>
                                                                        <!--内容区域-->
                                                                        <table>
                                                                                <tr>
                                                                                        <td></td>
                                                                                </tr>
                                                                        </table>    
                                                                </td>
                                                                <%
                                                                if (i + 1 == dtQuality.Rows.Count)
                                                                { 
                                                                        %></tr><%
                                                                }
                                                }
                                        }
                                }
                        %>
                </table>--%>
        </div>
        </form>
</body>
</html>
