/**
 * Created by Administrator on 2016/8/14.
 */
var page = {
    userName: "",
    idCard: ""
};
var searchDto = {
    userName: "",
    idCard: ""
};
$(function () {
    search();
});

function reset() {
    $.each($("input[type='text']"), function () {
        $(this).val("");
    });
}

function searchList() {
    searchDto.name = $("#searchName").val();
    searchDto.cardid = $("#searchIdCard").val();
    var reqReason = $("input[name='reqReasonIndex']:checked").val();
    if(!reqReason) return;
    switch (reqReason){
        case '1':searchDto.reqReason = "借款申请审批";break;
        case '2':searchDto.reqReason = "债券管理";break;
        case '3':searchDto.reqReason = "逾期管理";break;
        case '4':searchDto.reqReason = $("#reqReason").val();break;
        default :return;
    }
    if(!searchDto.reqReason) {
        alert("未填写原因，无法查询！");
        return;
    }
    $.ajax({
        type: "POST",
        url: "queryUserBlackList.pfv",
        data: searchDto,
        dataType: "json",
        contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
        success: function (data) {
            if (data == '-1') {
                alert("查询失败！")
            } else if (data == '0') {
                alert("查询用户没有不良记录！")
            } else {
                alert("查询用户有" + data + "条不良记录！")
            }
            search();
        },
        error: function () {
            alert("查询失败！")
        }
    });
}
function search() {
    $.ajax({
        type: "POST",
        url: "searchBlackListSearch.pfv",
        data: page,
        dataType: "json",
        contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
        success: function (data) {
            if (!!data) {
                var rows = data.rows;
                page = data.pageinfo;
                $("#tData").children().remove();
                $.each(rows, function (i, val) {
                    $("#tData").append(
                        "<tr><td>" + val.name +
                        "</td><td>" + val.cardid +
                        "</td><td>" + val.reqReason +
                        "</td><td>" + val.userAccount +
                        "</td><td>" + val.reqTime +
                        "</td><td>" +
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
                var scroll_offset = $("#tData").offset(); //得到pos这个div层的offset，包含两个值，top和left
                $("body,html").animate({
                    scrollTop: scroll_offset.top //让body的scrollTop等于pos的top，就实现了滚动
                }, 0);
            }
        },
        error: function (data) {

        }
    });
}
