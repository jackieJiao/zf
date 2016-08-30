var page = {
    userName: "",
    idCard: ""
};
function downloadReport(reportId) {
    window.open(GetDocumentRoot() + "/WEB-INF/report/"+reportId+".pdf", 'hd');
}
function queryData() {
    page.userName = $("#userName").val();
    page.idCard = $("#idCard").val();
    $.ajax({
        type: "POST",
        url: "GetCunLiangList.pfv",
        data: page,
        dataType: "json",
        contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
        success: function (data) {
            if (!!data) {
                var rows = data.rows;
                page = data.pageinfo;
                $("#databody").children().remove();
                $.each(rows, function (i, val) {
                    var index = (page.pageNow - 1) * page.pageSize + (i + 1);
                    var status = "正常";
                    if (!!val.paymentLevel) status = "逾期";
                    $("#databody").append(
                        "<tr><td>" + index +
                        "</td><td>" + val.name +
                        "</td><td>" + val.cardId +
                        "</td><td>" + val.contractId +
                        "</td><td>" + val.stopTime +
                        "</td><td>" + val.contractSum +
                        "</td><td>" + status +
                        "</td><td>" + "<a class='label label-warning label-mini' href='downreport.pfv?reportId="+val.reportId+"'>下载报告</a>" +
                        "</td></tr>"
                    )
                });
                $("#firstPageLink").hide();
                $("#prePageLink").hide();
                $("#nextPageLink").hide();
                $("#lastPageLink").hide();
                debugger;
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

function initList(data, id){
	$.each(data, function(){
		$(id).append("<option value="+ this.value+">"+this.name+"</option>");
	});
}
var loanType=[{value:1,name:"经营"},{value:2,name:"消费"},{value:3,name:"其他"}];
//1信用、2抵押、3质押、4担保、5保证、6其他
var guarantType=[{value:1,name:"信用"},{value:2,name:"抵押"},{value:3,name:"质押"},
                 {value:4,name:"担保"},{value:5,name:"保证"},{value:6,name:"其他"}];	
//1催收中、2催收还款中、3恢复正常、4核销、5逾期已结清、6协议还款、7其他
var overdueStatus=[{value:1,name:"催收中"},{value:2,name:"催收还款中"},{value:3,name:"恢复正常"},
                 {value:4,name:"核销"},{value:5,name:"逾期已结清"},{value:6,name:"协议还款"},{value:7,name:"其他"}];
//1能力下降、2恶意拖欠、3身份欺诈、4逃逸、5犯罪入狱、6疾病、7死亡、8其他
var overdueReason=[{value:1,name:"能力下降"},{value:2,name:"恶意拖欠"},{value:3,name:"身份欺诈"},
                 {value:4,name:"逃逸"},{value:5,name:"犯罪入狱"},{value:6,name:"疾病"},{value:7,name:"死亡"},{value:9,name:"其他"}];
//1小于等于30天、2大于30小于等于60天、3大于60天小于等于120天、4大于120天。
var overdueTime=[{value:1,name:"小于等于30天"},{value:2,name:"大于30小于等于60天"},
               {value:3,name:"大于60天小于等于120天"},{value:4,name:"大于120天"}];
initList(loanType,"#loanType");
initList(guarantType,"#guarantType");
initList(overdueStatus,"#overdueStatus");
initList(overdueReason,"#overdueReason");
initList(overdueTime,"#overdueTime");

$("#showDelay").on('ifChecked', function(event) {
	$("#settledMsg").hide();
	$("#delayMsg").show();
});

$("#showSettled").on('ifChecked', function(event) {
	$("#delayMsg").hide();
	$("#settledMsg").show();
});


// 查询按钮事件绑定
$('#queryBtn').click(function (e) {
    // 执行查询，然后动态拼接数据表格,id=databody
    page.pageNow = 1;
    queryData();
});

// 翻页按钮点击
// 首页
$('#firstPageLink').click(function (e) {
    page.pageNow = 1;
    queryData();
});

// 上一页
$('#prePageLink').click(function (e) {
    page.pageNow = page.pageNow - 1;
    queryData();
});
// 下一页
$('#nextPageLink').click(function (e) {
    page.pageNow = page.pageNow + 1;
    queryData();
});
// 末页
$('#lastPageLink').click(function (e) {
    page.pageNow = page.totalPageCount;
    queryData();
});

$(function () {
    queryData();
    $.getJSON('js/bootstrap-chinese-region/sql_areas.json', function (data) {
        for (var i = 0; i < data.length; i++) {
            var area = {id: data[i].id, name: data[i].cname, level: data[i].level, parentId: data[i].upid};
            data[i] = area;
        }
        $.each($('.bs-chinese-region'), function () {
            $(this).chineseRegion('source', data);
        });
    });
    $('#reset').click(function () {
        $.each($("input[type='text']"), function () {
            $(this).val("");
        });
        $("input[type='radio']").removeAttr("checked");
        $.each($('select'), function () {
            $(this).val(1);
        });
    });
    $("#submit").click(function () {
        if (!IdentityCodeValid($("#cardId").val())) {
            alert("身份证号不正确！");
            return;
        }
        var payLocation = $("#city").find(".current").data("id");
        if (payLocation == null) payLocation = $("#province").find(".current").data("id");
        if (payLocation != null) $("#payLocation").val(payLocation);

        $.ajax({
            type: "POST",
            url: "AddCunLiangDetail.pfv",
            data: $('#form-insert').serialize(),
            dataType: "json",
            success: function (data) {
                alert("添加信息成功！");
                queryData();
                $("#reset").trigger("click");
            },
            error: function () {
                alert("添加信息失败！");
            }
        });
    });

});