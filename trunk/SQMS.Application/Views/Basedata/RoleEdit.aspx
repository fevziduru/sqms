<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/Main.Master" AutoEventWireup="true" CodeBehind="RoleEdit.aspx.cs" Inherits="SQMS.Application.Views.Basedata.RoleEdit" %>

<%@ Register Assembly="YYControls" Namespace="YYControls" TagPrefix="yyc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div>
    角色编码：<asp:TextBox ID="txtRoleCode" runat="server" ></asp:TextBox><br />
    角色名称：<asp:TextBox ID="txtRoleName" runat="server" ></asp:TextBox><br />
    禁用：<asp:CheckBox ID="cbIsVoid" runat="server" /><br />
    备注：<asp:TextBox ID="txtMemo" runat="server" ></asp:TextBox><br />
    <asp:Button runat="server" ID="btnSave" Text="保存" OnClick="btnSave_Click"/>
    </div><br />
    
    
   <asp:DropDownList ID="DropDownListClass" runat="server" 
        onselectedindexchanged="DropDownListClass_SelectedIndexChanged" Visible="False"></asp:DropDownList><br />
    
   <yyc:SmartGridView ID="sGrid" AllowSorting="true" MouseOverCssClass="OverRow" AutoGenerateColumns="false" EnableViewState="true" runat='server'>
 
        <CascadeCheckboxes>
            <yyc:CascadeCheckbox ChildCheckboxID="item" ParentCheckboxID="all" />
        </CascadeCheckboxes>
        
        <SmartSorting AllowMultiSorting="True" AllowSortTip="True" /> 
    
    </yyc:SmartGridView>

</asp:Content>
