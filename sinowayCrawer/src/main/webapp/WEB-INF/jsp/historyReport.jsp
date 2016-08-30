<%@ page language="java" import="java.util.*" pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<div class="wrapper ">
<div class="row">
	<div class="col-sm-12">
		<section class="panel">
			<header class="panel-heading"> 历史信息报告 </header>
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
                            <input type='hidden' id='count'/>
                        </div>
                        <label for="inputPassword3" class="col-sm-1 control-label"
                               style="margin-top: 7px">身份证号</label>

                        <div class="col-sm-3">
                            <input type='text' id='idCard' name="idCard" class="form-control">
                        </div>
                        <div class="col-sm-3">
                            <input type="button" class="btn btn-primary" style="width: 60px;"
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
										<th>申请编号</th>
										<th>合同编号</th>
										<th>生成报告时间</th>
										<th>报告来源</th>
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
								<li class="prev" id="firstPageLink"><a>首页</a></li>
								<li id="prePageLink"><a>上一页</a></li>
								<li id="nextPageLink"><a>下一页</a></li>
								<li class="next" id="lastPageLink"><a>尾页</a></li>
							</ul>
						</div>					
				</div>

                </div>
            </section>
        </div>
    </div>
</div>
<script src="js/ViewJs/historyReport.js"></script>

