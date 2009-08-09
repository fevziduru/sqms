<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MonitorPointDetail.aspx.cs"
    Inherits="SQMS.Application.Views.Quality.MonitorPointDetail" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        body
        {
            margin: 0 0 0 0;
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
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <div id="top">
            <!--监控点详细数据-->
        </div>
        <div id="divLeft" class="left">
            <div>
                <!--时间段过滤器-->
            </div>
            <div>
                <!--QC数据列表，分为常态和巡检两个tab-->
            </div>
        </div>
        <div id="right" class="right">
            <!--QC详细数据-->
        </div>
    </div>
    </form>
</body>
</html>
