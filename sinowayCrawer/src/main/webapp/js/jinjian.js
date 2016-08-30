var obj;


function reset(){
	$('#name').val("");
	$('#cardid').val("");
	$('#edu').val("0");
	$('#requestType').val("0");
	$('#requestLocation').val("");
	$('#requestMoney').val("");
	$('#jinjianTime').val("");
	$('#instiid').val("");
};

function huixian() {
	var names = $('#name').val();
	var cardids = $('#cardid').val();
	var edus = $('#edu').val();
	var requestLocations = $('#requestLocation').attr('value');

	var requestTypes = $('#requestType').val();
	var requestMoneys = $('#requestMoney').val();
	var jinjianTimes = $('#jinjianTime').val();
	var instiid = $('#instiid').val();
	$("#modal-755411").attr("data-target","#modal-container-755411");
	//表单数据校验
	if(names.length == 0){
		alertMessage("温馨提示","请输入姓名");
		$("#modal-755411").removeAttr("data-target");
		return;
	}
	if(!new RegExp(/^(\d{15}$|^\d{18}$|^\d{17}(\d|X|x))$/).test(cardids)||cardids.length == 0){
		
		alertMessage("温馨提示","身份证号码格式不正确，请重新输入");
		$("#modal-755411").removeAttr("data-target");
		return;
	}
	if(edus == 0){
		alertMessage("温馨提示","请选择学历");
		$("#modal-755411").removeAttr("data-target");
		return;
	}
	if(requestTypes == 0){
		
		alertMessage("温馨提示","请选择申请类型");
		$("#modal-755411").removeAttr("data-target");
		return;
	}
	
	if(requestLocations == 0){
			alertMessage("温馨提示","请选择申请地点");
			$("#modal-755411").removeAttr("data-target");
			return;
		}
	
	if(jinjianTimes == 0){
		
		alertMessage("温馨提示","请选择申请时间");
		$("#modal-755411").removeAttr("data-target");
		return;
	}
	
	if(requestMoneys.length==0 || !new RegExp(/^[0-9]*$/).test(requestMoneys)){
		
		alertMessage("温馨提示","请输入正确的申请金额");
		$("#modal-755411").removeAttr("data-target");
		
		return;
	}
	
	if(instiid.length!=0){
		var flag = 1;
	$.ajax({
        cache: true,
        type: "POST",
        url:'catchInstiid.pfv',
        async: false,
        data:{
        	instiid:$("#instiid").val()
        	
    	},// 你的formid
    	dataType:'json',
        success: function(data) {
        	 console.log(data);
        	if(data.result!="1"){
    			alertMessage("温馨提示","您的申请编号重复，请重新输入！");
    			$("#modal-755411").removeAttr("data-target");
    			return;
    		}
        	
        }
    });	
	
	
	}else
		{
		alertMessage("温馨提示","请输入申请编号");
		$("#modal-755411").removeAttr("data-target");
		return;
		}
	
	//$("#modal-755411").attr("data-target","#modal-container-755411");

	$('#tname').val(names);
	$('#tcardid').val(cardids);
	if (edus == 1) {
		$('#tedu').val("初中及以下");
	}
	if (edus == 2) {
		$('#tedu').val("高中中专技校");
	}
	if (edus == 3) {
		$('#tedu').val("博士及以上");
	}
	if (edus == 4) {
		$('#tedu').val("硕士");
	}
	if (edus == 5) {
		$('#tedu').val("本科");
	}
	if (edus == 6) {
		$('#tedu').val("大专");
	}
	$('#trequestLocation').val(requestLocations);

	if (requestTypes == 1) {
		$('#trequestTypes').val("经营");
	}
	if (requestTypes == 2) {
		$('#trequestTypes').val("消费");
	}
	if (requestTypes == 3) {
		$('#trequestTypes').val("其他");
	}

	$('#trequestMoneys').val(requestMoneys);
	$('#tjinjianTimes').val(jinjianTimes);
	$('#tinstiid').val(instiid);
	
	 

}
/*function chkvalue(){
	$.ajax({
        cache: true,
        type: "POST",
        url:'catchInstiid.pfv',
        data:{
        	instiid:$("#instiid").val()
        	
    	},// 你的formid
    	dataType:'json',
        success: function(data) {
        	 console.log(data);
        	if(data.result!="1"){
    			alertMessage("温馨提示","您的申请编号重复，请重新输入！");
    			return;
    		}
        	
        }
    });	
}*/

