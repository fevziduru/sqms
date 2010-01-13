/*
* DropDownTree client side object model
*/
function DropDownTree(id) {
    this.Id = id;
}

DropDownTree.prototype.isExpand = false;

/*
* Open or close the tree panel
* Author: Yin.P
*/
DropDownTree.prototype.switchDropdownTree = function() {
    var objDropdownButton = document.getElementById(this.Id + "_dropdownbutton");
    var objTreeFrame = document.getElementById(this.Id + '_tree_frame');
    if (this.isExpand == false) {
        objTreeFrame.style.display = "block";
        objTreeFrame.style.zIndex = 9999;
        objDropdownButton.src = "dropdown_pressed.png";
        this.isExpand = true;
    }
    else {
        objTreeFrame.style.display = "none";
        objDropdownButton.src = "dropdown_normal.png";
        this.isExpand = false;
    }

    window.event.cancelBubble = true;
};

/*
* Close the tree panel
* Author: Yin.P
*/
DropDownTree.prototype.collapseDropdownTree = function() {
    var objDropdownButton = document.getElementById(this.Id + "_dropdownbutton");
    var objTreeFrame = document.getElementById(this.Id + '_tree_frame');
    if (this.isExpand) {
        objTreeFrame.style.display = "none";
        objDropdownButton.src = "dropdown_normal.png";
        this.isExpand = false;
    }
};

/*
* Set text and value
* Author: Yin.P
*/
DropDownTree.prototype.selectNode = function(id, text, value) {
    var txt = document.getElementById(id + "__SelectedText");
    var val = document.getElementById(id + "__SelectedValue");

    if (txt != null) {
        txt.value = text;
    }

    if (val != null) {
        val.value = value;
    }

    this.collapseDropdownTree();
};

/*
* Get selected text
* Author: Yin.P
*/
DropDownTree.prototype.getSelectedText = function() {
    var txt = document.getElementById(this.Id + "__SelectedText");
    return txt.value;
};

/*
* Get selected value
* Author: Yin.P
*/
DropDownTree.prototype.getSelectedValue = function() {
    var val = document.getElementById(this.Id + "__SelectedValue");
    return val.value;
};