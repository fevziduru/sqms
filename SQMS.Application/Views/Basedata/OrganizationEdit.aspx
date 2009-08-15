<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/Main.Master" AutoEventWireup="true" CodeBehind="OrganizationEdit.aspx.cs" Inherits="SQMS.Application.Views.Basedata.OrganizationEdit" %>

<%@ Register src="../Components/OrganizationTree.ascx" tagname="OrganizationTree" tagprefix="uc1" %>
<%@ Register src="../Components/OrganizationEdit.ascx" tagname="OrganizationEdit" tagprefix="uc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<table border="0" cellspacing="0" cellpadding="0" width="100%">

    <tr>
		<td width="220px">


		        
		    <uc1:OrganizationTree ID="OrganizationTree1" runat="server" />


		        
		</td>
		
		<td width="100%">
		

		
		    <uc2:OrganizationEdit ID="OrganizationEdit1" runat="server" />
		

		
		</td>
    </tr>


</table>

</asp:Content>
