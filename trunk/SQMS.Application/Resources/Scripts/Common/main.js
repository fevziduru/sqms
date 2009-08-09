/*
*Purpose:用于列表全选
*Author:YinPSoft
*/
function SelectAll(id) {
    var grid = document.getElementById(id);
    if (grid == null) {
        return;
    }
    var checkBoxs = grid.getElementsByTagName('INPUT');
    if (checkBoxs == null || checkBoxs.length < 1) {
        return;
    }
    
    if (checkIsAllSelected(checkBoxs) == false) {
        for (var i = 0; i < checkBoxs.length; i++) {
            if (checkBoxs[i].name != "header") {
                if (checkBoxs[i].type == 'checkbox') {
                    if (checkBoxs[i].checked == false) {
                        checkBoxs[i].checked = true;
                    }
                }
            }
        }
    }
    else {
        for (var i = 0; i < checkBoxs.length; i++) {
            if (checkBoxs[i].name != "header") {
                if (checkBoxs[i].type == 'checkbox') {
                    checkBoxs[i].checked = false;
                }
            }
        }
    }
}

function checkIsAllSelected(objs) {
    var result = true;
    for (var i = 0; i < objs.length; i++) {
        if (objs[i].checked != null && objs[i].checked == false && objs[i].name != "header") {
            result = false;
            break;
        }
    }

    return result;
}
/******************************************************/