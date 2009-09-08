var regex = /(^[0-2]?[0-9]:[0-5]?[0-9]:[0-5]?[0-9]$)|(^[0-2]?[0-9]:[0-5]?[0-9]$)/;
var isAllValidated = false;

//检查时间格式
function checkTime(timebox) {
        document.getElementById(timebox.id + "_hint").style.display = "none";

        if (timebox.value !== "") {
                if (regex.test(timebox.value) == true) {
                        timebox.style.backgroundColor = "#fff";
                        timebox.style.color = "#000";
                        document.getElementById(timebox.id + "_errinfo").style.display = "none";
                        isAllValidated = true;
                }
                else {
                        timebox.style.backgroundColor = "#FFF688";
                        timebox.style.color = "#ff0000";
                        //timebox.focus();
                        document.getElementById(timebox.id + "_errinfo").style.display = "block";
                        isAllValidated = false;
                }
        }
}

//显示提示信息
function showHint(obj) {
        document.getElementById(obj.id + "_hint").style.display = "block";
}

//初始化时间控件
function InitTimeBox(id, hintMsg, errMsg) {
        var innerHtml = "<div id='" + id + "_main'>";
        innerHtml += "<input type='text' id='" + id + "' value='' name='time' onchange='javascript:checkTime(this)' onblur='javascript:checkTime(this)' onfocus='javascript:showHint(this)' />";
        innerHtml += "<div id='" + id + "_hint' style='margin:0 10;z-index:1000;display:none;position:absolute;border:#6B90DA 1px solid;background-color:#F0F7F9;text-align:center;vertical-align:middle'>";
        innerHtml += "<span style='margin:0 10;z-index:1000;font-size:10pt;vertical-align:absmiddle;padding:30;text-align:center'>" + hintMsg + "</span></div>";
        innerHtml += "<div id='" + id + "_errinfo' style='margin:0 10;z-index:1000;display:none;position:absolute;border:#ff0000 1px solid;background-color:#FFEDDB'>";
        innerHtml += "<span style='margin:0 10;z-index:1000;font-size:10pt;vertical-align:absmiddle; padding:30;text-align:center'>" + errMsg + "</span></div></div>";

        return innerHtml
}

//创建客户端时间控件
function CreateTimeBox(containerId, timeBoxId, hintMsg, errMsg) {
        document.getElementById(containerId).innerHTML += InitTimeBox(timeBoxId, hintMsg, errMsg);
}

//从客户端添加时间控件函数
var count = 0;
function addTimeBox() {
        count++;
        CreateTimeBox('container', 'tb' + "_" + count, '时间格式为hh24(小时):mm(分钟):ss(秒)', '时间格式不对,时间格式应为hh24(小时):mm(分钟):ss(秒)');
}