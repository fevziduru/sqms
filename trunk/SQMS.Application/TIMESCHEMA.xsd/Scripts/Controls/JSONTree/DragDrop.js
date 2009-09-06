/*function DragDrop(objId)
{
	this._dragObject = $(objId);

	this._originX = 0;

	this._originY = 0;

	this._offsetX = 0;

	this._offsetY = 0;

	this._isDraging = false;

	var OnDraging = function ()
	{
		if (window.event.button != 1)
		{
			return;
		}

		this._offsetX = document.body.scrollLeft + window.event.clientX-this._dragObject.style.pixelLeft;
		this._offsetY = document.body.scrollTop + window.event.clientY-this._dragObject.style.pixelTop;
		this._dragObject.className = "actived";
		this._isDraging = true;
	};

	var OnDrag = function ()
	{
		if(!this._isDraging)
		{
			return;
		}
		//¸üÐÂÎ»ÖÃ
		this._dragObject.style.pixelLeft = document.body.scrollLeft + window.event.clientX-this._offsetX;
		this._dragObject.style.pixelTop = document.body.scrollTop + window.event.clientY-this._offsetY;
	};

	var OnDraged = function ()
	{
		if (window.event.button != 1)
		{
			return;
		}
		this._isDraging = false;

		this._dragObject.style.pixelLeft = document.body.scrollLeft + window.event.clientX-this._offsetX;
		this._dragObject.style.pixelTop = document.body.scrollTop + window.event.clientY-this._offsetY;
	}
}

DragDrop.prototype.initDrag = function ()
{
	this._offsetX = this._originX;
	this._offsetY = this._originY;

	this._dragObject.onmousedown = this.OnDraging;
	//document.body.attachEvent("onmousemove",this.OnDrag);
	document.onmousemove = this.OnDrag;
	this._dragObject.onmouseup = this.OnDraged;
}*/


function DragDrop(o,s)  
{  
    if (typeof o == "string") o = document.getElementById(o);  
    o.orig_x = parseInt(o.style.left) - document.body.scrollLeft;  
    o.orig_y = parseInt(o.style.top) - document.body.scrollTop;  
    o.orig_index = o.style.zIndex;  
          
    o.onmousedown = function(a)  
    {  
        this.style.cursor = "move";  
        this.style.zIndex = 10000;  
        var d=document;  
        if(!a)a=window.event;  
        var x = a.clientX+d.body.scrollLeft-o.offsetLeft;  
        var y = a.clientY+d.body.scrollTop-o.offsetTop;  
        //author: www.longbill.cn  
        d.ondragstart = "return false;"  
        d.onselectstart = "return false;"  
        d.onselect = "document.selection.empty();"  
                  
        if(o.setCapture)  
            o.setCapture();  
        else if(window.captureEvents)  
            window.captureEvents(Event.MOUSEMOVE|Event.MOUSEUP);  

        d.onmousemove = function(a)  
        {  
            if(!a)a=window.event;  
            o.style.left = a.clientX+document.body.scrollLeft-x;  
            o.style.top = a.clientY+document.body.scrollTop-y;  
            o.orig_x = parseInt(o.style.left) - document.body.scrollLeft;  
            o.orig_y = parseInt(o.style.top) - document.body.scrollTop;  
        }  

        d.onmouseup = function()  
        {  
            if(o.releaseCapture)  
                o.releaseCapture();  
            else if(window.captureEvents)  
                window.captureEvents(Event.MOUSEMOVE|Event.MOUSEUP);  
            d.onmousemove = null;  
            d.onmouseup = null;  
            d.ondragstart = null;  
            d.onselectstart = null;  
            d.onselect = null;  
            o.style.cursor = "normal";  
            o.style.zIndex = o.orig_index;  
        }  
    }  
      
    if (s)  
    {  
        var orig_scroll = window.onscroll?window.onscroll:function (){};  
        window.onscroll = function ()  
        {  
            orig_scroll();  
            o.style.left = o.orig_x + document.body.scrollLeft;  
            o.style.top = o.orig_y + document.body.scrollTop;  
        }  
    }  
}  