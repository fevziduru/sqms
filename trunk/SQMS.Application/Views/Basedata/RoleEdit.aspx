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
            <td align="right"><a href="RoleList.aspx?p=rolelist">���ص��б�</a></td>
        </tr>
        
        <tr>
            <td align="center">
                <fieldset>
                    <asp:Button Width="110px" runat="server" ID="Button2" Text="����" OnClick="btnSave_Click"/>&nbsp;&nbsp;
                    <asp:Button Width="110px" runat="server" ID="Button4" Text="���沢����" OnClick="btnSA_Click"/>
                </fieldset>
            </td>
        </tr>    
    </table>
    </div>
    <br />
    
<fieldset>
<legend>��ɫ������Ϣ</legend>
<table style="width:100%">
    <tr>
    <td Width="110">��ɫ���ƣ�</td>
        <td style="width:330px">
            <asp:TextBox Width="210" ID="txtRoleName" runat="server" ></asp:TextBox><span style="color:Red">*</span>
            <asp:RequiredFieldValidator ID="rfvRoleName" runat="server" 
                    ControlToValidate="txtRoleName" 
                    SetFocusOnError="true"
                    ErrorMessage="��ɫ���Ʊ���"
                    Display="Dynamic" ></asp:RequiredFieldValidator>
        </td>
        <td Width="110">��ɫ���룺</td>
        <td style="width:330px">
            <asp:TextBox Width="210" ID="txtRoleCode" runat="server" ></asp:TextBox><span style="color:Red">*</span>
            <asp:RequiredFieldValidator ID="rfvRoleCode" runat="server" 
                    ControlToValidate="txtRoleCode" 
                    SetFocusOnError="true"
                    ErrorMessage="��ɫ�������"
                    Display="Dynamic"></asp:RequiredFieldValidator>
        </td>
        
    </tr>
    <tr>
            <td>&nbsp;</td>
            <td>
                <asp:CheckBox ID="cbIsvoid" runat="server" Text="����" />
            </td>
        </tr>
    <tr>
        <td>��ע��</td>
        <td colspan="3"><asp:TextBox ID="txtMemo" runat="server" Height="98px" TextMode="MultiLine" 
            Width="306px" ></asp:TextBox></td>
    </tr>
</table>
</fieldset>
<br />

<fieldset>
<legend>��ɫ��Ȩ</legend>        
        <%--<asp:DropDownList ID="DropDownListClass" runat="server" AutoPostBack="True" 
            onselectedindexchanged="DropDownListClass_SelectedIndexChanged">
            <asp:ListItem Value="all">����</asp:ListItem>
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
        <%--<CustomPagerSettings PagingMode="webabcd" TextFormat="ÿҳ{0}��/��{1}��&nbsp;&nbsp;&nbsp;&nbsp;��{2}ҳ/��{3}ҳ&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" />--%>
        <%--<PagerSettings Position="Top" PageButtonCount="13" FirstPageText="��ҳ" PreviousPageText="��һҳ" NextPageText="��һҳ" LastPageText="ĩҳ" />--%>
    </yyc:SmartGridView>
    </div>
    </fieldset>
<br />

<table width="100%">
        <tr>
            <td align="right"><a href="RoleList.aspx?p=rolelist">���ص��б�</a></td>
        </tr>
        
        <tr>
            <td align="center">
                <fieldset>
                    <asp:Button Width="110px" runat="server" ID="Button1" Text="����" OnClick="btnSave_Click"/>&nbsp;&nbsp;
                    <asp:Button Width="110px" runat="server" ID="Button3" Text="���沢����" OnClick="btnSA_Click"/>
                </fieldset>
            </td>
        </tr>    
    </table>
    </div>
    
   </asp:Content>
