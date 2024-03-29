﻿/// <reference name="MicrosoftAjax.js"/>
var StaticMapType = {};
StaticMapType.ROAD_MAP = "roadmap";
StaticMapType.MOBILE = "mobile";
StaticMapType.SATELLITE = "satellite";
StaticMapType.TERRAIN = "terrain";
StaticMapType.HYBRID = "hybrid";

var StaticMapFormat = {
	GIF: "gif",
	JPG: "jpg",
	JPG_BASELINE: "jpg-baseline",
	PNG8: "png8",
	PNG32: "png32"
}
var StaticMapMarkerSize = {
	TINY: "tiny",
	MID: "mid",
	SMALL: "small"
}
var StaticMapMarkerColor = {
	BLACK: "black", BROWN: "brown", GREEN: "green", PURPLE: "purple", YELLOW: "yellow", BLUE: "blue", GRAY: "gray", ORANGE: "orange", RED: "red", WHITE: "white"
}
function StaticMapMarker(lat, lng, size, color, letter)
{
	this.lat = lat;
	this.lng = lng;
	this.size = size ? size : StaticMapMarkerSize.SMALL;
	this.color = color ? color : StaticMapMarkerColor.ORANGE;
	this.letter = letter;
}
function StaticMap(containerElId)
{
	this.key = "ABQIAAAA41EnQa1wtzf10JQz5YdqmRQ6hbvwoS9GD89j9qEqTKobihdwiBTS_QjMbHbdYwkxWiBA-XpSkWHt_w";
	this.centerLat = 0;
	this.centerLng = 0;
	this.zoom = 0;
	this.mapType = StaticMapType.ROAD_MAP;
	this.format = StaticMapFormat.GIF;
	this.markers = new Array();

	this.containerEl = document.getElementById(containerElId);
	this.width = 300;
	this.height = 200;
}
StaticMap.prototype.render = function()
{
	if (!this.containerEl)
	{
		return;
	}
	var markers = "";
	for (var i = 0; i < this.markers.length; i++)
	{
		if (i == 0)
		{
			markers += this.markers[i].lat + "," + this.markers[i].lng + "," + this.markers[i].size + this.markers[i].color + this.markers[i].letter;
		} else
		{
			markers += "|" + this.markers[i].lat + "," + this.markers[i].lng + "," + this.markers[i].size + this.markers[i].color + this.markers[i].letter;
		}
	}
	var url = "http://ditu.google.cn/staticmap?"
	//        + "center=" + this.centerLat + "," + this.centerLng + "&"
	//        + "zoom=" + this.zoom + "&"
        + "size=" + this.width + "x" + this.height + "&"
        + "maptype=" + this.mapType + "&"
        + "markers=" + markers + "&"
        + "key=" + this.key + "&"
        + "sensor=false";
	var imageEl = new Image();
	imageEl.style.boder = "none";

	imageEl.setAttribute("src", url);
	if (this.containerEl.children.length > 0)
	{
		this.containerEl.removeChild(this.containerEl.children[0]);
	}
	this.containerEl.appendChild(imageEl);
}
StaticMap.prototype.addMarker = function(marker)
{
	if (marker)
	{
		this.markers.push(marker);
	}
}

var StaticMapFactory = {
	currentMpId: "",
	currentStaicMap: null,
	isInMarkersLoaded_: false,
	/**
	* @params containerElId string the static map container element's id.
	* @params currMpId string the current monitor point id,this point will be displayed on static map with red marker. 
	* @params w int (option) the static map's width,default width is 300px.
	* @params h int (option) the static map's height,default height is 200px.
	*/
	createStaticMap: function(containerElId, currMpId, w, h)
	{
		this.currentMpId = currMpId;
		this.currentStaicMap = new StaticMap(containerElId);
		this.isInMarkersLoaded_ = false;
		if (w && w > 0)
		{
			this.currentStaicMap.width = w;
		}
		if (h && h > 0)
		{
			this.currentStaicMap.height = h;
		}

		var url = "/Views/AjaxServices/QualityControl/MonitorPoint.aspx?p=AjaxServicesQualityControlMonitorPoint&mpid=" + currMpId;

		var handler = Function.createDelegate(this, function(executor, eventArgs)
		{
			if (executor.get_statusCode() == "200")
			{
				var body = executor.get_responseData();
				var mps = [];
				try
				{
					mps = Sys.Serialization.JavaScriptSerializer.deserialize(body);
				}
				catch (e) { };
				this.createStaticMarkers(mps);
				var roadUrl = "/Views/AjaxServices/QualityControl/MonitorPoint.aspx?p=AjaxServicesQualityControlMonitorPoint&roadid=" + mps[0].RoadId;
				if (this.isInMarkersLoaded_ !== true)
				{
					this.fetchMonitorPoints_(roadUrl, Function.createDelegate(this, function(executor, eventArgs)
					{
						if (executor.get_statusCode() == "200")
						{
							var body = executor.get_responseData();
							var mps = [];
							try
							{
								mps = Sys.Serialization.JavaScriptSerializer.deserialize(body);
							} catch (e) { };
							this.createStaticMarkers(mps);
							this.currentStaicMap.render();
							this.isInMarkersLoaded_ = true;
						}
					}));
				}
			}
		});
		this.fetchMonitorPoints_(url, handler);
		try
		{
			return handler;
		} finally
		{
			handler = null;
		}
	},
	fetchMonitorPoints_: function(url, handler)
	{
		var wRequest = new Sys.Net.WebRequest();
		wRequest.add_completed(handler);
		wRequest.set_url(url);
		wRequest.invoke();
	},
	createStaticMarkers: function(mps)
	{
		if (mps)
		{
			for (var i = 0; i < mps.length; i++)
			{
				if (mps[i].MonitorPointId == this.currentMpId)
				{
					this.currentStaicMap.addMarker(new StaticMapMarker(mps[i].Lat, mps[i].Lng, StaticMapMarkerSize.MID, StaticMapMarkerColor.RED, ""));
				} else if (mps[i].IsStart == true)
				{
					this.currentStaicMap.addMarker(new StaticMapMarker(mps[i].Lat, mps[i].Lng, StaticMapMarkerSize.MID, StaticMapMarkerColor.ORANGE, "s"));
				} else if (mps[i].IsEnd == true)
				{
					this.currentStaicMap.addMarker(new StaticMapMarker(mps[i].Lat, mps[i].Lng, StaticMapMarkerSize.MID, StaticMapMarkerColor.ORANGE, "e"));
				} else
				{
					this.currentStaicMap.addMarker(new StaticMapMarker(mps[i].Lat, mps[i].Lng, StaticMapMarkerSize.SMALL, StaticMapMarkerColor.ORANGE, ""));
				}
			}
		}
	}


}