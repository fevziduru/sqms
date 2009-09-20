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
        <asp:ScriptManager runat="server" ID="sm1">
        </asp:ScriptManager>
        <button type="button" id="btnChange">
                change current marker</button>
        <div id="divStaticMap" style="display:none">
        </div>
        </form>

        <script type="text/javascript">
                var currentId = "A00001"
                Sys.Application.add_load(function() {
                        $addHandler($get("btnChange"), "click", function() {
                                
                                if (currentId == "A00001") {
                                        currentId = "A00002";
                                } else {
                                        currentId = "A00001";
                                }
                                StaticMapFactory.createStaticMap("divStaticMap", currentId);
                                $get("divStaticMap").style.display = "block";
                        });
                        StaticMapFactory.createStaticMap("divStaticMap", currentId, 300, 400);
                });
        </script>

</body>
</html>
