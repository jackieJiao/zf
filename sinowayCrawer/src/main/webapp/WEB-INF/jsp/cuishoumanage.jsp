<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="row">
	<div class="col-md-12">
		<div class="panel">
			<header class="panel-heading">
				基本信息 <span class="tools pull-right"> 申请编号：${cad.sinoid} <input
					type="hidden" id="sinoid" value="${cad.sinoid}" /> <input
					type="hidden" id="is_paid_finish" value="${cad.isPaidFin}">
				</span>
			</header>
			<div class="panel-body">
				<form class="form-horizontal" role="form">
					<div class="form-group">
						<label class="col-sm-2 control-label text-right">姓名</label>
						<div class="col-sm-3">
							<input type='text' id='userName' name="userName" readonly
								class="form-control" value="${cad.userName}">
						</div>
						<label class="col-sm-2 control-label text-right">身份证号</label>
						<div class="col-sm-3">
							<input type='text' id='idCard' name="idCard" readonly
								class="form-control" value="${cad.idCard}">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label text-right">合同编号</label>
						<div class="col-sm-3">
							<input type='text' id='contractId' name="contractId" readonly
								class="form-control" value="${cad.contractId}">
						</div>
						<label class="col-sm-2 control-label text-right">合同金额</label>
						<div class="col-sm-3">
							<input type='text' id='contractSum' name="contractSum" readonly
								class="form-control" value="${cad.contractSum}">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label text-right">借款日期</label>
						<div class="col-sm-3">
							<input type='text' id='startTime' name="startTime" readonly
								class="form-control"
								value="<fmt:formatDate value="${cad.startTime}" pattern="yyyy-MM-dd"/>">
						</div>
						<label class="col-sm-2 control-label text-right">到期日期</label>
						<div class="col-sm-3">
							<input type='text' id='stopTime' name="stopTime" readonly
								class="form-control"
								value="<fmt:formatDate value="${cad.stopTime}" pattern="yyyy-MM-dd"/>">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label text-right">贷款类型</label>
						<div class="col-sm-3">
							<input type='text' id='contractType' name="contractType" readonly
								class="form-control"
								value="<c:if test='${cad.contractType == 1}'>经营</c:if><c:if test='${cad.contractType == 2}'>消费</c:if><c:if test='${cad.contractType == 9}'>其他</c:if>
									">
						</div>
						<label class="col-sm-2 control-label text-right">贷款形式</label>
						<div class="col-sm-3">
							<input type='text' id='guaraType' name="guaraType" readonly
								class="form-control"
								value="<c:if test='${cad.guaraType == 1}'>信用</c:if><c:if test='${cad.guaraType == 2}'>抵押</c:if><c:if test='${cad.guaraType == 3}'>质押</c:if><c:if test='${cad.guaraType == 4}'>担保</c:if><c:if test='${cad.guaraType == 5}'>保证人</c:if><c:if test='${cad.guaraType == 6}'>抵押+保证人</c:if><c:if test='${cad.guaraType == 9}'>其他</c:if>">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label text-right">还款期数</label>
						<div class="col-sm-3">
							<input type='text' id='payPeriod' name="payPeriod" readonly
								class="form-control" value="${cad.payPeriod}">
						</div>
						<label class="col-sm-2 control-label text-right">借款地点</label>
						<div class="col-sm-3">
							<div class="bs-chinese-region flat" data-submit-type="id"
								data-min-level="1" data-max-level="3">
								<input type="text" class="form-control" name="payLocation"
									id="payLocation" readonly value="${cad.payLocation}">

							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

<div class="row">
	<div class="col-md-12">
		<div class="panel">
			<header class="panel-heading">
				催收管理信息
			</header>
			<div class="panel-body">
				<form class="form-horizontal" role="form">
					<div class="form-group">
						<label class="col-sm-2 control-label text-right">逾期开始日</label>
						<div class="col-sm-3">
							<div data-date-viewmode="years" data-date-format="yyyy-mm-dd"
								data-date="2016-08-01" data-date-language="zh-CN"
								class="input-append date dpYears">
								<input type="text" size="16" class="form-control"
									id="overduestarttime" name="overduestarttime" /> <span
									class="input-group-btn add-on">
									<button class="btn btn-primary" type="button">
										<i class="fa fa-calendar"></i>
									</button>
								</span>
							</div>
						</div>
						<label class="col-sm-2 control-label text-right">逾期时长</label>
						<div class="col-sm-3">
							<select id='overdue_level' name='overdue_level'
								class="form-control" required="required">
								<option value=''>请选择</option>
								<option value='1'>小于等于30天</option>
								<option value='2'>大于30天小于等于60天</option>
								<option value='3'>大于60天小于等于90天</option>
								<option value='4'>大于90天</option>
								<option value='9'>其他</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label text-right">逾期原因</label>
						<div class="col-sm-3">
							<select id='overdue_reason' name='overdue_reason'
								class="form-control" required="required">
								<option value=''>请选择</option>
								<option value='1'>能力下降</option>
								<option value='2'>恶意拖欠</option>
								<option value='3'>身份欺诈</option>
								<option value='4'>逃逸</option>
								<option value='5'>犯罪入狱</option>
								<option value='6'>疾病</option>
								<option value='7'>死亡</option>
								<option value='9'>其他</option>
							</select>
						</div>
						<label class="col-sm-2 control-label text-right">逾期状态</label>
						<div class="col-sm-3">
							<select id='overdue_status' name='overdue_status'
								class="form-control" required="required">
								<option value=''>请选择</option>
								<option value='1'>催收中</option>
								<option value='2'>催收还款中</option>
								<option value='3'>恢复正常</option>
								<option value='4'>核销</option>
								<option value='5'>逾期已结清</option>
								<option value='6'>协议还款</option>
								<option value='9'>其他</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-12 text-center">
							<input type="button" class="btn btn-danger" style="width: 120px;"
								value="提交" id="queryBtn" onclick="overduesubmit()">
							&nbsp;<input type="button" class="btn btn-danger" style="width: 120px;"
								value="返回"  onclick="back()">
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

