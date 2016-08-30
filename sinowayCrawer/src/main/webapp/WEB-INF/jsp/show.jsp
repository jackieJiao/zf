<%@ page language="java" import="java.util.*" pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<link rel="stylesheet" href="css/bootstrap-chinese-region.css">
<script type="text/javascript" src="js/location1.js"></script>
<!--body wrapper start-->
<div class="wrapper ">
<div class="row">
	<div class="col-sm-12">
		<section class="panel">
			<header class="panel-heading"> 债权管理列表 </header>
			<div class="panel-body">

				<!-- 地图div -->
				<div id="container" style="width:900px;height:600px;"></div> 
				
 
				
				<!-- 地图div结束 -->

			</div>
		</section>


	</div>
</div>

					
	<!-- 测试td标签事件	 -->	
   </div>
</section>
</div>
</div>
<!--body wrapper end-->
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=dcDEnfmP6HuqcTiOgcsLdRrUyXdDqmLh">
</script>
<script type="text/javascript"> 
$(function(){ 
	var map = new BMap.Map("container");
	map.centerAndZoom(new BMap.Point(116.417854, 39.921988), 15);
	var data_info = [ [ 116.417854, 39.921988, "地址：北京市东城区王府井大街88号乐天银泰百货八层" ],
			[ 116.406605, 39.921585, "地址：北京市东城区东华门大街" ],
			[ 116.412222, 39.912345, "地址：北京市东城区正义路甲5号" ] ];
	var opts = {
		width : 250, // 信息窗口宽度
		height : 80, // 信息窗口高度
		title : "信息窗口", // 信息窗口标题
		enableMessage : true
	//设置允许信息窗发送短息
	};
	for (var i = 0; i < data_info.length; i++) {
		var marker = new BMap.Marker(new BMap.Point(data_info[i][0],
				data_info[i][1])); // 创建标注
		var content = data_info[i][2];
		map.addOverlay(marker); // 将标注添加到地图中
		addClickHandler(content, marker);
	}
	function addClickHandler(content, marker) {
		marker.addEventListener("click", function(e) {
			openInfo(content, e)
		});
	}
	function openInfo(content, e) {
		var p = e.target;
		var point = new BMap.Point(p.getPosition().lng, p.getPosition().lat);
		var content1="<a href='http://ditu.amap.com/detail/B000A8URXB?citycode="+content+"'>详细信息</a>";
		var infoWindow = new BMap.InfoWindow(content1, opts); // 创建信息窗口对象 
		map.openInfoWindow(infoWindow, point); //开启信息窗口
	}
});
</script>
<script src="js/pickers-init.js"></script>


<script type="text/javascript" src="js/bootstrap-chinese-region/bootstrap-chinese-region.js"></script>
