<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<script type="text/javascript">
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
														"data" : "productid"
													}, {
														"data" : "productname"
													}, {
														"data" : "pricein"
													}, {
														"data" : "priceout"
													}, {
														"data" : "unit"
													}, {
														"data" : "groupid"
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
																showProductDetail(row
																		.data().productid))
														.show();
												tr.addClass('shown');
											}
										});
						$.ajax({
							url : "/Struts22/productjson",
							method : "get",
							async : "false",
							success : function(data) {
								data1 = JSON.stringify(data.products);
								console.log(data1);
								data.products.forEach(function(entry) {
									drawtable(entry);
								});
							},
						});
					});
	function drawtable(data) {
		console.log(data);
		var str = "<a title='Edit' href='#'>"
				+ "<span class='glyphicon glyphicon-edit' style='color:green'></span>"
				+ "</a> | "
				+ "<a title='Remove' href='#'>"
				+ "<span class='glyphicon glyphicon-trash'style='color:red'></span>"
				+ "</a>";
		data.str = str;
		$('#example').DataTable().row.add(data).draw(false);
	}
	function sm() {
		$.ajax({
			url : "addproduct.action",
			data : $("#add").serialize(),
			success : function(data) {
				console.log("ok");
			}
		});
		$("#code").attr('name', 'productdetail.productid');
		$.ajax({
			url : "addproductdetail.action",
			data : $("#add").serialize(),
			success : function(data) {
				console.log("ok");
				$("#code").attr('name', 'product.productid');
			}
		});
	}
	function showProductDetail(id) {
		console.log(id);
		var str = "";
		$
				.ajax({
					url : "productdetailjson.action",
					data : {
						productid : id
					},
					async : false,
					success : function(data) {
						console.log(data);
						var pd = data.pd;
						str = "<div style='float:left;margin-left:100px;border:3px;border-style:dashed;margin-right:50px;width: 230px;height:250px;'>"
								+ "<img style='width:100%;height:100%'  alt'piture here' src='/Struts22/img/product/"+pd.image+"' /> "
								+ "</div>"
								+ "<table><tr><th colspan='4' style='text-align:center'>Thông tin chi tiết</th></tr>"
								+ "<tr><td>Màn hình:</td><td>"
								+ pd.display
								+ "</td>"
								+ "<td>OS:</td><td>"
								+ pd.os
								+ "</td></tr>"
								+ "<tr><td>Camera trước:</td><td>"
								+ pd.frontcam
								+ "</td>"
								+ "<td>Camera sau:</td><td>"
								+ pd.backcam
								+ "</td></tr>"
								+ "<tr><td>CPU:</td><td>"
								+ pd.cpu
								+ "</td>"
								+ "<td>Ram:</td><td>"
								+ pd.ram
								+ "</td></tr>"
								+ "<tr><td>Bộ nhớ:</td><td>"
								+ pd.storage
								+ "</td>"
								+ "<td>Thẻ nhớ:</td><td>"
								+ pd.sdcard
								+ "</td></tr>"
								+ "<tr><td>Sim:</td><td>"
								+ pd.sim
								+ "</td>"
								+ "<td>Pin:</td><td>"
								+ pd.battery
								+ "</td></tr>"
								+ "<tr><td>Đặc biệt:</td><td colspan='3'>"
								+ pd.sim + "</td>" + "</table>";
					}
				});
		return str;
	}
