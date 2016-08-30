<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="row">
	<div class="col-md-12">
		<div class="panel">
			<header class="panel-heading">
				基本信息 <span class="tools pull-right"> 申请编号：${cad.sinoid} <input
					type="hidden" id="sinoid" value="${cad.sinoid}" />
					<input type="hidden" id="is_paid_fin" value="${cad.isPaidFin}">
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
					<div class="form-group" id="delayinfo" style="display: none">
						<label class="col-sm-2 control-label text-right">展期时间</label>
						<div class="col-sm-3">
							<input type='text' readonly class="form-control" value="<fmt:formatDate value="${delayinftime}" pattern="yyyy-MM-dd"/>" >
						</div>
						<label class="col-sm-2 control-label text-right">未偿金额</label>
						<div class="col-sm-3">						
							<input type="text" class="form-control" readonly value="${delayinfomoney}">
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
			<header class="panel-heading"> 每期还款记录</header>
			<div class="panel-body">
				<div class="adv-table">
					<table
						class="display table table-bordered table-striped table-condensed"
						id="dynamic-table">
						<thead>
							<tr>
								<th>期数</th>
								<th>状态</th>
								<th>还款时间</th>
								<th>当期账单金额</th>
								<th>备注</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody id='databody'>
							<c:forEach items="${plist}" var="a">
								<tr>
									<td>${a.paymentnumber}</td>
									<td><c:if test="${a.isPaid == 0}">未还</c:if> <c:if
											test="${a.isPaid == 1}">已还</c:if></td>
									<td><c:choose>
											<c:when test="${empty a.paidTime}">--</c:when>
											<c:otherwise>
												<fmt:formatDate value="${a.paidTime}" pattern="yyyy-MM-dd" />
											</c:otherwise>
										</c:choose>
									<td><c:choose>
											<c:when test="${empty a.paidMoney}">--</c:when>
											<c:otherwise>${a.paidMoney}</c:otherwise>
										</c:choose></td>
									<td>${a.remark}</td>
									<td><c:if test="${a.isPaid == 0}">
											<a href="#myModal" onclick="getcurrant(${a.paymentnumber})"
												data-toggle="modal" class="btn btn-success">还款</a>
										</c:if></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>


<!-- Modal -->
<div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog"
	tabindex="-1" id="myModal" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button aria-hidden="true" data-dismiss="modal" class="close"
					type="button">×</button>
				<h4 class="modal-title">每期债权管理</h4>
			</div>
			<div class="modal-body">
				<div class="col-md-12">
					<input id="cperiod" type="hidden">
					<div class="form-group">
						<label> 还款时间</label>
						<div data-date-viewmode="years" data-date-format="yyyy-mm-dd"
							data-date="2016-08-01" class="input-append date dpYears">
							<input type="text" size="16" class="form-control" id="paytime"
								name="paytime" /> <span class="input-group-btn add-on">
								<button class="btn btn-primary" type="button">
									<i class="fa fa-calendar"></i>
								</button>
							</span>
						</div>
					</div>
					<div class="form-group">
						<label> 当期还款金额</label> <input id="paymoney" class="form-control">
					</div>
					<div class="form-group">
						<label> 备注</label>
						<textarea id="remark" rows="2" class="form-control"></textarea>
					</div>
				</div>

			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<button type="button" class="btn btn-success" data-dismiss="modal" onclick="savemonth()" >保存</button>
			</div>
		</div>
	</div>
</div>


<div class="row">
	<div class="col-md-12">
		<div class="panel">
			<header class="panel-heading"> 贷中还款状态更新 </header>
			<div class="panel-body">
				<div class="row">
					<div class="col-sm-12 icheck ">
						<div class="flat-green">
							<div class="radio ">
								<input tabindex="3" type="radio" name="demo-radio"
									id="normalradio"> <label>正常结清</label>
							</div>
						</div>
						<div class="flat-grey" id="delaycheck" style="display: block">
							<div class="radio ">
								<input tabindex="3" type="radio" name="demo-radio"
									id="delayradio"> <label>贷款展期</label>
							</div>
						</div>

						<div class="flat-red">
							<div class="radio ">
								<input tabindex="3" type="radio" name="demo-radio"
									id="overdueradio"> <label>逾期管理</label>
							</div>
						</div>

					</div>
				</div>
				<hr>
				<div class="row">
					<div class="col-sm-12">
						<form class="form-horizontal" role="form">
							<div id="normal" class="form-group" style="display: none">
								<label class="col-sm-2 control-label text-right">结清日期</label>
								<div class="col-sm-3">
									<div data-date-viewmode="years" data-date-format="yyyy-mm-dd"
										data-date="2016-08-01" data-date-language="zh-CN"
										class="input-append date dpYears">
										<input type="text" size="16" class="form-control"
											id="normaltime" name="normaltime" /> <span
											class="input-group-btn add-on">
											<button class="btn btn-primary" type="button">
												<i class="fa fa-calendar"></i>
											</button>
										</span>
									</div>
								</div>
								<div class="col-sm-3 text-right">
									<input type="button" class="btn btn-success"
										style="width: 60px;" value="提交" onclick="normalpay()">
								</div>
							</div>
							<div id="delay" class="form-group" style="display: none">
								<label class="col-sm-2 control-label text-right">展期到期日</label>
								<div class="col-sm-3">
									<div data-date-viewmode="years" data-date-format="yyyy-mm-dd"
										data-date="2016-08-01" class="input-append date dpYears">
										<input type="text" size="16" class="form-control"
											id="delaytime" name="delaytime" /> <span
											class="input-group-btn add-on">
											<button class="btn btn-primary" type="button">
												<i class="fa fa-calendar"></i>
											</button>
										</span>
									</div>
								</div>
								<label class="col-sm-2 control-label text-right">未偿金额（元）</label>
								<div class="col-sm-3">
									<input type='text' id='notpaid' name="notpaid"
										class="form-control">
								</div>

								<div class="col-sm-2 text-center">
									<input type="button" class="btn btn-info" style="width: 60px;"
										value="提交" onclick="delay()">
								</div>

							</div>
							<div id="overdue" class="form-group" style="display: none">
								<div class="col-sm-12 text-center">
									<input type="button" class="btn btn-danger"
										style="width: 120px;" value="进行逾期管理" onclick="tooverdue()">
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<!--icheck -->
<script src="js/iCheck/jquery.icheck.js"></script>
<script src="js/icheck-init.js"></script>
<!--pickers initialization-->
<script src="js/pickers-init.js"></script>
<!--dynamic table initialization -->
<script src="js/dynamic_table_init.js"></script>
<script src="js/gritter/js/gritter-init.js" type="text/javascript"></script>
<script type="text/javascript"
	src="js/bootstrap-chinese-region/bootstrap-chinese-region.js"></script>
