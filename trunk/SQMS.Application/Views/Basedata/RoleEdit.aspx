<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/Main.Master" AutoEventWireup="true" CodeBehind="RoleEdit.aspx.cs" Inherits="SQMS.Application.Views.Basedata.RoleEdit" %>

<%@ Register Assembly="YYControls" Namespace="YYControls" TagPrefix="yyc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div>
    ��ɫ���룺<asp:TextBox ID="txtRoleCode" runat="server" ></asp:TextBox>
        <br />
        <br />
    ��ɫ���ƣ�<asp:TextBox ID="txtRoleName" runat="server" ></asp:TextBox>
        <br />
        <br />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:CheckBox ID="cbIsVoid" runat="server" Text="�Ƿ����" />
        <br />
        <br />
        ��ɫȨ�ޣ�<asp:LinkButton ID="lbPerSelect" runat="server" 
            onclick="lbPerSelect_Click">ѡ���ɫȨ��</asp:LinkButton>
        <br />
        <br />
    
    <div style=" margin-left:80px">

    <yyc:SmartGridView ID="sGrid" AllowSorting="true" MouseOverCssClass="OverRow" AutoGenerateColumns="false" EnableViewState="true" runat='server'>
 
        <CascadeCheckboxes>
            <yyc:CascadeCheckbox ChildCheckboxID="item" ParentCheckboxID="all" />
        </CascadeCheckboxes>
        
        <SmartSorting AllowMultiSorting="True" AllowSortTip="True" /> 
    
    </yyc:SmartGridView>

        <br />
        <asp:Button ID="btnDelPermission" runat="server" Text="ɾ��" 
            onclick="btnDelPermission_Click" Visible="False" />

    </div>

        <br />
        <br />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    ��ע��<asp:TextBox ID="txtMemo" runat="server" Height="98px" TextMode="MultiLine" 
            Width="306px" ></asp:TextBox>
        <br />
        <br />
        <br />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button runat="server" ID="btnSave" Text="  ����  " OnClick="btnSave_Click"/>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnSA" runat="server" Text="���沢����" onclick="btnSA_Click" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnBack2List" runat="server" Text="���ص��б�" 
            onclick="btnBack2List_Click" />
    </div>
    
   </asp:Content>
