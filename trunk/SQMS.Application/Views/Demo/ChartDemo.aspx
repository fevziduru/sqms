﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChartDemo.aspx.cs" Inherits="SQMS.Application.Views.Demo.ChartDemo" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
        <title></title>
        <!-- Dependencies -->

        <script type="text/javascript" src="../../Resources/Scripts/Controls/yui/build/yahoo-dom-event/yahoo-dom-event.js"></script>

        <script type="text/javascript" src="../../Resources/Scripts/Controls/yui/build/element/element-min.js"></script>

        <script type="text/javascript" src="../../Resources/Scripts/Controls/yui/build/datasource/datasource-min.js"></script>

        <script type="text/javascript" src="../../Resources/Scripts/Controls/yui/build/event/event-min.js"></script>
                
        <script type="text/javascript" src="../../Resources/Scripts/Controls/yui/build/json/json-min.js"></script>

        <!-- Source files -->

        <script type="text/javascript" src="../../Resources/Scripts/Controls/yui/build/charts/charts-min.js"></script>

</head>
<body>
<form  runat="server">
 <span>Monthly Expenses</span>
<div id="chart">Unable to load Flash content. The YUI Charts Control requires Flash Player 9.0.45 or higher. You can download the latest version of Flash Player from the <a href="http://www.adobe.com/go/getflashplayer">Adobe Flash Player Download Center</a>.</p></div>

<script type="text/javascript">

        YAHOO.widget.Chart.SWFURL = "charts.swf"; 
        YAHOO.example.monthlyExpenses =
	[
		{ month: "January", rent: 880.00, utilities: 894.68 },
		{ month: "February", rent: 880.00, utilities: 901.35 },
		{ month: "March", rent: 880.00, utilities: 889.32 },
		{ month: "April", rent: 880.00, utilities: 884.71 },
		{ month: "May", rent: 910.00, utilities: 879.811 },
		{ month: "June", rent: 910.00, utilities: 897.95 }
	];

        var myDataSource = new YAHOO.util.DataSource(YAHOO.example.monthlyExpenses);
        myDataSource.responseType = YAHOO.util.DataSource.TYPE_JSARRAY;
        myDataSource.responseSchema =
	{
	        fields: ["month", "rent", "utilities"]
	};

        //--- chart

        var seriesDef =
	[
		{ displayName: "Rent", yField: "rent" },
		{ displayName: "Utilities", yField: "utilities" }
	];

        YAHOO.example.formatCurrencyAxisLabel = function(value) {
                return YAHOO.util.Number.format(value,
		{
		        prefix: "$",
		        thousandsSeparator: ",",
		        decimalPlaces: 2
		});
        }

        YAHOO.example.getDataTipText = function(item, index, series) {
                var toolTipText = series.displayName + " for " + item.month;
                toolTipText += "\n" + YAHOO.example.formatCurrencyAxisLabel(item[series.yField]);
                return toolTipText;
        }

        var currencyAxis = new YAHOO.widget.NumericAxis();
        currencyAxis.minimum = 800;
        currencyAxis.labelFunction = YAHOO.example.formatCurrencyAxisLabel;

        var mychart = new YAHOO.widget.LineChart("chart", myDataSource,
	{
	        series: seriesDef,
	        xField: "month",
	        yAxis: currencyAxis,
	        dataTipFunction: YAHOO.example.getDataTipText,
	        //only needed for flash player express install
	        expressInstall: "charts.swf"
	});

</script>
</form>
</body>
</html>
