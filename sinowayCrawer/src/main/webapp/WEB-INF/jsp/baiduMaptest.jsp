<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="chrome=1">
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no, width=device-width">
    <style type="text/css">
      body,html,#container{
        height: 100%;
        margin: 0px
      }
    </style>
    <title>快速入门</title>
    <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=dcDEnfmP6HuqcTiOgcsLdRrUyXdDqmLh">
    </script>
    </head>
  
   <body>  
<div id="container"></div> 
<script type="text/javascript"> 

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
</script>  
  </body>
</html>