<div class="row">
	<div class="col-md-12">
		<div class="panel">
			<header class="panel-heading"> 历史催收信息</header>
			<div class="panel-body">
				<div class="adv-table">
					<table
						class="display table table-bordered table-striped table-condensed"
						id="dynamic-table">
						<thead>
							<tr>
								<th>催收处理时间</th>
								<th>逾期日期</th>
								<th>逾期时长</th>
								<th>逾期原因</th>
								<th>处置状态</th>
							</tr>
						</thead>
						<tbody id='databody'>
							<c:forEach items="${plist}" var="a">
								<tr>
									<td><fmt:formatDate value="${a.sinotime}" pattern="yyyy-MM-dd" /></td>
									<td><fmt:formatDate value="${a.overdueStartTime}" pattern="yyyy-MM-dd" /></td>
									<td>
										<c:if test="${a.paymentLevel == 1}">小于等于30天</c:if>
										<c:if test="${a.paymentLevel == 2}">大于30天小于等于60天</c:if>
										<c:if test="${a.paymentLevel == 3}">大于60天小于等于90天</c:if>
										<c:if test="${a.paymentLevel == 4}">大于90天</c:if>
										<c:if test="${a.paymentLevel == 9}">其他</c:if>
									</td>
									<td>									
										<c:if test="${a.overdueReason == 1}">能力下降</c:if>
										<c:if test="${a.overdueReason == 2}">恶意拖欠</c:if>
										<c:if test="${a.overdueReason == 3}">身份欺诈</c:if>
										<c:if test="${a.overdueReason == 4}">逃逸</c:if>
										<c:if test="${a.overdueReason == 5}">犯罪入狱</c:if>
										<c:if test="${a.overdueReason == 6}">疾病</c:if>
										<c:if test="${a.overdueReason == 7}">死亡</c:if>
										<c:if test="${a.overdueReason == 9}">其他</c:if>
									</td>
									<td><c:if test="${a.overdueStatusMark == 1}">催收中</c:if>
										<c:if test="${a.overdueStatusMark == 2}">催收还款中</c:if>
										<c:if test="${a.overdueStatusMark == 3}">恢复正常</c:if>
										<c:if test="${a.overdueStatusMark == 4}">核销</c:if>
										<c:if test="${a.overdueStatusMark == 5}">逾期已结清</c:if>
										<c:if test="${a.overdueStatusMark == 6}">协议还款</c:if>
										<c:if test="${a.overdueStatusMark == 9}">其他</c:if>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>
<!--pickers initialization-->
<script src="js/pickers-init.js"></script>
<!--dynamic table initialization -->
<script src="js/dynamic_table_init.js"></script>
<script src="js/gritter/js/gritter-init.js" type="text/javascript"></script>
<script type="text/javascript">	
	$(function(){
		$.getJSON('js/bootstrap-chinese-region/sql_areas.json',function(data){
			
			for (var i = 0; i < data.length; i++) {
				var area = {id:data[i].id,name:data[i].cname,level:data[i].level,parentId:data[i].upid};
				data[i] = area;
			}

			$('.bs-chinese-region').chineseRegion('source',data);
		});
	});



	function overduesubmit(){
		var sinoid = $('#sinoid').val();
		var idcard = $('#idCard').val();
		var name = $('#userName').val();
		var ispaidfin = $('#is_paid_fin').val();
		var overdueStartTime = $('#overduestarttime').val();
		var overdueReason = $('#overdue_reason').val();
		var overdueStatusMark = $('#overdue_status').val();
		var paymentLevel  = $('#overdue_level').val();
		$.post('overduesubmit.pfv',{overdueStartTime:overdueStartTime,overdueReason:overdueReason,overdueStatusMark:overdueStatusMark,paymentLevel:paymentLevel,
			sinoid:sinoid,idcard:idcard,name:name,ispaidfin:ispaidfin},function(result){
				if(result == "true"){
					alertMessage("温馨提示","保存成功！");
					$('#main').load('cuishoulist.pfv?name='+name+'&idCard='+idcard);
				}else{
					alertMessage("温馨提示","保存失败，请联系管理员！");
				}
		})
		
	}
	
	function back(){
		var idcard = $('#idCard').val();
		var name = $('#userName').val();
		$('#main').load('cuishoulist.pfv?name='+name+'&idCard='+idcard);
	}
</script>
