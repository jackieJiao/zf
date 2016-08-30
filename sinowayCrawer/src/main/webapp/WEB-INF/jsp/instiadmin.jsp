<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
<meta name="keywords"
	content="admin, dashboard, bootstrap, template, flat, modern, theme, responsive, fluid, retina, backend, html5, css, css3">
<meta name="description" content="">
<meta name="author" content="ThemeBucket">
<script type="text/javascript" src="js/instiadmin.js"></script>
</head>
<body>
	<div class="wrapper">
		<div class="row">
			<div class="col-md-12">
				<section class="panel">
					<header class="panel-heading custom-tab">
						<ul class="nav nav-tabs">
							<li><a href="#instiadmin" data-toggle="tab"> <i
									class="fa fa-home"></i>
							</a></li>
							<li class="active"><a href="#newinsti" data-toggle="tab">
									<i class="fa fa-user"></i> 新建机构
							</a></li>
							<li class=""><a href="#updateinsti" data-toggle="tab"> <i
									class="fa fa-envelope-o"></i> 修改
							</a></li>
						</ul>
					</header>
					<div class="panel-body">
						<div class="tab-content">
							<!-- 新建机构 -->
							<div class="tab-pane active" id="newinsti">
								<form class="form-horizontal" role="form" id="instiAdd">
									<div class="form-group">
										<label for="instiShortname" class="col-md-2 control-label">机构简称:</label>
										<div class="col-md-4 ">
											<input type="text" id="instiShortname" name="instiShortname"
												required="required" value="" class="form-control" />
										</div>
										<label for="instiCode" class="col-md-2 control-label">机构代码:</label>
										<div class="col-md-4 ">
											<input type="text" id="instiCode" name="instiCode"
												required="required" value="" class="form-control" />
										</div>
									</div>
									<div class="form-group">
										<label for="instiName" class="col-md-2 control-label">申请机构全称:</label>
										<div class="col-md-4">
											<input type="text" id="instiName" name="instiName"
												required="required" value="" class="form-control" />
										</div>
										<label for="instiType" class="col-md-2 control-label">会员类型</label>
										<div class="col-md-4">
											<select class="form-control m-bot15" id="instiType"
												name="instiType">
												<option value="1">消费金融公司</option>
												<option value="2">银行</option>
												<option value="3">小贷公司</option>
												<option value="4">网贷机构</option>
												<option value="9">其他</option>
											</select>
										</div>
									</div>
									<div class="form-group">
										<label for="corporationName" class="col-md-2 control-label">法人代表姓名:</label>
										<div class="col-md-4">
											<input type="text" id="corporationName"
												name="corporationName" required="required" value=""
												class="form-control" />
										</div>
										<label for="creditPerson" class="col-md-2 control-label">征信负责人姓名:</label>
										<div class="col-md-4">
											<input type="text" id="creditPerson" name="creditPerson"
												required="required" value="" class="form-control" />
										</div>
									</div>
									<div class="form-group">
										<label for="socialCreditCode" class="col-md-2 control-label">社会信用代码:</label>
										<div class="col-md-4">
											<input type="text" id="socialCreditCode"
												name="socialCreditCode" required="required" value=""
												class="form-control" />
										</div>
										<label for="registeredAddress" class="col-md-2 control-label">注册地址:</label>
										<div class="col-md-4">
											<input type="text" id="registeredAddress"
												name="registeredAddress" required="required" value=""
												class="form-control" />
										</div>
									</div>
									<div class="form-group">
										<label for="generalManager" class="col-md-2 control-label">总经理姓名:</label>
										<div class="col-md-4">
											<input type="text" id="generalManager" name="generalManager"
												required="required" value="" class="form-control" />
										</div>
										<label for="zipCode" class="col-md-2 control-label">邮政编码:</label>
										<div class="col-md-4">
											<input type="text" id="zipCode" name="zipCode"
												required="required" value="" class="form-control" />
										</div>
									</div>
									<div class="form-group">
										<label for="registeredCapital" class="col-md-2 control-label">注册资本:</label>
										<div class="col-md-4">
											<input type="text" id="registeredCapital"
												name="registeredCapital" required="required" value=""
												class="form-control" />
										</div>
										<label for="webUrl" class="col-md-2 control-label">网站地址:</label>
										<div class="col-md-4">
											<input type="text" id="webUrl" name="webUrl"
												required="required" value="" class="form-control" />
										</div>
									</div>
									<div class="form-group">
										<label for="instiLocation" class="col-md-2 control-label">办公地址:</label>
										<div class="col-md-4">
											<input type="text" id="instiLocation" name="instiLocation"
												required="required" value="" class="form-control" />
										</div>
										<label for="faxNumber" class="col-md-2 control-label">传真号码:</label>
										<div class="col-md-4">
											<input type="text" id="faxNumber" name="faxNumber"
												required="required" value="" class="form-control" />
										</div>
									</div>
									<div class="form-group">
										<label for="instiPhone" class="col-md-2 control-label">联系电话:</label>
										<div class="col-md-4">
											<input type="text" id="instiPhone" name="instiPhone"
												required="required" value="" class="form-control" />
										</div>
										<label for="accessIp" class="col-md-2 control-label">接入终端的IP地址:</label>
										<div class="col-md-4">
											<input type="text" id="accessIp" name="accessIp"
												required="required" value="" class="form-control" />
										</div>

									</div>
									<div class="form-group">
										<label for="accessType" class="col-md-2 control-label">系统接入方式:</label>
										<div class="col-md-4">

											<label class="checkbox-inline"> <input
												type="checkbox" id="accessType" name="accessType" value="1">
												WEB页面
											</label> <label class="checkbox-inline"> <input
												type="checkbox" id="accessType" name="accessType" value="2">
												接口
											</label>
										</div>
									</div>
								</form>
								<div style="text-align: center; padding: 5px">
									<button type="button" class="btn btn-primary"
										onclick="insertInstiDetail()">保存</button>
									<button type="button" class="btn btn-primary"
										onclick="resetForm()">重置</button>
								</div>
							</div>
							<!-- 修改 -->
							<div class="tab-pane " id="updateinsti">
								<header class="panel-heading"> 修改列表 </header>
								<div class="panel-body">
									<div class="col-md-offset-5 col-md-2">
										<label for="instiShortname" class="control-label">机构简称</label>
									</div>
									<div class="col-md-4">
										<input type='text' id='sinstiShortname' name="instiShortname"
											class="form-control"> <input type='hidden'
											id='pageNo' value='1' /> <input type='hidden' id='pages'
											value='1' /> <input type='hidden' id='count' />
									</div>
									<div class="col-md-1">
										<input type="button" class="btn btn-primary"
											style="width: 60px;" value="查询" id="queryResultBtn">
									</div>
								</div>

								<div class="adv-table">
									<div class="row">
										<section id="unseen">
											<table
												class="table table-bordered table-striped table-condensed">
												<thead>
													<tr>
														<th>机构简称</th>
														<th>会员机构代码</th>
														<th>征信负责人姓名</th>
														<th>联系电话</th>
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


								<!-- 弹出窗=========================================================== -->
								<div class="modal fade" id="modal-container" role="dialog"
									aria-labelledby="myModalLabel" aria-hidden="true">
									<div class="modal-dialog">
										<div class="modal-content">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal"
													aria-hidden="true">×</button>
											</div>
											<div class="modal-body">
												<form class="form-horizontal" role="form" id="instiUpdate">
													<div class="form-group">
														<label for="instiShortname" class="col-md-2 control-label">机构简称:</label>
														<div class="col-md-4 ">
															<input type="text" id="minstiShortname"
																name="instiShortname" required="required" value=""
																class="form-control" />
														</div>
														<label for="instiCode" class="col-md-2 control-label">机构代码:</label>
														<div class="col-md-4 ">
															<input type="text" id="minstiCode" name="instiCode"
																required="required" value="" class="form-control" />
														</div>
													</div>
													<div class="form-group">
														<label for="instiName" class="col-md-2 control-label">申请机构全称:</label>
														<div class="col-md-4">
															<input type="text" id="minstiName" name="instiName"
																required="required" value="" class="form-control" />
														</div>
														<label for="instiType" class="col-md-2 control-label">会员类型</label>
														<div class="col-md-4">
															<select class="form-control m-bot15" id="minstiType"
																name="instiType">
																<option value="1">消费金融公司</option>
																<option value="2">银行</option>
																<option value="3">小贷公司</option>
																<option value="4">网贷机构</option>
																<option value="9">其他</option>
															</select>
														</div>
													</div>
													<div class="form-group">
														<label for="corporationName"
															class="col-md-2 control-label">法人代表姓名:</label>
														<div class="col-md-4">
															<input type="text" id="mcorporationName"
																name="corporationName" required="required" value=""
																class="form-control" />
														</div>
														<label for="creditPerson" class="col-md-2 control-label">征信负责人姓名:</label>
														<div class="col-md-4">
															<input type="text" id="mcreditPerson" name="creditPerson"
																required="required" value="" class="form-control" />
														</div>
													</div>
													<div class="form-group">
														<label for="socialCreditCode"
															class="col-md-2 control-label">社会信用代码:</label>
														<div class="col-md-4">
															<input type="text" id="msocialCreditCode"
																name="socialCreditCode" required="required" value=""
																class="form-control" />
														</div>
														<label for="registeredAddress"
															class="col-md-2 control-label">注册地址:</label>
														<div class="col-md-4">
															<input type="text" id="mregisteredAddress"
																name="registeredAddress" required="required" value=""
																class="form-control" />
														</div>
													</div>
													<div class="form-group">
														<label for="generalManager" class="col-md-2 control-label">总经理姓名:</label>
														<div class="col-md-4">
															<input type="text" id="mgeneralManager"
																name="generalManager" required="required" value=""
																class="form-control" />
														</div>
														<label for="zipCode" class="col-md-2 control-label">邮政编码:</label>
														<div class="col-md-4">
															<input type="text" id="mzipCode" name="zipCode"
																required="required" value="" class="form-control" />
														</div>
													</div>
													<div class="form-group">
														<label for="registeredCapital"
															class="col-md-2 control-label">注册资本:</label>
														<div class="col-md-4">
															<input type="text" id="mregisteredCapital"
																name="registeredCapital" required="required" value=""
																class="form-control" />
														</div>
														<label for="webUrl" class="col-md-2 control-label">网站地址:</label>
														<div class="col-md-4">
															<input type="text" id="mwebUrl" name="webUrl"
																required="required" value="" class="form-control" />
														</div>
													</div>
													<div class="form-group">
														<label for="instiLocation" class="col-md-2 control-label">办公地址:</label>
														<div class="col-md-4">
															<input type="text" id="minstiLocation"
																name="instiLocation" required="required" value=""
																class="form-control" />
														</div>
														<label for="faxNumber" class="col-md-2 control-label">传真号码:</label>
														<div class="col-md-4">
															<input type="text" id="mfaxNumber" name="faxNumber"
																required="required" value="" class="form-control" />
														</div>
													</div>
													<div class="form-group">
														<label for="instiPhone" class="col-md-2 control-label">联系电话:</label>
														<div class="col-md-4">
															<input type="text" id="minstiPhone" name="instiPhone"
																required="required" value="" class="form-control" />
														</div>
														<label for="accessIp" class="col-md-2 control-label">接入终端的IP地址:</label>
														<div class="col-md-4">
															<input type="text" id="maccessIp" name="accessIp"
																required="required" value="" class="form-control" />
														</div>

													</div>
													<div class="form-group">
														<label for="accessType" class="col-md-2 control-label">系统接入方式:</label>
														<div class="col-md-4">

															<label class="checkbox-inline"> <input
																type="checkbox" id="maccessType1" name="accessType"
																value="1"> WEB页面
															</label> <label class="checkbox-inline"> <input
																type="checkbox" id="maccessType2" name="accessType"
																value="2"> 接口
															</label>
														</div>
													</div>
												</form>
											</div>
											<!-- div结束 -->

											<div class="modal-footer">
												<button type="button" class="btn btn-default"
													data-dismiss="modal">关闭</button>
												<button type="button" class="btn btn-primary"
													onclick="updateInstiDetail()" data-dismiss="modal">保存</button>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</section>
			</div>
		</div>
	</div>
</body>
</html>