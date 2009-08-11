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
    
    <div>
    <asp:GridView Width="100%" ID="gvRefList" runat="server" AllowPaging="True" PageSize="15" 
            AutoGenerateColumns="False">
        <PagerSettings Position="TopAndBottom" 
            NextPageText=">" 
            PageButtonCount="5" 
            LastPageText=">>" 
            FirstPageText="<<" 
            PreviousPageText="<" 
            Mode="NextPreviousFirstLast"/>
    </asp:GridView>
    </div>
    </div>
    </form>
</body>
</html>