<script type="text/javascript">	
	$(function(){
		$('#normalradio').on('ifClicked',function(event){
			document.getElementById('normal').style.display = 'block';
			document.getElementById('delay').style.display = 'none';
			document.getElementById('overdue').style.display = 'none';
		});
		
		$('#delayradio').on('ifClicked',function(event){
			document.getElementById('normal').style.display = 'none';
			document.getElementById('delay').style.display = 'block';
			document.getElementById('overdue').style.display = 'none';
		});
		
		$('#overdueradio').on('ifClicked',function(event){
			document.getElementById('normal').style.display = 'none';
			document.getElementById('delay').style.display = 'none';
			document.getElementById('overdue').style.display = 'block';
		});
		
		$.getJSON('js/bootstrap-chinese-region/sql_areas.json',function(data){
			
			for (var i = 0; i < data.length; i++) {
				var area = {id:data[i].id,name:data[i].cname,level:data[i].level,parentId:data[i].upid};
				data[i] = area;
			}

			$('.bs-chinese-region').chineseRegion('source',data);
		});
		
		var ispaidin = $('#is_paid_fin').val();
		if(ispaidin == '2'){
			$('#delaycheck').css('display','none'); 
			$('#delayinfo').css('display','block');
		}
	});
	
	function getcurrant(p){
		$('#cperiod').val(p);
	}
	
	function savemonth(){
		var sinoid = $('#sinoid').val();
		var cperiod = $('#cperiod').val();
		var paytime = $('#paytime').val();
		var paymoney = $('#paymoney').val();
		var remark = $('#remark').val();
		var ispaidfin = $('#is_paid_fin').val();
		var idcard = $('#idCard').val();
		var name = $('#userName').val();
		$.post('monthpay.pfv',{sinoid:sinoid,paymentnumber:cperiod,paidMoney:paymoney,paidTime:paytime,remark:remark,isPaidFin:ispaidfin,idCard:idcard,name:name},function(result){
			$("div").removeClass(".modal-backdrop fade in");
			if(result == 'true'){
				alertMessage("温馨提示","保存成功！");
				$('#main').load('debtmanage.pfv?sinoid='+sinoid);
			}else{
				alertMessage("温馨提示","保存失败，请联系管理员！");
			}
			
			
		});
	}
	
	function normalpay(){
		var sinoid = $('#sinoid').val();
		var idcard = $('#idCard').val();
		var name = $('#userName').val();
		var normaltime = $('#normaltime').val();
		$.post('normalpay.pfv',{sinoid:sinoid,idCard:idcard,name:name,normaltime:normaltime},function(result){
			if(result == "true"){
				alertMessage("温馨提示","保存成功！");
				$('#main').load('zhaiquanlist.pfv?name='+name+'&idCard='+idcard);
			}else{
				alertMessage("温馨提示","保存失败，请联系管理员！");
			}
		});
	}
	
	function delay(){
		var sinoid = $('#sinoid').val();
		var idcard = $('#idCard').val();
		var name = $('#userName').val();
		var delaytime = $('#delaytime').val();
		var notpaid = $('#notpaid').val();
		$.post('delaytime.pfv',{sinoid:sinoid,idCard:idcard,name:name,delaytime:delaytime,notpaid:notpaid},function(result){
			if(result == "true"){
				alertMessage("温馨提示","保存成功！");
				$('#main').load('zhaiquanlist.pfv?name='+name+'&idCard='+idcard);
			}else{
				alertMessage("温馨提示","保存失败，请联系管理员！");
			}
		});
	}
	
	function tooverdue(){
		var sinoid = $('#sinoid').val();
		$('#main').load('collectionmanage.pfv?sinoid='+sinoid);
	}
		
</script>
