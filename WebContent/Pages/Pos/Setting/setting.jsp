<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<script src="//cdn.tinymce.com/4/tinymce.min.js"></script>
<script>
	tinymce.init({
		selector : 'textarea',
		plugins : "image",
		insert_menubar : "insert"
	});
	$(document).ready(function() {
		$('.example').dataTable({
			"searching" : false,
			"columnDefs" : [ {
				"className" : "dt-center",
				"targets" : "_all"
			} ]
		});
		loadtableuser();
		$("#adduser").click(function() {
			$("#myModalUser").modal('toggle');
		});
	})
	function loadtableuser() {
		$("#tableuser").DataTable().clear();
		$.ajax({
			url : "userlist.action",
			method : "post",
			async : "false",
			success : function(data) {
				$("#tableuser").DataTable().clear();
				console.log(data);
				data.user.forEach(function(entry) {
					drawtableuser(entry);
				});
			},
		});
	}
	function adduser() {
		$.ajax({
			url : "addduser.action",
			method : "post",
			data : {
				username : $("#username").val(),
				employeename : $("#employeename").val(),
				role : $("#role").val()
			},
			success : function(data) {
				$("#tableuser").DataTable().clear();
				console.log(data);
				loadtableuser();
				$("#myModalUser").modal('toggle');
			}
		});
	}
	function removeuser(userid, emid) {
		$.ajax({
			url : "removeuser.action",
			data : {
				userid : userid,
				emid : emid
			},
			success : function(data) {
				$("#tableuser").DataTable().clear();
				console.log(data);
				loadtableuser();
			}
		});
	}
	function drawtableuser(data) {
		console.log(data);
		var str = "<a title='Edit' href='#' id='eu"+data[0].id+"'>"
				+ "<span class='glyphicon glyphicon-edit' style='color:green' cusid='"+data[0].id+"' ></span>"
				+ "</a> | "
				+ "<a title='Remove' href='#' id='ru"+data[0].id+"'>"
				+ "<span class='glyphicon glyphicon-trash'style='color:red' cusid='"+data[0].id+"' ></span>"
				+ "</a>";
		$('#tableuser').DataTable().row.add(
				[ data[0].id, data[0].username, data[1].employeeid,
						data[1].employeename, data[0].role, str ]).draw(false);
		$("#ru" + data[0].id).click(function() {
			removeuser(data[0].id, data[1].employeeid);
		});
		$("#eu" + data[0].id).click(function() {
			edituser1(data[0].username);
		});
	}
	function edituser1(username) {
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
				$("#userModal").modal('toggle');
			}
		});
	}
	function savetemplate() {
		var header = tinyMCE.get('head').getContent();
		var footer = tinyMCE.get('body').getContent();
		console.log(body);
		$.ajax({
			url : "addtemplate.action",
			type:"post",
			data : {
				header : header,
				footer :footer,
			},
			success : function(data){
				console.log("ok");
			}
		});
	}
</script>
<div class="row">
	<div class="col-md-2">
		<div class="groupcontainer">
			Cài đặt
			<div class="groupitem">
				<div>
					<a href='#' id='edituser' title='Chỉnh sửa người dùng'>Người
						dùng</a>
				</div>
				<div>
					<a href='#' id='editgroup' title='Chỉnh sửa nhóm'>Nhóm</a>
				</div>
				<div>
					<a href='#' id='editbill' title='Chỉnh sửa hóa đơn'>Hóa đơn</a>
				</div>
			</div>
		</div>
	</div>
	<div hidden class="col-md-10 ">
		<div class="tablecontainer">
			<div align="right">
				<a href="#" id="adduser"><span class="glyphicon glyphicon-plus"></span></a>
			</div>
			<table id="tableuser" class="display example" cellspacing="0"
				width="100%">
				<thead>
					<tr>
						<th>Mã Người dùng</th>
						<th>Username</th>
						<th>Mã nhân viên</th>
						<th>Họ tên</th>
						<th>Quyền</th>
						<th>Chức năng</th>
					</tr>
				</thead>
			</table>
		</div>
	</div>
	<div hidden class="col-md-10 ">
		<div class="tablecontainer">
			<table id="tablegroup" class="display example" cellspacing="0"
				width="100%">
				<thead>
					<tr>
						<th>Mã nhóm</th>
						<th>Tên nhóm</th>
						<th>Ghi chú</th>
						<th>Chức năng</th>
					</tr>
				</thead>
			</table>
		</div>
	</div>
	<div class="col-md-10 ">
		<h1>Chỉnh sửa hóa đơn in ra</h1>
		<div>
			<label>Header:&nbsp;</label>
			<textarea id="head" style="height: 200px"></textarea>
			<br />
			<label>Footer:&nbsp;</label>
			<textarea id="body" style="height: 200px"></textarea>
			<br />
			<div align="right">
				<input type="button" class="botbarbutton" onclick="savetemplate()"
					value="Save" /> <input type="button" class="botbarbutton"
					onclick="preview()" value="Preview" />
			</div>
		</div>
	</div>
	<!--Bootstrap Modal User -->
	<div id="myModalUser" class="modal fade" role="dialog">
		<div class="modal-dialog ">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Thêm người dùng</h4>
				</div>
				<div class="modal-body ">
					<form action="addproduct.action" id="add">
						<input type="hidden" id="cmid" name="customer.customerid">
						<table width="100%" class="popuptable" align="center">
							<tr>
								<td style="white-space: nowrap;">Username</td>
								<td><input type="text" name="customer.customername"
									id="username" /> <span style="color: blue">Mật khẩu mặc
										định: Password123</span></td>
							</tr>
							<tr>
								<td style="white-space: nowrap;">Tên nhân viên</td>
								<td><input type="text" name="customer.customername"
									id="employeename" /></td>
							</tr>
							<tr>
								<td style="white-space: nowrap;">Quyền</td>
								<td><select name="customer.customergroup" id="role">
										<option value="user">User</option>
										<option value="admin">Admin</option>
								</select></td>
							</tr>
						</table>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" onclick="adduser()" class="btn btn-default">Thêm</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>