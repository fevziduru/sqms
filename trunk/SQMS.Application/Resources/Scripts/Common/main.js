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

function popup(textfieldid, valuefieldid, textFieldName, keyFieldName, headerColumns, textField, keyField, searchColumn, service, assemblyName) {
        var date = new Date();
        var result = window.showModalDialog(
        "/Views/Components/PopupReference/PopupDialog.aspx?tfn=" + textFieldName +
                "&kfn=" + keyFieldName +
                "&hc=" + headerColumns +
                "&tf=" + textField +
                "&kf=" + keyField +
                "&sf=" + searchColumn +
                "&s=" + service +
                "&t=" + assemblyName + 
                "&r=" + date.valueOf(), 
        document.getElementById(textfieldid),
        "dialogWidth=800px;dialogHeight=600px");
        if (result != null) {
                document.getElementById(valuefieldid).value = result[keyField];
                document.getElementById(textfieldid).value = result[textField];
        }
}