/**
 * Created by yuanshuai5 on 2016/8/15.
 */
var myExcelFile = new Object();
function downloadTemplate() {
    window.open(GetDocumentRoot() + "/不良信息导入模板.xls", 'hd');
}

function importExcel() {
    $.ajax({
        type: "POST",
        url: "importBlackList.pfv",
        data: {
            fileData: myExcelFile
        },
        dataType: "json",
        success: function (data) {
            if (data.length > 8) alert(data);
            else
                alert("导入" + data + "条数据成功！");
        },
        error: function (data) {
            alert("导入失败!");
        }
    });
}

$(function () {
    $("#fileUpload").change(function (evt) {
        var file = evt.currentTarget.files[0];
        var reader = new FileReader();
        reader.onload = function (evt) {
            myExcelFile = evt.target.result;
        };
        reader.readAsDataURL(file);
    })
});