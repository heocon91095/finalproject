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
						loadtable();
						getgrouplist();
						$("#addgroup").click(function() {
							$("#groupModal").modal('toggle');
						});
						$("#submitgroup").click(function() {
							addgroup();
							$("#groupModal").modal('toggle');
						});
					});
	function addgroup() {
		$.ajax({
			url : "addpgroup.action",
			data : $("#formaddgroup").serialize(),
			success : function(data) {
				console.log("ok");
				getgrouplist();
			}
		});
	}
	function getgrouplist() {
		$(".groupitem").html("");
		$
				.ajax({
					url : "pgrouplist.action",
					success : function(data) {
						var strall = "<div><a href='#' onclick='return loadtable();'>Tất cả</a></div>"
						$(".groupitem").append(strall);
						data.pgs
								.forEach(function(entry) {
									var str = "<div><a href='#'id='g"+entry.pgroupid+"' title='"+entry.pgroupnote+"'>"
											+ entry.pgroupname + "</a></div>";
									var str1 = "<option value='"+entry.pgroupname+"'>"
											+ entry.pgroupname + "</option>"
									$(".groupitem").append(str);
									$("#group").append(str1);
									$("#g" + entry.pgroupid).click(function() {
										loadtable(entry.pgroupname);
									});
								});
					}
				});
	}
	function loadtable(data) {
		$.ajax({
			url : "/Struts22/productlist",
			method : "get",
			data : {
				group : data,
			},
			async : "false",
			success : function(data) {
				$("#example").DataTable().clear();
				data1 = JSON.stringify(data.products);
				console.log(data1);
				data.products.forEach(function(entry) {
					drawtable(entry);
				});
			},
		});
	}
	function loadtablebykey() {
		$.ajax({
			url : "/Struts22/productlist",
			method : "post",
			data : {
				key : $("#txtsearch").val(),
			},
			async : "false",
			success : function(data) {
				$("#example").DataTable().clear();
				data1 = JSON.stringify(data.products);
				console.log(data1);
				data.products.forEach(function(entry) {
					drawtable(entry);
				});
			},
		});
	}
	function drawtable(data) {
		console.log(data);
		var str = "<a title='Edit' href='#' id='e"+data.productid+"'>"
				+ "<span class='glyphicon glyphicon-edit' style='color:green'></span>"
				+ "</a> | "
				+ "<a title='Remove' href='#' id='r"+data.productid+"'>"
				+ "<span class='glyphicon glyphicon-trash'style='color:red'></span>"
				+ "</a>";
		data.str = str;
		$('#example').DataTable().row.add(data).draw(false);
		$("#r" + data.productid).click(function() {
			remove(data.productid);
		});
		$("#e" + data.productid).click(function() {
			getproduct(data.productid);
		});
	}
	function getBase64(file, onload) {
		var str;
		var reader = new FileReader();
		reader.onload = onload;
		reader.onerror = function(error) {
			console.log('Error: ', error);
		};
		reader.readAsDataURL(file);
	}
	function add() {
		getfile().done(function() {
			$.when(addproduct()).then(function(data, textStatus, jqXHR) {
				$("#productid").val(data.product.productid);
				$.ajax({
					url : "addproductdetail.action",
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
			});
		});
	}
	function addproduct() {
		return $.ajax({
			url : "addproduct.action",
			type : "post",
			async : false,
			data : $("#add").serialize(),
			success : function(data) {
				console.log("ok");
			}
		});
	}
	function getfile() {
		var defer = new $.Deferred();
		$("#filename").val(getfilename());
		$("#filename1").val(getfilename());
		console.log($("#filename1").val());
		var file = document.getElementById('imgfile').files[0];
		//return image base 64 here
		getBase64(file, function(e) {
			x = e.target.result;
			var i = x.indexOf(",", 0);
			var y = x.substring(i + 1, x.length);
			$("#fileencode").val(y);
			console.log($("#fileencode").val());
			defer.resolve();
			
		});
		return defer.promise();
	}
	function getfilename() {
		return $("#imgfile").val().replace(/.*(\/|\\)/, '');
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
	function getproduct(data) {
		$("#add")[0].reset();
		console.log(data);
		$.ajax({
			url : "getproduct.action",
			data : {
				productid : data
			},
			success : function(data1) {
				console.log(data1);
				var product = data1.product;
				$(".modal-title").text("Cập nhật");
				$("#code").val(product.productid);
				$("#code").attr('disabled', 'disabled');
				$("#name").val(product.productname);
				$("#group").val(product.group);
				$("#suplier").val(product.supiler);
				$("#unit").val(product.unit);
				$("#producer").val(product.producer);
				$("#pricein").val(product.pricein);
				$("#priceout").val(product.priceout);
				$("#note").val(product.note);
				$("#vat").val(product.vat);
				$('#myModal').modal("toggle");
				$.ajax({
					url : "getproductdetail.action",
					async : false,
					data : {
						productid : data
					},
					success : function(data2) {
						console.log(data2);
						var detail = data2.pd;
						$("#display").val(detail.display);
						$("#os").val(detail.os);
						$("#backcam").val(detail.backcam);
						$("#frontcam").val(detail.frontcam);
						$("#cpu").val(detail.cpu);
						$("#ram").val(detail.ram);
						$("#storage").val(detail.storage);
						$("#sdcard").val(detail.sdcard);
						$("#sim").val(detail.sim);
						$("#battery").val(detail.battery);
						$("#special").val(detail.special);
					}
				});
				$("#submitbutton").text("Cập nhật");
				$("#submitbutton").unbind();
				$("#submitbutton").click(function() {
					updateProduct($("#code").val());
				});
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
	function showAddProduct() {
		$("#add")[0].reset();
		$(".modal-title").text("Them san pham");
		$("#code").removeAttr('disabled');
		$('#myModal').modal("toggle");
		$("#submitbutton").val("Them");
		$("#submitbutton").unbind();
		$("#submitbutton").click(function() {
			add();
		});
	}
	function showProductDetail(id) {
		console.log(id);
		var str = "";
		$
				.ajax({
					url : "getproductdetail.action",
					data : {
						productid : id
					},
					async : false,
					success : function(data) {
						console.log(data);
						var pd = data.pd;
						str = "<div style='float:left;margin-left:100px;border:3px;border-style:dashed;margin-right:50px;width: 300px;height:250px;'>"
								+ "<img style='width:100%;height:100%'  alt'piture here' src='/Struts22/img/product/"
								+ pd.image
								+ "' /> "
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
								+ pd.special + "</td>" + "</table>";
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
	<a href="#" id="botbaractive">Hàng hóa</a> <a href="warehouse.action">Nhập kho</a>
	<div class="botbarfunction">
		Quản lý hàng hóa <input type="text" class="form-control"
			id="txtsearch" style="width: 200px; display: inline-block;" />
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
			Thể loại <a href="#" style="float: right" id="addgroup">+</a>
			<div class="groupitem"></div>
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
				<form action="addproduct.action" id="add"
					enctype="multipart/form-data">
					<div class="row">
						<div class="col-md-5">
							<input type="hidden" id="code" name="product.productid" />
							<table width="100%" class="popuptable">
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
										type="hidden" name="product.prductimg" id="filename" /><input
										type="hidden" name="productdetail.image" id="filename1" /> <input
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
									<td colspan="4"><b>Thông tin chi tiết</b> <input
										type="hidden" name="productdetail.productid" id="productid" /></td>
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
<!-- Group Modal -->
<div id="groupModal" class="modal fade" role="dialog">
	<div class="modal-dialog ">
		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">Thêm nhóm sản phẩm</h4>
			</div>
			<div class="modal-body ">
				<form action="addcustomergroup.action" id="formaddgroup">
					<table width="100%" class="popuptable" align="center">
						<tr>
							<td style="white-space: nowrap;" width="30%">Tên nhóm</td>
							<td><input type="text" name="productgroup.pgroupname" /></td>
						</tr>
						<tr>
							<td style="white-space: nowrap;">Thông tin nhóm</td>
							<td><textarea cols="40" name="productgroup.pgroupnote"></textarea></td>
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