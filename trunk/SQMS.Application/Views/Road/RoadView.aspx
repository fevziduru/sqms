<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/Main.Master" AutoEventWireup="true" CodeBehind="RoadView.aspx.cs" Inherits="SQMS.Application.Views.Road.RoadView" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<script src=" http://maps.google.com/maps?file=api&amp;v=2&amp;sensor=false&amp;key=ABQIAAAA41EnQa1wtzf10JQz5YdqmRQ6hbvwoS9GD89j9qEqTKobihdwiBTS_QjMbHbdYwkxWiBA-XpSkWHt_w&hl=zh-CN"
    type="text/javascript"></script>
    
<script type="text/javascript">
        function showMap(lng, lat) {
                //alert(window.event.clientX + " " + window.event.clientY);
                var mapObj = document.getElementById("mapcontainer");
                if (mapObj != null) {
                        mapObj.style.display = "block";
                        //mapObj.style.left = e.clientX;       
                        //mapObj.style.top = e.clientY;
                }
                loadMap(lng, lat);
        }

        function closeMap() { 
                var mapObj = document.getElementById("mapcontainer");
                if (mapObj != null) {
                        mapObj.style.display = "none";
                        mapObj.style.left = 0;
                        mapObj.style.top = 0;
                }
        }
        
        function loadMap(lng, lat) {
                if (GBrowserIsCompatible()) {
                        map = new GMap2(document.getElementById("map"));
                        map.setCenter(new GLatLng(lat, lng), 19);
                }
        }        
</script>

<div id="mapcontainer" style="background-color:#fff;position:absolute;display:none;width:300;height:300">
        <table cellpadding="0" cellspacing="0" style="width:100%;height:100%" border="1">
                <tr>
                        <td align="right" style="height:25px"><a href="javascript:void(0);" onclick="closeMap()">关闭</a></td>
                </tr>
                <tr>
                        <td>
                        <div id="map" style="width:100%;height:100%; margin:0 0"></div>
                        </td>
                </tr>
        </table>
</div>
 

