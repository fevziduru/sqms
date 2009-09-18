<%@ Page Language="C#" AutoEventWireup="True" CodeBehind="Test.aspx.cs" Inherits="SQMS.Application.Views.AjaxServices.QualityControl.Test" %>

<%@ Register Src="~/Views/Components/MapVideo.ascx" TagName="MapVideo" TagPrefix="uc" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <script type="text/javascript" charset="utf-8" src="../../../Resources/Scripts/Controls/GoogleMap/StaticMap.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager runat="server" ID="sm1"></asp:ScriptManager>
    <div id="divStaticMap"></div>
    </form>
    <script type="text/javascript">
        Sys.Application.add_load(function() {
            StaticMapFactory.createStaticMap("divStaticMap", "A00001");
        });
    </script>
</body>
</html>
