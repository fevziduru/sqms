<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/Main.Master" AutoEventWireup="true" CodeBehind="EmergencyEventEdit.aspx.cs" Inherits="SQMS.Application.Views.Quality.EmergencyEventEdit" %>

<%@ Register src="../Components/PopupReference/PopupReference.ascx" tagname="PopupReference" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<script type="text/javascript" src="../../Resources/Scripts/Controls/TimeBox/TimeBox.js"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div>
    
     <table style="width:100%">
        <tr>
            <td align="right"><a href="EmergencyEventList.aspx?p=eelist">返回到列表</a></td>
        </tr>
        <tr>        
            <td align="center">
                <fieldset>    
                    <asp:Button Width="110px" runat="server" ID="Button1" Text="保存" OnClick="btnSave_Click"/>
                    <asp:Button Width="110px" runat="server" ID="Button2" Text="保存并新增" OnClick="btnSaveAndNew_Click"/>
                </fieldset>
            </td>
        </tr>
    </table>
    <br />
    <fieldset>
    <legend>紧急事件基本信息</legend>    
    <table style="width:100%">
        <tr>
            <td style="width:110px">事件名称：</td>
            <td style="width:330px">
                <asp:TextBox ID="txtEEName" runat="server" ></asp:TextBox>
            </td>
            <td style="width:110px">事件编号：</td>
            <td style="width:330px">
                <asp:TextBox ID="txtEECode" runat="server" ></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>检查单位：</td>
            <td>
            <asp:TextBox ID="txtEECHECKUNIT" runat="server" ></asp:TextBox>
            </td>
            <td style="width:110px">监控时间段：</td>
            <td style="width:330px">
                <uc1:PopupReference ID="refEESCHEMAID" Service="SQMS.Services.TimeSchemaService" 
                HeaderColumns="SCHEMAID:时间段编号,SCHEMANAME:时间段名称,ISVOID:时间段状态" KeyFieldName="时间段编号" TextFieldName="时间段名称"
                KeyField="SCHEMAID" TextField="SCHEMANAME" SearchColumn="SCHEMANAME" AssemblyName="SQMS.Services" runat="server" />
            </td>            
        </tr>
        
        <tr>
            <td style="width:110px">检查时间：</td>
            <td style="width:330px">
            
            <div>
                       <div id="txt100_main">
	                    <input type="text" id="txt100" value="<%= strSTIME %>" name="tbSTIME" onchange="javascript:checkTime(this)" onblur="javascript:checkTime(this)" onfocus="javascript:showHint(this)" />
	                    <div id="txt100_hint" style="z-index:1000;display:none;position:absolute;border:#6B90DA 1px solid;background-color:#F0F7F9;vertical-align:middle;text-align:center">
		                    <span style="font-size:10pt;vertical-align:absmiddle;text-align:center; padding:30">时间格式为hh24(小时):mm(分钟):ss(秒)</span>
	                    </div>
	                    <div id="txt100_errinfo" style="z-index:1000;display:none;position:absolute;border:#ff0000 1px solid;background-color:#FFEDDB">
		                    <span style="font-size:10pt;vertical-align:absmiddle; padding:30;text-align:center">时间格式不对,时间格式应为hh24(小时):mm(分钟):ss(秒)</span>
	                    </div>
            </div>
                   
            </td>
            <td style="width:110px">事件负责人：</td>
            <td style="width:330px">
                <uc1:PopupReference ID="refEMP" Service="SQMS.Services.EmployeeService" 
                HeaderColumns="EMPID:职员编号,EMPNAME:职员名称,ISVOID:职员状态" KeyFieldName="职员编号" TextFieldName="职员名称"
                KeyField="EMPID" TextField="EMPNAME" SearchColumn="EMPNAME" AssemblyName="SQMS.Services" runat="server" />
            </td>
        </tr>        
        
        <tr>
            <td>优先级：</td>
            <td>
                <asp:DropDownList ID="ddlPRIVILIGE" runat="server">
                </asp:DropDownList>

            </td>       
        </tr>        
        
        <tr>
            <td>&nbsp;</td>
            <td>
                <asp:CheckBox ID="cbIsvoid" runat="server" Text="禁用" />
            </td>
        </tr>
        <tr>
            <td>备注：</td>
            <td colspan="3"><asp:TextBox TextMode="MultiLine" ID="txtMemo" runat="server" 
                    Height="181px" Width="488px" ></asp:TextBox></td>
        </tr>
    </table>
    </fieldset>
    <br />
    <table style="width:100%">
        <tr>        
            <td align="center">
                <fieldset>    
                    <asp:Button Width="110px" runat="server" ID="Button3" Text="保存" OnClick="btnSave_Click"/>
                    <asp:Button Width="110px" runat="server" ID="Button4" Text="保存并新增" OnClick="btnSaveAndNew_Click"/>
                </fieldset>
            </td>
        </tr>
    </table>
    
    </div>  

</asp:Content>
