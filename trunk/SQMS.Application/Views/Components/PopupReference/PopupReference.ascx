<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PopupReference.ascx.cs"
        Inherits="SQMS.Application.PopupReference" %>
<div>
        <table border="0" cellpadding="0" cellspacing="0">
                <tr>
                        <td>
                                <asp:TextBox ID="txtDisplayField" runat="server" Width="180"></asp:TextBox>
                        </td>
                        
                        <td valign="bottom">
                                <a runat="server" id="lbPop">选择</a>
                        </td>
                </tr>
        </table>
        <div style="display: none">
                <asp:TextBox ID="txtValueField" runat="server" Width="180"></asp:TextBox>
        </div>
</div>