function loanAppResult(){
	if(!$("#userNamex").val()==""){
		var namesx = $("#userNamex").val();
	}
	if(!$("#idCardx").val()==""){
		var cardidsx = $("#idCardx").val();
	}
	var pageNo = $('#pageNo').val();
	
	$.ajax({
        cache: true,
        type: "POST",
        url:'loanApplicationResult.pfv',
        data:{
    		namex:namesx,
    		cardidx:cardidsx,
    		pageNo:pageNo
    	},// 你的formid
    	dataType:'json',
        success: function(data) {
        	//最新查询结果数据显示
    		getQueryResultDatas(data);
    		$('#count').val(data.pageinfo.totalCount);
			$('#pages').val(data.pageinfo.totalPageCount);
			$('#pageinfo').html('<a href="#" style="text-decoration:none;color:#797979">总数'+data.pageinfo.totalCount+' 第'+data.pageinfo.pageNow+'页 共'+data.pageinfo.totalPageCount+'页</a>');
        }
    });
	
}




$(function() {
	//提交按钮查询事件
	$('#queryBtn').click(function(e) {
		
		queryData();
	});
	
	//查询事件
	$('#queryResultBtn').click(function(e) {
		loanAppResult();
	});
	
	//翻页按钮点击
	//首页
	$('#firstPageLink').click(function(e){
		$('#pageNo').val(1);
		loanAppResult();
	});

	//上一页
	$('#prePageLink').click(function(e){
		var pageNo = $('#pageNo').val();
		var page = parseInt(pageNo)
		if(page>1){
			$('#pageNo').val((page-1));
			loanAppResult();
		}
	});
	//下一页
	$('#nextPageLink').click(function(e){
		//alert('next')
		var pageNo = $('#pageNo').val();
		var page = parseInt(pageNo);
		var pages = parseInt($('#pages').val());
		if(page<pages){
			$('#pageNo').val((page+1));
			loanAppResult();
		}
	});
	//末页
	$('#lastPageLink').click(function(e){
		var pageNo = $('#pageNo').val();
		var page = parseInt(pageNo);
		var pages = parseInt($('#pages').val());
		if(page<pages){
			$('#pageNo').val(pages);
			loanAppResult();
		}
		loanAppResult();
	});
	$.getJSON('js/bootstrap-chinese-region/sql_areas.json',function(data){
		
		for (var i = 0; i < data.length; i++) {
			var area = {id:data[i].id,name:data[i].cname,level:data[i].level,parentId:data[i].upid};
			data[i] = area;
		}

		$('.bs-chinese-region').chineseRegion('source',data);
	});

	loanAppResult();
})


