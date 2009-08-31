<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/Main.Master" AutoEventWireup="true" CodeBehind="MonitorPointEdit.aspx.cs" Inherits="SQMS.Application.Views.Quality.MonitorPointEdit" %>
<%@ Register src="../Components/PopupReference/PopupReference.ascx" tagname="PopupReference" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div>
     <table style="width:100%">
        <tr>
            <td align="right"><a href="MonitorPointList.aspx?p=mplist">返回到列表</a></td>
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
    <legend>监控点基本信息</legend>    
    <table style="width:100%">
        <tr>
            <td style="width:110px">监控点名称：</td>
            <td style="width:330px">
                <asp:TextBox ID="txtMPName" runat="server" ></asp:TextBox><span style="color:Red">*</span>
                <asp:RequiredFieldValidator ID="rfvMPName" runat="server" 
                    ControlToValidate="txtMPName" 
                    SetFocusOnError="true"
                    ErrorMessage="监控点名称必填"
                    Display="Dynamic" ></asp:RequiredFieldValidator>
            </td>
            <td style="width:110px">监控点编码：</td>
            <td style="width:330px">
                <asp:TextBox ID="txtMPCode" runat="server" ></asp:TextBox><span style="color:Red">*</span>
                <asp:RequiredFieldValidator ID="rfvMPCode" runat="server" 
                    ControlToValidate="txtMPCode" 
                    SetFocusOnError="true"
                    ErrorMessage="监控点编码必填"
                    Display="Dynamic" ></asp:RequiredFieldValidator>
            </td>
        </tr>
        
          <tr>
            <td>所属路段：</td>
            <td>
                <uc1:PopupReference ID="refRoad" Service="SQMS.Services.RoadService" 
                HeaderColumns="ROADID:路段ID,ROADNAME:路段名称,ISVOID:路段状态" KeyFieldName="路段编号" TextFieldName="路段名称"
                KeyField="ROADID" TextField="ROADNAME" SearchColumn="ROADNAME" AssemblyName="SQMS.Services" runat="server" />
            </td>
            <td>监控时间段：</td>
            <td>
                <uc1:PopupReference ID="refTimeSchema" Service="SQMS.Services.TimeSchemaService" 
                HeaderColumns="SCHEMAID:时间段ID,SCHEMANAME:时间段名称,ISVOID:时间段状态" KeyFieldName="时间段编号" TextFieldName="时间段名称"
                KeyField="SCHEMAID" TextField="SCHEMANAME" SearchColumn="SCHEMANAME" AssemblyName="SQMS.Services" runat="server" />
            </td>
        </tr>
         <tr>
            <td>经度：</td>
            <td><asp:TextBox ID="txtLng"  Width="210" runat="server" ></asp:TextBox></td>  
            <td>纬度：</td>
            <td><asp:TextBox ID="txtLat" Width="210" runat="server" ></asp:TextBox></td>
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
