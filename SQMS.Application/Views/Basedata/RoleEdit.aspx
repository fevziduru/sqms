<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/Main.Master" AutoEventWireup="true" CodeBehind="RoleEdit.aspx.cs" Inherits="SQMS.Application.Views.Basedata.RoleEdit" %>

<%@ Register Assembly="YYControls" Namespace="YYControls" TagPrefix="yyc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<style type="text/css">
.Freezing 
{ 
   position:relative ; 
   table-layout:fixed;
   top:expression(this.offsetParent.scrollTop);   
   z-index: 10;
}
   
.Freezing th
{
    text-overflow:ellipsis;
    overflow:hidden;
    white-space: nowrap;
    padding:2px;
    z-index:10;
}
</style>
<table width="100%">
        <tr>
            <td align="right"><a href="RoleList.aspx?p=rolelist">返回到列表</a></td>
        </tr>
        
        <tr>
            <td align="center">
                <fieldset>
                    <asp:Button Width="110px" runat="server" ID="Button2" Text="保存" OnClick="btnSave_Click"/>&nbsp;&nbsp;
                    <asp:Button Width="110px" runat="server" ID="Button4" Text="保存并新增" OnClick="btnSA_Click"/>
                </fieldset>
            </td>
        </tr>    
    </table>
    </div>
    <br />
    
<fieldset>
<legend>角色基本信息</legend>
<table style="width:100%">
    <tr>
    <td Width="110">角色名称：</td>
        <td style="width:330px">
            <asp:TextBox Width="210" ID="txtRoleName" runat="server" ></asp:TextBox><span style="color:Red">*</span>
            <asp:RequiredFieldValidator ID="rfvRoleName" runat="server" 
                    ControlToValidate="txtRoleName" 
                    SetFocusOnError="true"
                    ErrorMessage="角色名称必填"
                    Display="Dynamic" ></asp:RequiredFieldValidator>
        </td>
        <td Width="110">角色编码：</td>
        <td style="width:330px">
            <asp:TextBox Width="210" ID="txtRoleCode" runat="server" ></asp:TextBox><span style="color:Red">*</span>
            <asp:RequiredFieldValidator ID="rfvRoleCode" runat="server" 
                    ControlToValidate="txtRoleCode" 
                    SetFocusOnError="true"
                    ErrorMessage="角色编码必填"
                    Display="Dynamic"></asp:RequiredFieldValidator>
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
        <td colspan="3"><asp:TextBox ID="txtMemo" runat="server" Height="98px" TextMode="MultiLine" 
            Width="306px" ></asp:TextBox></td>
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
    <yyc:SmartGridView ID="sGrid" AllowSorting="false" Width="100%"  FixRowColumn-FixColumns="0"
            MouseOverCssClass="OverRow" AutoGenerateColumns="false" HeaderStyle-CssClass="Freezing"
            HeaderStyle-BackColor="#EDEDED" EnableViewState="true" 
            MergeCells="0" runat='server'>
        <CascadeCheckboxes>
            <yyc:CascadeCheckbox ChildCheckboxID="item" ParentCheckboxID="all" />
        </CascadeCheckboxes>
        <SmartSorting AllowMultiSorting="True" AllowSortTip="True" />         
        <%--<CustomPagerSettings PagingMode="webabcd" TextFormat="每页{0}条/共{1}条&nbsp;&nbsp;&nbsp;&nbsp;第{2}页/共{3}页&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" />--%>
        <%--<PagerSettings Position="Top" PageButtonCount="13" FirstPageText="首页" PreviousPageText="上一页" NextPageText="下一页" LastPageText="末页" />--%>
    </yyc:SmartGridView>
    </div>
    </fieldset>
<br />

<table width="100%">
        <tr>
            <td align="right"><a href="RoleList.aspx?p=rolelist">返回到列表</a></td>
        </tr>
        
        <tr>
            <td align="center">
                <fieldset>
                    <asp:Button Width="110px" runat="server" ID="Button1" Text="保存" OnClick="btnSave_Click"/>&nbsp;&nbsp;
                    <asp:Button Width="110px" runat="server" ID="Button3" Text="保存并新增" OnClick="btnSA_Click"/>
                </fieldset>
            </td>
        </tr>    
    </table>
    </div>
    
   </asp:Content>
