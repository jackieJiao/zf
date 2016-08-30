/**
 * Created by yuanshuai5 on 2016/8/16.
 */
var page = {
    userName: "",
    idCard: ""
};
// 首页
$('#firstPageLink').click(function(e) {
    page.pageNow = 1;
    queryData();
});

// 上一页
$('#prePageLink').click(function(e) {
    page.pageNow = page.pageNow - 1;
    queryData();
});
// 下一页
$('#nextPageLink').click(function(e) {
    page.pageNow = page.pageNow + 1;
    queryData();
});
// 末页
$('#lastPageLink').click(function(e) {
    page.pageNow = page.totalPageCount;
    queryData();
});

function queryData() {
    page.userName = $("#userName").val();
    page.idCard = $("#idCard").val();
    $.ajax({
        type: "POST",
        url: "GetHistoryReportList.pfv",
        data: page,
        dataType: "json",
        contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
        success: function (data) {
            if (!!data) {
                var rows = data.rows;
                page = data.pageinfo;
                $("#queryResultTable").children().remove();
                $.each(rows, function (i, val) {
                    var index = (page.pageNow - 1) * page.pageSize + (i + 1);
                    var dataFrom = "";
                    switch (val.dataFrom){
                        case '1':dataFrom = '页面';break;
                        case '2':dataFrom = '接口';break;
                        case '3':dataFrom = '存量';break;
                        default:break;
                    }
                    $("#queryResultTable").append(
                        "<tr><td>" + index +
                        "</td><td>" + val.name +
                        "</td><td>" + val.cardid +
                        "</td><td>" + val.instiid +
                        "</td><td>" + val.contractId +
                        "</td><td>" + val.sinotime +
                        "</td><td>" + dataFrom +
                        "</td><td>" + "<a class='label label-warning label-mini' href='downreport.pfv?reportId="+val.reportId+"'>下载报告</a>" +
                        "</td></tr>"
                    )
                });
                $("#firstPageLink").hide();
                $("#prePageLink").hide();
                $("#nextPageLink").hide();
                $("#lastPageLink").hide();
                if (page.hasFirst) {
                    $("#firstPageLink").show();
                }
                if (page.hasLast) {
                    $("#lastPageLink").show();
                }
                if (page.hasNext) {
                    $("#nextPageLink").show();
                }
                if (page.hasPre) {
                    $("#prePageLink").show();
                }
            }
        },
        error: function (data) {

        }
    });
}

$(function() {
    queryData();
    $('#queryBtn').click(function (e) {
        // 执行查询，然后动态拼接数据表格,id=databody
        page.pageNow = 1;
        queryData();
    });
});