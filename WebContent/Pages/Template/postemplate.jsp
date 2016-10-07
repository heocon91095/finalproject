<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><tiles:insertAttribute name="title" /></title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
	integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-2.2.4.min.js"
	integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="
	crossorigin="anonymous"></script>
<!-- Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>
<style type="text/css">
html,body
{
    width: 100%;
    height: 100%;
    margin: 0px;
    padding: 0px;
    overflow-x: hidden; 
}
</style>	
</head>
<body style="margin: 0;padding: 0;border: 0">
<div style="width: 100%;background-color: teal;margin: 0;color: white;padding-bottom:5px;padding-left: 80px;padding-top:5px;font-size: 16px; ">
	<a href="#" style="color: white;margin-right: 30px;"><span class="glyphicon glyphicon-cog"></span>Setting</a> 
	<a href="#" style="color: white;margin-right: 30px;"><span class="glyphicon glyphicon-question-sign"></span>Help</a> 
	<a href="#" style="color: white;margin-right: 30px;">Chi nhánh</a>
	<div style="float: right;">
	 <a href="#"style="color: white;margin-right: 30px;"><span class="glyphicon glyphicon-user"></span> Sign Up</a>
    <a href="#"style="color: white;margin-right: 30px;"><span class="glyphicon glyphicon-log-in"></span> Login</a>
	</div>
</div>
	<nav class="navbar navbar-default">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" href="#"><img height="100%" alt="Logo hang" src="<s:url value="/img/logo.png"/>" /></a>
		</div>
		<ul class="nav navbar-nav">
			<li class="active"><a href="#"><span class="glyphicon glyphicon-home"></span></a></li>
			<li><a href="#">Bán hàng</a></li>
			<li><a href="#">Hàng hóa</a></li>
			<li><a href="#">Nhập kho</a></li>
			<li><a href="#">Khách hàng</a></li>
			<li><a href="#">Nhà cung cấp</a></li>
			<li><a href="#">Thu chi</a></li>
			<li><a href="#">Báo cáo</a></li>
		</ul>
	</div>
	</nav>
	<main  style="margin: 0;padding: 0;border: 0">
	<tiles:insertAttribute name="body" />
	</main>
	<div style="position: fixed; bottom: 0;background-color: teal;width: 100%;color: white;" align="center">
	TranPhucTai-K39.104.078	&copy;Copyright
	</div>
</body>
</html>