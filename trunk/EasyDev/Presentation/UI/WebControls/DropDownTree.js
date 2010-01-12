var isExpand = false;

function SwitchDropdownTree(id) {
    var obj = document.getElementById(id + '_tree_frame');
    var objBtn = document.getElementById(id + "_dropdownbutton");

    if (isExpand == false) {
        obj.style.display = "block";
        isExpand = true;
    }
    else {
        obj.style.display = "none";
        isExpand = false;
    }

    window.event.cancelBubble = true;
}

function CollapseDropdownTree(id) {
    if (isExpand) {
        var obj = document.getElementById(id + '_tree_frame');
        obj.style.display = "none";
        isExpand = false;
    }
}