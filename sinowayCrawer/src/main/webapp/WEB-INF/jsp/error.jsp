<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
  <meta name="description" content="">
  <meta name="author" content="ThemeBucket">
  <link rel="shortcut icon" href="#" type="image/png">

  <title>预警提示</title>

  <link href="css/styleerror.css" rel="stylesheet">
</head>

<body>

<div id="major">
  <div  id="div1">
   <p>  信 息 提 示</p></br>
 
   </div>
   <p id="p1">预警提示：贷款人在本次贷款申请后将发生借贷变化</p></br></br>
   <div id="div2">
  <table border="1" cellspacing="0" cellpadding="0" id="table_self">
 
  <tr>
    <td colspan="3"><center> 正常还款笔数</center></td>
	<td colspan="4"><center> 最近6个月贷款申请记录</center></td>
	<td colspan="3"><center> 还款异常</center></td>
	<td>最近两年查询记录</td>
  </tr>
  <tr>
   <td><center> 未清笔数</center></td>
	<td><center> 结清笔数</center></td>
	<td><center> 小计</center></td>
	<td><center> 待审</center></td>
	 <td><center> 通过</center></td>
	<td><center> 拒绝</center></td>
	<td><center> 小计</center></td>
	<td><center> 未清笔数</center></td>
	 <td><center> 结清笔数</center></td>
	<td><center> 小计</center></td>
	<td><center> 进件/债权/催收/存量</center></td>
  </tr>
  <tr>
    <td><%= request.getParameter("normalNot")%></td>
	<td><%= request.getParameter("normalYes")%></td>
	<td><%= request.getParameter("sum1")%></td>
	<td><%= request.getParameter("appcheck")%></td>
	 <td><%= request.getParameter("appagree")%></td>
	<td><%= request.getParameter("apprefuse")%></td>
	<td><%= request.getParameter("sum2")%></td>
	<td><%= request.getParameter("unnormalNot")%></td>
	 <td><%= request.getParameter("unnormalYes")%></td>
	<td><%= request.getParameter("sum3")%></td>
	<td><%= request.getParameter("searchHistory")%></td>
  </tr>
  <tr>
    <td>+1</td>
	<td>--</td>
	<td>+1</td>
	<td>-1</td>
	 <td>+1</td>
	<td>--</td>
	<td>--</td>
	<td>--</td>
	 <td>--</td>
	<td>--</td>
	<td>+1</td>
  </tr>
  </table>
  </div>
  </div>
<!-- Placed js at the end of the document so the pages load faster -->
<script src="js/jquery-1.10.2.min.js"></script>
<script src="js/jquery-migrate-1.2.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/modernizr.min.js"></script>


<!--common scripts for all pages-->
<!--<script src="js/scripts.js"></script>-->

</body>
</html>