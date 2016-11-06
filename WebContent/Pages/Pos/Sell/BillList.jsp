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
						$("#navp").addClass("active");
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
														"data" : "status"
													}, {
														"data" : "date"
													}, {
														"data" : "str"
													}, ]
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
																showBillDetail(row
																		.data().billid))
														.show();
												tr.addClass('shown');
											}
										});
						loadtable();
						$(".group").click(function(){
							var value = $(this).text();
							if(value== "Tất cả")
								{
								value = null;
								}
							loadtable(value);
						});
					});
	function showBillDetail(dataa) {
		return getbilldetail(dataa);
	}
	function getbilldetail(dataa) {
		var table = "<h4 align='center'>Chi tiết đơn hàng</h4>"
				+ "<table width='80%' style='margin-left:100px'><thead>"
				+ "<tr style='text-align:center'>" + "<th >STT</th>"
				+ "<th >Mã sản phẩm</th>" + "<th >Tên sản phẩm</th>"
				+ "<th >Số lượng</th>" + "<th>Đơn giá</th>"
				+ "<th >Thành tiền</th>" + "</tr>" + "</thead>";
		$
				.ajax({
					url : "getbilldetail.action",
					async : false,
					data : {
						billid : dataa
					},
					success : function(data) {
						bill = data.billdetail;
						console.log(bill);
						for (var i = 0, n = bill.length; i < n; i++) {
							table += "<tr>" + "<td>" + (i + 1) + "</td>"
									+ "<td>" + bill[i].id.productid + "</td>"
									+ "<td>" + bill[i].productname + "</td>"
									+ "<td>" + bill[i].number + "</td>"
									+ "<td>" + bill[i].unitprice + "</td>"
									+ "<td>" + bill[i].totalprice + "</td>"
									+ "</tr>";
						}
						table += "</table>";
						table += "<h4 align='right' style='margin-right:100px'> Tổng cộng: "
								+ totaltemp + "</h4>";
						table += "<div style='margin-left:100px'> <b>Ghi chú:</b> "
								+ notetemp + "</div>";
					}
				});
		return table;
	}
	function loadtable(data) {
		$("#example").DataTable().clear().draw();
		$.ajax({
			url : "getbilllist.action",
			method : "get",
			data : {
				group : data,
			},
			success : function(data1) {
				data1.billd.forEach(function(entry) {
					drawtable(entry);
				});
			},
		});
	}
	function loadtablebykey() {
		$("#example").DataTable().clear().draw();
		$.ajax({
			url : "getbilllistbykey.action",
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
		var str = "<a title='Edit' href='#' id='e"+data.productid+"'>"
				+ "<span class='glyphicon glyphicon-edit' style='color:green'></span>"
				+ "</a> | "
				+ "<a title='Remove' href='#' id='r"+data.productid+"'>"
				+ "<span class='glyphicon glyphicon-trash'style='color:red'></span>"
				+ "</a>";
		var str1 = "<select id='s"+data[0].billid+"' productid='"+data[0].billid+"' class='status' >"
				+ "<option value='Đã giao hàng'>Đã giao hàng</option>"
				+ "<option value='Đã thanh toán'>Đã thanh toán</option>"
				+ "<option value='Chờ xử lý'>Chờ xử lý</option>"
				+ "<option value='Hủy'>Hủy</option>"
		var bill = {
			billid : data[0].billid,
			customername : data[1].customername,
			address : data[1].address,
			phone : data[1].phone,
			status : str1,
			date : date,
			str : str
		}
		$('#example').DataTable().row.add(bill).draw(false);
		$("#s" + data[0].billid + " [value='" + data[0].status + "']").attr(
				"selected", true);
		$("#s" + data[0].billid).change(function() {
			var id = $(this).attr('id');
			var id = id.substr(1, id.length);
			var status = $(this).val();
			changestatus(id, status);
		});
		$("#r" + data.productid).click(function() {
			remove(data.productid);
		});
		$("#e" + data.productid).click(function() {
			getproduct(data.productid);
		});
	}
	function changestatus(id, status) {
		$.ajax({
			url : "changestatus.action",
			type : "get",
			data : {
				billid : id,
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
			url : "removeproduct.action",
			data : {
				productid : data
			},
			success : function(data) {
				console.log("ok");
				$("#example").DataTable().clear();
				loadtable();
			}
		});
		$.ajax({
			url : "removeproductdetail.action",
			data : {
				productid : data
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
	<a href="#" id="botbaractive">Danh sách hóa đơn</a>
	<div>
		Quản lý hàng hóa | <input type="text" class="form-control"
			id="txtsearch" placeholder="Nhập từ khóa"
			style="width: 200px; display: inline-block;" /> Từ ngày: <input
			type="date" class="form-control" id="datestart" placeholder="Từ ngày"
			style="width: 160px; display: inline-block;" /> Đến ngày:<input
			type="date" placeholder="Đến ngày" class="form-control" id="dateend"
			style="width: 160px; display: inline-block;" />
		<button onclick="loadtablebykey()" class="botbarbutton">
			<span class="glyphicon glyphicon-search"></span>
		</button>
		<div style="float: right;">
			<button class="botbarbutton" onclick="showAddProduct()">
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
					<a href='#' class="group">Đã giao hàng</a>
				</div>
				<div>
					<a href='#' class="group">Đã thanh toán</a>
				</div>
				<div>
					<a href='#' class="group">Chờ xử lý</a>
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
						<th>Mã đơn hàng</th>
						<th>Khách hàng</th>
						<th width="20%">Địa chỉ</th>
						<th>Điện thoại</th>
						<th>Tình trạng</th>
						<th>Ngày mua</th>
						<th>Chức năng</th>
					</tr>
				</thead>
			</table>
		</div>
	</div>
</div>
<!--Bootstrap Modal -->
<div id="myModal" class="modal fade" role="dialog">
	<div class="modal-dialog modal-lg">
		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">Thêm sản phẩm</h4>
			</div>
			<div class="modal-body ">
				<form action="addproduct.action" id="add"
					enctype="multipart/form-data">
					<div class="row">
						<div class="col-md-5">
							<table width="100%" class="popuptable">
								<tr>
									<td style="white-space: nowrap;">Mã hàng hóa&nbsp;</td>
									<td><input type="text" id="code" name="product.productid" /></td>
								</tr>
								<tr>
									<td style="white-space: nowrap;">Tên hàng hóa&nbsp;</td>
									<td><input type="text" id="name"
										name="product.productname" /></td>
								</tr>
								<tr>
									<td style="white-space: nowrap;">Nhà sản xuất&nbsp;</td>
									<td><input type="text" id="producer"
										name="product.producer" /></td>
								</tr>
								<tr>
									<td style="white-space: nowrap;">Nhà cung cấp&nbsp;</td>
									<td><input type="text" id="suplier" name="product.supiler" /></td>
								</tr>
								<tr>
									<td style="white-space: nowrap;">Chọn nhóm&nbsp;</td>
									<td><select id="group" name="product.groupid">

									</select></td>
								</tr>
								<tr>
									<td style="white-space: nowrap;">Đơn vị tính&nbsp;</td>
									<td><input type="text" id="unit" name="product.unit" /></td>
								</tr>
								<tr>
									<td style="white-space: nowrap;" id="img">Hình ảnh&nbsp;</td>
									<td><input type="file" name="imgfile" id="imgfile" /><input
										type="hidden" name="productdetail.image" id="filename" /> <input
										type="hidden" name="fileencode" id="fileencode" /></td>
								</tr>
								<tr>
									<td style="white-space: nowrap;">Ghi chú&nbsp;</td>
									<td><textarea id="note" name="product.note" cols="23"
											rows="4"></textarea></td>
								</tr>
							</table>
						</div>
						<div class="col-md-7">
							<table width="100%" class="popuptable">
								<tr>
									<td colspan="6"><b>Thiết lập giá</b></td>
								</tr>
								<tr>
									<td style="white-space: nowrap;">Giá nhập&nbsp;</td>
									<td><input id="pricein" type="text" name="product.pricein"
										style="width: 100%;" /></td>
									<td style="white-space: nowrap;">&nbsp; Giá bán &nbsp;</td>
									<td><input type="text" id="priceout"
										name="product.priceout" style="width: 100%" /></td>
									<td style="white-space: nowrap;">&nbsp; VAT &nbsp;</td>
									<td><input type="text" id="vat" name="product.vat"
										style="width: 60%" />%</td>
								</tr>
							</table>
							<table width="100%" class="popuptable">
								<tr>
									<td colspan="4"><b>Thông tin chi tiết</b></td>
								</tr>
								<tr>
									<td style="white-space: nowrap;">Màn hình&nbsp;</td>
									<td><input type="text" id="display"
										name="productdetail.display" style="width: 100%;" /></td>
									<td style="white-space: nowrap;">&nbsp; OS &nbsp;</td>
									<td><input type="text" id="os" name="productdetail.os"
										style="width: 100%" /></td>
								</tr>
								<tr>
									<td style="white-space: nowrap;">Camera trước&nbsp;</td>
									<td><input type="text" id="frontcam"
										name="productdetail.frontcam" style="width: 100%;" /></td>
									<td style="white-space: nowrap;">&nbsp; Camera sau &nbsp;</td>
									<td><input type="text" id="backcam"
										name="productdetail.backcam" style="width: 100%" /></td>
								</tr>
								<tr>
									<td style="white-space: nowrap;">CPU&nbsp;</td>
									<td><input type="text" id="cpu" name="productdetail.cpu"
										style="width: 100%;" /></td>
									<td style="white-space: nowrap;">&nbsp; Ram &nbsp;</td>
									<td><input type="text" id="ram" name="productdetail.ram"
										style="width: 100%" /></td>
								</tr>
								<tr>
									<td style="white-space: nowrap;">Bộ nhớ&nbsp;</td>
									<td><input type="text" id="storage"
										name="productdetail.storage" style="width: 100%;" /></td>
									<td style="white-space: nowrap;">&nbsp;Thẻ nhớ &nbsp;</td>
									<td><input type="text" id="sdcard"
										name="productdetail.sdcard" style="width: 100%" /></td>
								</tr>
								<tr>
									<td style="white-space: nowrap;">Sim&nbsp;</td>
									<td><input type="text" id="sim" name="productdetail.sim"
										style="width: 100%;" /></td>
									<td style="white-space: nowrap;">&nbsp; Pin &nbsp;</td>
									<td><input type="text" id="battery"
										name="productdetail.battery" style="width: 100%" /></td>
								</tr>
								<tr>
									<td style="white-space: nowrap;">Đặc biệt&nbsp;</td>
									<td colspan="3"><input type="text" id="special"
										name="productdetail.special" style="width: 100%;" /></td>
								</tr>
							</table>
						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" id="submitbutton" class="btn btn-default">Thêm</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>