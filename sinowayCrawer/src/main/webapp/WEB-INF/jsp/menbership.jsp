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
									<i class="fa fa-user"></i> 修改密码
							</a></li>
														
						
						</ul>
					</header>
					<div class="panel-body">
						<div class="tab-content">
							
							<div class="tab-pane active" id="newconsumer">
								<form class="form-horizontal" role="form" id="ff" method="post"
									action="">
									<div class="form-group">
				
										<label for="" class="col-md-2 control-label">原密码:</label>
										<div class="col-md-4 ">
											<input type="password" id="oldPwd" name="oldPwd"  value=""
												class="form-control" />
										</div>
									</div>
									<div class="form-group">
										<label for="" class="col-md-2 control-label">新密码:</label>
										<div class="col-md-4">
											<input type="password" id="newPwd" name="newPwd"  value=""
												class="form-control" />
										</div>
										<label for="" class="col-md-2 control-label">再次输入新密码:</label>
										<div class="col-md-4">
											<input type="password" id="newPwdAgain" name="newPwdAgain" required="required" value=""
												class="form-control" />
										</div>
									</div>
									
	

								</form>
				<div style="text-align: center; padding: 5px">

				<button type="button" class="btn btn-primary" style="width:60px;" id="savePwd">保存</button>
  
				<button type="button" class="btn btn-primary" style="width:60px;" id="clearvalue">清除</button>
					
				</div>
	</div>
	
	
	
							
							
							
							
							
							
							</div>
							
						</div>
						
						

					</div>
				</section>
			</div>
		</div>
	</div>
	
	<script type="text/javascript" src="js/menbership.js"></script> 
</body>
</html>