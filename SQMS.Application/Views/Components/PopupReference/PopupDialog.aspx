<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PopupDialog.aspx.cs" Inherits="SQMS.Application.PopupDialog" %>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
    <base target="_self" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <script type="text/javascript">
        function SelectItem(obj) {
            window.returnValue = obj;
            this.close();
        }
    </script>
    
 <%--   <input type="button" onclick="SelectItem()"  value="OK"/>
    <a style="cursor:hand;text-decoration:underline" onclick="SelectItem()">Close</a>--%>
    <asp:GridView ID="gvRefList" runat="server" AllowPaging="True" PageSize="5" 
            AutoGenerateColumns="False">
        <PagerSettings Position="TopAndBottom" Mode="NumericFirstLast"/>    
        <Columns>
            <%--<asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:LinkButton ID="lbSelect" runat="server" CausesValidation="False" 
                        CommandName="Select" Text="选择"></asp:LinkButton>
                        <asp:HiddenField ID="hidValue" runat="server" Value='<%#bind("value")%>' />
                        <asp:HiddenField ID="hidText" runat="server" Value='<%#bind("text")%>' />
                </ItemTemplate>
            </asp:TemplateField>--%>
        </Columns>
    </asp:GridView>
    
    </div>
    </form>
</body>
</html>