</script>
<style>
.details-control {
	cursor: pointer;
}
</style>
<div class="botbar">
	<a href="#" id="botbaractive">Hàng hóa</a> <a href="#">Nhập kho</a> <a
		href="#">Chuyển hàng</a> <a href="#">Kiểm hàng</a>
	<div class="botbarfunction">
		Quản lý hàng hóa <input type="text" class="form-control"
			style="width: 200px; display: inline-block;" />
		<button class="botbarbutton">
			<span class="glyphicon glyphicon-search"></span>
		</button>
		<div style="float: right;">
			<button class="botbarbutton" data-toggle="modal"
				data-target="#myModal">
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
					<a href="#">Tất cả</a>
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
						<th>Mã hàng hóa</th>
						<th>Tên hàng hóa</th>
						<th>Giá nhập</th>
						<th>Giá bán</th>
						<th>Đơn vị tính</th>
						<th>Nhóm</th>
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
				<form action="addproduct.action" id="add" enctype="multipart/form-data">
					<div class="row">
						<div class="col-md-5">
							<table width="100%" class="popuptable">
								<tr>
									<td style="white-space: nowrap;">Mã hàng hóa&nbsp;</td>
									<td><input type="text" id="code" name="product.productid" /></td>
								</tr>
								<tr>
									<td style="white-space: nowrap;">Tên hàng hóa&nbsp;</td>
									<td><input type="text" name="product.productname" /></td>
								</tr>
								<tr>
									<td style="white-space: nowrap;">Nhà sản xuất&nbsp;</td>
									<td><input type="text" name="product.producer" /></td>
								</tr>
								<tr>
									<td style="white-space: nowrap;">Nhà cung cấp&nbsp;</td>
									<td><input type="text" name="product.supiler" /></td>
								</tr>
								<tr>
									<td style="white-space: nowrap;">Chọn nhóm&nbsp;</td>
									<td><select name="product.groupid">
											<option value="all">Nhóm 1</option>
											<option value="all">Nhóm 2</option>
									</select></td>
								</tr>
								<tr>
									<td style="white-space: nowrap;">Đơn vị tính&nbsp;</td>
									<td><input type="text" name="product.unit" /></td>
								</tr>
								<tr>
									<td style="white-space: nowrap;">Hình ảnh&nbsp;</td>
									<td><input type="file" name="productdetail.image" /></td>
								</tr>
								<tr>
									<td style="white-space: nowrap;">Ghi chú&nbsp;</td>
									<td><textarea name="product.note" cols="23" rows="4"></textarea></td>
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
									<td><input type="text" name="product.pricein"
										style="width: 100%;" /></td>
									<td style="white-space: nowrap;">&nbsp; Giá bán &nbsp;</td>
									<td><input type="text" name="product.priceout"
										style="width: 100%" /></td>
									<td style="white-space: nowrap;">&nbsp; VAT &nbsp;</td>
									<td><input type="text" name="product.vat"
										style="width: 60%" />%</td>
								</tr>
							</table>
							<table width="100%" class="popuptable">
								<tr>
									<td colspan="4"><b>Thông tin chi tiết</b></td>
								</tr>
								<tr>
									<td style="white-space: nowrap;">Màn hình&nbsp;</td>
									<td><input type="text" name="productdetail.display"
										style="width: 100%;" /></td>
									<td style="white-space: nowrap;">&nbsp; OS &nbsp;</td>
									<td><input type="text" name="productdetail.os"
										style="width: 100%" /></td>
								</tr>
								<tr>
									<td style="white-space: nowrap;">Camera trước&nbsp;</td>
									<td><input type="text" name="productdetail.frontcam"
										style="width: 100%;" /></td>
									<td style="white-space: nowrap;">&nbsp; Camera sau &nbsp;</td>
									<td><input type="text" name="productdetail.backcam"
										style="width: 100%" /></td>
								</tr>
								<tr>
									<td style="white-space: nowrap;">CPU&nbsp;</td>
									<td><input type="text" name="productdetail.cpu"
										style="width: 100%;" /></td>
									<td style="white-space: nowrap;">&nbsp; Ram &nbsp;</td>
									<td><input type="text" name="productdetail.ram"
										style="width: 100%" /></td>
								</tr>
								<tr>
									<td style="white-space: nowrap;">Bộ nhớ&nbsp;</td>
									<td><input type="text" name="productdetail.storage"
										style="width: 100%;" /></td>
									<td style="white-space: nowrap;">&nbsp;Thẻ nhớ &nbsp;</td>
									<td><input type="text" name="productdetail.sdcard"
										style="width: 100%" /></td>
								</tr>
								<tr>
									<td style="white-space: nowrap;">Sim&nbsp;</td>
									<td><input type="text" name="productdetail.sim"
										style="width: 100%;" /></td>
									<td style="white-space: nowrap;">&nbsp; Pin &nbsp;</td>
									<td><input type="text" name="productdetail.battery"
										style="width: 100%" /></td>
								</tr>
								<tr>
									<td style="white-space: nowrap;">Đặc biệt&nbsp;</td>
									<td colspan="3"><input type="text" name="productdetail.special"
										style="width: 100%;" /></td>
								</tr>
							</table>
						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" onclick="sm()" class="btn btn-default">Thêm</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>