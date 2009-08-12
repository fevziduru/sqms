<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="QualityMonitorPointMap.aspx.cs"
    Inherits="SQMS.Application.Views.Quality.QualityMonitorPointMap" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        body
        {
            margin: 0 0 0 0;
            font-size: 12px;
        }
        div table tr td
        {
            font-size: 12px;
        }
        .left
        {
            width: 200px;
            height: 650px;
            float: left;
        }
        .right
        {
        }
        .more_info
        {
            float: left;
        }
    </style>

    <script type="text/javascript">
        function openMoreInfo(url) {
            var topWindow = window.parent;
            while (topWindow.parent && topWindow.parent != topWindow) {
                try {
                    if (topWindow.parent.document.domain != document.domain)
                        break;
                    if (topWindow.parent.document.getElementsByTagName('frameset').length > 0)
                        break;
                }
                catch (e) {
                    break;
                }
                topWindow = topWindow.parent;
            }
            var topDocument = topWindow.document;
            var divMore = topDocument.getElementById("divMoreInfo");
            var iframeMore = topDocument.getElementById("iframeMoreInfo");
            if (!divMore) {
                var closeMoreText = topDocument.createTextNode("关闭");
                var lnkMoreClose = topDocument.createElement('a');
                lnkMoreClose.href = "javascript:void(0);";
                lnkMoreClose.appendChild(closeMoreText);
                var divMoreClose = topDocument.createElement('div');
                divMoreClose.style.cssText = "text-align:right;";
                divMoreClose.appendChild(lnkMoreClose);
                divMore = topDocument.createElement('div');
                divMore.id = "divMoreInfo";
                divMore.style.cssText = 'margin:0;' +
		            'padding:0;' +
		            'border:0;' +
		            'background-color:#4D81BD;' +
		            'background-image:none;' ;
                divMore.style.position = "absolute";
                divMore.style.top = "0px";
                divMore.style.left = "0px";
                divMore.style.width = "100%";
                divMore.style.zIndex = 999;
                divMore.appendChild(divMoreClose);
                topDocument.body.appendChild(divMore);

                $addHandler(lnkMoreClose, "click", function() {this.parentElement.parentElement.style.display = 'none'; });
            }
            if (!iframeMore) {
                iframeMore = topDocument.createElement('iframe');
                iframeMore.id = "iframeMoreInfo";
                iframeMore.frameborder = 0;
                iframeMore.style.width = "100%";
                divMore.appendChild(iframeMore);
            }
            
            if (divMore.style.display == 'none') {
                divMore.style.display = '';
            }
            divMore.style.height = window.screen.availHeight;
            iframeMore.style.height = window.screen.availHeight;
            iframeMore.src = url;

        }
        function closeMoreInfo() {
            var divMore = document.getElementById("divMoreInfo");
            if (!divMore) {
                return;
            }
            if (divMore.style.display != 'none') {
                divMore.style.display = 'none';
            }
        }
    </script>

</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div>
        <div>
            <asp:Label ID="LabelMPName" runat="server"></asp:Label><span>（经纬度：<asp:Label ID="LabelMPLng"
                runat="server"></asp:Label>,<asp:Label ID="LabelMPLat" runat="server"></asp:Label>）</span></div>
        <div>
            <div>
                <asp:HyperLink ID="LinkImageSource" runat="server" Target="_blank"></asp:HyperLink>
            </div>
            <div>
                <span><span>数据采集时间：</span><span><asp:Label ID="LabelDataFetchTime" runat="server"></asp:Label></span></span></div>
            <div>
                <span><span>采集坐标：</span><span><asp:Label ID="LabelQCCrood" runat="server"></asp:Label></span></span></div>
            <div>
                <span><span>类型：</span><span><asp:Label ID="LabelQCType" runat="server"></asp:Label></span></span></div>
            <div>
                <span><span>状态：</span><span><asp:Label ID="LabelQCState" runat="server"></asp:Label></span></span></div>
            <div>
                <span><span>责任人：</span><span><asp:Label ID="LabelDutyMan" runat="server"></asp:Label></span></span></div>
            <div>
                <span><span>巡查员：</span><span><asp:Label ID="LabelPatrolMan" runat="server"></asp:Label></span></span></div>
            <div>
                <span><span>应急处理责任人：</span><span><asp:Label ID="LabelEmergencyMan" runat="server"></asp:Label></span></span></div>
        </div>
        <div>
            <asp:HyperLink ID="LinkMore" runat="server" Text="更多信息"></asp:HyperLink></div>
    </div>
    </form>
</body>
</html>
