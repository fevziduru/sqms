//�л���֧����������չ��
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

//����꾭����ʱ���л������ı���
function Tree_Node_MouseOverEventHandler()
{
	if (this != null)
	{
		this.setAttribute("className","mouseover");
	}
}

//����꾭����ʱ���л������ı���
function Tree_Node_MouseOutEventHandler()
{
	if (this != null)
	{
		this.setAttribute("className","mouseout");
	}
}

//��֧��㸴ѡ��ѡ��/ȡ���¼�����
function Tree_BranchNode_CheckedEventHandler()
{	
	if (this)
	{		
		var tmp = "_CheckBox";
		var containerId = this.id.substr(0,this.id.length-tmp.length)+"_Container";		//����ID
		var checkBoxes = $objects_tag($(containerId),"input");	//����µ����и�ѡ��

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

		//��ֹ�¼���һ��������Ԫ�ش�����ֹͣ�¼�ð�ݣ�
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