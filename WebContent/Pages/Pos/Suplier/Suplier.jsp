<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<style>
#example th {
	font-size: 12px;
}

#example td {
	font-size: 12px;
}
</style>
<script type="text/javascript">
	var data1 = null;
	$(document).ready(function() {
		$(".active").removeClass("active");
		$("#navsp").addClass("active");
		$('#example').dataTable({
			"searching" : false,
			"columnDefs" : [ {
				"className" : "dt-center",
				"targets" : "_all"
			} ]
		});
		loadtable();
		getgrouplist();
		$("#addnew").click(function() {
			$("#add input,#add textarea,#add #cmgroup").val(" ");
			$('#cmid').removeAttr('disabled');
			$("#submitbutton").text("Thêm");
			$("#submitbutton").click(function() {
				add();
			});
			$("#myModal").modal('toggle');
		});
		$("#addgroup").click(function() {
			$("#groupModal").modal('toggle');
		});
		$("#submitgroup").click(function() {
			addgroup();
			$("#groupModal").modal('toggle');
		});
		
	});
	function getgrouplist() {
		$(".groupitem").html("");
		$
				.ajax({
					url : "sgrouplist.action",
					success : function(data) {
						var strall = "<div><a href='#' onclick='return loadtable();'>Tất cả</a></div>"
						$(".groupitem").append(strall);
						console.log(data);
						data.supliergroups
								.forEach(function(entry) {
									var str = "<div><a href='#'id='g"+entry.sgroupid+"' title='"+entry.sgroupnote+"'>"
											+ entry.sgroupname + "</a></div>";
									var str1 = "<option value='"+entry.sgroupname+"'>"
											+ entry.sgroupname + "</option>"
									$(".groupitem").append(str);
									$("#cmgroup").append(str1);
									$("#g" + entry.sgroupid).click(function() {
										getsuplierbygroup(entry.sgroupname);
									});
								});
					}
				});
	}
	function getsuplierbygroup(data) {
		console.log(data);
		loadtable(data);
	}
	function drawtable(data) {
		console.log(data);
		var str = "<a title='Edit' href='#' id='e"+data.suplierid+"'>"
				+ "<span class='glyphicon glyphicon-edit' style='color:green' cusid='"+data.suplierid+"' ></span>"
				+ "</a> | "
				+ "<a title='Remove' href='#' id='r"+data.suplierid+"'>"
				+ "<span class='glyphicon glyphicon-trash'style='color:red' cusid='"+data.suplierid+"' ></span>"
				+ "</a> | "
				+ "<a title='Barcode' href='#' id='b"+data.suplierid+"'>"
				+ "<span class='glyphicon glyphicon-export'style='color:orange' cusid='"+data.suplierid+"' ></span>"
				+ "</a>";
		$('#example').DataTable().row.add(
				[ data.suplierid, data.supliername, data.address, data.phone,
						data.mail, data.supliergroup, str ])
				.draw(false);
		$("#r" + data.suplierid).click(function() {
			remove(data.suplierid);
		});
		$("#e" + data.suplierid).click(function() {
			getsuplier(data.suplierid);
		});
		$("#b" + data.suplierid).click(function() {
			getbarcode("NCC"+data.suplierid);
		});
	}
	function loadtable(data) {
		$.ajax({
			url : "getsuplierlist",
			method : "post",
			async : "false",
			data : {
				group : data,
			},
			success : function(data) {
				$("#example").DataTable().clear();
				data1 = JSON.stringify(data.supliers);
				console.log(data1);
				data.supliers.forEach(function(entry) {
					drawtable(entry);
				});
			},
		});
	}
	function loadtablebykeyword() {
		console.log($("#txt_cmsearch").val());
		$.ajax({
			url : "/Struts22/getsuplierlist",
			method : "post",
			async : "false",
			data : {
				searchvalue : $("#txt_cmsearch").val(),
			},
			success : function(data) {
				$("#example").DataTable().clear();
				data1 = JSON.stringify(data.supliers);
				console.log(data1);
				data.supliers.forEach(function(entry) {
					drawtable(entry);
				});
			},
		});
	}
	function add() {
		$.ajax({
			url : "addsuplier.action",
			data : {
				supliername : $("#cmname").val(),
				address: $("#cmaddress").val(),
				phone: $("#cmphone").val() ,
				supliergroup: $("#cmgroup").val() ,
				mail: $("#cmmail").val()
			},
			type: "post",
			success : function(data) {
				console.log("ok");
				loadtable();
				$("#myModal").modal('toggle');
				$('#alertsuccessaddsuplier').show();
			}
		});
	}
	function addgroup() {
		$.ajax({
			url : "addsgroup.action",
			data : $("#formaddgroup").serialize(),
			success : function(data) {
				console.log("ok");
				getgrouplist();
			}
		});
	}
	function remove(data) {
		$.ajax({
			url : "removesuplier.action",
			data : {
				suplierid : data
			},
			success : function(data) {
				console.log("ok");
				$("#example").DataTable().clear();
				loadtable();
			}
		});
	}
	function getsuplier(data) {
		$.ajax({
			url : "getsuplier.action",
			data : {
				suplierid : data
			},
			success : function(data1) {
				console.log("ok");
				var cus = data1.suplier;
				$(".modal-title").text("Cập nhật NCC: #"+cus.suplierid);
				$("#cmid").val(cus.suplierid);
				$("#cmid").attr('disabled', 'disabled');
				$("#cmname").val(cus.supliername);
				$("#cmgroup").val(cus.supliergroup);
				$("#cmaddress").val(cus.address);
				$("#cmmail").val(cus.mail);
				$("#cmphone").val(cus.phone);
				$('#myModal').modal("toggle");
				$("#submitbutton").text("Cập nhật");
				$("#submitbutton").unbind();
				$("#submitbutton").click(function() {
					updatesuplier();
				});
			}
		});
	}
	function updatesuplier() {
		//console.log($("#add").serialize());
		$('#cmid').removeAttr('disabled');
		$.ajax({
			url : "updatesuplier.action",
			data : $("#add").serialize(),
			success : function(data) {
				console.log("ok");
				loadtable();
				$("#myModal").modal('toggle');
			}
		});
	}
	function excel() {
		var data = $("#example").dataTable().fnGetData();
		console.log(data);
		var str = "<table><tr><th>Mã NCC</th><th>Nhà cung cấp</th>"
				+ "<th>Địa chỉ</th><th>Điện thoại</th><th>Email</th>"
				+ "<th>Nhóm</th></tr>";
		 data.forEach(function(entry) {
			str += "<tr><td>" + entry[0] + "</td><td>" + entry[1]
					+ "</td><td>" + entry[2] + "</td><td>" + entry[3]
					+ "</td><td>" + entry[4] + "</td><td>" + entry[5]
					+ "</td></tr>";
		});
		str += "</table>";
		$("#exceltable").html(str);
		var html = $("#exceltable").html();
		window
				.open('data:application/vnd.ms-excel;charset=utf-8,\uFEFF'
						+ html);
	}
	function getbarcode(data) {
		$("#barcodecontent").barcode(data, "code39");
		var html = $("#barcode").html();
		var newWindow = window.open();
		newWindow.document.write(html);
	}
