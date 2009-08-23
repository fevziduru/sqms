<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="OrganizationTree.ascx.cs" Inherits="SQMS.Application.Views.Components.OrganizationTree" %>

<asp:TreeView ID="TreeView1" 
    style="vertical-align:top;margin:10 5;text-align:left; " runat="server" 
    ImageSet="Contacts" NodeIndent="10">
    <ParentNodeStyle Font-Bold="True" ForeColor="#5555DD" />
    <HoverNodeStyle Font-Underline="False" />
    <SelectedNodeStyle Font-Underline="True" HorizontalPadding="0px" 
        VerticalPadding="0px" />
    <NodeStyle Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" 
        HorizontalPadding="5px" NodeSpacing="0px" VerticalPadding="0px" />
</asp:TreeView>
