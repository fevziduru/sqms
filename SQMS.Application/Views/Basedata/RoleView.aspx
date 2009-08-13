<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/Main.Master" AutoEventWireup="true" CodeBehind="RoleView.aspx.cs" Inherits="SQMS.Application.Views.Basedata.RoleView" %>

<%@ Register Assembly="YYControls" Namespace="YYControls" TagPrefix="yyc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


<div>
    
    <table width="100%">
        <tr>
            <td align="right"><a href="EmployeeList.aspx?p=employeelist">返回到列表</a></td>
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
    
<fieldset>
<legend>角色基本信息</legend>
<table style="width:100%">
    <tr>
        <td Width="110">角色编码：</td>
        <td style="width:330px">
            <asp:Label ID="lblRoleCode" runat="server" Text=""></asp:Label>
        </td>
        <td Width="110">角色名称：</td>
        <td style="width:330px">
            <asp:Label ID="lblRoleName" runat="server" Text=""></asp:Label>
        </td>
    </tr>
    <tr>
        <td>状态：</td>
        <td colspan="3">
            <asp:Label ID="lblStatus" runat="server"></asp:Label>
        </td>
    </tr>
    <tr>
        <td>备注：</td>
        <td colspan="3">
            <asp:Label ID="lblMeno" runat="server"></asp:Label>
            </td>
    </tr>
</table>
</fieldset>
<br />

<fieldset>
<legend>角色授权</legend>        
        <%--<asp:DropDownList ID="DropDownListClass" runat="server" AutoPostBack="True" 
            onselectedindexchanged="DropDownListClass_SelectedIndexChanged">
            <asp:ListItem Value="all">所有</asp:ListItem>
        </asp:DropDownList>--%>
    
    <div style="margin:18 18; height:400;overflow:auto">    
    <yyc:smartgridview ID="sGrid" AllowSorting="false" Width="100%"  FixRowColumn-FixColumns="0"
            MouseOverCssClass="OverRow" AutoGenerateColumns="false" HeaderStyle-CssClass="Freezing"
            HeaderStyle-BackColor="#EDEDED" EnableViewState="true" 
            MergeCells="0" runat='server'>
        <CascadeCheckboxes>
            <yyc:CascadeCheckbox ChildCheckboxID="item" ParentCheckboxID="all" />
        </CascadeCheckboxes>
        <SmartSorting AllowMultiSorting="True" AllowSortTip="True" />         
        <%--<CustomPagerSettings PagingMode="webabcd" TextFormat="每页{0}条/共{1}条&nbsp;&nbsp;&nbsp;&nbsp;第{2}页/共{3}页&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" />--%>
        <%--<PagerSettings Position="Top" PageButtonCount="13" FirstPageText="首页" PreviousPageText="上一页" NextPageText="下一页" LastPageText="末页" />--%>
    </yyc:smartgridview>
    </div>
    </fieldset>
<br /> 
 
 
    <fieldset>
    <table width="100%">
        <tr>
            <td align="center">
                <asp:Button Width="110" runat="server" ID="Button2" Text="新增" OnClick="btnNew_Click"/>&nbsp;&nbsp;
                    <asp:Button Width="110" runat="server" ID="Button5" Text="编辑" OnClick="btnEdit_Click"/>&nbsp;&nbsp;
                    <asp:Button Width="110" runat="server" ID="Button6" Text="删除" OnClick="btnDelete_OnClick"/>
            </td>
        </tr>
    </table>
    </fieldset>
    
    </div>

</asp:Content>
