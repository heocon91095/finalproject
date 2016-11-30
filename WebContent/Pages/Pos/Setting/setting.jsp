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

	})

	function savetemplate() {
		var header = tinyMCE.get('head').getContent();
		var footer = tinyMCE.get('body').getContent();
		console.log(body);
		$.ajax({
			url : "addtemplate.action",
			type : "post",
			data : {
				header : header,
				footer : footer,
			},
			success : function(data) {
				console.log("ok");
			}
		});
	}
</script>

<div class="row">
	<div class="col-md-2">
		<div class="groupcontainer">
			Cài đặt <a href="#" style="float: right" id="addgroup">+</a>
			<div class="groupitem">
				<div>
					<a href='setting.action' class="group">Quản lý người dùng</a>
				</div>
				<div>
					<a href='groupsetting.action' class="group">Quản lý nhóm</a>
				</div>
				<div style="background-color: teal">
					<a href='settingtemplate.action' class="group" style="color: white">Mẫu
						hóa đơn</a>
				</div>
			</div>
		</div>
	</div>
	<div class="col-md-10 ">
		<h1>Chỉnh sửa hóa đơn in ra</h1>
		<div>
			<label>Header:&nbsp;</label>
			<textarea id="head" style="height: 200px"></textarea>
			<br /> <label>Footer:&nbsp;</label>
			<textarea id="body" style="height: 200px"></textarea>
			<br />
			<div align="right">
				<input type="button" class="botbarbutton" onclick="savetemplate()"
					value="Save" /> <!-- <input type="button" class="botbarbutton"
					onclick="preview()" value="Preview" /> -->
			</div>
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