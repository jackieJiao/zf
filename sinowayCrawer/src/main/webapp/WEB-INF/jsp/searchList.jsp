<%@ page language="java" import="java.util.*" pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<link rel="stylesheet" href="css/bootstrap-chinese-region.css">
<script type="text/javascript" src="js/location1.js"></script>
<!--body wrapper start-->
<div class="wrapper ">
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
								class="form-control">
							<input type='hidden' id='pageNo' value='1'/>
							<input type='hidden' id='pages' value='1'/>
							<input type='hidden' id='count' />
						</div>
						<label for="inputPassword3" class="col-sm-1 control-label"
							style="margin-top: 7px">身份证号</label>
						<div class="col-sm-3">
							<input type='text' id='idCard' name="idCard" class="form-control">
						</div>

						<!-- <label for="inputPassword3" class="col-sm-1 control-label" style="margin-top: 7px">查询</label> -->
						<div class="col-sm-3">
							<input type="button" class="btn btn-primary" style="width: 60px;"
								value="查询" onclick="queryDataHT()" >
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
										<th>提交日期</th>
										<th>申请金额</th>
										<th>合同到期日期</th>
										<th>剩余天数</th>
										<th>操作</th>
									</tr>
								</thead>
								<tbody id='queryResultTable'>

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

					<!-- 合同管理连接的弹出框开始 -->
	<div class="container">
		<div class="row clearfix">
			<div class="col-md-12 column">
				<!--  <a id="modal-755411" href="#modal-container-755411" role="button"
					class="btn" data-toggle="modal">触发遮罩窗体</a>  -->
				<!-- 弹出窗 -->
				<div class="modal fade" id="modal-container-755411" role="dialog"
					aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-hidden="true">×</button>
								<h4 class="modal-title" id="myModalLabel">合同管理</h4>
							</div>
							<div class="modal-body">
								<form action="#" class="form-horizontal ">
									<div class="form-group">
										<label  style="text-align:left;margin-left:30px" class="control-label col-md-3"> 申请编号 :</label>
										<div class="col-md-6">
											<input id="sinoid" class="form-control" style="font-size:13px;" readonly="true" size="18" type="text"
												onfocus="this.blur()" disabled>
										</div>
									</div>
									<div class="form-group">
										<label style="text-align:left;margin-left:30px" class="control-label col-md-3"> 姓名: </label>
										<div class="col-md-6">
											<input id="showName" class="form-control" readonly="true" size="16" type="text"
												onfocus="this.blur()" disabled>
										</div>
									</div>

									<div class="form-group">
										<label style="text-align:left;margin-left:30px" class="control-label col-md-3">身份证号码:</label>
										<div class="col-md-6">
											<input id="showCardid" class="form-control" readonly="true" onfocus="this.blur()"
												size="16" type="text" disabled>
										</div>
									</div>
					
						
							<div class="col-sm-12 icheck ">
								<div class="flat-green">
									<div class="radio ">
										<input tabindex="3" type="radio" name="contractResult"
											value="1" id="radio1"/> <label>同意贷款 </label>
									</div>
								</div>
								<div class="flat-grey">
									<div class="radio ">
										<input tabindex="3" type="radio" name="contractResult"
											value="2" id="radio2"/> <label>拒绝贷款</label>
									</div>
								</div>

								<div class="flat-red">
									<div class="radio ">
										<input tabindex="3" type="radio" name="contractResult"
											value="3" id="radio3"/> <label>延迟处理</label>
									</div>
								</div>
								<div class="flat-blue">
									<div class="radio ">
										<input tabindex="3" type="radio" name="contractResult"
											value="4" id="radio4"/> <label>客户取消</label>
									</div>
								</div>

							</div> 
						
						
					
									<div id='showDiv'>
									<!-- 同意页面div -->
									<div id="a1" class="form-group">
					<div class="form-group">
						<label style="text-align:left;margin-left:30px" class="control-label col-md-3">合同编号：</label>
						<div class="col-md-6 col-xs-11">
							<input class="form-control" id="htbh" name="htbh" size="16"
								type="text" value="" />
						</div>
					</div>
					<div class="form-group">
						<label style="text-align:left;margin-left:30px" class="control-label col-md-3">合同金额：</label>
						<div class="col-md-6 col-xs-11">
							<input class="form-control" id="htje" size="16" type="text"
								value="" />
						</div>
					</div>
					<div class="form-group">
						<label style="text-align:left;margin-left:30px" class="control-label col-md-3">还款期数：</label>
						<div class="col-md-6 col-xs-11">
							<input class="form-control" id="hkqs" size="16" type="text"
								value="" />
						</div>
					</div>
					<div class="form-group">
						<label style="text-align:left;margin-left:30px" class="control-label col-md-3">借款日期：</label>
						<div class="col-md-5 col-xs-11">

							<div data-date-viewmode="years" data-date-format="yyyy-mm-dd"
								data-date="2016-08-23" class="input-append date dpYears">
								<input type="text" id="jkrq" readonly="" value=""
									size="16" class="form-control"> <span
									class="input-group-btn add-on">
									<button class="btn btn-primary" type="button">
										<i class="fa fa-calendar"></i>
									</button>
								</span>
							</div>
						</div>
					</div>
					<div class="form-group">
						<label style="text-align:left;margin-left:30px" class="control-label col-md-3">到期日期：</label>
						<div class="col-md-5 col-xs-11">
							<div data-date-viewmode="years" data-date-format="yyyy-mm-dd"
								data-date="2016-08-23" class="input-append date dpYears">
								<input type="text" id="dqrq" readonly="" value=""
									size="16" class="form-control"> <span
									class="input-group-btn add-on">
									<button class="btn btn-primary" type="button">
										<i class="fa fa-calendar"></i>
									</button>
								</span>
							</div>
						</div>
					</div>
					<div class="form-group">
						<label style="text-align:left;margin-left:30px" class="control-label col-md-3">借款类型：</label>
						<div class="col-md-6 col-xs-11">
							<select id='jklx' name='requestType' class="form-control"    required="required">
									<option value='0'>请选择</option>
									<option value='1'>经营</option>
									<option value='2'>消费</option>
									<option value='3'>其他</option>
							</select>
					   </div>
					</div>
					<div class="form-group">
						<label style="text-align:left;margin-left:30px" class="control-label col-md-3">担保方式：</label>
						<div class="col-md-6 col-xs-11">
							<select id='dbfs' name='requestType' class="form-control"    required="required">
									<option value='0'>请选择</option>
									<option value='1'>信用</option>
									<option value='2'>抵押</option>
									<option value='3'>质押</option>
									<option value='3'>担保</option>
									<option value='3'>保证</option>
									<option value='3'>其他</option>
							</select>
						</div>
					</div>
				<div class="form-group">
					<label style="text-align:left;margin-left:30px" class="control-label col-md-3">借款地点：</label>
					<div class="col-sm-3 ">
					
						<div class="bs-chinese-region flat dropdown" data-submit-type="id" data-min-level="1" data-max-level="3">
							<input type="text" class="form-control" name="requestLocation" id="jkdd" placeholder="选择你的地区" data-toggle="dropdown" readonly="" value="" >
							<div class="dropdown-menu" role="menu" aria-labelledby="dLabel">
								<div>
									<ul class="nav nav-tabs" role="tablist">
										<li role="presentation" class="active"><a href="#province" data-next="city" role="tab" data-toggle="tab">省份</a></li>
										<li role="presentation"><a href="#city" data-next="district" role="tab" data-toggle="tab">城市</a></li>
										
									</ul>
									<div class="tab-content">
										<div role="tabpanel" class="tab-pane active" id="province">--</div>
										<div role="tabpanel" class="tab-pane" id="city">--</div>
										
									</div>
								</div>
							</div>
						</div></div></div></div>
						<!-- 同意div结束 -->
						<!-- 拒绝div开始 -->
						<div id="refuseDiv">
					
					<div class="form-group">
						<label style="text-align:left;margin-left:30px" class="control-label col-md-3">拒贷原因：</label>
						<div class="col-md-6 col-xs-11">
							<select id='jdyy' name='requestType' class="form-control"    required="required">
									<option value='0'>请选择</option>
									<option value='1'>信用评分过低</option>
									<option value='2'>有失信行为记录</option>
									<option value='3'>信用额度用完</option>
									<option value='4'>暂停贷款业务</option>
									<option value='5'>其他</option>
							</select>
					   </div>
					</div>
					
					<br>
					<div class="form-group">
						<label style="text-align:left;margin-left:30px" class="control-label col-md-3">拒贷日期：</label>
						<div class="col-md-6 col-xs-11">
							<div data-date-viewmode="years" data-date-format="yyyy-mm-dd"
								data-date="2016-08-23" class="input-append date dpYears">
								<input type="text" id="jdrq" readonly="" value="2016-08-23"
									size="16" class="form-control"> <span
									class="input-group-btn add-on">
									<button class="btn btn-primary" type="button">
										<i class="fa fa-calendar"></i>
									</button>
								</span>
							</div>
						</div>
					</div>
					
					
					
				</div>
						<!-- 拒绝div结束 -->
									</div>
								</form>
							</div>
							<!-- div结束 -->
			<!-- radio的值显示不同的div -->
			<div style="display: none">
			
					<!-- <div class="col-sm-3 ">
