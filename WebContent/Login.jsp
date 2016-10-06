<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript" src="./Script/MyScript.js"> </script>
</head>
<body onload="mywork()">
<h2>Struts 2 - Login Application</h2> 
<div align="center" style="width: 300px;background-color: blue; padding-top: 20px;padding-bottom: 20px;position: absolute;left: 50%;top: 50%; margin-left: -150px;margin-top: -60px">
<s:actionerror /> 
<s:form action="login.action" method="post"> 
 <s:textfield name="username" key="label.username" size="20" /> 
  <s:password name="password" key="label.password" size="20" />  
  <s:submit method="execute" key="label.login" align="center" />
</s:form>
</div>
</body>
</html>