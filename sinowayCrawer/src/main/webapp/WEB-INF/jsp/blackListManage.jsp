<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<div class="row">
    <div class="col-md-12">
        <div>
            <header class="panel-heading">
                <div>
                    <span class="cisp-title">不良信息管理</span>
                </div>
            </header>
            <div class="panel-body">
                <div class="col-md-4">
                    <div>
                        <a id="blackListManage-menu-a" href="javascript:void(0)" style="color:white"
                           onclick="getBlackListHtml('blackListInsert.pfv')">
                            <img style="margin-left: inherit;"  class="img-responsive center-block" alt src="images/xitongluru.png"/>
                            <span><h2 style="margin-top: -88px;margin-left: 55px">不良信息录入</h2></span>
                        </a>
                    </div>
                </div>
                <div class="col-md-4">
                    <div>
                        <a id="blackListSearch-img" href="javascript:void(0)" style="color:white"
                           onclick="getBlackListHtml('blackListSearch.pfv')">
                            <img style="margin-left: inherit;" class="img-responsive center-block" alt src="images/buliangxinxichaxun.png"/>
                            <span><h2 style="margin-top: -88px;margin-left: 55px">不良信息查询</h2></span>
                        </a>
                    </div>
                </div>
                <div class="col-md-4">
                    <div>
                        <a id="blackListUpload-img" href="javascript:void(0)" style="color:white"
                           onclick="getBlackListHtml('blackListUpload.pfv')">
                            <img style="margin-left: inherit;"  class="img-responsive center-block" alt src="images/buliangxinxishangbao.png"/>
                            <span><h2 style="margin-top: -88px;margin-left: 55px">不良信息上传</h2></span>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="js/blackList/manage.js"></script>
