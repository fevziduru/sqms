<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MPScoreTrendPart.ascx.cs"
        Inherits="SQMS.Application.Views.PortalParts.MPScoreTrendPart" %>
<!-- Dependencies -->
<!-- Sam Skin CSS for TabView -->
<link rel="stylesheet" type="text/css" href="../../Resources/Scripts/Controls/yui/build/assets/skins/sam/tabview.css" />
<!-- JavaScript Dependencies for Tabview: -->

<script type="text/javascript" src="../../Resources/Scripts/Controls/yui/build/yahoo-dom-event/yahoo-dom-event.js"></script>

<script type="text/javascript" src="../../Resources/Scripts/Controls/yui/build/element/element-min.js"></script>

<!-- Source file for TabView -->

<script type="text/javascript" src="../../Resources/Scripts/Controls/yui/build/tabview/tabview-min.js"></script>

<div class="yui-skin-sam">

        <script type="text/javascript">
                var myTabs = new YAHOO.widget.TabView("mpdata");  
        </script>

        <div id="mpdata" class="yui-navset">
                <ul class="yui-nav">
                        <li class="selected"><a href="#tab1"><em>周统计</em></a></li>
                        <li><a href="#tab2"><em>月统计</em></a></li>
                        <li><a href="#tab3"><em>年统计</em></a></li>
                </ul>
                <div class="yui-content">
                        <div>
                                <div id="chartWeek" style="width: 650; height: 350">
                                        Unable to load Flash content. The YUI Charts Control requires Flash Player 9.0.45
                                        or higher. You can download the latest version of Flash Player from the
                                </div>
                        </div>
                        <div>
                                <div id="chartMonth" style="width: 650; height: 350">
                                        Unable to load Flash content. The YUI Charts Control requires Flash Player 9.0.45
                                        or higher. You can download the latest version of Flash Player from the
                                </div>
                        </div>
                        <div>
                                <div id="chartYear" style="width: 650; height: 350">
                                        Unable to load Flash content. The YUI Charts Control requires Flash Player 9.0.45
                                        or higher. You can download the latest version of Flash Player from the
                                </div>
                        </div>
                </div>
        </div>
        <div style="text-align: right; margin: 5 5">
                <a href="#">更多</a>
        </div>
</div>

<script type="text/javascript">

        YAHOO.widget.Chart.SWFURL = "../../Resources/Swf/charts.swf";
        YAHOO.example.monthlyExpenses =
	[
		{ weekday: "星期一", mp1: 480.00, mp2: 894.68, mp3: 242.3 },
		{ weekday: "星期二", mp1: 580.00, mp2: 901.35, mp3: 332.3 },
		{ weekday: "星期三", mp1: 480.00, mp2: 859.32, mp3: 42.3 },
		{ weekday: "星期四", mp1: 480.00, mp2: 834.71, mp3: 642.3 },
		{ weekday: "星期五", mp1: 610.00, mp2: 879.811, mp3: 142.3 },
		{ weekday: "星期六", mp1: 710.00, mp2: 897.95, mp3: 533.3 },
		{ weekday: "星期天", mp1: 410.00, mp2: 1007.95, mp3: 252.3 }
	];

        var myDataSource = new YAHOO.util.DataSource(YAHOO.example.monthlyExpenses);
        myDataSource.responseType = YAHOO.util.DataSource.TYPE_JSARRAY;
        myDataSource.responseSchema =
	{
	        fields: ["weekday", "mp1", "mp2", "mp3"]
	};

        //--- chart

        var seriesDef =
	[
		{ displayName: "项目1", yField: "mp1" },
		{ displayName: "项目2", yField: "mp2" },
		{ displayName: "项目3", yField: "mp3" },
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
        currencyAxis.minimum = 0;
        currencyAxis.labelFunction = YAHOO.example.formatCurrencyAxisLabel;

        //Style object
        var styleDef =
	{
	        legend: { display: "bottom" },
	        xAxis:
	    {
	            majorTicks:
	        {
	                display: "inside",
	                length: 3,
	                size: 1
	        },
	            minorTicks:
	        {
	                display: "inside",
	                length: 2
	        },
	            labelRotation: 0
	    },
	        yAxis:
	    {
	            zeroGridLine:
	        {
	                size: 2,
	                color: 0xff0000
	        },
	            minorTicks: { display: "none" }
	    }
}
	
        var mychart = new YAHOO.widget.LineChart("chartWeek", myDataSource,
	{
	        style: styleDef,
	        series: seriesDef,
	        xField: "weekday",
	        yAxis: currencyAxis,
	        dataTipFunction: YAHOO.example.getDataTipText,
	        //only needed for flash player express install
	        expressInstall: "../../Resources/Swf/charts.swf"
	});

</script>

<script type="text/javascript">

        YAHOO.widget.Chart.SWFURL = "../../Resources/Swf/charts.swf"; 
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

        var mychart = new YAHOO.widget.LineChart("chartMonth", myDataSource,
	{
	        style:{
	                legend:{display:"bottom"},
	        },
	        series: seriesDef,
	        xField: "month",
	        yAxis: currencyAxis,
	        dataTipFunction: YAHOO.example.getDataTipText,
	        //only needed for flash player express install
	        expressInstall: "../../Resources/Swf/charts.swf"
	});

</script>

<script type="text/javascript">

        YAHOO.widget.Chart.SWFURL = "../../Resources/Swf/charts.swf"; 
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

        var mychart = new YAHOO.widget.LineChart("chartYear", myDataSource,
	{
	        style:{
	                legend:{display:"bottom"},
	        },
	        series: seriesDef,
	        xField: "month",
	        yAxis: currencyAxis,
	        dataTipFunction: YAHOO.example.getDataTipText,
	        //only needed for flash player express install
	        expressInstall: "../../Resources/Swf/charts.swf"
	});

</script>

