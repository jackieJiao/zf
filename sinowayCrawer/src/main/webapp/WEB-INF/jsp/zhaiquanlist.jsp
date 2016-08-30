<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!--body wrapper start-->
<div class="row">
	<div class="col-sm-12">
		<section class="panel">
			<header class="panel-heading"> 债权管理列表 </header>
			<div class="panel-body">

				<div style="margin-bottom: 60px">
						<div class="col-sm-1 ">
							<label for="inputEmail3" class="control-label"
								style="margin-top: 7px">查询姓名</label>
						</div>
						<div class="col-sm-3">

							<input type='text' id='userName' name="userName"
								class="form-control" value="${name}">
							<input type='hidden' id='pageNo' value='1'/>
							<input type='hidden' id='pages' value='1'/>
							<input type='hidden' id='count' />
						</div>
						<label for="inputPassword3" class="col-sm-1 control-label"
							style="margin-top: 7px">身份证号</label>
						<div class="col-sm-3">
							<input type='text' id='idCard' name="idCard" value="${idCard}" class="form-control">
						</div>

						<!-- <label for="inputPassword3" class="col-sm-1 control-label" style="margin-top: 7px">查询</label> -->
						<div class="col-sm-3">
							<input type="button" class="btn btn-info" style="width: 60px;"
								value="查询" id="queryBtn">
						</div>
				</div>

				<div class="adv-table">
					<div class="row">
						<section id="unseen">
							<table class="table table-bordered table-striped table-condensed">
								<thead>
									<tr>
										<th>序号</th>
										<th>姓名</th>
										<th>身份证</th>
										<th>合同编号</th>
										<th>合同开始日期</th>
										<th>合同结束日期</th>
										<th>操作</th>
									</tr>
								</thead>
								<tbody id='databody'>

								</tbody>
							</table>
						</section>
					</div>
				</div>
				<div class="row-fluid">					
						<div class="dataTables_paginate paging_bootstrap pagination">
							<ul>
								<li class="disabled" id='pageinfo'></li>
								<li class="prev" id="firstPageLink"><a href="#">首页</a></li>
								<li id="prePageLink"><a href="#">上一页</a></li>
								<li id="nextPageLink"><a href="#">下一页</a></li>
								<li class="next" id="lastPageLink"><a href="#">尾页</a></li>
							</ul>
						</div>					
				</div>

			</div>
		</section>


	</div>
</div>
<!--body wrapper end-->
<script type="text/javascript">
	function queryData(){
		var userName = $('#userName').val();
		var idCard = $('#idCard').val();
		var pageNo = $('#pageNo').val();
		$.post('debtlist.pfv',{userName:userName,idCard:idCard,pageNo:pageNo},function(result){
			var doc = document;
			//alert(result);	
			//var obj = JSON.parse(result); 
			var databody = doc.getElementById('databody');
			//删除现有行
			while(databody.rows.length > 0){
				databody.deleteRow(0);
			}
			var rows = result.rows;
			var dataObj;
			for(var i=0;i<rows.length;i++){
				dataObj = rows[i];
				tr = doc.createElement("tr");
				
				td = doc.createElement("td");
				td.innerHTML =i+1;
				tr.appendChild(td);
				
				td = doc.createElement("td");
				td.innerHTML = dataObj.userName;
				tr.appendChild(td);
				
				td = doc.createElement("td");
				td.innerHTML = dataObj.idCard;
				tr.appendChild(td);
				
				td = doc.createElement("td");
				td.innerHTML = dataObj.contractId;
				tr.appendChild(td);
				
				td = doc.createElement("td");
				td.innerHTML = dataObj.startTime;
				tr.appendChild(td);
				
				td = doc.createElement("td");
				td.innerHTML = dataObj.stopTime;
				tr.appendChild(td);
				
				td = doc.createElement("td");
				opHtml = '';
				if(dataObj.isPaidFin == 0){
					opHtml = '<a role="button" href="javascript:toEdit(\''+dataObj.sinoid+'\')" class="btn btn-success">债权管理</a>';
					opHtml += '&nbsp;<a role="button" disabled="disabled" href="#" class="btn btn-default">报告下载</a>'
				}else if(dataObj.isPaidFin == 1){
					opHtml = '<a role="button" href="#" disabled="disabled" class="btn btn-default">债权管理</a>';
					opHtml += '&nbsp;<a role="button" href="downreport.pfv?reportId='+dataObj.reportid+'" class="btn btn-warning">报告下载</a>'
				}
				else{
					opHtml = '<a role="button" href="javascript:toEdit(\''+dataObj.sinoid+'\')" class="btn btn-success">债权管理</a>';
					opHtml += '&nbsp;<a role="button" href="downreport.pfv?reportId='+dataObj.reportid+'" class="btn btn-warning">报告下载</a>';
				}
				td.innerHTML = opHtml;
				tr.appendChild(td);
				
				databody.appendChild(tr);
			}
			
			//设置页码等标记
			$('#count').val(result.pageinfo.totalCount);
			$('#pages').val(result.pageinfo.totalPageCount);
			$('#pageinfo').html('<a href="#" style="text-decoration:none;color:#797979">总数'+result.pageinfo.totalCount+' 第'+result.pageinfo.pageNow+'页 共'+result.pageinfo.totalPageCount+'页</a>');
			
			
		});
	}
	
	function toEdit(sinoid){
		$('#main').load('debtmanage.pfv?sinoid='+sinoid);
	}
	
	$(function(){
		//查询按钮事件绑定
		$('#queryBtn').click(function(e){
			//执行查询，然后动态拼接数据表格,id=databody
			queryData();
		});
		
		//翻页按钮点击
		//首页
		$('#firstPageLink').click(function(e){
			$('#pageNo').val(1);
			queryData();
		});

		//上一页
		$('#prePageLink').click(function(e){
			var pageNo = $('#pageNo').val();
			var page = parseInt(pageNo)
			if(page>1){
				$('#pageNo').val((page-1));
				queryData();
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
				queryData();
			}
		});
		//末页
		$('#lastPageLink').click(function(e){
			var pageNo = $('#pageNo').val();
			var page = parseInt(pageNo);
			var pages = parseInt($('#pages').val());
			if(page<pages){
				$('#pageNo').val(pages);
				queryData();
			}
			//queryData();
		});
		
		var name = $('#userName').val();
		var idcard = $('#idCard').val();
		if(name != '' || idcard != ''){
			queryData();
		}
	});
</script>