</script>
<div class="botbar">
	<div class="botbarfunction">
		Nhà cung cấp <input type="text" class="form-control" id="txt_cmsearch"
			style="width: 200px; display: inline-block;" />
		<button class="botbarbutton" id="but_cmsearch" onclick="loadtablebykeyword()">
			<span class="glyphicon glyphicon-search"></span>
		</button>
		<div style="float: right;">
			<button class="botbarbutton" id="addnew">
				<span class="glyphicon glyphicon-plus"></span> Thêm
			</button>
			<button class="botbarbutton" onclick="excel()">
				<span class="glyphicon glyphicon-export"></span> Xuất Excel
			</button>
		</div>
	</div>
</div>
<div class="row">
	<div class="col-md-2">
		<div class="groupcontainer">
			Nhóm NCC <a href="#" style="float: right" id="addgroup">+</a>
			<div class="groupitem"></div>
		</div>
	</div>
	<div class="col-md-10 ">
		<div class="tablecontainer">
			<table id="example" class="display" cellspacing="0" width="100%">
				<thead>
					<tr>
						<th>Mã NCC</th>
						<th width="120px">Nhà cung cấp</th>
						<th width="20%">Địa chỉ</th>
						<th>Điện thoại</th>
						<th>Email</th>
						<th width="100px">Nhóm</th>
						<th>Chức năng</th>
					</tr>
				</thead>
			</table>
		</div>
	</div>
</div>
<div hidden id="exceltable"></div>
<div hidden id="alertsuccessaddsuplier" class="alert alert-success"
	style="position: fixed; bottom: 0; z-index: 10; left: 50%; transform: translateX(-50%);">
	<a href="#" class="close"
		onclick="$('#alertsuccessaddsuplier').hide()" aria-label="close"
		style="padding-left: 10px">&times;</a> <strong>Nhà cung cấp thành công!</strong>
</div>
<div  hidden  id="barcode">
	<div id="barcodecontent"></div>
</div>
<!--Bootstrap Modal -->
<div id="myModal" class="modal fade" role="dialog">
	<div class="modal-dialog ">
		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">Thêm NCC</h4>
			</div>
			<div class="modal-body ">
				<form action="addsuplier.action" id="add">
				<input type="hidden" name="suplier.suplierid" id="cmid" />
					<table width="100%" class="popuptable" align="center">
						<tr>
							<td style="white-space: nowrap;">Tên nhà cung cấp</td>
							<td><input type="text" name="suplier.supliername"
								id="cmname" /></td>
						</tr>
						<tr>
							<td style="white-space: nowrap;">Chọn nhóm</td>
							<td><select name="suplier.supliergroup" id="cmgroup">

							</select></td>
						</tr>
						<tr>
							<td style="white-space: nowrap;">Địa chỉ</td>
							<td><textarea cols="40" name="suplier.address"
									id="cmaddress"></textarea></td>
						</tr>
						<tr>
							<td style="white-space: nowrap;">Số điện thoại</td>
							<td><input type="text" name="suplier.phone" id="cmphone" /></td>
						</tr>
						<tr>
							<td style="white-space: nowrap;">Email</td>
							<td><input type="text" name="suplier.mail" id="cmmail" /></td>
						</tr>
					</table>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" id="submitbutton" class="btn btn-default">Thêm</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>
<div id="groupModal" class="modal fade" role="dialog">
	<div class="modal-dialog ">
		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">Thêm nhóm nhà cung cấp</h4>
			</div>
			<div class="modal-body ">
				<form action="addsupliergroup.action" id="formaddgroup">
					<table width="100%" class="popuptable" align="center">
						<tr>
							<td style="white-space: nowrap;" width="30%">Tên nhóm</td>
							<td><input type="text" name="supliergroup.sgroupname" /></td>
						</tr>
						<tr>
							<td style="white-space: nowrap;">Thông tin nhóm</td>
							<td><textarea cols="40" name="supliergroup.sgroupnote"></textarea></td>
						</tr>
					</table>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" id="submitgroup" class="btn btn-default">Thêm</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>