<%@ Page Language="C#" AutoEventWireup="True" CodeBehind="Test.aspx.cs" Inherits="SQMS.Application.Views.AjaxServices.QualityControl.Test" %>

<%@ Register Src="~/Views/Components/MapVideo.ascx" TagName="MapVideo" TagPrefix="uc" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <uc:MapVideo ID="MapVideo1" runat="server" AutoPlay="true" ExternVideoUrl="/test.flv" />
    <script type="text/javascript">
        Sys.Application.add_load(function() {
            MapVideoManager.getInstance("<%=this.MapVideo1.ClientID %>");
        });
    </script>
    </form>
</body>
</html>
