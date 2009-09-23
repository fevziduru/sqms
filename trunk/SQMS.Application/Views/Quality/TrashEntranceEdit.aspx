<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/Main.Master" AutoEventWireup="true" CodeBehind="TrashEntranceEdit.aspx.cs" Inherits="SQMS.Application.Views.Quality.TrashEntranceEdit" %>

<%@ Register Src="../Components/PopupReference/PopupReference.ascx" TagName="PopupReference" TagPrefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

<link type="text/css" href="../../Resources/CSS/Controls/jquery/redmond/jquery-ui.css" rel="stylesheet" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

	<script type="text/javascript" src="../../Resources/Scripts/Controls/jquery/jqueryui.js"></script>
	<script type="text/javascript" src="../../Resources/Scripts/Controls/jquery/timepicker.js"></script>

            <script type="text/javascript">
                $(function() {
                                    $('.timepicker').datepicker({
                                        duration: '',
                                        showTime: true,
                                        constrainInput: false,
                                        stepMinutes: 1,
                                        stepHours: 1,
                                        altTimeField: '',
                                        time24h: true
                                    });
                });
            </script>

        <div>
                <table style="width: 100%">
                        <tr>
                                <td align="right">
                                        <a href="TrashEntranceList.aspx?p=emergencylist">返回到列表</a>
                                </td>
                        </tr>
                        <tr>
                                <td align="center">
                                        <fieldset>
                                                <asp:Button Width="110px" runat="server" ID="Button1" Text="保存" OnClick="btnSave_Click" />
                                                <asp:Button Width="110px" runat="server" ID="Button2" Text="保存并新增" OnClick="btnSaveAndNew_Click" />
                                        </fieldset>
                                </td>
                        </tr>
                </table>
                <br />
                <fieldset>
                        <legend>渣口基本信息</legend>
                        <table style="width: 100%">
                                <tr>
                                        <td style="width: 110px">
                                                渣口名称：
                                        </td>
                                        <td style="width: 330px">
                                                <asp:TextBox ID="txtEEName" runat="server"></asp:TextBox>
                                        </td>
                                        <td style="width: 110px">
                                                渣口编号：
                                        </td>
                                        <td style="width: 330px">
                                                <asp:TextBox ID="txtEECode" runat="server"></asp:TextBox>
                                        </td>
                                </tr>
                                <tr>
                                        <td>
                                                检查单位：
                                        </td>
                                        <td>
                                                <asp:TextBox ID="txtEECHECKUNIT" runat="server"></asp:TextBox>
                                        </td>
                                        <td style="width: 110px">
                                                监控时间段：
                                        </td>
                                        <td style="width: 330px">
                                                <uc1:PopupReference ID="refEESCHEMAID" Service="SQMS.Services.TimeSchemaService"
                                                        HeaderColumns="SCHEMAID:时间段编号,SCHEMANAME:时间段名称,ISVOID:时间段状态" KeyFieldName="时间段编号"
                                                        TextFieldName="时间段名称" KeyField="SCHEMAID" TextField="SCHEMANAME" SearchColumn="SCHEMANAME"
                                                        AssemblyName="SQMS.Services" runat="server" />
                                        </td>
                                </tr>
                                <tr>
                                        <td style="width: 110px">
                                                检查时间：
                                        </td>
                                        <td style="width: 330px">
                                                <asp:TextBox ID="checkTime" runat="server" CssClass="timepicker" ></asp:TextBox>
                                        </td>
                                        <td style="width: 110px">
                                                事件负责人：
                                        </td>
                                        <td style="width: 330px">
                                                <uc1:PopupReference ID="refEMP" Service="SQMS.Services.EmployeeService" HeaderColumns="EMPID:职员编号,EMPNAME:职员名称,ISVOID:职员状态"
                                                        KeyFieldName="职员编号" TextFieldName="职员名称" KeyField="EMPID" TextField="EMPNAME"
                                                        SearchColumn="EMPNAME" AssemblyName="SQMS.Services" runat="server" />
                                        </td>
                                </tr>
                                <tr>
                                        <td>
                                                优先级：
                                        </td>
                                        <td>
                                                <asp:DropDownList ID="ddlPRIVILIGE" runat="server">
                                                </asp:DropDownList>
                                        </td>
                                </tr>
                                <tr>
                                        <td>
                                                &nbsp;
                                        </td>
                                        <td>
                                                <asp:CheckBox ID="cbIsvoid" runat="server" Text="禁用" />
                                        </td>
                                </tr>
                                <tr>
                                        <td>
                                                备注：
                                        </td>
                                        <td colspan="3">
                                                <asp:TextBox TextMode="MultiLine" ID="txtMemo" runat="server" Height="181px" Width="488px"></asp:TextBox>
                                        </td>
                                </tr>
                        </table>
                </fieldset>
                <br />
                <table style="width: 100%">
                        <tr>
                                <td align="center">
                                        <fieldset>
                                                <asp:Button Width="110px" runat="server" ID="Button3" Text="保存" OnClick="btnSave_Click" />
                                                <asp:Button Width="110px" runat="server" ID="Button4" Text="保存并新增" OnClick="btnSaveAndNew_Click" />
                                        </fieldset>
                                </td>
                        </tr>
                </table>
        </div>

</asp:Content>
