<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<script>
	$(document).ready(function() {
		$('.example').dataTable({
			"searching" : false,
			"columnDefs" : [ {
				"className" : "dt-center",
				"targets" : "_all"
			} ]
		});
		loadtable();
		$("#adduser").click(function() {
			$("#addbutton").unbind();
			$("#addbutton").click(function() {
				addgroup();
			})
			$("#modaltitle").text("Thêm nhóm");
			$("#name").val("");
			$("#note").val("");
			$("addbutton").text("Thêm");
			$("#groupModal").modal('toggle');
		});
		$("#group").change(function() {
			loadtable();
		});
	})
	function loadtable() {
		$("#tableuser").DataTable().clear();
		if ($("#group").val() == "product") {
			$.ajax({
				url : "pgrouplist.action",
				method : "post",
				async : "false",
				success : function(data) {
					$("#tableuser").DataTable().clear();
					console.log(data);
					data.pgs.forEach(function(entry) {
						drawtableuser(entry.pgroupid, entry.pgroupname,
								entry.pgroupnote);
					});
				},
			});
		}
		if ($("#group").val() == "producer") {
			$.ajax({
				url : "producergrouplist.action",
				method : "post",
				async : "false",
				success : function(data) {
					$("#tableuser").DataTable().clear();
					console.log(data);
					data.producergroups.forEach(function(entry) {
						drawtableuser(entry.groupid, entry.groupname,
								entry.groupnote);
					});
				},
			});
		}
		if ($("#group").val() == "customer") {
			$.ajax({
				url : "cgrouplist.action",
				method : "post",
				async : "false",
				success : function(data) {
					$("#tableuser").DataTable().clear();
					console.log(data);
					data.customergroups.forEach(function(entry) {
						drawtableuser(entry.cgroupid, entry.cgroupname,
								entry.cgroupnote);
					});
				},
			});
		}
		if ($("#group").val() == "suplier") {
			$.ajax({
				url : "sgrouplist.action",
				method : "post",
				async : "false",
				success : function(data) {
					$("#tableuser").DataTable().clear();
					console.log(data);
					data.supliergroups.forEach(function(entry) {
						drawtableuser(entry.sgroupid, entry.sgroupname,
								entry.sgroupnote);
					});
				},
			});
		}

	}
	function addgroup() {
		if ($("#group").val() == "product") {
			$("#name").attr("name", "productgroup.pgroupname");
			$("#note").attr("name", "productgroup.pgroupnote");
			console.log($("#add").serialize());
			$.ajax({
				url : "addpgroup.action",
				method : "post",
				data : $("#add").serialize(),
				success : function(data) {
					console.log(data);
					loadtable();
					$("#groupModal").modal('toggle');
				}
			});
		}
		if ($("#group").val() == "producer") {
			$("#name").attr("name", "producergroup.groupname");
			$("#note").attr("name", "producergroup.groupnote");
			console.log($("#add").serialize());
			$.ajax({
				url : "addproducergroup.action",
				method : "post",
				data : $("#add").serialize(),
				success : function(data) {
					console.log(data);
					loadtable();
					$("#groupModal").modal('toggle');
				}
			});
		}
		if ($("#group").val() == "suplier") {
			$("#name").attr("name", "supliergroup.sgroupname");
			$("#note").attr("name", "supliergroup.sgroupnote");
			console.log($("#add").serialize());
			$.ajax({
				url : "addsgroup.action",
				method : "post",
				data : $("#add").serialize(),
				success : function(data) {
					console.log(data);
					loadtable();
					$("#groupModal").modal('toggle');
				}
			});
		}
		if ($("#group").val() == "customer") {
			$("#name").attr("name", "customergroup.cgroupname");
			$("#note").attr("name", "customergroup.cgroupnote");
			console.log($("#add").serialize());
			$.ajax({
				url : "addcgroup.action",
				method : "post",
				data : $("#add").serialize(),
				success : function(data) {
					console.log(data);
					loadtable();
					$("#groupModal").modal('toggle');
				}
			});
		}
	}
	function updategroup() {
		if ($("#group").val() == "product") {
			$("#groupid").attr("name", "productgroup.pgroupid");
			$("#name").attr("name", "productgroup.pgroupname");
			$("#note").attr("name", "productgroup.pgroupnote");
			console.log($("#add").serialize());
			$.ajax({
				url : "updateproductgroup.action",
				method : "post",
				data : $("#add").serialize(),
				success : function(data) {
					console.log(data);
					loadtable();
					$("#groupModal").modal('toggle');
				}
			});
		}
		if ($("#group").val() == "producer") {
			$("#groupid").attr("name", "producergroup.groupid");
			$("#name").attr("name", "producergroup.groupname");
			$("#note").attr("name", "producergroup.groupnote");
			console.log($("#add").serialize());
			$.ajax({
				url : "updateproducergroup.action",
				method : "post",
				data : $("#add").serialize(),
				success : function(data) {
					console.log(data);
					loadtable();
					$("#groupModal").modal('toggle');
				}
			});
		}
		if ($("#group").val() == "suplier") {
			$("#groupid").attr("name", "supliergroup.sgroupid");
			$("#name").attr("name", "supliergroup.sgroupname");
			$("#note").attr("name", "supliergroup.sgroupnote");
			console.log($("#add").serialize());
			$.ajax({
				url : "updatesupliergroup.action",
				method : "post",
				data : $("#add").serialize(),
				success : function(data) {
					console.log(data);
					loadtable();
					$("#groupModal").modal('toggle');
				}
			});
		}
		if ($("#group").val() == "customer") {
			$("#groupid").attr("name", "customergroup.cgroupid");
			$("#name").attr("name", "customergroup.cgroupname");
			$("#note").attr("name", "customergroup.cgroupnote");
			console.log($("#add").serialize());
			$.ajax({
				url : "updatecustomergroup.action",
				method : "post",
				data : $("#add").serialize(),
				success : function(data) {
					console.log(data);
					loadtable();
					$("#groupModal").modal('toggle');
				}
			});
		}
	}

	function removegroup(groupid) {
		if ($("#group").val() == "product") {
			$.ajax({
				url : "removeproductgroup.action",
				data : {
					id : groupid
				},
				success : function(data) {
					$("#tableuser").DataTable().clear();
					console.log(data);
					loadtable();
				}
			});
		}
		if ($("#group").val() == "suplier") {
			$.ajax({
				url : "removesupliergroup.action",
				data : {
					id : groupid
				},
				success : function(data) {
					$("#tableuser").DataTable().clear();
					console.log(data);
					loadtable();
				}
			});
		}
		if ($("#group").val() == "producer") {
			$.ajax({
				url : "removeproducergroup.action",
				data : {
					id : groupid
				},
				success : function(data) {
					$("#tableuser").DataTable().clear();
					console.log(data);
					loadtable();
				}
			});
		}
		if ($("#group").val() == "customer") {
			$.ajax({
				url : "removecustomergroup.action",
				data : {
					id : groupid
				},
				success : function(data) {
					$("#tableuser").DataTable().clear();
					console.log(data);
					loadtable();
				}
			});
		}
	}
	function drawtableuser(id, name, note) {

		var str = "<a title='Edit' href='#' id='e"+id+"'>"
				+ "<span class='glyphicon glyphicon-edit' style='color:green' cusid='"+id+"' ></span>"
				+ "</a> | "
				+ "<a title='Remove' href='#' id='r"+id+"'>"
				+ "<span class='glyphicon glyphicon-trash'style='color:red' cusid='"+id+"' ></span>"
				+ "</a>";
		$('#tableuser').DataTable().row.add([ id, name, note, str ])
				.draw(false);
		$("#r" + id).click(function() {
			removegroup(id);
		});
		$("#e" + id).click(function() {
			editgroup(id, name, note);
		});
	}
	function editgroup(id, name, note) {
		$("#addbutton").unbind();
		$("#modaltitle").text("Cập nhật nhóm");
		$("#groupid").val(id);
		$("#name").val(name);
		$("#note").val(note);
		$("#groupModal").modal("toggle");
		$("#addbutton").text("Cập nhật")
		$("#addbutton").click(function() {
			updategroup();
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
				<div style="background-color: teal">
					<a href='groupsetting.action' class="group" style="color: white">Quản
						lý nhóm</a>
				</div>
				<div>
					<a href='settingtemplate.action' class="group">Mẫu hóa đơn</a>
				</div>
			</div>
		</div>
	</div>
	<div class="col-md-10 ">
		<div>
			Nhóm: <select id="group">
				<option value="product" selected="selected">Sản phẩm</option>
				<option value="suplier">Nhà cung cấp</option>
				<option value="producer">Nhà sản xuất</option>
				<option value="customer">Khách hàng</option>
			</select>
		</div>
		<div class="tablecontainer">
			<div align="right">
				<a href="#" id="adduser"><span class="glyphicon glyphicon-plus"></span></a>
			</div>
			<table id="tableuser" class="display example" cellspacing="0"
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
</div>
<!--Bootstrap Modal User -->
<div id="groupModal" class="modal fade" role="dialog">
	<div class="modal-dialog ">
		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title" id="modaltitle">Thêm nhóm</h4>
			</div>
			<div class="modal-body ">
				<form id="add">
					<input type="hidden" id="groupid" name="id">
					<table width="100%" class="popuptable" align="center">
						<tr>
							<td style="white-space: nowrap;">Tên nhóm</td>
							<td><input type="text" id="name" /></td>
						</tr>
						<tr>
							<td style="white-space: nowrap;">Ghi chú</td>
							<td><input type="text" id="note" /></td>
						</tr>
					</table>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" id="addbutton" class="btn btn-default">Thêm</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>