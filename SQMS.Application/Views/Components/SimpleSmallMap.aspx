<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SimpleSmallMap.aspx.cs" Inherits="SQMS.Application.Views.Components.SimpleSmallMap" %>

<%@ Register src="Map.ascx" tagname="Map" tagprefix="uc1" %>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
 
    <script type="text/javascript">
//            function PrepareMap() {
//                    var loc = window.dialogArguments;
//                    loadMap(loc.lng, loc.lat);
//            }

//            function loadMap(lng, lat) {
//                    var icon = new GIcon();
//                    //icon.image = "icons/bank.png";
//                    //icon.shadow = "icons/shadow.png";
//                    icon.iconSize = new GSize(16, 16);
//                    icon.shadowSize = new GSize(16, 16);
//                    icon.iconAnchor = new GPoint(8, 8);
//                    icon.maxHeight = 4;
//                    var marker = new GMarker(new GLatLng(lat, lng), G_DEFAULT_ICON, true);
//                    if (GBrowserIsCompatible()) {
//                            map = new GMap2(document.getElementById("map"));
//                            map.setCenter(new GLatLng(lat, lng), 2);
//                    }
//            }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div><uc1:Map ID="Map1" runat="server" /></div>
    </form>
</body>
</html>
