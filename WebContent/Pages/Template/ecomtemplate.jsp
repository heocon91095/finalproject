<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><tiles:insertAttribute name="title" /></title>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
	integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
	crossorigin="anonymous">
<!-- Bootstrap CSS over -->
<!-- JQuery -->
<script src="https://code.jquery.com/jquery-2.2.4.min.js"
	integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="
	crossorigin="anonymous"></script>
<!-- Bootstrap JS -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>
<!-- Datatables JS and CSS -->
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/v/dt/jq-2.2.3/dt-1.10.12/af-2.1.2/b-1.2.2/datatables.min.css" />

<script type="text/javascript"
	src="https://cdn.datatables.net/v/dt/dt-1.10.12/datatables.min.js"></script>
<style type="text/css">
html, body {
	width: 100%;
	height: 100%;
	margin: 0px;
	padding: 0px;
	overflow-x: hidden;
	margin: 0;
	padding: 0;
	border: 0
}

.topbar {
	width: 100%;
	background-color: teal;
	margin: 0;
	color: white;
	padding-bottom: 5px;
	padding-left: 80px;
	padding-top: 5px;
	font-size: 14px;
}

.topbar a {
	color: white;
	margin-right: 30px;
}

.navbar {
	margin-bottom: 0
}

.login {
	float: right;
}

.login a {
	color: white;
	margin-right: 30px;
}

.botbar {
	background-color: #DDDDDD;
	font-size: 14px;
	color: black;
	font-weight: bold;
	padding: 5px
}

.botbar a {
	margin-left: 20px;
	margin-right: 20px;
	color: black;
}

#botbaractive {
	color: #337ab7;
}

.tablecontainer {
	margin: 10px;
}

.groupcontainer {
	padding: 15px;
	font-size: 16px;
	font-weight: bold;
	color: teal;
}

.groupcontainer a {
	font-size: 16px;
	font-weight: bold;
	color: teal;
}

.col-md-2 {
	background-color: #c6dcff;
}

.groupitem {
	margin-top: 10px;
	background-color: white;
	margin-right: -10px;
}

.groupitem div {
	width: 100%;
	background-color: #DDDDDD;
	padding: 10px;
	border-bottom: solid 1px;
	border-left: solid 1px;
}

.groupitem div a {
	color: black;
	font-size: 14px;
}

.botbarfunction {
	margin-top: 10px;
	margin-left: 20px;
	font-size: 16px;
	color: teal;
}

.botbarbutton {
	padding-top: 4px;
	padding-bottom: 4px;
	padding-left: 10px;
	padding-right: 10px;
	color: white;
	background-color: teal;
	border: 0;
}

.popuptable, table.popuptable td {
	border: 5px;
	padding-top: 10px;
}

textarea:focus, input:focus {
	outline: none;
}
</style>
<script>
	$(document).ready(function() {
		loadproductgroup();
	});
	function loadproductgroup() {
		$.ajax({
			url : "pgrouplist.action",
			success : function(data) {
				data.pgs.forEach(function(entry) {
					$("#navibar")
							.append(
									"<li ><a href=''>" + entry.pgroupname
											+ "</a></li>");
				});
				$("#navibar").append("<li><a href=''>Thông tin</a></li>");
			}
		})
	}
</script>
</head>
<body>
	<nav class="navbar navbar-default">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="#"><img height="100%"
					alt="Logo hang" src="<s:url value="/img/logo.png"/>" /></a>
			</div>
			<ul class="nav navbar-nav" id="navibar">
				<li id="navd"><a href="/Struts22/posindex"><span
						class="glyphicon glyphicon-home"></span></a></li>
				<li id="searchbar">
					<div
						style="background-color: teal; width 200px; padding: 8px; display: inline-block; float: left">
						<input type="text" placeholder="Tìm kiếm sản phẩm"
							style="display: inline-block; padding-right: 50px; border-radius: 8px; border: 1px solid teal; height: 34px; padding-left: 10px" />
						<button
							style="margin-left: -35px; width: 50p; background-color: Transparent; background-repeat: no-repeat; border: none; cursor: pointer; overflow: hidden; outline: none;">
							<span style="color: teal" class="glyphicon glyphicon-search"></span>
						</button>
					</div>
				</li>
			</ul>
			<ul class="nav navbar-nav navbar-right" style="background-color: red">
				<li><a href="#" style="color: white"><span class="glyphicon glyphicon-shopping-cart"></span>
						Giỏ hàng</a></li>
			</ul>
		</div>
	</nav>
	<main style="margin-bottom:100px ;padding-top: 10px;border: 0;margin-left: 100px;margin-right:100px"> <tiles:insertAttribute
		name="body" /> </main>
	<div class="footer">
		<p align="center"
			style="background-color: teal; color: white; font-size: large; padding: 5px">Tìm
			kiếm nhiều :</p>
		<div class="row"
			style="margin-left: 50px; margin-right: 50px; margin-bottom: 30px; font-size: 16px;">
			<div class="col-md-4" style="padding-left: 20px">
				<b>Mobile Store</b><br /> <a>Giới thiệu Mobile Store</a><br /> <a>Danh
					sách cửa hàng</a><br /> <a>Trung tâm bảo hành</a><br />
			</div>
			<div class="col-md-4" style="padding-left: 20px">
				<b>CÓ THẮC MẮC?</b><br /> Bán hàng (7:30 - 22:00)<br /> 1800.1060
				Hoặc (08) 38.102.102 <br /> Góp ý, khiếu nại (8:00 - 21:30)<br />
				1800.1062<br /> Bảo hành sản phẩm (8:00 - 21:00)<br /> 1800.1064
			</div>
			<div class="col-md-4" style="padding-left: 20px">
				<b>Đăng kí nhận tin khuyến mãi</b><br /> <input type="text"
					class="form-control" placeholder="Nhập email"
					style="display: inline-block; width: 80%" /> <input type="button"
					value="Gửi" class="botbarbutton"
					style="margin-left: -7px; padding: 6px" />
			</div>
		</div>
		<div
			style="bottom: 0; background-color: teal; width: 100%; color: white;"
			align="center">TranPhucTai-K39.104.078 &copy;Copyright</div>
	</div>

</body>
</html>