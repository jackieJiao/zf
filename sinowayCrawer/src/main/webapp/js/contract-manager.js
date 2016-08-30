/*查询方法*/
function queryDataHT() {
		
		var userName = $('#userName').val();
		var idCard = $('#idCard').val();
		var pageNo = $('#pageNo').val();
		$.post('/CISPWeb/searchResult.pfv', {
			userName : userName,
			idCard : idCard,
			pageNo : pageNo
		}, function(result) {
			var doc = document;
			var obj = JSON.parse(result);
			//var obj = result;
			var databody = doc.getElementById('queryResultTable');
			//删除现有行
			while (databody.rows.length > 0) {
				databody.deleteRow(0);
			}
			var rows = obj.rows;
			var dataObj;
			for (var i = 0; i < rows.length; i++) {
				dataObj = rows[i];
				tr = doc.createElement("tr");

				td = doc.createElement("td");
				td.innerHTML = i + 1;
				tr.appendChild(td);

				td = doc.createElement("td");
				td.innerHTML = dataObj.name;
				tr.appendChild(td);

				td = doc.createElement("td");
				td.innerHTML = dataObj.cardid;
				tr.appendChild(td);

				td = doc.createElement("td");
				td.innerHTML = dataObj.requestTime;
				tr.appendChild(td);

				td = doc.createElement("td");
				td.innerHTML = dataObj.requestMoney;
				tr.appendChild(td);

				td = doc.createElement("td");
				td.innerHTML = dataObj.entTime;
				tr.appendChild(td);

				td = doc.createElement("td");
				td.innerHTML = dataObj.lastDays;
				tr.appendChild(td);
				/* 根据处理结果，显示不同的操作 */
				var resultNum=dataObj.requestResult;
				if(resultNum=="0"){
				td = doc.createElement("td");
				td.innerHTML = "<a class=\"btn btn-success\" data-toggle=\"modal\" id=\"modal-755411\" href='#modal-container-755411' role=\"button\">合同管理</a>";
				}
				if(resultNum=="1"){
					//opHtml = '<a role="button" href="javascript:toEdit(\''+dataObj.sinoid+'\')" class="btn btn-success">逾期管理</a>';
					opHtml = '<a role="button" href="javascript:getreportid(\''+dataObj.sinoid+'\')" class="btn btn-warning">报告下载</a>';
					
					td = doc.createElement("td");
					td.innerHTML = opHtml;
					}
				if(resultNum=="2"){
					td = doc.createElement("td");
					td.innerHTML = "<a disabled=\"disabled\" class=\"btn btn-default \" type=\"button\">已拒绝</a>";
					}
				if(resultNum=="4"){
					td = doc.createElement("td");
					td.innerHTML = "<a disabled=\"disabled\" class=\"btn btn-default \" type=\"button\">已取消</a>";
					}
				td.sname=dataObj.name;
				td.sc=dataObj.cardid;
				td.sinoid=dataObj.sinoid;
				td.htje=dataObj.htje;
				td.jklx=dataObj.jklx;
				td.jkdd=dataObj.jkdd;
				td.onclick=function(){
				
				var htje=this.htje;
				var sname=this.sname;
				var scardid=this.sc;
				var sinoid=this.sinoid;
				var jkdd=this.jkdd;
				var jklx=this.jklx;
				$("#showName").val(sname);
				$("#showCardid").val(scardid);
				$("#sinoid").val(sinoid);
				/*$("#htje").val(htje);
				$("#jklx").val(jklx);*/
				/*$("#jkdd").val(jkdd);*/
				
				};
				
				tr.appendChild(td);

				databody.appendChild(tr);
			}
			//设置页码等标记
			$('#count').val(obj.pageinfo.totalCount);
			$('#pages').val(obj.pageinfo.totalPageCount);
			$('#pageinfo').html(
					'<a href="#" style="text-decoration:none;color:#797979">总数'
							+ obj.pageinfo.totalCount + ' 第'
							+ obj.pageinfo.pageNow + '页 共'
							+ obj.pageinfo.totalPageCount + '页</a>');

		});
	}
