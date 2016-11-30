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
		$("#navrp").addClass("active");
		$('#example').dataTable({
			"searching" : false,
			"columnDefs" : [ {
				"className" : "dt-center",
				"targets" : "_all"
			} ]
		});
		loadtable();
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
	function getcustomerbygroup(data) {
		console.log(data);
		loadtable(data);
	}
	function drawtable(data) {
		console.log(data);
		var str = "<a title='Edit' href='#' id='e"+data.billid+"'>"
				+ "<span class='glyphicon glyphicon-edit' style='color:green' cusid='"+data.billid+"' ></span>"
				+ "</a> | "
				+ "<a title='Remove' href='#' id='r"+data.billid+"'>"
				+ "<span class='glyphicon glyphicon-trash'style='color:red' cusid='"+data.billid+"' ></span>"
				+ "</a>";
		$('#example').DataTable().row.add(
				[ data.billid, data.billtype, data.receivername, data.phone,
						data.address, data.cash, data.reason, data.date, str ])
				.draw(false);
		$("#r" + data.billid).click(function() {
			remove(data.billid);
		});
		$("#e" + data.billid).click(function() {
			getrp(data.billid);
		});
	}
	function loadtable(data) {
		$.ajax({
			url : "/Struts22/getrplist",
			method : "post",
			async : "false",
			data : {
				group : data,
			},
			success : function(data) {
				$("#example").DataTable().clear();
				data.receiptandpayments.forEach(function(entry) {
					drawtable(entry);
				});
			},
		});
	}
	function loadtablebykeyword() {
		console.log($("#txt_cmsearch").val());
		$.ajax({
			url : "/Struts22/getrplist",
			method : "post",
			async : "false",
			data : {
				searchvalue : $("#txt_cmsearch").val(),
			},
			success : function(data) {
				$("#example").DataTable().clear();
				data1 = JSON.stringify(data.customers);
				console.log(data1);
				data.customers.forEach(function(entry) {
					drawtable(entry);
				});
			},
		});
	}
	function add() {
		console.log($("#add").serialize());
		$.ajax({
			url : "addrp.action",
			data : $("#add").serialize(),
			success : function(data) {
				console.log("ok");
				loadtable();
				$("#myModal").modal('toggle');
				$("#alertsuccess").show();
			}
		});
	}
	function remove(data) {
		$.ajax({
			url : "removerp.action",
			data : {
				billid : data
			},
			success : function(data) {
				console.log("ok");
				$("#example").DataTable().clear();
				loadtable();
			}
		});
	}
	function getrp(data) {
		$.ajax({
			url : "getrp.action",
			data : {
				billid : data
			},
			success : function(data1) {
				console.log("ok");
				var cus = data1.receiptandpayment;
				$(".modal-title")
						.text("Cập nhật phiếu thu/chi: #" + cus.billid);
				$("#bid").val(cus.billid);
				$("#bname").val(cus.receivername);
				$("#bgroup").val(cus.billtype);
				$("#baddress").val(cus.address);
				$("#breason").val(cus.reason);
				$("#bphone").val(cus.phone);
				$("#bcash").val(cus.cash);
				$("#bdate").val(cus.date);
				$('#myModal').modal("toggle");
				$("#submitbutton").text("Cập nhật");
				$("#submitbutton").unbind();
				$("#submitbutton").click(function() {
					updaterp();
				});
			}
		});
	}
	function updaterp() {
		//console.log($("#add").serialize());
		$('#bid').removeAttr('disabled');
		$.ajax({
			url : "updaterp.action",
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
		var str = "<table><tr><th>Mã phiếu</th><th>Loại</th>"
				+ "<th>Người nhận</th><th>Điện thoại</th><th>Địa chỉ</th>"
				+ "<th>Số tiền</th><th>Lý do</th><th>Ngày tạo</th></tr>";
		data.forEach(function(entry) {
			str += "<tr><td>" + entry[0] + "</td><td>" + entry[1] + "</td><td>"
					+ entry[2] + "</td><td>" + entry[3] + "</td><td>"
					+ entry[4] + "</td><td>" + entry[5] + "</td><td>"
					+ entry[6] + "</td><td>" + entry[7] + "</td></tr>";
		});
		str += "</table>";
		$("#exceltable").html(str);
		var html = $("#exceltable").html();
		window
				.open('data:application/vnd.ms-excel;charset=utf-8,\uFEFF'
						+ html);
	}
</script>
<div class="botbar">
	<div class="botbarfunction">
		Thu chi | <input type="text" class="form-control" id="txtsearch"
			placeholder="Nhập từ khóa"
			style="width: 200px; display: inline-block;" /> Từ ngày: <input
			type="date" class="form-control" id="datestart" placeholder="Từ ngày"
			style="width: 160px; display: inline-block;" /> Đến ngày:<input
			type="date" placeholder="Đến ngày" class="form-control" id="dateend"
			style="width: 160px; display: inline-block;" />
		<button onclick="loadtablebykey()" class="botbarbutton">
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
			Thể loại <a href="#" style="float: right" id="addgroup">+</a>
			<div class="groupitem">
				<div>
					<a href='#' class="group">Tất cả</a>
				</div>
				<div>
					<a href='#' class="group">Thu</a>
				</div>
				<div>
					<a href='#' class="group">Chi</a>
				</div>
			</div>
		</div>
	</div>
	<div class="col-md-10 ">
		<div class="tablecontainer">
			<table id="example" class="display" cellspacing="0" width="100%">
				<thead>
					<tr>
						<th>Mã phiếu</th>
						<th>Loại</th>
						<th>Người nhận</th>
						<th>Điện thoại</th>
						<th width="20%">Địa chỉ</th>
						<th>Số tiền</th>
						<th>Lý do</th>
						<th width="100px">Ngày tạo</th>
						<th>Chức năng</th>
					</tr>
				</thead>
			</table>
		</div>
	</div>
</div>
<div hidden id="exceltable"></div>
<div hidden id="alertsuccess" class="alert alert-success"
	style="position: fixed; bottom: 0; z-index: 10; left: 50%; transform: translateX(-50%);">
	<a href="#" class="close" onclick="$('#alertsuccess').hide()"
		aria-label="close" style="padding-left: 10px">&times;</a> <strong>Thêm
		phiếu thu/chi thành công!</strong>
</div>
<!--Bootstrap Modal -->
<div id="myModal" class="modal fade" role="dialog">
	<div class="modal-dialog ">
		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">Thêm phiếu thu/chi</h4>
			</div>
			<div class="modal-body ">
				<form action="addproduct.action" id="add">
					<input type="hidden" name="billid" id="bid" />
					<table width="100%" class="popuptable" align="center">
						<tr>
							<td style="white-space: nowrap;">Tên người nhận</td>
							<td><input type="text" name="receiptandpayment.receivername"
								id="bname" /></td>
						</tr>
						<tr>
							<td style="white-space: nowrap;">Loại phiếu</td>
							<td><select name="receiptandpayment.billtype" id="btype">
									<option value="Thu">Thu</option>
									<option value="Chi">Chi</option>
							</select></td>
						</tr>
						<tr>
							<td style="white-space: nowrap;">Số tiền</td>
							<td><input type="number" name="receiptandpayment.cash"
								id="bcash" /> VND</td>
						</tr>
						<tr>
							<td style="white-space: nowrap;">Địa chỉ</td>
							<td><textarea cols="40" name="receiptandpayment.address"
									id="baddress"></textarea></td>
						</tr>
						<tr>
							<td style="white-space: nowrap;">Số điện thoại</td>
							<td><input type="text" name="receiptandpayment.phone"
								id="bphone" /></td>
						</tr>
						<tr>
							<td style="white-space: nowrap;">Lý do</td>
							<td><textarea cols="40" name="receiptandpayment.reason"
									id="breason"></textarea></td>
						</tr>
						<tr>
							<td style="white-space: nowrap;">Ngày lập</td>
							<td><input type="date" name="receiptandpayment.date"
								id="bdate" /></td>
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