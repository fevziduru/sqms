<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PopupReference.ascx.cs" Inherits="SQMS.Application.PopupReference" %>
<script type="text/javascript">
function popup(textfieldid, valuefieldid) {
    var date = new Date();
    var result = window.showModalDialog(
        "/Views/Components/PopupReference/PopupDialog.aspx?s=<%=Service %>&t=<%=AssemblyName %>&r=" + date.valueOf(),
        document.getElementById(textfieldid),
        "dialogWidth=800px;dialogHeight=600px");
    if (result != null) {
        document.getElementById(valuefieldid).value = result.value;
        document.getElementById(textfieldid).value = result.text;
    }
}
</script>
    
    
    <div>    
        <table border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    <asp:TextBox ID="txtDisplayField" runat="server" Width="180"></asp:TextBox>
                </td>
                <td valign="bottom">
                    <input onclick="popup('<%=txtDisplayField.ClientID %>','<%=txtValueField.ClientID %>')" 
                        style="width:24px;height:24px" type="button" value="..." id="pop" />
                </td>
            </tr>
        </table>   
        <div style="display:none">
            <asp:TextBox ID="txtValueField" runat="server" Width="180"></asp:TextBox>
        </div> 
    </div>