function queryData() {
	var str=$("#ff").serialize();
	console.log(str);
	var names = $('#name').val();
	var cardids = $('#cardid').val();
	var edus = $('#edu').val();
	//var requestLocations = $('#requestLocation').attr('value');
	//var s=$(".current").data("id");
	
	//console.log(s);
	//console.log(requestLocations);
	var requestLocations = $("#city").find(".current").data("id");
    if (requestLocations == null) requestLocations = $("#province").find(".current").data("id");
    if (requestLocations != null) $("#requestLocations").val(requestLocations);
	
	
	var requestTypes = $('#requestType').val();
	var requestMoneys = $('#requestMoney').val();
	var jinjianTimes = $('#jinjianTime').val();
	
	var sinoid = $('#shoulihao').html();

	var instiid = $('#tinstiid').val();

	var pageNo = $('#pageNo').val();
	var normalsettle;
	


	
	
	/*$.post('addLoanApplication.pfv', {
		name:names,
		cardid:cardids,
		edu:edus,
		requestLocation : s,
		requestType : requestTypes,
		requestMoney : requestMoneys,
		jinjianTime : jinjianTimes
	}, function(result) {
		
		var doc = document;
		doc.getElementById('publishtime').innerHTML = "--";
		
		
	
		for (var i = 0; i < rows.length; i++) {
			var flag = 1;
			dataObj = rows[i];
			tr = doc.createElement("tr");

			td = doc.createElement("td");
			td.innerHTML = dataObj.normalsettle;			
			tr.appendChild(td);

			td = doc.createElement("td");
			td.innerHTML = dataObj.normalunsettle;		
			tr.appendChild(td);
			
			
			databody.appendChild(tr);
		}
		

});*/
	
	$.ajax({
        cache: true,
        type: "POST",
        url:'addLoanApplication.pfv',
        data:{
        	name:names,
    		cardid:cardids,
    		edu:edus,
    		requestLocation : requestLocations,
    		requestType : requestTypes,
    		requestMoney : requestMoneys,
    		jinjianTime : jinjianTimes,
    		pageNo:pageNo,
    		sinoid:sinoid,
    		instiid:instiid

    	
    	},// 你的formid
    	dataType:'json',
        success: function(data,status) {
        	if(status=="success"||status==200){
        		alertMessage("温馨提示","保存成功");
        		 reset();
        	}else
        		{
        		alertMessage("温馨提示","保存失败");
        		}
        	//申请结果数据显示
        	$("#normalunsettle").html(data.map.normalunsettle);
    		$("#sixOver").html(data.map.sixOver);
    		$("#normalsettle").html(data.map.normalsettle);
    		$("#sixRefuse").html(data.map.sixRefuse);
    		$("#sixIng").html(data.map.sixIng);
    		$("#sixcancel").html(data.map.sixcancel);
    		$("#unnormalunsettle").html(data.map.unnormalunsettle);
    		$("#unnormalsettle").html(data.map.unnormalsettle);
    		$("#twoyearsearch").html(data.map.twoyearsearch);
        	//最新查询结果数据显示
    		getQueryResultDatas(data);
    		$('#count').val(data.pageinfo.totalCount);
			$('#pages').val(data.pageinfo.totalPageCount);
			debugger;
			$('#pageinfo').html('<a href="#" style="text-decoration:none;color:#797979">总数'+data.pageinfo.totalCount+' 第'+data.pageinfo.pageNow+'页 共'+data.pageinfo.totalPageCount+'页</a>');
        }
    });
	
}






var getQueryResultDatas = function (result){
	var doc = document;
	var databody = doc.getElementById('queryResultTable');
	//删除现有行
	while (databody.rows.length > 0) {
		databody.deleteRow(0);
	}
	
	var tr, td;
	var dataObj;
	//格式化
	function formate(d){
		return d>9?d:'0'+d;
		}
	
	$.each(result.rows,function(i,e){
		var flag = 1;
		console.log(e);
		
		tr = doc.createElement("tr");

		td = doc.createElement("td");
		td.innerHTML =e.name;			
		tr.appendChild(td);

		td = doc.createElement("td");
		td.innerHTML = e.cardid;		
		tr.appendChild(td);

		td = doc.createElement("td");
		td.innerHTML = e.userAccount;
		tr.appendChild(td);	
		//时间
		td = doc.createElement("td");
		var d=new Date(e.sinotime.time);
		var year=d.getFullYear();
		var day=d.getDate();
		var month=+d.getMonth()+1;
		var hour=d.getHours();
		var minute=d.getMinutes();
		var second=d.getSeconds();
		var f=year+"-"+formate(month)+"-"+formate(day)+" "+formate(hour)+":"+formate(minute)+":"+formate(second);
		td.innerHTML = f;
		tr.appendChild(td);	

		td = doc.createElement("td");
		if(flag == "0"){
			td.innerHTML = "--";
		}else{
			td.innerHTML = "<a class='label label-warning label-mini' href='downreport.pfv?reportId="+e.reportId+"'>下载报告</a>";
		}		
		tr.appendChild(td);		

		databody.appendChild(tr);
	});
	
	
//	$(".dtattlbs tr:even").addClass("demoBg");
//	//设置页码等标记
//	$('#count').val(result.total);
//	$('#pages').val(Math.ceil((result.total)/15));
//	var str = '总数:' + result.total + ' 第'
//			+ $('#pageNo').val() + '页-- 共' + Math.ceil((result.total)/15)
//			+ '页';
//	$('#pageinfo').html(str); 
};

