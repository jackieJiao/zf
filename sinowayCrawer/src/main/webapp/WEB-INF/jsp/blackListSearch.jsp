<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>

<link rel="stylesheet" type="text/css" href="css/black-list.css"/>
<form class="form-horizontal">
    <div class="row">
        <div class="col-md-12">
            <div class="panel">
                <header class="panel-heading"><h5 class="black-list-h5">信息查询</h5></header>
                <div class="panel-body hbox hbox-auto-xs">
                    <div class="wrapper-xs">
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-sm-4 control-label">姓名：</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="searchName">
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-sm-4 control-label">身份证号：</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="searchIdCard">
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-12">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">查询目的：</label>

                                <div class="col-sm-10 icheck">
                                    <div class="radio">
                                        <input tabindex="1" type="radio" name="reqReasonIndex" value="1" checked>
                                        <label>借款申请审批</label>
                                    </div>
                                    <div class="radio">
                                        <input tabindex="2" type="radio" name="reqReasonIndex" value="2">
                                        <label>债券管理</label>
                                    </div>
                                    <div class="radio">
                                        <input tabindex="3" type="radio" name="reqReasonIndex" value="3">
                                        <label>逾期管理</label>
                                    </div>
                                    <div class="radio">
                                        <input tabindex="4" type="radio" name="reqReasonIndex" value="4">
                                        <label>其它</label>
                                    </div>
                                    <input type="text" class="text-left form-control" id="reqReason" style="width: auto">
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-12 text-center">
                            <button type="button" class="btn blue" onclick="searchList()">查询</button>
                            <button type="button" class="btn blue" onclick="reset()">重置</button>
                        </div>
                    </div>
                </div>
            </div>

            <div class="panel">
                <header class="panel-heading"><h5 class="black-list-h5">查询记录</h5></header>
                <div class="panel-body hbox hbox-auto-xs">
                    <div class="wrapper-xs">
                        <div class="col-sm-12">
                            <table class="table table-striped table-hover b-t b-light panel">
                                <thead>
                                <tr>
                                    <th nowrap>姓名</th>
                                    <th nowrap>身份证号</th>
                                    <th nowrap>查询目的</th>
                                    <th nowrap>查询人</th>
                                    <th nowrap>查询时间</th>
                                    <th nowrap>备注信息</th>
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
                                    <li id="nextPageLink"><a onclick="next()">下一页</a></li>
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

<script type="text/javascript" src="js/blackList/page.js"></script>
<script type="text/javascript" src="js/blackList/search.js"></script>


