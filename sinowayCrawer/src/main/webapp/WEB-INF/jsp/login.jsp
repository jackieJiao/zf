<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="ThemeBucket">
    <link rel="shortcut icon" href="#" type="image/png">

    <title>登录</title>

    <link href="css/style.css" rel="stylesheet">
    <link href="css/style-responsive.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->
 <style type="text/css">
.sign-title{
font-size: 40px;
color: #000000 ;
top: 32px;
left: 60;

}
.container {
    margin-right: auto;
    margin-left: auto;
    padding-left: 15px;
    padding-right: 15px;
    padding-top: 110px;
}



.form-signin {
    max-width: 850px;
    
	 text-align: left;
}

.form-signin .form-signin-heading {
   
    text-align: left;
    
}

.form-signin .btn-login {
    font-size: 25px;
}

</style>
    
    <script type="text/javascript">
    	function resetVerifyCode(){
    		document.getElementById("randcodeImg").src="captcha.pfv?" + Math.floor(Math.random()*100);
    	}
    </script>
</head>

<body class="login-body">

<div class="container">

    <form class="form-signin" action="loginin.pfv" method="post">
        <div class="form-signin-heading text-center">
          <h1 class="sign-title"><strong>消费信贷信息共享平台（CISP）&nbsp;V1.0</strong></h1> 
          
            <img src="images/logo-hua.png" alt=""/>
        </div>
       
        <div class="login-wrap">
            <input type="text" class="form-control" name = "userAccount" placeholder="用户名" autofocus>
            <input type="password" class="form-control" name = "userPsw" placeholder="密码">
 			<input type="text" class="form-control login-yan-w" size="4" maxlength="4" id = "txtRandcode" name = "txtRandcode" placeholder="验证码">
 			<span class="login-w"><img id="randcodeImg" src="captcha.pfv" onclick="resetVerifyCode()" width="100" height="39"></span>
           <!--  <button class="btn btn-lg btn-login btn-block" type="submit">
            <i class="fa fa-check"></i> 
            </button> -->
            <button role="button" class="btn btn-lg btn-login btn-block"  type="submit">欢&nbsp;迎&nbsp;登&nbsp;入</button>

            <div class="registration">
                <span style="color:red">${msg}</span>
            </div>
            <!-- <label class="checkbox">
                <input type="checkbox" value="remember-me"> Remember me
                <span class="pull-right">
                    <a data-toggle="modal" href="#myModal"> Forgot Password?</a>

                </span>
            </label> -->

        </div>

        <!-- Modal -->
        <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="myModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">Forgot Password ?</h4>
                    </div>
                    <div class="modal-body">
                        <p>Enter your e-mail address below to reset your password.</p>
                        <input type="text" name="email" placeholder="Email" autocomplete="off" class="form-control placeholder-no-fix">

                    </div>
                    <div class="modal-footer">
                        <button data-dismiss="modal" class="btn btn-default" type="button">Cancel</button>
                        <button class="btn btn-primary" type="button">Submit</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- modal -->

    </form>

</div>



<!-- Placed js at the end of the document so the pages load faster -->

<!-- Placed js at the end of the document so the pages load faster -->
<script src="js/jquery-1.10.2.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/modernizr.min.js"></script>

</body>
</html>
