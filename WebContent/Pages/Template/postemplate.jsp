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
</style>
<script>
	$(document).ready(function() {
		$("#edituser").click(function(data) {
			$("#userModal").modal('toggle');
			var username = "${sessionScope.username}";
			$.ajax({
				url : 'getemployee.action',
				data : {
					username : username
				},
				success : function(data) {
					console.log(data);
					$("#uname").val(data.employee.employeename);
					$("#uaddress").val(data.employee.address);
					$("#uphone").val(data.employee.phone);
					$("#umail").val(data.employee.mail);
					$("#uuser").val(data.employee.username);
					$("#uid").val(data.employee.employeeid);
				}
			});
		});
	});
	function changeinfo() {
		$.ajax({
			url : 'updateemployee.action',
			type: 'post',
			data : $("#updateinfo").serialize(),
			success : function() {
				console.log("update OK");
				location.reload();
			}
		});
	}
	function changepassword(){
		if($("#newpass").val() == $("#renewpass").val() )
		$.ajax({
			url : 'changepassword.action',
			type: 'post',
			data : $("#changepass").serialize(),
			success : function() {
				console.log("update OK");
				alert("Re-login to take effect");
				window.location.href = "/Struts22/";
			}
		});
	}
</script>
</head>
<body>
	<div class="topbar">
		<a href="#"><span class="glyphicon glyphicon-cog"></span>Setting</a> <a
			href="#"><span class="glyphicon glyphicon-question-sign"></span>Help</a>
		<a href="#">Chi nhánh</a>
		<div class="login" style="float: right;">
			<a href="#" id="edituser"><span class="glyphicon glyphicon-user"></span>
				${sessionScope.username}</a> <a id="logout" href="/Struts22/logout"><span
				class="glyphicon glyphicon-log-in"></span> Logout</a>
		</div>
	</div>
	<nav class="navbar navbar-default">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="#"><img height="100%"
					alt="Logo hang" src="<s:url value="/img/logo.png"/>" /></a>
			</div>
			<ul class="nav navbar-nav">
				<li id="navd"><a href="/Struts22/posindex"><span
						class="glyphicon glyphicon-home"></span></a></li>
				<li id="navs"><a href="/Struts22/sell">Bán hàng</a></li>
				<li id="navp"><a href="/Struts22/product">Hàng hóa</a></li>
				<li><a href="/Struts22/warehouse">Nhập kho</a></li>
				<li id="navcm"><a href="/Struts22/customer">Khách hàng</a></li>
				<li id="navsp"><a href="/Struts22/suplier">Nhà cung cấp</a></li>
				<li id="navproducer"><a href="/Struts22/suplier">Nhà sản xuất</a></li>
				<li id="navrp"><a href="/Struts22/rp">Thu chi</a></li>
				<li><a href="#">Thông tin</a></li>
				<li><a href="#">Báo cáo</a></li>
			</ul>
		</div>
	</nav>
	<main style="margin-bottom:100px ;padding: 0;border: 0"> <tiles:insertAttribute
		name="body" /> </main>
	<div
		style="position: fixed; bottom: 0; background-color: teal; width: 100%; color: white;"
		align="center">TranPhucTai-K39.104.078 &copy;Copyright</div>

	<!-- Modal -->

	<div id="userModal" class="modal fade" role="dialog">
		<div class="modal-dialog ">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Thay đổi thông tin</h4>
				</div>
				<div class="modal-body ">
					<form id="updateinfo">
						<input type="hidden" id="uid" name="employee.employeeid" /> <input
							type="hidden" id="uuser" name="employee.username" />
						<table width="100%" class="popuptable" align="center">
							<tr>
								<td style="white-space: nowrap;">Họ tên</td>
								<td><input type="text" name="employee.employeename"
									id="uname" /></td>
							</tr>
							<tr>
								<td style="white-space: nowrap;">Địa chỉ</td>
								<td><textarea cols="40" name="employee.address"
										id="uaddress"></textarea></td>
							</tr>
							<tr>
								<td style="white-space: nowrap;">Số điện thoại</td>
								<td><input type="text" name="employee.phone" id="uphone" /></td>
							</tr>
							<tr>
								<td style="white-space: nowrap;">Email</td>
								<td><input type="text" name="employee.mail" id="umail" /></td>
							</tr>
						</table>
					</form>
					<div>
						<hr />
						<h4>Đổi mật khẩu</h4>
					</div>
					<form id="changepass">
						<table width="100%" class="popuptable" align="center">
							<tr>
								<td style="white-space: nowrap;">Mật khẩu cũ</td>
								<td><input type="password" name="oldpass" id="oldpass" /></td>
							</tr>
							<tr>
								<td style="white-space: nowrap;">Mật khẩu mới</td>
								<td><input type="password" name="newpass" id ="newpass" /></td>
							</tr>
							<tr>
								<td style="white-space: nowrap;">Nhập lại mật khẩu mới</td>
								<td><input type="password" name="renewpass" id="renewpass"/></td>
							</tr>
						</table>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" onclick="changepassword()"
						class="btn btn-default">Đổi mật khẩu</button>
					<button type="button" onclick="changeinfo()"
						class="btn btn-default">Cập nhật thông tin</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">Đóng</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>