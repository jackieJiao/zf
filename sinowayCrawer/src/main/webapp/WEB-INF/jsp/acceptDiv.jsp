<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
  <link rel="stylesheet" type="text/css" href="js/bootstrap-datepicker/css/datepicker-custom.css" />
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
								value="${htje}" />
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
								data-date="2016-08-20" class="input-append date dpYears">
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
							<select id='jklx' name='requestType' class="form-control" value="${jklx}" required="required">
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
					<!-- <div class="col-sm-3">
							<div class="bs-chinese-region flat" data-submit-type="id"
								data-min-level="1" data-max-level="3">
								<input type="text" class="form-control" name="payLocation"
									id="jkdd" readonly value="">

							</div>
					</div> -->
					<div class="col-sm-3 ">
					
						<div class="bs-chinese-region flat dropdown" data-submit-type="id" data-min-level="1" data-max-level="3">
							<input type="text" class="form-control" id="jkdd" name="requestLocation"  placeholder="选择你的地区" data-toggle="dropdown" readonly="" value="${jkdd}" >
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

<!--pickers plugins-->
<script type="text/javascript" src="js/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
<script type="text/javascript" src="js/bootstrap-datetimepicker/js/bootstrap-datetimepicker.js"></script>
<script type="text/javascript" src="js/bootstrap-daterangepicker/moment.min.js"></script>
<script type="text/javascript" src="js/bootstrap-daterangepicker/daterangepicker.js"></script>

<script type="text/javascript" src="js/bootstrap-timepicker/js/bootstrap-timepicker.js"></script>


<script type="text/javascript" src="js/bootstrap-chinese-region/bootstrap-chinese-region.js"></script>


<!--pickers initialization-->
<script src="js/pickers-init.js"></script>

<script type="text/javascript">
$(function() {
	
	
	$.getJSON('js/bootstrap-chinese-region/sql_areas.json',function(data){
		
		for (var i = 0; i < data.length; i++) {
			var area = {id:data[i].id,name:data[i].cname,level:data[i].level,parentId:data[i].upid};
			data[i] = area;
		}

		$('.bs-chinese-region').chineseRegion('source',data);
	});
	var lx=${jklx};
	$("#jklx").val(lx);
	
})
</script>