<div>
         <table width="100%">
        <tr>
            <td align="right"><a href="RoadList.aspx?p=roadlist">返回到列表</a></td>
        </tr>
        <tr>
            <td align="center">
                <fieldset>
                    <asp:Button Width="110" runat="server" ID="Button4" Text="新增" OnClick="btnNew_Click"/>&nbsp;&nbsp;
                    <asp:Button Width="110" runat="server" ID="Button3" Text="编辑" OnClick="btnEdit_Click"/>&nbsp;&nbsp;
                    <asp:Button Width="110" runat="server" ID="Button1" Text="删除" OnClick="btnDelete_OnClick"/>
                </fieldset>
            </td>
        </tr>
    </table>    
    <br />
        <br />
        <fieldset>
            <legend>路段基本信息</legend>
            <table style="width: 100%">
            <tr>
                <td style="width:110">路段名称：</td>
                <td><asp:Label ID="lblRoadName" runat="server" ></asp:Label></td>
                <td style="width:110">路段编码：</td>
                <td><asp:Label ID="lblRoadCode" runat="server" ></asp:Label></td>
            </tr>
                
                <tr>
                    <td>所属项目：</td>
                    <td colspan="3"><asp:Label runat="server" ID="lblProject"></asp:Label></td>
                </tr>
                <tr>
                    <td>路段类型：</td>
                    <td><asp:Label ID="lblRoadType" runat="server"></asp:Label></td>
                    <td>作业时间：</td>
                    <td><asp:Label ID="lblWorkTime" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <td>作业开始时间：</td>
                    <td><asp:Label ID="lblWorkBeginTime" runat="server"></asp:Label></td>
                    <td>作业结束时间：</td>
                    <td><asp:Label ID="lblWorkEndTime" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <td>工作人数：</td>
                    <td><asp:Label ID="lblWorkerNum" runat="server"></asp:Label></td>
                    <td>人均工作量：</td>
                    <td><asp:Label ID="lblAvgWorkAmount" runat="server"></asp:Label></td>
                </tr>
                <tr>
                <td>状态：</td>
                <td colspan="3"><asp:Label ID="lblIsvoid" runat="server"></asp:Label></td>                    
                </tr>
                <tr>
                    <td>备注：</td>
                    <td colspan="3"><asp:Label ID="lblMemo" runat="server" ></asp:Label></td>
                </tr>
            </table>
        </fieldset>
        <br />
        
        <br />
        <fieldset>
        <legend>路段监控点</legend>
        
        <div style="margin:18 18; height:400;overflow:auto">
        <table>
         <tr>
                <td><asp:DropDownList ID="ddlTimeSchema" runat="server" AutoPostBack="false" Width="210"></asp:DropDownList></td>
                <td><asp:Button ID="btnSetTimeSchema" runat="server" Text="设置监控时间段" 
                                CommandName="Select" onclick="btnSetTimeSchema_Click" /></td>
         </tr>
        </table>
        <asp:GridView ID="gvList" runat="server" AllowPaging="False"  Width="100%" CssClass="gridview"
        AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="MPID" OnSorting="gvList_Sorting"
        EmptyDataText="没有可显示的数据记录。"  ShowFooter="true"
         onrowcommand="GridView1_RowCommand" onrowdatabound="gvList_RowDataBound" >
        <Columns>
            <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="30px">
                <HeaderTemplate>
                    <input name="header" onclick='SelectAll("<%=this.gvList.ClientID %>")' type="checkbox" value='<%#Eval("MPID") %>' />
                </HeaderTemplate>
                <ItemTemplate>
                    <input name="__KeyValues__" type="checkbox" value='<%#Eval("MPID") %>' />
                </ItemTemplate>
            </asp:TemplateField>
            
         <%--   <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <a href="javascript:showMap('<%#Eval("LONGITUDE")%>','<%#Eval("LATITUDE")%>')">地图位置</a>
                </ItemTemplate>
            </asp:TemplateField>      --%>     
                 
            <asp:BoundField DataField="MPID" HeaderText="MPID" ReadOnly="True" HeaderStyle-HorizontalAlign="Left" SortExpression="MPID" Visible="False" />
            <asp:HyperLinkField DataNavigateUrlFields="MPID" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left"
                DataNavigateUrlFormatString="/Views/Quality/MonitorPointView.aspx?p=mpview&id={0}" 
                DataTextField="MPNAME" HeaderText="监控点名称" SortExpression="MPNAME" />
            <asp:BoundField DataField="MPCODE" HeaderText="监控点编码"  ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left"
                SortExpression="MPCODE" />                
            <asp:BoundField DataField="SCHEMANAME" HeaderText="时间段模板名称"  ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" SortExpression="SCHEMANAME" />
            <asp:BoundField DataField="LONGITUDE" HeaderText="经度"  ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left"  SortExpression="LONGITUDE" />
            <asp:BoundField DataField="LATITUDE" HeaderText="纬度" SortExpression="LATITUDE" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" />
            <asp:BoundField DataField="FLOATDIST" HeaderText="监控浮动距离" SortExpression="FLOATDIST" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" />
            <asp:CommandField ShowSelectButton="True" ItemStyle-HorizontalAlign="Center"
                SelectText="编辑">
            <ItemStyle Width="60px" />
            </asp:CommandField>
        </Columns>
        <FooterStyle CssClass="footer" />
    </asp:GridView>
    </div>
        </fieldset>
        
         <table width="100%">
        <tr>
            <td align="center">
                <fieldset>
                    <asp:Button Width="110" runat="server" ID="Button2" Text="新增" OnClick="btnNew_Click"/>&nbsp;&nbsp;
                    <asp:Button Width="110" runat="server" ID="Button5" Text="编辑" OnClick="btnEdit_Click"/>&nbsp;&nbsp;
                    <asp:Button Width="110" runat="server" ID="Button6" Text="删除" OnClick="btnDelete_OnClick"/>
                </fieldset>
            </td>
        </tr>
    </table>    
    <br />
    </div>
</asp:Content>
