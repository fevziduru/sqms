<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/Main.Master" AutoEventWireup="true" CodeBehind="RoleEdit.aspx.cs" Inherits="SQMS.Application.Views.Basedata.RoleEdit" %>

<%@ Register Assembly="YYControls" Namespace="YYControls" TagPrefix="yyc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div>
    角色编码：<asp:TextBox ID="txtRoleCode" runat="server" ></asp:TextBox>
        <br />
        <br />
    角色名称：<asp:TextBox ID="txtRoleName" runat="server" ></asp:TextBox>
        <br />
        <br />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:CheckBox ID="cbIsVoid" runat="server" Text="是否禁用" />
        <br />
        <br />
        角色权限：<asp:LinkButton ID="lbPerSelect" runat="server" 
            onclick="lbPerSelect_Click">选择角色权限</asp:LinkButton>
        &nbsp;&nbsp;&nbsp;&nbsp;
        <asp:DropDownList ID="DropDownListClass" runat="server" AutoPostBack="True" 
            onselectedindexchanged="DropDownListClass_SelectedIndexChanged">
            <asp:ListItem Value="all">所有</asp:ListItem>
        </asp:DropDownList>
        <br />
        <br />
    
    <div style=" margin-left:80px">

    <yyc:SmartGridView ID="sGrid" AllowPaging="true" AllowSorting="true" MouseOverCssClass="OverRow" AutoGenerateColumns="false" EnableViewState="true"  runat='server'>
 
        <CascadeCheckboxes>
            <yyc:CascadeCheckbox ChildCheckboxID="item" ParentCheckboxID="all" />
        </CascadeCheckboxes>
        
        <SmartSorting AllowMultiSorting="True" AllowSortTip="True" /> 
        
        <CustomPagerSettings PagingMode="Webabcd" TextFormat="每页{0}条/共{1}条&nbsp;&nbsp;&nbsp;&nbsp;第{2}页/共{3}页&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" />
        <PagerSettings Position="Top" PageButtonCount="13" FirstPageText="首页" PreviousPageText="上一页"
            NextPageText="下一页" LastPageText="末页" />        
    
    </yyc:SmartGridView>

    </div>

        <br />
        <br />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    备注：<asp:TextBox ID="txtMemo" runat="server" Height="98px" TextMode="MultiLine" 
            Width="306px" ></asp:TextBox>
        <br />
        <br />
        <br />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button runat="server" ID="btnSave" Text="  保存  " OnClick="btnSave_Click"/>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnSA" runat="server" Text="保存并新增" onclick="btnSA_Click" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnBack2List" runat="server" Text="返回到列表" 
            onclick="btnBack2List_Click" />
    </div>
    
   </asp:Content>
