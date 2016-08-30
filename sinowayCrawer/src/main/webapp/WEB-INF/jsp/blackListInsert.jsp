<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>

<form id="form-insert" class="form-horizontal" method="post">
    <input id="loanAddress" name="loanAddress" style="display:none">
    <input id="birthAddress" name="birthAddress" style="display:none">
    <input id="nowAddress" name="nowAddress" style="display:none">

    <div class="row">
        <div class="col-md-12">
            <div class="panel">
                <header class="panel-heading"> 不良信息录入</header>
                <div class="panel-body hbox hbox-auto-xs">
                    <div>
                        <h5  style="color: rgb(1, 115, 236);font-weight: bold;">基本信息</h5>
                    </div>
                    <div class="wrapper-xs">
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-sm-4 control-label required">姓名：</label>

                                <div class="col-sm-8">
                                    <input type="text" class="form-control" placeholder="请输入姓名" required name="name">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-4 control-label required">逾期开始日：</label>

                                <div class="col-sm-8">
                                    <div class="iconic-input right">
                                        <i class="fa fa-calendar"></i>
                                        <input class="form-control form-control-inline input-medium default-date-picker"
                                               readonly
                                               size="16" type="text" name="overdueStartTime">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-sm-4 control-label required">身份证号：</label>

                                <div class="col-sm-8">
                                    <input type="text" class="form-control" placeholder="请输入身份证号" required id="cardId"
                                           name="cardid">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-4 control-label required">欠款总额：</label>

                                <div class="col-sm-8">
                                    <input type="text" class="form-control" required name="notPaidMoney">
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-12">
                            <div class="form-group">
                                <label class="col-sm-2 control-label required">借款地点：</label>

                                <div class="col-sm-4">
                                    <div class="bs-chinese-region flat dropdown" data-submit-type="id"
                                         data-min-level="1" data-max-level="3">
                                        <input type="text" class="form-control" name="loanAddressData"
                                               id="loanAddressData" placeholder="选择你的地区" data-toggle="dropdown"
                                               readonly="" value="">

                                        <div class="dropdown-menu" role="menu" aria-labelledby="dLabel">
                                            <div>
                                                <ul class="nav nav-tabs" role="tablist">
                                                    <li role="presentation" class="active"><a href="#province"
                                                                                              data-next="city"
                                                                                              role="tab"
                                                                                              data-toggle="tab">省份</a>
                                                    </li>
                                                    <li role="presentation"><a href="#city" data-next="district"
                                                                               role="tab" data-toggle="tab">城市</a></li>
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
                    </div>
                    <div>
                        <h5 style="color: rgb(1, 115, 236);font-weight: bold;">逾期信息</h5>
                    </div>
                    <div class="wrapper-xs">
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-sm-4 control-label">逾期期数：</label>

                                <div class="col-sm-8">
                                    <input type="text" class="form-control" placeholder="请输入逾期期数" name="overdueTimes">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-4 control-label">借款开始日：</label>

                                <div class="col-sm-8">
                                    <div class="iconic-input right">
                                        <i class="fa fa-calendar"></i>
                                        <input class="form-control form-control-inline input-medium default-date-picker"
                                               size="16" type="text" name="borrowStartTime" readonly>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-4 control-label">担保方式：</label>

                                <div class="col-sm-8">
                                    <select class="form-control" name="guaranteeType"></select>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-sm-4 control-label">最长逾期天数：</label>

                                <div class="col-sm-8">
                                    <select class="form-control" name="overdueLongestDays"></select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-4 control-label">借款类型：</label>

                                <div class="col-sm-8">
                                    <select class="form-control" name="loanType"></select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-4 control-label">原因：</label>

                                <div class="col-sm-8">
                                    <select class="form-control" name="overdueReason"></select>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-12">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">逾期状态：</label>

                                <div class="col-sm-4">
                                    <select class="form-control" name="overdueStatusMark"></select>
                                </div>
                            </div>
                        </div>
                        <div>
                            <h5 style="color: rgb(1, 115, 236);font-weight: bold;">联络信息</h5>
                        </div>
                        <div class="wrapper-xs">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label class="col-sm-4 control-label">电话：</label>

                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" placeholder="请输入电话" name="phone">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-4 control-label">户籍地址：</label>

                                    <div class="col-sm-8">
                                        <div class="bs-chinese-region flat dropdown" data-submit-type="id"
                                             data-min-level="1" data-max-level="3">
                                            <input type="text" class="form-control" name="birthAddressData"
                                                   id="birthAddressData" placeholder="选择你的地区" data-toggle="dropdown"
                                                   readonly="" value="">

                                            <div class="dropdown-menu" role="menu" aria-labelledby="dLabel">
                                                <div>
                                                    <ul class="nav nav-tabs" role="tablist">
                                                        <li role="presentation" class="active"><a href="#province1"
                                                                                                  data-next="city1"
                                                                                                  role="tab"
                                                                                                  data-toggle="tab">省份</a>
                                                        </li>
                                                        <li role="presentation"><a href="#city1" data-next="district"
                                                                                   role="tab" data-toggle="tab">城市</a>
                                                        </li>
                                                    </ul>
                                                    <div class="tab-content">
                                                        <div role="tabpanel" class="tab-pane active" id="province1">--
                                                        </div>
                                                        <div role="tabpanel" class="tab-pane" id="city1">--</div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label class="col-sm-4 control-label">Email：</label>

                                    <div class="col-sm-8">
                                        <input type="email" class="form-control" name="email">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-4 control-label">现住址：</label>

                                    <div class="col-sm-8">
                                        <div class="bs-chinese-region flat dropdown" data-submit-type="id"
                                             data-min-level="1" data-max-level="3">
                                            <input type="text" class="form-control" name="nowAddressData"
                                                   id="nowAddressData" placeholder="选择你的地区" data-toggle="dropdown"
                                                   readonly="" value="">

                                            <div class="dropdown-menu" role="menu" aria-labelledby="dLabel">
                                                <div>
                                                    <ul class="nav nav-tabs" role="tablist">
                                                        <li role="presentation" class="active"><a href="#province2"
                                                                                                  data-next="city2"
                                                                                                  role="tab"
                                                                                                  data-toggle="tab">省份</a>
                                                        </li>
                                                        <li role="presentation"><a href="#city2" data-next="district"
                                                                                   role="tab" data-toggle="tab">城市</a>
                                                        </li>
                                                    </ul>
                                                    <div class="tab-content">
                                                        <div role="tabpanel" class="tab-pane active" id="province2">--
                                                        </div>
                                                        <div role="tabpanel" class="tab-pane" id="city2">--</div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-12 text-center">
                            <button type="button" onclick="insert()" class="btn btn-info">提交</button>
                            <button class="btn btn-info" id="reset">重置</button>
                        </div>
                    </div>
                    <div class="panel-body hbox hbox-auto-xs">
                        <div>
                            <h5 style="color: rgb(1, 115, 236);font-weight: bold;">录入记录</h5>
                        </div>
                        <div class="wrapper-xs">
                            <div class="col-sm-10">
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">姓名：</label>

                                    <div class="col-sm-3">
                                        <input type="text" class="form-control" id="searchName">
                                    </div>
                                    <label class="col-sm-2 control-label">身份证号：</label>

                                    <div class="col-sm-5">
                                        <input type="text" class="form-control" id="searchIdCard">
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-2">
                                <button class="btn blue" onclick="search()">查询</button>
                            </div>
                        </div>
                        <div class="col-sm-12">
                            <table class="table table-striped table-hover b-t b-light panel">
                                <thead>
                                <tr>
                                    <th nowrap>序号</th>
                                    <th nowrap>更新日期</th>
                                    <th nowrap>姓名</th>
                                    <th nowrap>身份证号</th>
                                    <th nowrap>逾期开始日期</th>
                                    <th nowrap>欠款总额</th>
                                    <th nowrap>操作</th>
                                </tr>
                                </thead>
                                <tbody id="tData">
                                </tbody>
                            </table>
                        </div>
                        <div class="row-fluid">
                            <div class="dataTables_paginate paging_bootstrap pagination">
                                <ul>
                                    <li class="disabled" id='pageinfo'></li>
                                    <li class="prev" id="firstPageLink"><a onclick="first()">首页</a></li>
                                    <li id="prePageLink"><a onclick="prev()">上一页</a></li>
                                    <li id="nextPageLink"><a  onclick="next()">下一页</a></li>
                                    <li class="next" id="lastPageLink" onclick="last()"><a>尾页</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</form>


<script type="text/javascript" src="js/pickers-init.js"></script>
<script type="text/javascript" src="js/blackList/page.js"></script>
<script type="text/javascript" src="js/utils.js"></script>
<script type="text/javascript" src="js/blackList/insert.js"></script>
<script type="text/javascript" src="js/bootstrap-chinese-region/bootstrap-chinese-region.js"></script>



