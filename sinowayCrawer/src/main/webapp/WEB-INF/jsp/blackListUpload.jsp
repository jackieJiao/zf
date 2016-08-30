<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<link rel="stylesheet" type="text/css" href="css/black-list.css"/>
<link rel="stylesheet" type="text/css" href="js/bootstrap-fileupload/bootstrap-fileupload.min.css"/>
<form class="form-horizontal">
    <div class="row">
        <div class="col-md-12">
            <div class="panel">
                <header class="panel-heading"><h5 class="black-list-h5">不良信息上传</h5></header>
                <div class="panel-body hbox hbox-auto-xs">
                    <div class="col-sm-12" style="margin-bottom: 30px">
                        <button type="button" class="btn" onclick="downloadTemplate()" style="background-color: orange;padding: 6px 80px;color: white">Excel模板下载</button>
                    </div>
                    <div class="col-sm-12" style="margin-left: 6px;margin-bottom: 10px">
                        <div class="fileupload fileupload-new" data-provides="fileupload">
                                                <span class="btn btn-default btn-file">
                                                <span class="fileupload-new"><i class="fa fa-paper-clip"></i>上传附件</span>
                                                <span class="fileupload-exists"><i class="fa fa-undo"></i> 替换</span>
                                                    <input type="file" class="default" id="fileUpload"
                                                           accept="application/vnd.ms-excel,application/vnd.openxmlformats-officedocument.spreadsheetml.sheet">
                                                </span>
                            <span class="fileupload-preview"></span>
                            <a href="#" class="close fileupload-exists" data-dismiss="fileupload"
                               style="float: none; margin-left:5px;"></a>
                        </div>
                    </div>
                    <div class="col-sm-12 text-center">
                        <button type="button" class="btn blue" onclick="importExcel()">提交</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</form>

<script src="js/bootstrap-fileupload/bootstrap-fileupload.min.js"></script>
<script type="text/javascript" src="js/utils.js"></script>
<script type="text/javascript" src="js/blackList/import.js"></script>