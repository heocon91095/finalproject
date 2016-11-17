<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<a href="einfo.action">Trở về trang thông tin</a>
<hr />
<div style="padding-left: 50px; padding-right: 50px">
	<h1 align="center" style="color: blue; font-weight: bold;">${info.infohead}</h1>
	<hr />
	<p align="right">${info.date}</p>
	<br />
	<div>${info.infobody}</div>
</div>

