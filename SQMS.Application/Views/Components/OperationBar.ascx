<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="OperationBar.ascx.cs" Inherits="SQMS.Application.Views.Components.OperationBar" %>
<table style="width:100%;margin:3 10" cellpadding="0" cellspacing="0">
    <tr>
        <td align="left">
            <%=this.Title %> <%=this.SubTitle.Length > 0 ? " - "+this.SubTitle:""%>
        </td>
        <td align="right">
            <asp:PlaceHolder ID="phButtons" runat="server"></asp:PlaceHolder>
        </td>
        <td style="width:15px">&nbsp;</td>
    </tr>
</table>
