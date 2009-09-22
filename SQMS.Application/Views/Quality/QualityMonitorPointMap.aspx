<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="QualityMonitorPointMap.aspx.cs"
    Inherits="SQMS.Application.Views.Quality.QualityMonitorPointMap" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
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
		            'background-image:none;';
                divMore.style.position = "absolute";
                divMore.style.top = "0px";
                divMore.style.left = "0px";
                divMore.style.width = "100%";
                divMore.style.zIndex = 999;
                divMore.appendChild(divMoreClose);
                topDocument.body.appendChild(divMore);

                $addHandler(lnkMoreClose, "click", function() { this.parentElement.parentElement.style.display = 'none'; });
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
        <div runat="server" id="divMP">
            <!--监控点详细数据-->
            <div>
                <span>监控点名称：<asp:Label ID="LabelMPName" runat="server"></asp:Label></span><span><asp:Label
                    ID="LabelMPCode" runat="server"></asp:Label></span></div>
            <div>
                所属项目：<asp:Label ID="LabelMPProject" runat="server"></asp:Label></div>
            <div>
                所属路段：<asp:Label ID="LabelMPRoad" runat="server"></asp:Label></div>
            <div>
                备注：<asp:Label ID="LabelMPMemo" runat="server"></asp:Label></div>
        </div>
        <div runat="server" id="divEvent" visible="false">
            <!--路段详细数据-->
            <div>
                <span>事件名称：<asp:Label ID="LabelEventName" runat="server"></asp:Label></span><span><asp:Label
                    ID="LabelEventCode" runat="server"></asp:Label></span></div>
            <div>
                检查单位：<asp:Label ID="LabelEventCheckUnit" runat="server"></asp:Label></div>
            <div>
                负责人：<asp:Label ID="LabelEventEmpName" runat="server"></asp:Label></div>
            <div>
                备注：<asp:Label ID="LabelEventMemo" runat="server"></asp:Label></div>
        </div>
        <div runat="server" id="divRoad">
            <!--路段详细数据-->
            <div>
                <span>路段名称：<asp:Label ID="LabelRoadName" runat="server"></asp:Label></span><span><asp:Label
                    ID="Label2" runat="server"></asp:Label></span></div>
            <div>
                所属项目：<asp:Label ID="LabelRoadProject" runat="server"></asp:Label></div>
            <div>
                路段类型：<asp:Label ID="LabelRoadType" runat="server"></asp:Label></div>
            <div>
                备注：<asp:Label ID="LabelRoadMemo" runat="server"></asp:Label></div>
        </div>
        <div runat="server" id="divQC">
            <div>
                <div>
                    <asp:HyperLink ID="LinkImageSource" runat="server" Width="150" Height="160" Target="_blank"></asp:HyperLink>
                </div>
                <div>
                    <span><span>数据采集时间：</span><span><asp:Label ID="LabelDataFetchTime" runat="server"></asp:Label></span></span></div>
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
        <div runat="server" id="divNoQC" visible="false">
            暂时没有质量监控数据</div>
    </div>
    </form>
</body>
</html>
