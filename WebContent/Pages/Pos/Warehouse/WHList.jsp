<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<script type="text/javascript">
	var totaltemp;
	var notetemp;
	$(document)
			.ready(
					function() {
						$(".active").removeClass("active");
						$("#navwh").addClass("active");
						var table = $('#example')
								.DataTable(
										{
											"searching" : false,
											"columnDefs" : [ {
												"className" : "dt-center",
												"targets" : "_all"
											} ],
											"columns" : [
													{
														"className" : 'details-control dt-center',
														"orderable" : false,
														"data" : null,
														"defaultContent" : "<span class=' glyphicon glyphicon-plus'></span>"
													}, {
														"data" : "billid"
													}, {
														"data" : "customername"
													}, {
														"data" : "address"
													}, {
														"data" : "phone"
													}, {
														"data" : "creator"
													}, {
														"data" : "status"
													}, {
														"data" : "date"
													}, {
														"data" : "str"
													} ]
										});
						$('#example tbody')
								.on(
										'click',
										'td.details-control',
										function() {
											var tr = $(this).closest('tr');
											var row = table.row(tr);

											if (row.child.isShown()) {
												// This row is already open - close it
												row.child.hide();
												tr.removeClass('shown');
											} else {
												// Open this row
												row
														.child(
																showWHDetail(row
																		.data().billid))
														.show();
												tr.addClass('shown');
											}
										});
						loadtable();
						$(".group").click(function() {
							var value = $(this).text();
							if (value == "Tất cả") {
								value = null;
							}
							console.log(value);
							loadtable(value);
						});
						$("#newwarehouse").click(function() {
							window.location.href = "createWH.action";
						});
					});
	function showWHDetail(dataa) {
		return getWHdetail(dataa);
	}
	function getWHdetail(dataa) {
		var table = "<h4 align='center'>Chi tiết đơn hàng</h4>"
				+ "<table width='80%' style='margin-left:100px'><thead>"
				+ "<tr style='text-align:center'>" + "<th >STT</th>"
				+ "<th >Mã sản phẩm</th>" + "<th >Tên sản phẩm</th>"
				+ "<th >Số lượng</th>" + "<th>Đơn giá</th>"
				+ "<th >Thành tiền</th>" + "</tr>" + "</thead>";
		$
				.ajax({
					url : "getwarehousedetail.action",
					async : false,
					data : {
						wid : dataa
					},
					success : function(data) {
						var wh = data.WHdetail;
						for (var i = 0, n = wh.length; i < n; i++) {
							table += "<tr>" + "<td>" + (i + 1) + "</td>"
									+ "<td>" + wh[i].id.productid + "</td>"
									+ "<td>" + wh[i].productname + "</td>"
									+ "<td>" + wh[i].number + "</td>" + "<td>"
									+ wh[i].unitprice + "</td>" + "<td>"
									+ wh[i].totalprice + "</td>" + "</tr>";
						}
						table += "</table>";
						$
								.ajax({
									url : "getwh.action",
									async : false,
									data : {
										wid : dataa
									},
									success : function(data) {
										console.log(data);
										table += "<h4 align='right' style='margin-right:100px'> Tổng cộng: "
												+ data.wh.total + "</h4>";
										table += "<div style='margin-left:100px'> <b>Ghi chú:</b> "
												+ data.wh.note + "</div>";
									}
								});
					}
				});
		return table;
	}
	function loadtable(data) {
		$("#example").DataTable().clear().draw();
		$.ajax({
			url : "getwarehouselist.action",
			method : "get",
			data : {
				group : data,
			},
			success : function(data1) {
				data1.whd.forEach(function(entry) {
					drawtable(entry);
				});
			},
		});
	}
	function loadtablebykey() {
		$("#example").DataTable().clear().draw();
		$.ajax({
			url : "getwarehouselistbykey.action",
			data : {
				key : $("#txtsearch").val(),
				datestart : $("#datestart").val(),
				dateend : $("#dateend").val()
			},
			success : function(data1) {
				data1.billd.forEach(function(entry) {
					drawtable(entry);
				});
			},
		});
	}
	function drawtable(data) {
		totaltemp = data[0].total;
		notetemp = data[0].note
		var date = data[0].day.substr(0, data[0].day.indexOf("T"));
		var str = "<a title='Edit' href='#' id='e"+data[0].wid+"'>"
				+ "<span class='glyphicon glyphicon-edit' style='color:green'></span>"
				+ "</a> | "
				+ "<a title='Remove' href='#' id='r"+data[0].wid+"'>"
				+ "<span class='glyphicon glyphicon-trash'style='color:red'></span>"
				+ "</a>";
		var str1 = "<select id='s"+data[0].wid+"' productid='"+data[0].wid+"' class='status' >"
				+ "<option value='Đã thanh toán'>Đã thanh toán</option>"
				+ "<option value='Nợ'>Nợ</option>"
				+ "<option value='Hủy'>Hủy</option>"
		var wh = {
			billid : data[0].wid,
			customername : data[1].supliername,
			address : data[1].address,
			phone : data[1].phone,
			creator : data[0].creator,
			status : str1,
			date : date,
			str : str
		}
		$('#example').DataTable().row.add(wh).draw(false);
		$("#s" + data[0].wid + " [value='" + data[0].status + "']").attr(
				"selected", true);
		$("#s" + data[0].wid).change(function() {
			var id = $(this).attr('id');
			var id = id.substr(1, id.length);
			var status = $(this).val();
			console.log(id);
			console.log(status);
			changestatus(id, status);
		});
		$("#r" + data[0].wid).click(function() {
			remove(data[0].wid);
		});
		$("#e" + data[0].wid).click(function() {
			window.location.href ="getwhupdate.action?id="+data[0].wid;
		});
	}
	function changestatus(id, status) {
		$.ajax({
			url : "changewarehousestatus.action",
			type : "get",
			data : {
				wid : id,
				status : status
			},
			success : function() {
				console.log("ok");
			}
		})
	}
	function remove(data) {
		console.log(data);
		$.ajax({
			url : "removewarehouse.action",
			data : {
				wid : data
			},
			success : function(data) {
				console.log("ok");
				$("#example").DataTable().clear();
			}
		});
		$.ajax({
			url : "removewarehousedetail.action",
			data : {
				wid : data
			},
			success : function(data) {
				console.log("ok");
				$("#example").DataTable().clear();
				loadtable();
			}
		});
	}
	function updateProduct(data) {
		console.log($("#add").serialize());
		try {
			$("#filename").val(getfilename());
			var file = document.getElementById('imgfile').files[0];
			//return image base 64 here
			getBase64(file, function(e) {
				x = e.target.result;
				var i = x.indexOf(",", 0);
				var y = x.substring(i + 1, x.length);
				$("#fileencode").val(y);
				console.log($("#fileencode").val());
			});
		} catch (error) {
			console.log("error")
		}
		$('#code').removeAttr('disabled');
		$.ajax({
			url : "updateproduct.action",
			type : "post",
			async : false,
			data : $("#add").serialize(),
			success : function(data) {
				console.log("ok");
			}
		});
		$("#code").attr('name', 'productdetail.productid');
		$.ajax({
			url : "updateproductdetail.action",
			type : "post",
			async : false,
			data : $("#add").serialize(),
			success : function(data) {
				console.log("ok");
				$("#code").attr('name', 'product.productid');
				$('#myModal').modal("toggle");
				loadtable();
			}
		});
	}
</script>
<style>
.details-control {
	cursor: pointer;
}
</style>
<div class="botbar">
	<div>
		Phiếu nhập | <input type="text" class="form-control" id="txtsearch"
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
			<button class="botbarbutton" id="newwarehouse">
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
			Thể loại
			<div class="groupitem">
				<div>
					<a href='#' class="group">Tất cả</a>
				</div>
				<div>
					<a href='#' class="group">Đã thanh toán</a>
				</div>
				<div>
					<a href='#' class="group">Nợ</a>
				</div>
				<div>
					<a href='#' class="group">Hủy</a>
				</div>
			</div>
		</div>
	</div>
	<div class="col-md-10 ">
		<div class="tablecontainer">
			<table id="example" class="display" cellspacing="0" width="100%">
				<thead>
					<tr>
						<th></th>
						<th>Mã phiếu nhập</th>
						<th>Nhà cung cấp</th>
						<th width="20%">Địa chỉ</th>
						<th>Điện thoại</th>
						<th>Người tạo</th>
						<th>Tình trạng</th>
						<th>Ngày nhập</th>
						<th>Chức năng</th>
					</tr>
				</thead>
			</table>
		</div>
	</div>
</div>