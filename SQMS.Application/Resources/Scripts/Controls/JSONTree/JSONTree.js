    /*
    * =======���οؼ��ͻ�����=======
    *
    * ���ID������������(��������'_'����)��
    *	��֧��㣺ID => Tree ID + Branch_Node + Node Name
    *	Ҷ�ӽ�㣺ID => Tree ID + Leaf_Node + Node Name
    *
    * ���Name������������(��������'$'����)��
    *	��֧��㣺Name => Tree ID + Branch$Node + Node Name
    *	Ҷ�ӽ�㣺Name => Tree ID + Leaf$Node + Node Name
    *
    * ��֧��������ID������������ID => Tree ID + Branch_Node + Node Name + "Container"
    * ��֧��������Name������������Name => Tree ID + Branch$Node + Node Name + "Container"
    *    
    * TreeID:���οؼ�Ψһ��ʶ    
    */
    function JSONTreeView(TreeID, TreeContainerID)
    {
        //˽�г�Ա
		//���οؼ�Ψһ��ʶ
        this._treeId = TreeID;

		//���οؼ�����ID
		this._treeContainerId = TreeContainerID;

		//ͼƬ��Ŀ¼
		this._imageBasePath = "./Images/common/";

		//���չ��ͼƬ
		this._imageFolderOpen = "folderopen.gif";

		//�����չͼƬ
		this._imageFolderClose = "folderclose.gif";

		//Ҷ�ӽ��ͼƬ
		this._imageLeafNode = "leaf.gif";
    }
    
    /*�¼�����*/
    //��������������¼�����
    JSONTreeView.prototype.OnMouseOverEvent = Tree_Node_MouseOverEventHandler;
    
    //��������Ƴ������¼�����
    JSONTreeView.prototype.OnMouseOutEvent = Tree_Node_MouseOutEventHandler;
    
	//���÷�֧��㸴ѡ��ѡ��/ȡ���¼�����
    JSONTreeView.prototype.OnBranchNodeCheckedEvent = Tree_BranchNode_CheckedEventHandler;

	//��㵥���¼�
	JSONTreeView.prototype.OnNodeClickedEvent = null;
    
    /*������Ա*/

	//ȡ��ѡ�н�������ֵ
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
					
					//ֻ��ű�ѡ�е�Ҷ�ӽ�������
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

	//���÷�֧���չ��ͼƬ
	JSONTreeView.prototype.setFolderOpenImage = function (imageName)
	{
		this._imageFolderOpen = imageName;
	}
	
	//��ȡ��֧���չ��ͼƬ
	JSONTreeView.prototype.getFolderOpenImage = function ()
	{
		return this._imageFolderOpen;
	}

	//����Ҷ�ӽ������ͼƬ
	JSONTreeView.prototype.setLeafNodeImage = function (imageName)
	{
		this._imageLeafNode = imageName;
	}

	//��ȡҶ�ӽ������ͼƬ
	JSONTreeView.prototype.getLeafNodeImage = function ()
	{
		return this._imageLeafNode;
	}

	//���÷�֧�������ͼƬ
	JSONTreeView.prototype.setFolderCloseImage = function (imageName)
	{
		this._imageFolderClose = imageName;
	}

	//��ȡ��֧�������ͼƬ
	JSONTreeView.prototype.getFolderCloseImage = function ()
	{
		return this._imageFolderClose;
	}

	//����ͼƬ��Ŀ¼
	JSONTreeView.prototype.setImageBasePath = function (path)
	{
		this._imageBasePath = path;
	}

	//ȡ��ͼƬ��Ŀ¼
	JSONTreeView.prototype.getImageBasePath = function ()
	{
		return this._imageBasePath;
	}

    //�Ƿ������ѡ��
    JSONTreeView.prototype.hasCheckbox = false;
    
    //�Ƿ��ʼ�����״̬
    JSONTreeView.prototype.isInitExpand = true;

	//�����Ϊ��������
	JSONTreeView.prototype.isLinkNode = false;
    
    /*
    * �����
    * TreeDataModel:����ӽ�����������
    * TreeContainer:��Ÿ���HTML DOMԪ�ص�����	
	*
	* TODO:Ϊ������ͼƬ���һ����Ӧ��������������
    */
    JSONTreeView.prototype.BuildTree = function (BranchData, ParentContainer)
    {
        var leafItem = null;		    //�޷�֧��Ҷ�ӽ��
        var branchItem = null;			//�з�֧�ķ�֧���
	    var nodeText = null;		    //�����������
	    
		//���ɴ��ѡ�н�����ݵ�������
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

			//ÿ����������ֵ��
			var valueObj = document.createElement("input");
			valueObj.setAttribute("id",this._treeId+"_Node_"+BranchData[i]["Name"]+"_HiddenValue");
			valueObj.setAttribute("name","Node$SelectedHiddenValue");
			valueObj.setAttribute("type","hidden");
			valueObj.setAttribute("value",BranchData[i]["Tag"].toString());
			leafItem.appendChild(valueObj);
						
			//��ѡ����
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

			//���ͼƬ����
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

		    //����ÿ�����һ��������ʽ
		    if (i == BranchData["length"] - 1)
		    {
			    leafItem.setAttribute("className","last");
		    }

			//�����ӽ��
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

				//���ƽ��չ��������ʱ��ͼƬ
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
				
				//��ʼ�����չ��״̬Ϊ�棬�ҵ�ǰ��֧��״̬Ϊ����
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
			    this.BuildTree(BranchData[i]["Nodes"],branchItem);   //�ݹ鹹���ӽ��
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