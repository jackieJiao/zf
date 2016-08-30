<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<div class="wrapper ">

	<!-- CISP信息共享服务   -->
	<div class="row">
		<div class="col-md-12">
			<div class="panel">
				<header class="panel-heading"> 进件审核查询 </header>
				<div class="panel-body">
					<form class="form-horizontal" role="form" id="ff" method="post"
						action="">

						<div class="form-group">
								<label class="control-label col-md-1">姓名:</label>
							<div class="col-sm-3 ">
								<input class="form-control" type="text" id="name" name="name"
									value="" required="required"></input>
							</div>						
							<label class="control-label col-md-1">身份证号:</label>
							<div class="col-sm-3 ">
								<input class="form-control" type="text" id="cardid"
									name="cardid" required="required" value="" size="24" />
							</div>
						</div>

						<div class="form-group">
							<label for="inputEmail3" class="col-md-1 control-label">学历</label>
							<div class="col-sm-3 ">


								<select id='edu' name='edu' class="form-control" value="0">
									<option value='0'>请选择</option>
									<option value='1'>初中及以下</option>
									<option value='2'>高中中专技校</option>
									<option value='3'>博士及以上</option>
									<option value='4'>硕士</option>
									<option value='5'>本科</option>
									<option value='6'>大专</option>
								</select>
							</div>
							<label class="col-md-1 control-label">借款地点:</label>
							<div class="col-sm-3 ">

								<div class="bs-chinese-region flat dropdown"
									data-submit-type="id" data-min-level="1" data-max-level="3">
									<input type="text" class="form-control" name="requestLocation"
										id="requestLocation" placeholder="选择你的地区"
										data-toggle="dropdown" readonly="" value="">
									<div class="dropdown-menu" role="menu" aria-labelledby="dLabel">
										<div>
											<ul class="nav nav-tabs" role="tablist">
												<li role="presentation" class="active"><a
													href="#province" data-next="city" role="tab"
													data-toggle="tab">省份</a></li>
												<li role="presentation"><a href="#city"
													data-next="district" role="tab" data-toggle="tab">城市</a></li>

											</ul>
											<div class="tab-content">
												<div role="tabpanel" class="tab-pane active" id="province">--</div>
												<div role="tabpanel" class="tab-pane" id="city">--</div>

											</div>
										</div>
									</div>
								</div>
							</div>


						</div>
						<div class="form-group">
							<label for="inputEmail3" class="col-md-1 control-label">申请类型:</label>
							<div class="col-sm-3 ">



								<select id='requestType' name='requestType' class="form-control"
									required="required">
									<option value='0'>请选择</option>
									<option value='1'>经营</option>
									<option value='2'>消费</option>
									<option value='3'>其他</option>

								</select>


							</div>
							<label for="inputPassword3" class="col-md-1 control-label">申请金额(元):</label>
							<div class="col-sm-3 ">
								<input type="text" id="requestMoney" name="requestMoney"
									required="required" value="" class="form-control" />
							</div>
						</div>
						<div class="form-group">
							<label for="inputEmail3" class="col-md-1 control-label">申请日期:</label>
							<div class="col-sm-3 col-xs-11">

								<div data-date-viewmode="years" data-date-format="yyyy-mm-dd"
									data-date="2016-08-01" class="input-append date dpYears">
									<input type="text" readonly="" value="" size="16"
										class="form-control" id="jinjianTime" name="jinjianTime" /> <span
										class="input-group-btn add-on">
										<button class="btn btn-primary" type="button">
											<i class="fa fa-calendar"></i>
										</button>
									</span>
								</div>
							</div>
							<label for="inputPassword3" class="col-md-1 control-label">申请编号:</label>
							<div class="col-sm-3 ">
								<input type="text" id="instiid" name="instiid"
									 required="required" value=""
									class="form-control" />
							</div>
						</div>


					</form>

					<div style="text-align: center; padding: 5px">

						<button id="modal-755411" onclick="huixian()"
							role="button" class="btn btn-primary" data-toggle="modal"  data-target="#modal-container-755411"
							>提交</button>

						<!-- <button type="button" class="btn btn-primary" style="width:60px;" id="clearvalue">清除</button> -->

					</div>

					<!-- 弹出窗=========================================================== -->
					<div class="modal fade" id="modal-container-755411" role="dialog"
						aria-labelledby="myModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-hidden="true">×</button>
									<h4 class="modal-title" id="myModalLabel">华道受理号：</h4>
									<span id="shoulihao" name="shoulihao">${sinoId}</span>
								</div>
								<div class="modal-body">
									<form action="#" class="form-horizontal ">

										<div class="form-group">
											<label class="control-label col-md-4"> 姓名 </label>
											<div class="col-md-6">
												<input size="16" type="text" id="tname" readonly = "readonly">
											</div>
										</div>


										<div class="form-group">
											<label class="control-label col-md-4"> 身份证号 </label>
											<div class="col-md-6">
												<input size="16" type="text" id="tcardid" readonly = "readonly">
											</div>
										</div>

										<div class="form-group">
											<label class="control-label col-md-4"> 学历</label>
											<div class="col-md-6">
												<input size="16" type="text" id="tedu" readonly = "readonly">
											</div>
										</div>

										<div class="form-group">
											<label class="control-label col-md-4"> 借款地点 </label>
											<div class="col-md-6">
												<input size="16" type="text" id="trequestLocation" readonly = "readonly">
											</div>
										</div>

										<div class="form-group">
											<label class="control-label col-md-4"> 申请类型 </label>
											<div class="col-md-6">
												<input size="16" type="text" id="trequestTypes" readonly = "readonly">
											</div>
										</div>

										<div class="form-group">
											<label class="control-label col-md-4"> 申请金额(元): </label>
											<div class="col-md-6">
												<input size="16" type="text" id="trequestMoneys" readonly = "readonly">
											</div>
										</div>

										<div class="form-group">
											<label class="control-label col-md-4"> 申请日期: </label>
											<div class="col-md-6">
												<input size="16" type="text" id="tjinjianTimes" readonly = "readonly">
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-4"> 申请编号: </label>
											<div class="col-md-6">
												<input size="16" type="text" id="tinstiid" readonly = "readonly">
											</div>
										</div>


									</form>
								</div>
								<!-- div结束 -->

								<div class="modal-footer">
									<button type="button" class="btn btn-default"
										data-dismiss="modal">取消</button>
									<button type="button" class="btn btn-primary"
										onclick="queryData()" data-dismiss="modal">查询</button>
								</div>
							</div>
						</div>
					</div>

					<!-- 弹出窗=========================================================== -->

				</div>
			</div>
		</div>
	</div>



	<div class="row">
		<div class="col-md-12">
			<div class="panel">
				<header class="panel-heading"> 申请结果</header>
				<div class="panel-body">
					<form action="/" class="" method="post">
						<table class="table table-bordered table-striped text-center">

							<thead>
								<tr>
									<th colspan='2' class="text-center">正常还款账户</th>
									<th colspan='2' class="text-center">最近6个月借款申请记录</th>

								</tr>
							</thead>
							<tbody>

								<tr>
									<td width="25%">未清笔数:</td>
									<td><span id="normalunsettle"></span></td>
									<td width="25%">通过笔数:</td>
									<td><span id="sixOver"></span></td>
								</tr>
								<tr>
									<td>结算笔数:</td>
									<td><span id="normalsettle"></span></td>
									<td>拒绝笔数:</td>
									<td><span id="sixRefuse"></span></td>

								</tr>
								<tr>
									<td></td>
									<td></td>
									<td>待审笔数:</td>
									<td><span id="sixIng"></span></td>


								</tr>
								<tr>
									<td></td>
									<td></td>
									<td>取消笔数:</td>
									<td><span id="sixcancel"></span></td>

								</tr>
							</tbody>
							<thead>
								<tr>
									<th colspan='2' class="text-center">异常还款</th>
									<th colspan='2' class="text-center">最近2年内查询记录</th>

								</tr>
							</thead>
							<tbody>
								<tr>
									<td>未清笔数:</td>
									<td><span id="unnormalunsettle"></span></td>
									<td>申请/债权/逾期/补录:</td>
									<td><span id="twoyearsearch"></span></td>


								</tr>
								<tr>

									<td>结算笔数:</td>
									<td><span id="unnormalsettle"></span></td>
									<td></td>
									<td></td>

								</tr>
							</tbody>
						</table>
					</form>
				</div>

			</div>
		</div>
	</div>







	<div class="row">
		<div class="col-md-12">
			<div class="panel">
				<header class="panel-heading">最新查询结果 </header>

				<div class="panel-body">
					<div style="display: inline-block; width: 100%; margin-bottom: 20px">
						<div class="col-sm-1 ">
							<label for="inputEmail3" class="control-label"
								style="margin-top: 7px">查询姓名</label>
						</div>
						<div class="col-sm-3">

							<input type='text' id='userNamex' class="form-control">
						</div>
						<label for="inputPassword3" class="col-sm-1 control-label"
							style="margin-top: 7px">身份证号</label>
						<div class="col-sm-3">
							<input type='text' id='idCardx' class="form-control">
						</div>

						<!-- <label for="inputPassword3" class="col-sm-1 control-label" style="margin-top: 7px">查询</label> -->
						<div class="col-sm-3">
							<input type="button" class="btn btn-primary" style="width: 60px;"
								value="查询" id="queryResultBtn">
						</div>
					</div>
					<div class="adv-table">

						<div class="row">
							<table class="display table table-bordered table-striped">
								<thead>
									<tr>
										<th>姓名</th>
										<th>身份证号</th>
										<th>提交人</th>
										<th>提交时间</th>
										<th>操作</th>
									</tr>
								</thead>
								<tbody id="queryResultTable">
								</tbody>
							</table>
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
						<input type='hidden' id='pageNo' value='1' /> <input type='hidden'
							id='pages' value='1' /> <input type='hidden' id='count' />
					</div>

				</div>
			</div>
		</div>

	</div>


</div>


<!-- Placed js at the end of the document so the pages load faster -->


<!--pickers plugins-->


<!--pickers initialization-->
<script src="js/pickers-init.js"></script>
<script type="text/javascript" src="js/jinjian.js"></script>


<script type="text/javascript" src="js/bootstrap-chinese-region/bootstrap-chinese-region.js"></script>

