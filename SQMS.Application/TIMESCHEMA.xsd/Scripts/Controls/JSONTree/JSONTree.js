    /*
    * =======树形控件客户端类=======
    *
    * 结点ID属性命名规则(各部分用'_'连接)：
    *	分支结点：ID => Tree ID + Branch_Node + Node Name
    *	叶子结点：ID => Tree ID + Leaf_Node + Node Name
    *
    * 结点Name属性命名规则(各部分用'$'连接)：
    *	分支结点：Name => Tree ID + Branch$Node + Node Name
    *	叶子结点：Name => Tree ID + Leaf$Node + Node Name
    *
    * 分支容器对象ID属性命名规则：ID => Tree ID + Branch_Node + Node Name + "Container"
    * 分支容器对象Name属性命名规则：Name => Tree ID + Branch$Node + Node Name + "Container"
    *    
    * TreeID:树形控件唯一标识    
    */
    function JSONTreeView(TreeID, TreeContainerID)
    {
        //私有成员
		//树形控件唯一标识
        this._treeId = TreeID;

		//树形控件容器ID
		this._treeContainerId = TreeContainerID;

		//图片基目录
		this._imageBasePath = "./Images/common/";

		//结点展开图片
		this._imageFolderOpen = "folderopen.gif";

		//结点收展图片
		this._imageFolderClose = "folderclose.gif";

		//叶子结点图片
		this._imageLeafNode = "leaf.gif";
    }
    
    /*事件处理*/
    //设置鼠标进入结点的事件处理
    JSONTreeView.prototype.OnMouseOverEvent = Tree_Node_MouseOverEventHandler;
    
    //设置鼠标移出结点的事件处理
    JSONTreeView.prototype.OnMouseOutEvent = Tree_Node_MouseOutEventHandler;
    
	//设置分支结点复选框选择/取消事件处理
    JSONTreeView.prototype.OnBranchNodeCheckedEvent = Tree_BranchNode_CheckedEventHandler;

	//结点单击事件
	JSONTreeView.prototype.OnNodeClickedEvent = null;
    
    /*公共成员*/

	//取得选中结点的数据值
	JSONTreeView.prototype.getSelectedValues = function ()
	{
		var treeObj = $(this._treeContainerId);
		var valueObjects = $objects_tag(treeObj,"li");
		var values = new Array();
		var index = -1;

		if (valueObjects != null && valueObjects.length>0)
		{
			for (var i=0 ;i<valueObjects.length ;i++ )
			{				
				var nodeId = valueObjects[i].getAttribute("id").toString();

				index = nodeId.indexOf("_Leaf");
				if (index >= 0)
				{
					var checkboxObj = $(nodeId.substr(0,index)+"_Checkbox");
					var hiddenValueObj = $(nodeId.substr(0,index)+"_HiddenValue");
					
					//只存放被选中的叶子结点的数据
					if (checkboxObj.getAttribute("checked") == true && nodeId.indexOf("_Leaf") >= 0)
					{
						if (hiddenValueObj.getAttribute("type") == "hidden")
						{
							values.push(hiddenValueObj.getAttribute("value").toString());
						}
					}
				}
			}
		}

		return values;
	}

	//设置分支结点展开图片
	JSONTreeView.prototype.setFolderOpenImage = function (imageName)
	{
		this._imageFolderOpen = imageName;
	}
	
	//获取分支结点展开图片
	JSONTreeView.prototype.getFolderOpenImage = function ()
	{
		return this._imageFolderOpen;
	}

	//设置叶子结点收折图片
	JSONTreeView.prototype.setLeafNodeImage = function (imageName)
	{
		this._imageLeafNode = imageName;
	}

	//获取叶子结点收折图片
	JSONTreeView.prototype.getLeafNodeImage = function ()
	{
		return this._imageLeafNode;
	}

	//设置分支结点收折图片
	JSONTreeView.prototype.setFolderCloseImage = function (imageName)
	{
		this._imageFolderClose = imageName;
	}

	//获取分支结点收折图片
	JSONTreeView.prototype.getFolderCloseImage = function ()
	{
		return this._imageFolderClose;
	}

	//设置图片基目录
	JSONTreeView.prototype.setImageBasePath = function (path)
	{
		this._imageBasePath = path;
	}

	//取得图片基目录
	JSONTreeView.prototype.getImageBasePath = function ()
	{
		return this._imageBasePath;
	}

    //是否输出复选框
    JSONTreeView.prototype.hasCheckbox = false;
    
    //是否初始化结点状态
    JSONTreeView.prototype.isInitExpand = true;

	//结点作为超级链接
	JSONTreeView.prototype.isLinkNode = false;
    
    /*
    * 输出树
    * TreeDataModel:存放子结点的数组数据
    * TreeContainer:存放父级HTML DOM元素的容器	
	*
	* TODO:为根结点的图片添加一个对应的属性用于设置
    */
    JSONTreeView.prototype.BuildTree = function (BranchData, ParentContainer)
    {
        var leafItem = null;		    //无分支的叶子结点
        var branchItem = null;			//有分支的分支结点
	    var nodeText = null;		    //结点数据内容
	    
		//生成存放选中结点数据的隐藏域
		/*if ($(this._treeId+"_Selected_NodeValues_Hidden") == null)
		{
			var hiddenValues = document.createElement("input");
			hiddenValues.setAttribute("id",this._treeId+"_Selected_NodeValues_Hidden");
			hiddenValues.setAttribute("name",this._treeId+"$Selected$NodeValues$Hidden");
			hiddenValues.setAttribute("type","hidden");
			$(this._treeContainerId).appendChild(hiddenValues);
		}*/
		
	    for (var i=0; i<BranchData["length"]; i++ )
	    {
			if (this.isLinkNode == true)
			{
				nodeText = document.createElement("a");
				if (BranchData[i]["Type"] == 0 && BranchData[i]["Url"] != "")
				{
					nodeText.href = BranchData[i]["Url"];
				}
				else
				{
					nodeText.href="javascript:void(0)";	
				}				
			}
			else
			{
				nodeText = document.createElement("span");				
			}

			nodeText.innerText = BranchData[i]["Name"];
			nodeText.setAttribute("id",this._treeId+"_Node_"+BranchData[i]["Name"]+"_DisplayName");
			nodeText.setAttribute("name",this._treeId+"$Node$"+BranchData[i]["Name"]+"$DisplayName");
			nodeText.onmouseover = this.OnMouseOverEvent;
			nodeText.onmouseout = this.OnMouseOutEvent;

		    leafItem = document.createElement("li");

			//每个结点的隐藏值域
			var valueObj = document.createElement("input");
			valueObj.setAttribute("id",this._treeId+"_Node_"+BranchData[i]["Name"]+"_HiddenValue");
			valueObj.setAttribute("name","Node$SelectedHiddenValue");
			valueObj.setAttribute("type","hidden");
			valueObj.setAttribute("value",BranchData[i]["Tag"].toString());
			leafItem.appendChild(valueObj);
						
			//复选框处理
			if (this.hasCheckbox == true)
			{
				var checkBoxObj = document.createElement("input");
				checkBoxObj.setAttribute("type","checkbox");
				checkBoxObj.setAttribute("id",this._treeId+"_Node_"+BranchData[i]["Name"]+"_Checkbox");
				checkBoxObj.setAttribute("name",this._treeId+"$Node$"+BranchData[i]["Name"]+"$Checkbox");
				checkBoxObj.setAttribute("className","nodecheckbox");
				checkBoxObj.onclick = this.OnBranchNodeCheckedEvent;
				leafItem.appendChild(checkBoxObj);
			}

			var basePath = this.getImageBasePath();
			var folderOpen = this.getFolderOpenImage();
			var folderClose = this.getFolderCloseImage();
			var leafNode = this.getLeafNodeImage();

			//结点图片处理
			if ((folderOpen != null && typeof(folderOpen) != 'undefined') && 
					(folderClose != null && typeof(folderClose) != 'undefined') &&
					(leafNode != null && typeof(leafNode) != 'undefined'))
			{
				var imageObj = document.createElement("img");
				imageObj.setAttribute("width","18");
				imageObj.setAttribute("height","18");
				imageObj.setAttribute("id",this._treeId+"_Node_"+BranchData[i]["Name"]+"_NodeImage");
				imageObj.setAttribute("name",this._treeId+"$Node$"+BranchData[i]["Name"]+"$NodeImage");
				imageObj.setAttribute("className","nodeimage");
				imageObj.setAttribute("align","absmiddle");

				if (BranchData[i]["Type"] == 1)		//Branch Expanded
				{
					if (BranchData[i]["Expand"] == true)
					{
						imageObj.setAttribute("src",this.getImageBasePath()+folderOpen);
					}
					else
					{
						imageObj.setAttribute("src",this.getImageBasePath()+folderClose);
					}					
				}
				else if (BranchData[i]["Type"] == 0)		//Branch Folded
				{
					imageObj.setAttribute("src",this.getImageBasePath()+leafNode);
				}

				leafItem.appendChild(imageObj);
			}
			
		    leafItem.appendChild(nodeText);
			leafItem.appendChild(valueObj);

		    //处理每层最后一个结点的样式
		    if (i == BranchData["length"] - 1)
		    {
			    leafItem.setAttribute("className","last");
		    }

			//产生子结点
		    if (BranchData[i]["Nodes"] != null)
		    {
			    var nodeName = BranchData[i]["Name"];

			    leafItem.setAttribute("id",this._treeId+"_Node_"+nodeName);
			    leafItem.setAttribute("name",this._treeId+"$Node$"+nodeName);
				
			    leafItem.onclick = function ()
					{
						BranchNode_BackgroundColorSwitcher(
							this.id,
							basePath,
							folderClose,
							folderOpen
						);
					};

				//控制结点展开、收折时的图片
				if (this.isInitExpand == true)
				{				
					if (BranchData[i]["Expand"] == true)
					{
						leafItem.style.backgroundImage = "url(./Images/standard/minus_node.gif)";
					}
					else
					{
						leafItem.style.backgroundImage = "url(./Images/standard/plus_node.gif)";
					}
				}
				else
				{
					leafItem.style.backgroundImage = "url(./Images/standard/minus_node.gif)";
				}

			    branchItem = document.createElement("ul");
				
				//初始化结点展开状态为真，且当前分支的状态为收折
			    if (this.isInitExpand == true && BranchData[i]["Expand"] == false)
			    {
			        if (branchItem.style != null)
			        {
			            branchItem.style.display = "none";
			        }
			    }
				
			    branchItem.setAttribute("id",this._treeId+"_Node_"+nodeName+"_Container");
			    branchItem.setAttribute("name",this._treeId+"$Node$"+nodeName+"$Container");
			    ParentContainer.appendChild(leafItem);
			    this.BuildTree(BranchData[i]["Nodes"],branchItem);   //递归构造子结点
			    ParentContainer.appendChild(branchItem);
		    }
		    else
		    {
				if (this.OnNodeClickedEvent != null)
				{
					leafItem.onclick = this.OnNodeClickedEvent;
				}
			    leafItem.setAttribute("id",this._treeId+"_Node_"+BranchData[i]["Name"]+"_Leaf");
			    leafItem.setAttribute("name",this._treeId+"$Node$"+BranchData[i]["Name"]+"$Leaf");
			    ParentContainer.appendChild(leafItem);
		    }
	    }
    }