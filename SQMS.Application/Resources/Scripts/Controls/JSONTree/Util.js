var $ = function (id) 
{
	return document.getElementById(id); 
};

var $tag = function (tagname) 
{
	return document.getElementsByTagName(tagname);
};

var $objects_tag = function (obj,tagname) 
{
	var returnObj = null;
	if (obj != null)
	{
		returnObj = obj.getElementsByTagName(tagname);
	}

	return returnObj;
};

var $name = function (name)
{
	return document.getElementsByName(name);
};

var $objects_name = function (obj, name)
{
	var returnObj = null;
	if (obj != null)
	{
		returnObj = obj.getElementsByName(name);
	}

	return returnObj;
};