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
		$("#navproducer").addClass("active");
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
					url : "producergrouplist.action",
					success : function(data) {
						var strall = "<div><a href='#' onclick='return loadtable();'>Tất cả</a></div>"
						$(".groupitem").append(strall);
						console.log(data);
						data.producergroups
								.forEach(function(entry) {
									var str = "<div><a href='#'id='g"+entry.groupid+"' title='"+entry.groupnote+"'>"
											+ entry.groupname + "</a></div>";
									var str1 = "<option value='"+entry.groupname+"'>"
											+ entry.groupname + "</option>"
									$(".groupitem").append(str);
									$("#cmgroup").append(str1);
									$("#g" + entry.groupid).click(function() {
										getproducerbygroup(entry.groupname);
									});
								});
					}
				});
	}
	function getproducerbygroup(data) {
		console.log(data);
		loadtable(data);
	}
	function drawtable(data) {
		console.log(data);
		var str = "<a title='Edit' href='#' id='e"+data.producerid+"'>"
				+ "<span class='glyphicon glyphicon-edit' style='color:green' cusid='"+data.producerid+"' ></span>"
				+ "</a> | "
				+ "<a title='Remove' href='#' id='r"+data.producerid+"'>"
				+ "<span class='glyphicon glyphicon-trash'style='color:red' cusid='"+data.producerid+"' ></span>"
				+ "</a> |"
				+ "<a title='Barcode' href='#' id='b"+data.producerid+"'>"
				+ "<span class='glyphicon glyphicon-export'style='color:orange' cusid='"+data.producerid+"' ></span>"
				+ "</a>";
		$('#example').DataTable().row.add(
				[ data.producerid, data.producername, data.address, data.phone,
						data.mail, data.producergroup, str ]).draw(false);
		$("#r" + data.producerid).click(function() {
			remove(data.producerid);
		});
		$("#b" + data.producerid).click(function() {
			getbarcode("NSX"+data.producerid);
		});
	}
	function loadtable(data) {
		$.ajax({
			url : "getproducerlist",
			method : "post",
			async : "false",
			data : {
				group : data,
			},
			success : function(data) {
				$("#example").DataTable().clear();
				data1 = JSON.stringify(data.producers);
				console.log(data1);
				data.producers.forEach(function(entry) {
					drawtable(entry);
				});
			},
		});
	}
	function loadtablebykeyword() {
		console.log($("#txt_cmsearch").val());
		$.ajax({
			url : "/Struts22/getproducerlist",
			method : "post",
			async : "false",
			data : {
				searchvalue : $("#txt_cmsearch").val(),
			},
			success : function(data) {
				$("#example").DataTable().clear();
				data1 = JSON.stringify(data.producers);
				console.log(data1);
				data.producers.forEach(function(entry) {
					drawtable(entry);
				});
			},
		});
	}
	function add() {
		$.ajax({
			url : "addproducer.action",
			data : {
				producername : $("#cmname").val(),
				address : $("#cmaddress").val(),
				phone : $("#cmphone").val(),
				producergroup : $("#cmgroup").val(),
				mail : $("#cmmail").val()
			},
			type : "post",
			success : function(data) {
				console.log("ok");
				loadtable();
				$("#myModal").modal('toggle');
				$('#alertsuccessaddproducer').show();
			}
		});
	}
	function addgroup() {
		$.ajax({
			url : "addproducergroup.action",
			data : $("#formaddgroup").serialize(),
			success : function(data) {
				console.log("ok");
				getgrouplist();
			}
		});
	}
	function remove(data) {
		$.ajax({
			url : "removeproducer.action",
			data : {
				producerid : data
			},
			success : function(data) {
				console.log("ok");
				$("#example").DataTable().clear();
				loadtable();
			}
		});
	}
	function getproducer(data) {
		$.ajax({
			url : "getproducer.action",
			data : {
				producerid : data
			},
			success : function(data1) {
				console.log("ok");
				var cus = data1.producer;
				$(".modal-title").text("Cập nhật NSX: #" + cus.producerid);
				$("#cmid").val(cus.producerid);
				$("#cmid").attr('disabled', 'disabled');
				$("#cmname").val(cus.producername);
				$("#cmgroup").val(cus.producergroup);
				$("#cmaddress").val(cus.address);
				$("#cmmail").val(cus.mail);
				$("#cmphone").val(cus.phone);
				$('#myModal').modal("toggle");
				$("#submitbutton").text("Cập nhật");
				$("#submitbutton").unbind();
				$("#submitbutton").click(function() {
					updateproducer();
				});
			}
		});
	}
	function updateproducer() {
		//console.log($("#add").serialize());
		$('#cmid').removeAttr('disabled');
		$.ajax({
			url : "updateproducer.action",
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
		var str = "<table><tr><th>Mã NSX</th><th>Nhà sản xuất</th>"
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
	function getbarcode(data){
		$("#barcodecontent").barcode(data, "code39");     
		var html = "<div style='padding: 0px; overflow: auto; width: 175px;'> "+$("#barcode").html()+"</div>";
		var newWindow = window.open();
		newWindow.document.write(html); 
	}
</script>
<div class="botbar">

	<div class="botbarfunction">
		Nhà sản xuất <input type="text" class="form-control" id="txt_cmsearch"
			style="width: 200px; display: inline-block;" />
		<button class="botbarbutton" id="but_cmsearch"
			onclick="loadtablebykeyword()">
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
			Nhóm NSX <a href="#" style="float: right" id="addgroup">+</a>
			<div class="groupitem"></div>
		</div>
	</div>
	<div class="col-md-10 ">
		<div class="tablecontainer">
			<table id="example" class="display" cellspacing="0" width="100%">
				<thead>
					<tr>
						<th>Mã NSX</th>
						<th width="120px">Nhà sản xuất</th>
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
<div hidden id="alertsuccessaddproducer" class="alert alert-success"
	style="position: fixed; bottom: 0; z-index: 10; left: 50%; transform: translateX(-50%);">
	<a href="#" class="close"
		onclick="$('#alertsuccessaddproducer').hide()" aria-label="close"
		style="padding-left: 10px">&times;</a> <strong>Nhà sản xuất
		thành công!</strong>
</div>
<div hidden id="exceltable"></div>
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
				<h4 class="modal-title">Thêm NSX</h4>
			</div>
			<div class="modal-body ">
				<form action="addproducer.action" id="add">
					<input type="hidden" name="producer.producerid" id="cmid" />
					<table width="100%" class="popuptable" align="center">
						<tr>
							<td style="white-space: nowrap;">Tên nhà sản xuất</td>
							<td><input type="text" name="producer.producername"
								id="cmname" /></td>
						</tr>
						<tr>
							<td style="white-space: nowrap;">Chọn nhóm</td>
							<td><select name="producer.producergroup" id="cmgroup">

							</select></td>
						</tr>
						<tr>
							<td style="white-space: nowrap;">Địa chỉ</td>
							<td><textarea cols="40" name="producer.address"
									id="cmaddress"></textarea></td>
						</tr>
						<tr>
							<td style="white-space: nowrap;">Số điện thoại</td>
							<td><input type="text" name="producer.phone" id="cmphone" /></td>
						</tr>
						<tr>
							<td style="white-space: nowrap;">Email</td>
							<td><input type="text" name="producer.mail" id="cmmail" /></td>
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
				<h4 class="modal-title">Thêm nhóm nhà sản xuất</h4>
			</div>
			<div class="modal-body ">
				<form action="addproducergroup.action" id="formaddgroup">
					<table width="100%" class="popuptable" align="center">
						<tr>
							<td style="white-space: nowrap;" width="30%">Tên nhóm</td>
							<td><input type="text" name="producergroup.groupname" /></td>
						</tr>
						<tr>
							<td style="white-space: nowrap;">Thông tin nhóm</td>
							<td><textarea cols="40" name="producergroup.groupnote"></textarea></td>
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