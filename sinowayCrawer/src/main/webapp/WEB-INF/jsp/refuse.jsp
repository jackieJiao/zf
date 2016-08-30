<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
  <meta name="description" content="">
  <meta name="author" content="ThemeBucket">
  <link rel="shortcut icon" href="#" type="image/png">

  <title>Pickers</title>

  <!--pickers css-->
  <link rel="stylesheet" type="text/css" href="js/bootstrap-datepicker/css/datepicker-custom.css" />

  <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!--[if lt IE 9]>
  <script src="js/html5shiv.js"></script>
  <script src="js/respond.min.js"></script>
  <![endif]-->
</head>

<body class="sticky-header">
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

<!--pickers plugins-->
<script type="text/javascript" src="js/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
<script type="text/javascript" src="js/bootstrap-datetimepicker/js/bootstrap-datetimepicker.js"></script>
<script type="text/javascript" src="js/bootstrap-daterangepicker/moment.min.js"></script>
<script type="text/javascript" src="js/bootstrap-daterangepicker/daterangepicker.js"></script>

<script type="text/javascript" src="js/bootstrap-timepicker/js/bootstrap-timepicker.js"></script>

<!--pickers initialization-->
<script src="js/pickers-init.js"></script>
