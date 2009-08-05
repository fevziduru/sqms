//切换分支结点的收折与展开
function BranchNode_BackgroundColorSwitcher(branchID, basePath, folderCloseImg, folderOpenImg)
{
	var imageObj = $(branchID+"_NodeImage");
	var branchObj = $(branchID+"_Container");
	var branchNodeObj = $(branchID);

	if (branchObj != null)
	{
		if (branchObj.style.display == "none")
		{
			branchObj.style.display = "block";
			if (imageObj != null)
			{
				imageObj.src = basePath+folderOpenImg;
			}
			branchNodeObj.style.backgroundImage = "url(./Images/standard/minus_node.gif)";
		}
		else
		{
			branchObj.style.display = "none";
			if (imageObj != null)
			{
				imageObj.src = basePath+folderCloseImg;
			}
			branchNodeObj.style.backgroundImage = "url(./Images/standard/plus_node.gif)";
		}
	}
}

//当鼠标经过的时候切换树结点的背景
function Tree_Node_MouseOverEventHandler()
{
	if (this != null)
	{
		this.setAttribute("className","mouseover");
	}
}

//当鼠标经过的时候切换树结点的背景
function Tree_Node_MouseOutEventHandler()
{
	if (this != null)
	{
		this.setAttribute("className","mouseout");
	}
}

//分支结点复选框选中/取消事件处理
function Tree_BranchNode_CheckedEventHandler()
{	
	if (this)
	{		
		var tmp = "_CheckBox";
		var containerId = this.id.substr(0,this.id.length-tmp.length)+"_Container";		//容器ID
		var checkBoxes = $objects_tag($(containerId),"input");	//结点下的所有复选框

		if (checkBoxes != null)
		{			
			for (var i=0; i<checkBoxes.length ;i++ )
			{
				if (checkBoxes[i]["type"]=="checkbox")
				{
					checkBoxes[i]["checked"] = this["checked"];
				}
			}
		}

		//阻止事件进一步向上组元素传播（停止事件冒泡）
		if (window.event.cancelBubble != null)
		{
			window.event.cancelBubble = true;
		}
		else if (event.stopPropagation)
		{
			event.stopPropagation();
		}
	}	
}