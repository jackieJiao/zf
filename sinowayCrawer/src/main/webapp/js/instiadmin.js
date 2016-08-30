/**
 * 插入数据
 * @returns
 */
function insertInstiDetail() {
	$.ajax({
		type : "POST",
		url : "insertInstiDetail.pfv",
		data : $('#instiAdd').serialize(),
		dataType : "json",
		success : function(data) {
			alertMessage("添加机构操作提示",data.result);
		}
	});
}
/**
 * 重置表单
 * @returns
 */
function resetForm(){
	$("#instiAdd")[0].reset();
}

/**
 * 查询机构详细信息
 * @returns
 */
function queryInstiDetail(){

	var instiShortname="";
	if($("#sinstiShortname").val()!=""){
		instiShortname = $("#sinstiShortname").val();
	}	
	var pageNo = $('#pageNo').val();
	$.ajax({
        type: "POST",
        url:'selectInstiDetails.pfv',
        data:{
        	instiShortname:instiShortname,
    		pageNo:pageNo,
    	},// 你的formid
    	dataType:'json',
        success: function(data) {
        	//最新查询结果数据显示
    		getQueryResultDatas(data);
    		$('#count').val(data.pageinfo.totalCount);
			$('#pages').val(data.pageinfo.totalPageCount);
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
		td.innerHTML =e.instiShortname;			
		tr.appendChild(td);

		td = doc.createElement("td");
		td.innerHTML = e.instiCode;		
		tr.appendChild(td);
		
		td = doc.createElement("td");
		td.innerHTML = e.creditPerson;		
		tr.appendChild(td);

		td = doc.createElement("td");
		td.innerHTML = e.instiPhone;
		tr.appendChild(td);	
		//时间
		td = doc.createElement("td");
		if(flag == "0"){
			td.innerHTML = "--";
		}else{
			td.innerHTML = "<a class='label label-warning label-mini' onclick='toUpdateInstiDetail(\""+e.instiCode+"\")' data-toggle='modal' href='#modal-container'>修改</a>";
		}		
		tr.appendChild(td);		
		databody.appendChild(tr);
	});	

}


/**
 * 修改详细信息
 * @returns
 */
function updateInstiDetail(){
	$.ajax({
        type: "POST",
        url:'updateInstiDetail.pfv',
        data:$('#instiUpdate').serialize(),// 你的formid
    	dataType:'json',
        success: function(data) {
			alertMessage("添加机构操作提示",data.result);
        }
    });
}

/**
 * 跳转详细页面
 * @param instiCode 机构代码
 * @returns
 */
function toUpdateInstiDetail(instiCode){
	$.ajax({
        type: "POST",
        url:'getInstiDetail.pfv',
        data:{instiCode:instiCode},// 你的formid
    	dataType:'json',
        success: function(data) {
        	$("#minstiShortname").val(data.instiShortname);
        	$("#minstiCode").val(data.instiCode);
        	$("#minstiName").val(data.instiName);
        	$("#minstiType").val(data.instiType);
        	$("#mcorporationName").val(data.corporationName);
        	$("#mcreditPerson").val(data.socialCreditCode);
        	$("#msocialCreditCode").val(data.instiCode);
        	$("#mregisteredAddress").val(data.registeredAddress);
        	$("#mgeneralManager").val(data.generalManager);
        	$("#mzipCode").val(data.zipCode);
        	$("#mregisteredCapital").val(data.registeredCapital);
        	$("#mwebUrl").val(data.webUrl);
        	$("#minstiLocation").val(data.instiLocation);
        	$("#mfaxNumber").val(data.faxNumber);
        	$("#minstiPhone").val(data.instiPhone);
        	$("#maccessIp").val(data.accessIp);
        	//$("#maccessType1").val(data.instiCode);       	
        }
    });
}

/**
 * ready
 */
$(function() {	
	//查询结果事件
	$('#queryResultBtn').click(function(e) {
		queryInstiDetail();
	});
	//翻页按钮点击
	//首页
	$('#firstPageLink').click(function(e){
		$('#pageNo').val(1);
		queryInstiDetail();
	});

	//上一页
	$('#prePageLink').click(function(e){
		var pageNo = $('#pageNo').val();
		var page = parseInt(pageNo)
		if(page>1){
			$('#pageNo').val((page-1));
			queryInstiDetail();
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
			queryInstiDetail();
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
		queryInstiDetail();
	});
})
