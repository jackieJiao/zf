var item = null;
function getHtml(url) {
	if (item != null) {
		$("#" + item).addClass("btn-primary");
		$("#" + item).removeClass("btn-default");
		$("#" + item + "-menu").removeClass("active");
		$("#" + item + "-menu").parents("li").removeClass("nav-active");
	}
	$("#home").removeClass("active");
	item = url.replace(/.pfv/, "");
	$("#" + item).removeClass("btn-primary");
	$("#" + item).addClass("btn-default");
	$("#" + item + "-menu").addClass("active");
	$("#" + item + "-menu").parents("li").addClass("nav-active");
	$("#main").load(url);
}

//账号名字


//提示信息
function alertMessage(mtitle,mtext) {
	$.gritter.add({  
	    title: mtitle,  
	    text: mtext,  
	    sticky: false,  
	    time: 1000,  
	    speed:500,  
	    position: 'bottom-right',  
	});  
}
$(function() {
	$.ajax({
				type : "GET",
				url : "getNotifications.pfv",
				dataType : "json",
				success : function(data) {
					var cntrctNum = data.cntrctNum;
					var isBlock = data.isBlock;
					var overdueNum=data.overdueNum;
					var mtitle;
					var mtext;
					if(cntrctNum!=0){
						$("#cntrctNum").html(cntrctNum);
						mtitle="签约管理提示";
						mtext="您有"+cntrctNum+"条签约信息没有处理";
						alertMessage(mtitle,mtext);
					}
					if(overdueNum!=0){
						$("#overdueNum").html(overdueNum);
						mtitle="催收管理提示";
						mtext="您有"+overdueNum+"条催收信息没有处理";
						alertMessage(mtitle,mtext);
					}
					
					if (isBlock) {
						// 使标签失效
						$("#jinjianManage,#zhaiquanlist,#cuishoulist")
								.addClass("disabled");
						// 使menu img提示处理信息
						mtitle="锁定提示";
						mtext="您有过期任务【签约查询】尚未处理！进件查询、贷中查询及催收共享查询功能模块已锁定，请及时处理以解除锁定！"
						var onclickStr="alertMessage(\""+mtitle+"\",\""+mtext+"\");";
						console.log(onclickStr);
						$("#jinjianManage-menu-a,#zhaiquanlist-menu-a,#historyReport-menu-a,#cunliangManage-menu-a,#cuishoulist-menu-a,#jinjianManage-tag,#zhaiquanlist-tag,#cuishoulist-tag")
								.attr("onclick",onclickStr);
						alertMessage(mtitle,mtext);
					} else {
						// 使标签失效
						$("#jinjianManage,#zhaiquanlist,#cuishoulist,#cunliangManage,#historyReport")
								.removeClass("disabled");
						// 使menu正常
						$("#jinjianManage-menu-a").attr("onclick",
								"getHtml('jinjianManage.pfv')");
						$("#zhaiquanlist-menu-a").attr("onclick",
								"getHtml('zhaiquanlist.pfv')");
						$("#cuishoulist-menu-a").attr("onclick",
								"getHtml('cuishoulist.pfv')");
						$("#cunliangManage-menu-a").attr("onclick",
						"getHtml('cunliangManage.pfv')");
						$("#historyReport-menu-a").attr("onclick",
						"getHtml('historyReport.pfv')");
						// tag正常
						$("#jinjianManage-img").attr("onclick",
								"getHtml('jinjianManage.pfv')");
						$("#zhaiquanlist-img").attr("onclick",
								"getHtml('zhaiquanlist.pfv')");
						$("#cuishoulist-img").attr("onclick",
								"getHtml('cuishoulist.pfv')");
						$("#cunliangManage-img").attr("onclick",
						"getHtml('cunliangManage.pfv')");
						$("#historyReport-img").attr("onclick",
						"getHtml('historyReport.pfv')");
					}
				}
			});
	
	$.ajax({
		cache: true,
		type : "GET",
		url : "selectUseraccount.pfv",
		dataType : "json",
		success : function(data) {
		
			$('#useridcode').html(data.result2);
			$('#usernamer').html(data.result1);
			
			
		}
	});
	


});