/*getreportid方法,从后台返回对应的reportid*/
function getreportid(sinoid){
	$.ajax({
		url:"getReportId.pfv?sinoid="+sinoid,
		
		 success : function(reportid){
			 window.location.href="downreport.pfv?reportId="+reportid;
		 }
	});
}

/* 点击合同管理弹出框的保存按钮 */
    function saveContractResult() {
	/*console.info("this is in saveContractResult保存按钮");
	$("#htbh").val();
	console.info($("#contractResult").val(), $("#htbh").val(),
			$("#htje").val(), $("#jkrq").val(), $("#dqrq").val());*/
	// 得到radio的值
	var reqResult;
	var obj = $('[name=contractResult]');
	//console.info("dddd", obj, obj[2], obj[3], obj.length);
	for (var i = 0; i < obj.length; i++) {
		if (obj[i].checked) {
			console.info("radio的值为：", obj[i].value);
			reqResult = obj[i].value;
		}
	} 
	//get radio value,get corresponding inputValue,call corresponding pfv.
	  if(reqResult=="1"){
		 var sinoid= $("#sinoid").val();
		 var htbh= $("#htbh").val();
		 var htje= $("#htje").val();
		 var jkrq=$("#jkrq").val();
		 var dqrq=$("#dqrq").val();
		 var jklx=$("#jklx").val();
		 var dbfs=$("#dbfs").val();
		 var v=$("#jkdd").attr('value');
		 var jkdd=$(".current").data("id");
		 
		 var sname=$("#showName").val();
		 var scardid=$("#showCardid").val();
		 var hkqs=$("#hkqs").val();
		//判断借款期数
		 var reg = new RegExp("^[0-9]*$");
		 var v=hkqs;
			
			if(v.length<1){
				 alertMessage("请重新输入", "借款期数不能为空");
					return;

			 }
			if(!reg.test(v)){
				alertMessage("请重新输入", "借款期数需为纯数字");
				return;
			}
			if(v.length>4){
				alertMessage("请重新输入", "借款期数过大");
				return;
			}
			v=v.replace(/(^\s*)|(\s*$)/g,"");
			 
			 if(v.length<1){
				 alertMessage("请重新输入", "借款期数不能为空");
					return;
			 }
			 
			 //验证合同编号不能为空
			 var je=htbh;
				
				if(je.length<1){
					 alertMessage("请重新输入", "合同金额不能为空");
						return;
				 }
				je=je.replace(/(^\s*)|(\s*$)/g,"");
				 
				 if(je.length<1){
					 alertMessage("请重新输入", "合同金额不能为空");
						return;
				 }
				 
			//验证合同编号
				 var bh=htje;
					
					if(bh.length<1){
						 alertMessage("请重新输入", "合同金额不能为空");
							return;
					 }
					bh=bh.replace(/(^\s*)|(\s*$)/g,"");
					 
					 if(bh.length<1){
						 alertMessage("请重新输入", "合同金额不能为空");
							return;
					 }
			//验证合同结束时间不能早于开始时间
					 var st= jkrq;
					 var et= dqrq;
					 debugger;
					 date1=new Date(st)
					 date2=new Date(et)
					 console.info(Date.parse(date1)<Date.parse(date2)) 
					 console.info(Date.parse(date1)>Date.parse(date2)) 
					 if(Date.parse(date1)>Date.parse(date2)){
						 alertMessage("请重新输入", "合同结束时间不能早于开始时间");
						 return;
					 }
				 
		  $.ajax({
			  url:"/CISPWeb/getData.pfv",
			  contentType:'application/x-www-form-urlencoded; charset=UTF-8',
			  data: {
				  sinoid:sinoid,
				  htbh: htbh ,
				  htje: htje,
				  jkrq:jkrq,
				  dqrq:dqrq,
				  jklx:jklx,
				  dbfs:dbfs,
				  jkdd:jkdd,
				  reqResult:reqResult,
				  sname:sname,
				  scardid:scardid,
				  hkqs:hkqs
			 },
		  success : function(jsonResult) {
			  var jsonResult = JSON.parse(jsonResult);
			 
				  if (jsonResult.isSaved === "0") {
					  alertMessage("提示", "数据提交失败");
				} else {
					console.info("transf success");
					alertMessage("提示", "保存成功");
					var normalNot = jsonResult.normalNot;
					var normalYes = jsonResult.normalYes;
					var appagree = jsonResult.appagree;
					var apprefuse = jsonResult.apprefuse;
					var appcheck = jsonResult.appcheck;
					var unnormalNot = jsonResult.unnormalNot;
					var unnormalYes = jsonResult.unnormalYes;
					var searchHistory = jsonResult.searchHistory;
					var sum1 = jsonResult.sum1;
					var sum2 = jsonResult.sum2;
					var sum3 = jsonResult.sum3;
					
					var urlString = "error.pfv?normalNot=" + normalNot
							+ "&normalYes=" + normalYes + "&appagree="
							+ appagree + "&apprefuse=" + apprefuse
							+ "&appcheck=" + appcheck + "&unnormalNot="
							+ unnormalNot + "&unnormalYes="
							+ unnormalYes + "&searchHistory="
							+ searchHistory + "&sum1=" + sum1
							+ "&sum2=" + sum2 + "&sum3=" + sum3;
					window
							.open(
									urlString,
									'newwindow',
									'height=500, width=700, top=0,left=0, toolbar=no, menubar=no, scrollbars=no, resizable=no,location=no,status=no');
					 queryDataHT();

				}
			}
		  });
		  queryDataHT();
	  }	 
	  if(reqResult=="2"){
		  var sinoid= $("#sinoid").val();
		  var jdyy= $("#jdyy").val();
		  var jdrq= $("#jdrq").val();
		  var sname=$("#showName").val();
		  var scardid=$("#showCardid").val();
		
		 //校验拒绝原因必选
		  var je=jdyy;
			
			if(je.length<1){
				 alertMessage("请重新输入", "拒绝原因不能为空");
					return;
			 }
			if(je=="0"){
				 alertMessage("请重新输入", "请选择拒绝原因");
					return;
			}
			je=je.replace(/(^\s*)|(\s*$)/g,"");
			 
			 if(je.length<1){
				 alertMessage("请重新输入", "拒绝原因不能为空");
					return;
			 }
			 
		  $.ajax({
			  url:"/CISPWeb/getRefuse.pfv",
			  contentType:'application/x-www-form-urlencoded; charset=UTF-8',
			  
			  data: {
				
				  sinoid:sinoid,
				  jdyy: jdyy ,
				  jdrq: jdrq,
				  reqResult:reqResult,
				  sname:sname,
				  scardid:scardid
				  
			 },
		  success : function(msg) {
			  alertMessage("提示", "已拒绝");
			  /*处理完毕后，刷新table*/
			  queryDataHT();
			  
		  }
		  });
	  
	  }
	  if(reqResult=="3" ||reqResult=="4" ){
		  var sinoid= $("#sinoid").val();
			 var sname=$("#showName").val();
			 var scardid=$("#showCardid").val();
		  $.ajax({
			  url:"/CISPWeb/getRefuse.pfv",
			  contentType:'application/x-www-form-urlencoded; charset=UTF-8',
			  data: {
				  sinoid:sinoid,
				  reqResult:reqResult
			 },
		  success : function(jsonResult) {
			  console.info("transf success");
			 // $("#modal-container-755411").fadeOut();
			  alertMessage("提示", "处理成功");
		  }
		  });
	  }
	  $('#showDiv').empty();
	  /*处理完毕后，刷新table*/
	  queryDataHT();
    }
    /*
     * post function
     */
    function post(url, params) {
	    var temp = document.createElement("form");
	    temp.action = url;
	    temp.method = "post";
	    temp.setAttribute("accept-charset","UTF-8");
	    temp.Allow = "POST";
	   
        var opt = document.createElement("input");
        opt.name = "data";
        opt.value = params;
        console.info("***this is params",params);
        temp.appendChild(opt);
	   
	    document.body.appendChild(temp);
	    temp.submit();
	    return temp;
	}
    
	$(function(){
		
		//翻页按钮点击
		//首页
		$('#firstPageLink').click(function(e){
			$('#pageNo').val(1);
			queryDataHT();
		});

		//上一页
		$('#prePageLink').click(function(e){
			var pageNo = $('#pageNo').val();
			var page = parseInt(pageNo)
			if(page>1){
				$('#pageNo').val((page-1));
				queryDataHT();
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
				var pageNo1 = $('#pageNo').val();
				queryDataHT();
			}
		});
		//末页
		$('#lastPageLink').click(function(e){
			var pageNo = $('#pageNo').val();
			var page = parseInt(pageNo);
			var pages = parseInt($('#pages').val());
			if(page<pages){
				$('#pageNo').val(pages);
				queryDataHT();
			}
			//queryData();
		});
		
		$.getJSON('js/bootstrap-chinese-region/sql_areas.json',function(data){
			
			for (var i = 0; i < data.length; i++) {
				var area = {id:data[i].id,name:data[i].cname,level:data[i].level,parentId:data[i].upid};
				data[i] = area;
			}

			$('.bs-chinese-region').chineseRegion('source',data);
		});
		$("#a1").hide();
	    $("#refuseDiv").hide();
		
		/* 根据radio的值改变展示内容 */
		  $("input[type='radio']").click(function(){
			
				  var id= $(this).attr("value");
				  
				  if(id=="1"){ 
					  var doc = document;
					  showDiv = doc.getElementById('showDiv');
					  $("#a1").show();
					  $("#refuseDiv").hide();
					  /*$("#showDiv").empty();
					  acceptdiv = doc.getElementById('a1');
					  showDiv.appendChild(acceptdiv);*/
				  }
				  if(id=="2"){
					  var doc = document;
					  showDiv = doc.getElementById('showDiv');
					  $("#a1").hide();
					  $("#refuseDiv").show();
					 /* $("#showDiv").empty();
					  refusediv = doc.getElementById('refuseDiv');
					  showDiv.appendChild(refusediv);	*/
				  }
				  if(id=="3"){ 
					  $("#a1").hide();
					    $("#refuseDiv").hide();
					  //$("#showDiv").html("延迟处理");   
				  }
				  if(id=="4"){  
					  $("#a1").hide();
					    $("#refuseDiv").hide();
					 // $("#showDiv").html("客户取消");
			  }
		  });
		  /*根据radio值改变内容2*/
		 /* $('#radio1').on('ifClicked',function(event){
			  var doc = document;
			  showDiv = doc.getElementById('showDiv');
			  $("#a1").show();
			  $("#refuseDiv").hide();
			});
		  $('#radio2').on('ifClicked',function(event){
			  var doc = document;
			  showDiv = doc.getElementById('showDiv');
			  $("#a1").hide();
			  $("#refuseDiv").show();
			});
		  $('#radio3').on('ifClicked',function(event){
			  $("#a1").hide();
			  $("#refuseDiv").hide();
			});
		  $('#radio4').on('ifClicked',function(event){
			  $("#a1").hide();
			  $("#refuseDiv").hide();
			});*/
		  
	/*
	 * load新页面
	 */
		 $('#radio1').on('ifClicked',function(event){
				 
				 var sinoid=$("#sinoid").val();
				  $('#showDiv').load('accept.pfv?sinoid='+sinoid);
				});
			  $('#radio2').on('ifClicked',function(event){
				  $('#showDiv').load('refuse.pfv');
				  
				});
			  $('#radio3').on('ifClicked',function(event){
				  $("#a1").hide();
				  $("#refuseDiv").hide();
				  
				  $('#showDiv').empty();
				  
				});
			  $('#radio4').on('ifClicked',function(event){
				  $('#showDiv').empty();
				}); 
		  
		  
	});
	