<form action="" method=post name=form1>
	<table width="" border=0 cellspacing="0" cellpadding="1"
		!bgcolor=#FFFDE6>
		<tr>
			
			<td class="black_con9"><select name="selectp"
				onChange="selectcityarea('selectp','selectc','form1');">
					<option value="0" selected>不限--
				</select></td>
			<td class="black_con9"><select id="jkdd" name="selectc">
					<option value="0" selected>不限--
					</select></td>
		</tr>
		
	</table>
</form>
				</div> -->
			</div>	
				<!-- 同意页面结束 -->
			
							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">取消</button>
								<button type="button" class="btn btn-success" data-dismiss="modal"
									onclick="saveContractResult()">保存</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 弹出框结束 -->
	<!-- 测试td标签事件	 -->	
   </div>
</section>
</div>
</div>
<!--body wrapper end-->
<script type="text/javascript">

	
	/* 点击合同管理后，触发此方法 
	传入td的对象	
	获得此td标签的sn sc属性的值
	把值设置到遮拦窗		
	*/
	function setValueFunc(){
		var sname=this.sn;
		var scardid=this.sc;
		
		$("#showName").val(sname);
		$("#showCardid").val(scardid);
	};
	
	
	
</script>
<script type="text/javascript" src="js/contract-manager.js"></script>
<script type="text/javascript">
$(function() {
	queryDataHT();
	$.getJSON('js/bootstrap-chinese-region/sql_areas.json',function(data){
		
		for (var i = 0; i < data.length; i++) {
			var area = {id:data[i].id,name:data[i].cname,level:data[i].level,parentId:data[i].upid};
			data[i] = area;
		}

		$('.bs-chinese-region').chineseRegion('source',data);
	});

	
})
</script>
<!-- icheack -->
<script src="js/iCheck/jquery.icheck.js"></script>
<script src="js/icheck-init.js"></script>

<script src="js/pickers-init.js"></script>


<script type="text/javascript" src="js/bootstrap-chinese-region/bootstrap-chinese-region.js"></script>
<!-- <script language="javascript">
	first("selectp", "selectc", "form1", 0, 0);
</script> -->
