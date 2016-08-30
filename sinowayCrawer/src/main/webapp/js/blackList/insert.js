/**
 * Created by yuanshuai5 on 2016/8/12.
 */
var page = {
    userName: "",
    idCard: ""
};

$(function () {
    $.getJSON('js/bootstrap-chinese-region/sql_areas.json', function (data) {
        for (var i = 0; i < data.length; i++) {
            var area = {id: data[i].id, name: data[i].cname, level: data[i].level, parentId: data[i].upid};
            data[i] = area;
        }
        $.each($('.bs-chinese-region'), function () {
            $(this).chineseRegion('source', data);
        });
    });
    search();
    var overdueLongestDays = [
        {value: 1, name: "小于等于30天"},
        {value: 2, name: "大于30天小于等于60天"},
        {value: 3, name: "大于60天小于等于120天"},
        {value: 4, name: "大于120天"}
    ];
    var loanType = [
        {value: 1, name: "经营"},
        {value: 2, name: "消费"},
        {value: 3, name: "其他"}
    ];
    var guaranteeType = [
        {value: 1, name: "信用"},
        {value: 2, name: "抵押"},
        {value: 3, name: "质押"},
        {value: 4, name: "担保"},
        {value: 5, name: "保证"},
        {value: 6, name: "其他"}
    ];
    var overdueReason = [
        {value: 1, name: "能力下降"},
        {value: 2, name: "恶意拖欠"},
        {value: 3, name: "身份欺诈"},
        {value: 4, name: "逃逸"},
        {value: 5, name: "犯罪入狱"},
        {value: 6, name: "疾病"},
        {value: 7, name: "死亡"},
        {value: 8, name: "其他"}
    ];
    var overdueStatusMark = [
        {value: 1, name: "催收中"},
        {value: 2, name: "催收还款中"},
        {value: 3, name: "恢复正常"},
        {value: 4, name: "核销"},
        {value: 5, name: "逾期已结清"},
        {value: 6, name: "协议还款"},
        {value: 7, name: "其他"}
    ];
    $.each(loanType, function () {
        $("select[name='loanType']").append("<option value=" + this.value + ">" + this.name + "</option>");
    });
    $.each(guaranteeType, function () {
        $("select[name='guaranteeType']").append("<option value=" + this.value + ">" + this.name + "</option>");
    });
    $.each(overdueLongestDays, function () {
        $("select[name='overdueLongestDays']").append("<option value=" + this.value + ">" + this.name + "</option>");
    });
    $.each(overdueReason, function () {
        $("select[name='overdueReason']").append("<option value=" + this.value + ">" + this.name + "</option>");
    });
    $.each(overdueStatusMark, function () {
        $("select[name='overdueStatusMark']").append("<option value=" + this.value + ">" + this.name + "</option>");
    });
    $("#reset").click(function () {
        $.each($("input[type='text']"), function () {
            $(this).val("");
        });
        $("input[type='email']").val("");
        $.each($('select'), function () {
            $(this).val(1);
        });
    });
});
function insert(){
    if(!IdentityCodeValid($("#cardId").val())) {
        return;
    }
    var loanAddress = $("#city").find(".current").data("id");
    if(loanAddress == null) loanAddress = $("#provisnce").find(".current").data("id");
    if(loanAddress != null) $("#loanAddress").val(loanAddress);
    var birthAddress = $("#city1").find(".current").data("id");
    if(birthAddress == null) birthAddress = $("#province1").find(".current").data("id");
    if(birthAddress != null) $("#birthAddress").val(birthAddress);
    var nowAddress = $("#city2").find(".current").data("id");
    if(nowAddress == null) nowAddress = $("#nowAddress").find(".current").data("id");
    if(nowAddress != null) $("#nowAddress").val(nowAddress);
    $.ajax({
        type : "POST",
        url : "addBlackList.pfv",
        data : $('#form-insert').serialize(),
        dataType : "json",
        success : function(data) {
            if(data != '1') alert("添加不良信息失败！");
            else{
                alert("添加不良信息成功！");
                search();
            }
        },
        error: function() {
        }
    });
}
function search() {
    page.userName = $("#searchName").val();
    page.idCard = $("#searchIdCard").val();
    $.ajax({
        type: "POST",
        url: "searchBlackList.pfv",
        data: page,
        dataType: "json",
        contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
        success: function (data) {
            if (!!data) {
                var rows = data.rows;
                page = data.pageinfo;
                $("#tData").children().remove();
                $.each(rows, function (i, val) {
                    var index = (page.pageNow - 1) * page.pageSize + (i + 1);
                    $("#tData").append(
                        "<tr><td>" + index +
                        "</td><td>" + val.sinotime +
                        "</td><td>" + val.name +
                        "</td><td>" + val.cardid +
                        "</td><td>" + val.overdueStartTime +
                        "</td><td>" + val.notPaidMoney +
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
                    scrollTop:scroll_offset.top //让body的scrollTop等于pos的top，就实现了滚动
                },0);
            }
        },
        error: function (data) {

        }
    });
}



