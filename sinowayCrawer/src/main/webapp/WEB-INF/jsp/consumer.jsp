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
							<li class="active"><a href="#newconsumer" data-toggle="tab">
									<i class="fa fa-user"></i> 新建用户
							</a></li>
							<li class=""><a href="#updateconsumer" data-toggle="tab"> <i
									class="fa fa-envelope-o"></i> 修改
							</a></li>
							<li class=""><a href="#jiedongconsumer" data-toggle="tab"> <i
									class="fa fa-envelope-o"></i> 冻结
							</a></li>
						</ul>
					</header>
					<div class="panel-body">
						<div class="tab-content">
							<!-- 新建机构 -->
							<div class="tab-pane active" id="newconsumer">
								<form class="form-horizontal" role="form" id="ff" method="post"
									action="">
									<div class="form-group">
										<label for="" class="col-md-2 control-label">机构名称:</label>
										<div class="col-md-4 ">
											<select id='instiName' name='instiName' class="form-control" >
											   <c:forEach items="${instiname}" var="years" varStatus="vs">    
                                                <option value="${years.instiName}">${years.instiName}</option>  
                                                 </c:forEach>

											</select>
										</div>
										<label for="" class="col-md-2 control-label">会员用户名:</label>
										<div class="col-md-4 ">
											<input type="text" id="userAccount" name="userAccount"  value=""
												class="form-control" />
										</div>
									</div>
									<div class="form-group">
										<label for="" class="col-md-2 control-label">手机号:</label>
										<div class="col-md-4">
											<input type="text" id="userPhone" name="userPhone"  value=""
												class="form-control" />
										</div>
										<label for="" class="col-md-2 control-label">会员密码:</label>
										<div class="col-md-4">
											<input type="text" id="userPsw" name="userPsw" required="required" value=""
												class="form-control" />
										</div>
									</div>
									<div class="form-group">
										<label for="" class="col-md-2 control-label">QQ号码:</label>
										<div class="col-md-4">
											<input type="text" id="qqnum" name="qqnum"  value=""
												class="form-control" />
										</div>
										<label for="" class="col-md-2 control-label">电子邮箱:</label>
										<div class="col-md-4">
											<input type="text" id="userMail" name="userMail"  value=""
												class="form-control" />
										</div>
									</div>
									<div class="form-group">
										<label for="" class="col-md-2 control-label">姓名:</label>
										<div class="col-md-4">
											<input type="text" id="userName" name="userName"  value=""
												class="form-control" />
										</div>
										
									</div>
	

								</form>
				<div style="text-align: center; padding: 5px">

				<button type="button" class="btn btn-primary" style="width:60px;" id="queryBtn">保存</button>
  
				<button type="button" class="btn btn-primary" style="width:60px;" id="clearvalue">清除</button>
					
				</div>
	</div>
	
	
	
							<!-- 修改 -->
							<div class="tab-pane " id="updateconsumer">
							
							<div class="col-sm-12">
							
		
			<header class="panel-heading"> 修改列表 </header>
			<div class="panel-body">

				<div style="margin-bottom: 60px">
						<div class="col-sm-1 ">
							<label for="inputEmail3" class="control-label"
								style="margin-top: 7px">会员用户名</label>
						</div>
						<div class="col-sm-3">

							<input type='text' id='userAccountX' name="userAccount"
								class="form-control">
							<input type='hidden' id='pageNo' value='1'/>
							<input type='hidden' id='pages' value='1'/>
							<input type='hidden' id='count' />
						</div>
						<label for="inputPassword3" class="col-sm-1 control-label"
							style="margin-top: 7px">机构简称</label>
						<div class="col-sm-3">
							<input type='text' id='instiNameC' name="instiName" class="form-control">
						</div>

						<!-- <label for="inputPassword3" class="col-sm-1 control-label" style="margin-top: 7px">查询</label> -->
						<div class="col-sm-3">
							<input type="button" class="btn btn-primary" style="width: 60px;"
								value="查询" id="queryResultBtn">
						</div>
				</div>

				<div class="adv-table">
					<div class="row">
						<section id="unseen">
							<table class="table table-bordered table-striped table-condensed">
								<thead>
									<tr>
										<th>会员用户名</th>
										<th>机构检测</th>
										<th>手机号码</th>
										<th>联系邮箱</th>
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
				<div class="modal fade" id="modal-container-755411" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
							</div>
							<div class="modal-body">
                                            <form action="#" class="form-horizontal" id = "tijiao">
                                            
                                                <div class="form-group">
                                                    <label class="control-label col-md-4"> 会员用户名 </label>
                                                    <div class="col-md-6">
                                                        <input size="16" type="text"  id = "tname" name = "userAccount" value = "" readonly="readonly">
                                                    </div>
                                                </div>
                                                

                                                 <div class="form-group">
                                                    <label class="control-label col-md-4"> 机构简称 </label>
                                                    <div class="col-md-6">
                                                        <input size="16" type="text"  id = "instiNames" name = "instiName" readonly="readonly">
                                                    </div>
                                                </div> 
                                                
                                               
                                                
                                                <div class="form-group">
                                                    <label class="control-label col-md-4"> 电子邮箱 </label>
                                                    <div class="col-md-6">
                                                        <input size="16" type="text"  id = "usermails" name = "userMail">
                                                    </div>
                                                </div>
                                                
                                                <div class="form-group">
                                                    <label class="control-label col-md-4"> QQ号码 </label>
                                                    <div class="col-md-6">
                                                        <input size="16" type="text"  id = "qqnums" name = "qqnum">
                                                    </div>
                                                </div>
                                                
                                                <div class="form-group">
                                                    <label class="control-label col-md-4"> 手机号码: </label>
                                                    <div class="col-md-6">
                                                        <input size="16" type="text"  id = "userPhones" name = "userPhone">
                                                    </div>
                                                </div>
                                                
                                                <div class="form-group">
                                                    <label class="control-label col-md-4"> 密码: </label>
                                                    <div class="col-md-6">
                                                        <input size="16" type="text"  id = "userPswModify" name = "userPsw">
                                                    </div>
                                                </div>
     
                                            </form>
                                        </div>
                                        <!-- div结束 -->
							
							<div class="modal-footer">
								<button type="button" class="btn btn-default" data-dismiss="modal" >关闭</button>
								<button type="button" class="btn btn-primary"  onclick= "saveResult()" data-dismiss="modal" >保存</button>
							</div>
						</div>
					</div>
				</div>
				
				<!-- 弹出窗=========================================================== -->

			</div>
	


	</div>
							
							
							
							
							
							</div>
							<div class="tab-pane " id="jiedongconsumer">
														
							<div class="col-sm-12">
							
		
			<header class="panel-heading"> 冻结列表 </header>
			<div class="panel-body">

				<div style="margin-bottom: 60px">
						<div class="col-sm-1 ">
							<label for="inputEmail3" class="control-label"
								style="margin-top: 7px">查询姓名</label>
						</div>
						<div class="col-sm-3">

							<input type='text' id='userNameFreeze' name="userName"
								class="form-control">
							<input type='hidden' id='pageNo' value='1'/>
							<input type='hidden' id='pages' value='1'/>
							<input type='hidden' id='count' />
						</div>
						<label for="inputPassword3" class="col-sm-1 control-label"
							style="margin-top: 7px">身份证号</label>
						<div class="col-sm-3">
							<input type='text' id='idCardFreeze' name="idCard" class="form-control">
						</div>

						<!-- <label for="inputPassword3" class="col-sm-1 control-label" style="margin-top: 7px">查询</label> -->
						<div class="col-sm-3">
							<input type="button" class="btn btn-primary" style="width: 60px;"
								value="查询" id="freezeQueryBtn">
						</div>
				</div>

				<div class="adv-table">
					<div class="row">
						<section id="unseen">
							<table class="table table-bordered table-striped table-condensed">
								<thead>
									<tr>
										<th>会员用户名</th>
										<th>机构检测</th>
										<th>手机号码</th>
										<th>联系邮箱</th>
										<th>操作</th>
									</tr>
								</thead>
								<tbody id='freezeDatabody'>

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
	


	</div>
							
							
							
							</div>
						</div>
					</div>
				</section>
			</div>
		</div>
	</div>
	
	<script type="text/javascript" src="js/consumer.js"></script> 
</body>
</html>