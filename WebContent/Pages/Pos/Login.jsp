<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login</title>
<script type="text/javascript" src="./Script/MyScript.js"></script>
<!-- Bootstrap va Jquery -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
	integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-2.2.4.min.js"
	integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>
<style type="text/css">
#loginbox {
	margin-top:150px;
	float: none;
	border: solid 1px;
	border-radius: 10px;
	text-align: center;
	width: 400px;
	padding-bottom: 2%;
	padding-top: 2%;
	padding-right: auto;
	padding-left: auto;
	background-color: white;
}

.label {
	font-size: large;
	color: black;
}

#wwgrp_login_user_username,#wwgrp_login_user_password {
	margin-bottom: 10px
}
html,body
{
    width: 100%;
    height: 100%;
    margin: 0px;
    padding: 0px;
    overflow-x: hidden; 
}
body {
	background-color: #478468;
}
input[type="submit"].form-control {
	background-color: #4CAF50;
	color: white;
}
</style>
</head>
<body>
	<img alt="Logo hang" src="<s:url value="/img/logo.png"/>" />
	<div class="row">
		<div align="center" class="center-block col-md-4" id="loginbox">
			<s:actionerror />
			<s:form action="login.action" method="post">
				<s:textfield cssClass="form-control" name="user.username" label="Tài khoản" size="20" />
				<s:password cssClass="form-control" name="user.password" label="Mật khẩu" size="20" />
				<s:submit cssClass="form-control" method="execute" key="label.login" align="center" />
			</s:form>
		</div>
	</div>
</body>
</html>