$(function() {
	var freezeQuery = true;
	//提交按钮保存事件
	$('#queryBtn').click(function(e) {
		
		queryData();
	});
	
	//查询结果事件
	$('#queryResultBtn').click(function(e) {
		freezeQuery = false;
		loanAppResult(freezeQuery);
	});
	
	//冻结-查询
	$('#freezeQueryBtn').click(function(e) {
		freezeQuery = true;
		loanAppResult(freezeQuery);
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

	
			
	

})

//冻结
function freezeData(e){		
		$.post('freezUserData.pfv', {
			userAccount:e
		}, function(result) {
		
			alertMessage("温馨提示",result);
			
		});
		
		
	};
	
	
	function unFreezeData(e){
		
		$.post('unFreezeUserData.pfv', {
			userAccount:e
		}, function(result) {
			
			alertMessage("温馨提示",result);
			
		});
		
	};


//数据的保存
function queryData() {
	
	var str=$("#ff").serialize();
	
	var userAccount = $('#userAccount').val();
	var userName = $('#userName').val();
	var userPsw = $('#userPsw').val();
	
	if(userAccount.length == 0){
		alertMessage("温馨提示","请输入用户名");
		return;
	}
	if(userPsw.length == 0){
		alertMessage("温馨提示","请输入密码");
		return;
	}
	if(userName.length == 0){
		alertMessage("温馨提示","请输入姓名");
		return;
	}
	


	$.ajax({
        type: "POST",
        url:'addConsumer.pfv',
        data:$("#ff").serialize(),// 你的formid
    	dataType:'json',
        success: function(data) {
        	
    	
        		alertMessage("温馨提示",data.result);
        	

        }
    });
	
}


function loanAppResult(freezeQuery){
	var userAccount;
	var instiName;
	if(freezeQuery){
		if(!$("#userNameFreeze").val()==""){
			userAccount = $("#userNameFreeze").val();
		}
		if(!$("#idCardFreeze").val()==""){
			instiName = $("#idCardFreeze").val();
		}
	}else{
		if(!$("#userAccountX").val()==""){
			userAccount = $("#userAccountX").val();
		}
		
		if(!$("#instiNameC").val()==""){
			instiName = $("#instiNameC").val();
		}
		
	}
	
	
	var pageNo = $('#pageNo').val();

	$.ajax({
        type: "POST",
        url:'selectConsumer.pfv',
        data:{
        	userAccount:userAccount,
        	instiName:instiName,
    		pageNo:pageNo
    	},// 你的formid
    	dataType:'json',
        success: function(data) {
        	//最新查询结果数据显示
    		getQueryResultDatas(data,freezeQuery);
    		$('#count').val(data.pageinfo.totalCount);
			$('#pages').val(data.pageinfo.totalPageCount);
        }
    });
	
}


var getQueryResultDatas = function (result,freezeQuery){
	var doc = document;
	var databody = doc.getElementById('queryResultTable');
	var databodyFreeze = doc.getElementById('freezeDatabody');
	//删除现有行
	while (databody.rows.length > 0) {
		databody.deleteRow(0);
	}
	while (databodyFreeze.rows.length > 0) {
		databodyFreeze.deleteRow(0);
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
		td.innerHTML =e.userAccount;			
		tr.appendChild(td);

		td = doc.createElement("td");
		td.innerHTML = e.instiCode;		
		tr.appendChild(td);
		
		td = doc.createElement("td");
		td.innerHTML = e.userPhone;		
		tr.appendChild(td);

		td = doc.createElement("td");
		td.innerHTML = e.userMail;
		
		tr.appendChild(td);	
		//时间
			
		if(freezeQuery){
			td = doc.createElement("td");
			td.innerHTML = "<a class='label label-warning label-mini'  href='javascript:void(0)' onclick = 'freezeData(\""+e.userAccount+"\")'>冻结</a>";
			td.innerHTML += "<a class='label label-warning label-mini' href='javascript:void(0)' onclick = 'unFreezeData(\""+e.userAccount+"\")'>解冻</a>";
			tr.appendChild(td);	
			databodyFreeze.appendChild(tr);
		}else{
			td = doc.createElement("td");
			if(flag == "0"){
				td.innerHTML = "--";
			}else{
				td.innerHTML = "<a class='label label-warning label-mini' href='#modal-container-755411' onclick = 're(\""+e.userAccount+"\")' data-toggle='modal'>修改</a>";
			}		
			tr.appendChild(td);		
			databody.appendChild(tr);
		}

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

function re(e){
	
	 $.ajax({  
		    url:'amendConsumer.pfv',
		    type:'post', 
		    data:{
	        	userAccount:e
	    	},// 你的formid
		    cache:false,  
		    dataType:'json',  
		    success:function(data) {
		    	
		    	/*$("#tname").val(result.userAccount);*/
		    	$("#tname").val(data.userAccount);
		    	
		    	$("#instiNames").val(data.instiName);
		    	$("#usermails").val(data.userMail);
		    	
		    	$("#qqnums").val(data.qqnum);
		    	$("#userPhones").val(data.userPhone);
		    	
		      }
		 });
	
	
}

function saveResult(){
	var userAccounts = $('#tname').val();
	var instiNames = $('#instiNames').val();
	var userMails = $('#usermails').attr('value');
	
	var qqnums = $('#qqnums').val();
	var userPhones = $('#userPhones').val();
	var userPsws = $('#userPswModify').val();
	
	 $.ajax({  
		    url:'saveConsumer.pfv',
		    data:{
		    	userAccount:userAccounts,
		    	instiName:instiNames,
		    	userMail:userMails,
		    	qqnum:qqnums,
		    	userPhone:userPhones,
		    	userPsw:userPsws 	
		    } ,  
		     type:'post',  
		    cache:false,  
		     dataType:'text',  
		    success:function(result) {
		    	
		    	alertMessage("温馨提示",result);
		       
		      }
		 });
}
