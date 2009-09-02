<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SimpleSmallMap.aspx.cs" Inherits="SQMS.Application.Views.Components.SimpleSmallMap" %>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
   <script src=" http://maps.google.com/maps?file=api&amp;v=2&amp;sensor=false&amp;key=ABQIAAAA41EnQa1wtzf10JQz5YdqmRQ6hbvwoS9GD89j9qEqTKobihdwiBTS_QjMbHbdYwkxWiBA-XpSkWHt_w&hl=zh-CN"
    type="text/javascript"></script>
    <script type="text/javascript">
            function PrepareMap() {
                    var loc = window.dialogArguments;
                    loadMap(loc.lng, loc.lat);
            }

            function loadMap(lng, lat) {
                    var icon = new GIcon();
                    //icon.image = "icons/bank.png";
                    //icon.shadow = "icons/shadow.png";
                    icon.iconSize = new GSize(16, 16);
                    icon.shadowSize = new GSize(16, 16);
                    icon.iconAnchor = new GPoint(8, 8);
                    icon.maxHeight = 4;
                    var marker = new GMarker(new GLatLng(lat, lng), G_DEFAULT_ICON, true);
                    if (GBrowserIsCompatible()) {
                            map = new GMap2(document.getElementById("map"));
                            map.setCenter(new GLatLng(lat, lng), 2);
                    }
            }
    </script>
</head>
<body onload="loadMap()" onunload="GUnload()" style="margin:0 0">
    <form id="form1" runat="server">
    <div>
    <div id="map" style="width:100%;height:100%; margin:0 0"></div>
    </div>
    </form>
</body>
</html>
