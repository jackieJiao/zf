<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<div class="row">
    <form id="form-insert" class="form-horizontal bucket-form" role="form">
        <div class="col-sm-12">
            <section class="panel">
                <header class="panel-heading"> 存量债权管理</header>
                <div class="panel-body">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">姓名：</label>
                        <div class="col-sm-3">
                            <input type="text" class="form-control" name="name">
                        </div>
                        <label class="col-sm-2 control-label">身份证号：</label>

                        <div class="col-sm-3">
                            <input type="text" class="form-control" name="cardid" id="cardId">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">合同编号：</label>

                        <div class="col-sm-3">
                            <input type="text" class="form-control" name="contractId">
                        </div>
                        <label class="col-sm-2 control-label">合同金额：</label>
                        <div class="col-sm-3">
                            <input type="text" class="form-control" name="contractSum">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">借款日期：</label>

                        <div class="col-sm-3">
                            <div class="iconic-input right">
                                <i class="fa fa-calendar"></i>
                                <input class="form-control form-control-inline input-medium default-date-picker"
                                       size="16" type="text" name="contractStartTime">
                            </div>
                        </div>
                        <label class="col-sm-2 control-label">到期日期：</label>

                        <div class="col-sm-3">
                            <div class="iconic-input right">
                                <i class="fa fa-calendar"></i>
                                <input class="form-control form-control-inline input-medium default-date-picker"
                                       size="16" type="text" name="contractEndTime">
                            </div>
                        </div>

                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">借款类型：</label>

                        <div class="col-sm-3">
                            <select id="loanType" class="form-control m-bot15" name="loanType"></select>
                        </div>
                        <label class="col-sm-2 control-label">担保方式：</label>

                        <div class="col-sm-3">
                            <select id="guarantType" class="form-control m-bot15" name="guaraType"></select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">还款期数：</label>

                        <div class="col-sm-3">
                            <input type="text" class="form-control" name="payPeriod">
                        </div>
                        <label class="col-sm-2 control-label">还款地点：</label>
                        <div class="col-sm-3">
                            <div class="bs-chinese-region flat dropdown" data-submit-type="id" data-min-level="1"
                                 data-max-level="3">
                                <input type="text" class="form-control" name="payLocation" id="payLocation"
                                       placeholder="选择你的地区" data-toggle="dropdown" readonly="" value="">

                                <div class="dropdown-menu" role="menu" aria-labelledby="dLabel">
                                    <div>
                                        <ul class="nav nav-tabs" role="tablist">
                                            <li role="presentation" class="active"><a href="#province" data-next="city"
                                                                                      role="tab"
                                                                                      data-toggle="tab">省份</a></li>
                                            <li role="presentation"><a href="#city" data-next="district" role="tab"
                                                                       data-toggle="tab">城市</a></li>
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
                </div>
            </section>
        </div>
        <div class="col-sm-12">
            <section class="panel">
                <header class="panel-heading"> 逾期/结清信息</header>
                <div class="panel-body">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">是否发生逾期：</label>

                        <div class="col-sm-8 icheck ">
                            <div class="col-sm-2 icheck ">
                                <div class="flat-grey single-row">
                                    <div class="radio ">
                                        <input id="showDelay" tabindex="3" type="radio" value="1"
                                               name="isDelay"> <label>是 </label>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-2 icheck ">
                                <div class="flat-grey single-row">
                                    <div class="radio ">
                                        <input id="showSettled" tabindex="3" type="radio" value="0"
                                               name="isDelay"> <label>否 </label>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="delayMsg" style="display: none;">
                        <div class="form-group">
                            <label class="col-sm-2 control-label">逾期开始日：</label>

                            <div class="col-sm-3">
                                <div class="iconic-input right">
                                    <i class="fa fa-calendar"></i>
                                    <input class="form-control form-control-inline input-medium default-date-picker"
                                           size="16" type="text" name="overdueStartDate">
                                </div>
                            </div>
                            <label class="col-sm-2 control-label">逾期时长：</label>

                            <div class="col-sm-3">
                                <select id="overdueTime" class="form-control m-bot15" name="overdueTime"></select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label">逾期状态：</label>

                            <div class="col-sm-3">
                                <select id="overdueStatus" class="form-control m-bot15" name="overdueStatus"></select>
                            </div>
                            <label class="col-sm-2 control-label">逾期原因：</label>

                            <div class="col-sm-3">
                                <div class="iconic-input">
                                    <select id="overdueReason" class="form-control m-bot15" name="overdueReason"></select>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="settledMsg" style="display: none;" class="form-group">
                        <div class="form-group">
                            <label class="col-sm-2 control-label">最近一期还款日期：</label>

                            <div class="col-sm-3">
                                <div class="iconic-input right">
                                    <i class="fa fa-calendar"></i>
                                    <input class="form-control form-control-inline input-medium default-date-picker"
                                           size="16" type="text" name="lastPaidDate">
                                </div>
                            </div>
                            <label class="col-sm-2 control-label">未尝金额(元)：</label>

                            <div class="col-sm-3">
                                <input type="text" class="form-control" name="unPaidSum">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">当期账单金额(元)：</label>

                            <div class="col-sm-3">
                                <input type="text" class="form-control" name="lastPaidSum">
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-12" style="text-align:center;">
                            <input type="button" class="btn btn-primary" style="width: 100px;"
                                   value="提交" id="submit">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="button" class="btn btn-primary" style="width: 100px;"
                                   value="重置" id="reset">
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </form>
    <div class="col-sm-12">
        <section class="panel">
            <header class="panel-heading"> 存量债权列表</header>
            <div class="panel-body">

                <div style="margin-bottom: 60px">
                    <div class="col-sm-1 ">
                        <label for="inputEmail3" class="control-label"
                               style="margin-top: 7px">查询姓名</label>
                    </div>
                    <div class="col-sm-3">

                        <input type='text' id='userName' name="userName"
                               class="form-control"> <input type='hidden' id='pageNo'
                                                            value='1'/> <input type='hidden' id='pages' value='1'/>
                        <input
                                type='hidden' id='count'/>
                    </div>
                    <label for="inputPassword3" class="col-sm-1 control-label"
                           style="margin-top: 7px">身份证号</label>

                    <div class="col-sm-3">
                        <input type='text' id='idCard' name="idCard" class="form-control">
                    </div>

                    <!-- <label for="inputPassword3" class="col-sm-1 control-label" style="margin-top: 7px">查询</label> -->
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
                                    <th>合同编号</th>
                                    <th>到期日期</th>
                                    <th>合同金额</th>
                                    <th>债权状态</th>
                                    <th>操作</th>
                                </tr>
                                </thead>
                                <tbody id='databody'>

                                </tbody>
                            </table>
                        </section>
                    </div>
                </div>
                <div class="row-fluid">
                    <div class="dataTables_paginate paging_bootstrap pagination">
                        <ul>
                            <li class="disabled" id='pageinfo'></li>
                            <li class="prev" id="firstPageLink"><a >首页</a></li>
                            <li id="prePageLink"><a >上一页</a></li>
                            <li id="nextPageLink"><a >下一页</a></li>
                            <li class="next" id="lastPageLink"><a >尾页</a></li>
                        </ul>
                    </div>
                </div>

            </div>
        </section>


    </div>
</div>


<!--icheck -->
<script src="js/iCheck/jquery.icheck.js"></script>
<script src="js/icheck-init.js"></script>

<!--pickers initialization-->
<script src="js/pickers-init.js"></script>
<script type="text/javascript" src="js/bootstrap-chinese-region/bootstrap-chinese-region.js"></script>

<script src="js/ViewJs/cunliangmanage.js"></script>
<script src="js/utils.js"></script>