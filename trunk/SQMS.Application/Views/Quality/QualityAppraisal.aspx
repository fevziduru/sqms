<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/Main.Master" AutoEventWireup="true" CodeBehind="QualityAppraisal.aspx.cs" Inherits="SQMS.Application.Views.Quality.QualityAppraisal" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <style type="text/css">
        img.framed { 
                padding: 10px; 
                border: 2px solid #CCC; 
                background-color: #FFF; 
        } 
        </style>
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
                <td>采集点位置：</td>
                <td><a runat="server" id="loc"
                        href='' target="_blank">
                                (<asp:Label ID="lblLng" runat="server" ></asp:Label>,<asp:Label ID="lblLat" runat="server" ></asp:Label>)</a>
                      </td>
                <td></td>
                <td>                
                </td>
        </tr>
        <tr>
                <td style="width:210px">采集点图片：</td>
                <td colspan="3">
                        <span>
                        <img alt="点击查看原图" runat="server" style="width:250;height:160" id="imgQuality"  class="framed" />
                        <%--<iframe frameborder="0" runat="server" id="imgQuality"></iframe>--%>
                        
                        </span>
                </td>
        </tr>
        <tr>
                <td>采集点视频：</td>
                <td colspan="3">
                 <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" id="MapVideo" width="280"
                     height="180" codebase=" http://fpdownload.macromedia.com/get/flashplayer/current/swflash.cab" data='<%#Eval("VIDEOURL") %>'>
                    <param name="movie" value="../../Resources/SimpleVideoPlay.swf?file=<%=videoUrl%>" />
                    <param name="quality" value="high" />
                    <param name="bgcolor" value="#869ca7" />                                                            
                    <param name="allowScriptAccess" value="sameDomain" />
                    <embed src="../../Resources/SimpleVideoPlay.swf?file=<%=videoUrl%>"
                        quality="high" bgcolor="#869ca7" width="250" height="180" name="MapVideo" align="middle"
                        play="true" loop="false" quality="high" allowscriptaccess="sameDomain" type="application/x-shockwave-flash"
                        pluginspage=" http://www.adobe.com/go/getflashplayer"></embed>
                </object><br />
                        <asp:HyperLink ID="hlVideo" runat="server"></asp:HyperLink>
                </td>
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
    <script type="text/javascript">
            document.getElementById('MapVideo').setExternVideoUrl('<%=videoUrl %>', true);
</script>
    </div>
</asp:Content>
