/**
 * Created by yuanshuai5 on 2016/8/12.
 */
function getBlackListHtml(url) {
    $("#home").removeClass("active");
    var item = "blackListManage";
    $("#" + item).removeClass("btn-primary");
    $("#" + item).addClass("btn-default");
    $("#" + item + "-menu").addClass("active");
    $("#" + item + "-menu").parents("li").addClass("nav-active");
    $("#main").load(url);
}

