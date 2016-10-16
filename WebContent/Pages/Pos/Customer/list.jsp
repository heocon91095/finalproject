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
		$("#navcm").addClass("active");
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
	});
	function getgrouplist() {
		$
				.ajax({
					url : "cgrouplist.action",
					success : function(data) {
						data.customergroups
								.forEach(function(entry) {
									var str = "<div><a href='#'id='g"+entry.cgroupid+"' title='"+entry.cgroupnote+"'>"
											+ entry.cgroupname + "</a></div>";
									var str1 = "<option value='"+entry.cgroupname+"'>"
											+ entry.cgroupname + "</option>"
									$(".groupitem").append(str);
									$("#cmgroup").append(str1);
									$("#g" + entry.cgroupid).click(function() {
										getcustomerbygroup(entry.cgroupname);
									});
								});
					}
				});
	}
	function getcustomerbygroup(data) {
		console.log(data);
		loadtable(data);
	}
	function drawtable(data) {
		console.log(data);
		var str = "<a title='Edit' href='#' id='e"+data.customerid+"'>"
				+ "<span class='glyphicon glyphicon-edit' style='color:green' cusid='"+data.customerid+"' ></span>"
				+ "</a> | "
				+ "<a title='Remove' href='#' id='r"+data.customerid+"'>"
				+ "<span class='glyphicon glyphicon-trash'style='color:red' cusid='"+data.customerid+"' ></span>"
				+ "</a>";
		$('#example').DataTable().row.add(
				[ data.customerid, data.customername, data.address, data.phone,
						data.mail, data.username, data.customergroup, str ])
				.draw(false);
		$("#r" + data.customerid).click(function() {
			remove(data.customerid);
		});
		$("#e" + data.customerid).click(function() {
			getcustomer(data.customerid);
		});
	}
	function loadtable(data) {
		$.ajax({
			url : "/Struts22/customerlistjson",
			method : "post",
			async : "false",
			data : {
				group : data
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
		$.ajax({
			url : "addcustomer.action",
			data : $("#add").serialize(),
			success : function(data) {
				console.log("ok");

				loadtable();
				//jQuery.noConflict();
				$("#myModal").modal('toggle');
			}
		});
	}
	function remove(data) {
		$.ajax({
			url : "removecustomer.action",
			data : {
				customerid : data
			},
			success : function(data) {
				console.log("ok");
				$("#example").DataTable().clear();
				loadtable();
			}
		});
	}
	function getcustomer(data) {
		$.ajax({
			url : "customerjson.action",
			data : {
				customerid : data
			},
			success : function(data1) {
				console.log("ok");
				var cus = data1.customer;
				console.log(cus);
				$("#cmid").val(cus.customerid);
				$("#cmid").attr('disabled', 'disabled');
				$("#cmname").val(cus.customername);
				$("#cmgroup").val(cus.customergroup);
				$("#cmaddress").val(cus.address);
				$("#cmmail").val(cus.mail);
				$("#cmphone").val(cus.phone);
				$('#myModal').modal("toggle");
				$("#submitbutton").text("Cập nhật");
				$("#submitbutton").click(function() {
					updatecustomer();
				});
			}
		});
	}
	function updatecustomer() {
		//console.log($("#add").serialize());
		$('#cmid').removeAttr('disabled');
		$.ajax({
			url : "updatecustomer.action",
			data : $("#add").serialize(),
			success : function(data) {
				console.log("ok");
				loadtable();
				//jQuery.noConflict();
				$("#myModal").modal('toggle');
			}
		});
	}
</script>
<div class="botbar">
	<a href="#" id="botbaractive">Khách hàng</a><a href="#">In mã vạch</a>
	<div class="botbarfunction">
		Khách hàng <input type="text" class="form-control"
			style="width: 200px; display: inline-block;" />
		<button class="botbarbutton">
			<span class="glyphicon glyphicon-search"></span>
		</button>
		<div style="float: right;">
			<button class="botbarbutton" id="addnew">
				<span class="glyphicon glyphicon-plus"></span> Thêm
			</button>
			<button class="botbarbutton">
				<span class="glyphicon glyphicon-export"></span> Xuất Excel
			</button>
		</div>
	</div>
</div>
<div class="row">
	<div class="col-md-2">
		<div class="groupcontainer">
			Thể loại <a href="#" style="float: right">+</a>
			<div class="groupitem">
				<div>
					<a href="#" onclick="return loadtable();">Tất cả</a>
				</div>
			</div>
		</div>
	</div>
	<div class="col-md-10 ">
		<div class="tablecontainer">
			<table id="example" class="display" cellspacing="0" width="100%">
				<thead>
					<tr>
						<th>Mã KH</th>
						<th width="120px">Họ Tên</th>
						<th width="20%">Địa chỉ</th>
						<th>Điện thoại</th>
						<th>Email</th>
						<th>Tên dăng nhập</th>
						<th width="100px">Nhóm</th>
						<th>Chức năng</th>
					</tr>
				</thead>
			</table>
		</div>
	</div>
</div>
<!--Bootstrap Modal -->
<div id="myModal" class="modal fade" role="dialog">
	<div class="modal-dialog ">
		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">Thêm khách hàng</h4>
			</div>
			<div class="modal-body ">
				<form action="addproduct.action" id="add">
					<table width="100%" class="popuptable" align="center">
						<tr>
							<td style="white-space: nowrap;" width="30%">Mã khách hàng</td>
							<td><input type="text" name="customer.customerid" id="cmid" /></td>
						</tr>
						<tr>
							<td style="white-space: nowrap;">Tên khách hàng</td>
							<td><input type="text" name="customer.customername"
								id="cmname" /></td>
						</tr>
						<tr>
							<td style="white-space: nowrap;">Chọn nhóm</td>
							<td><select name="customer.customergroup" id="cmgroup">

							</select></td>
						</tr>
						<tr>
							<td style="white-space: nowrap;">Địa chỉ</td>
							<td><textarea cols="40" name="customer.address"
									id="cmaddress"></textarea></td>
						</tr>
						<tr>
							<td style="white-space: nowrap;">Số điện thoại</td>
							<td><input type="text" name="customer.phone" id="cmphone" /></td>
						</tr>
						<tr>
							<td style="white-space: nowrap;">Email</td>
							<td><input type="text" name="customer.mail" id="cmmail" /></td>
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