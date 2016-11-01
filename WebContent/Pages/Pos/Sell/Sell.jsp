<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<script type="text/javascript">
	var plist = [];
	$(document).ready(function() {
		$(".active").removeClass("active");
		$("#navp").addClass("active");
		$('#example').dataTable({
			"bPaginate" : false,
			"bInfo" : false,
			"searching" : false,
			"columns" : [ {
				className : "dt-center pid"
			}, {
				className : "dt-center pname"
			}, {
				className : "dt-center"
			}, {
				className : "dt-center pprice"
			}, {
				className : "dt-center ptotal"
			} ]
		});
		loadtable();
		loadtablebykey()
		getgrouplist();
		countptotal();
		getpaytotal();
		getexcess();
		autocompletecustomer();
	});
	function countptotal() {
		$(".pnumber").change(function() {
			var thisobject = $(this);
			var price = thisobject.closest("tr").find(".pprice").text();
			var total = thisobject.val() * price;
			thisobject.closest("tr").find(".ptotal").text(total).change();
		});
	}
	function getgrouplist() {
		$(".groupitem").html("");
		$
				.ajax({
					url : "pgrouplist.action",
					success : function(data) {
						var strall = "<option value='all'>Tất cả</ option>"
						$("#groupitem").append(strall);
						data.pgs.forEach(function(entry) {
							var str = "<option value='"+entry.pgroupname+"'>"
									+ entry.pgroupname + "</ option>";
							$("#groupitem").append(str);
						});
						getgroup();
					}
				});
	}
	function getgroup()
	{
		$("#groupitem").change(function(){
			var gid = $(this).val();
			console.log(gid);
			loadtable(gid);
		})
	}
	function loadtable(data) {
		$.ajax({
			url : "/Struts22/productjson",
			method : "get",
			data : {
				group : data,
			},
			async : "false",
			success : function(data) {
				$(".product-container").empty();
				data1 = JSON.stringify(data.products);
				console.log(data1);
				data.products.forEach(function(entry) {
					drawproductgrid(entry);
				});
				$(".product-block").click(function() {
					var obj = $(this);
					var id = obj.attr('id');
					console.log(id);
					var name = $("#" + id + " .name").val();
					var price = $("#" + id + " .price").val();
					addtocart(id, name, price);
				});
			},
		});
	}
	function loadtablebykey() {
		$("#txtsearch").change(function(){
			$.ajax({
				url : "/Struts22/productjson",
				method : "post",
				data : {
					key : $("#txtsearch").val(),
				},
				async : "false",
				success : function(data) {
					$(".product-container").empty();
					data1 = JSON.stringify(data.products);
					console.log(data1);
					data.products.forEach(function(entry) {
						drawproductgrid(entry);
					});
				},
			});
		});	
	}
	function drawproductgrid(data) {
		console.log(data);
		var str = "<div class='product-block' id ='"+data.productid+"' >"
				+ "<div class='product-img'>"
				+ "<img src='/Struts22/img/product/galaxynote7.jpg' />"
				+ "</div>"
				+ "<input type='hidden' class='price' value="+data.priceout+" />"
				+ "<input type='hidden' class='name' value="+data.productname+" />"
				+ "<div class='product-price'>" + data.priceout + "</div>"
				+ "<div class='product-detail'>" + data.productname
				+ " <br />Tồn kho : 1" + "</div>" + "</div>";
		$(".product-container").append(str);
	}

	function add() {
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
		$.ajax({
			url : "addproduct.action",
			type : "post",
			async : false,
			data : $("#add").serialize(),
			success : function(data) {
				console.log("ok");
			}
		});
		$("#code").attr('name', 'productdetail.productid');
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
	function addtocart(id, name, price) {
		if ($.inArray(id, plist) > -1) {
			$("#n" + id).val(parseInt($("#n" + id).val()) + 1).change();
		} else {
			plist.push(id);
			$(".pnumber").unbind();
			$(".ptotal").unbind();
			console.log(id);
			var strsl = "<input class='pnumber' style='text-align:right' type='number' id ='n"+id+"' value=1 />"
			$('#example').DataTable().row
					.add([ id, name, strsl, price, price ]).draw(false);
			countptotal();
			counttotal();
			$(".pnumber").trigger("change");
		}
	}
	function counttotal() {
		$(".ptotal").change(function() {
			var tempint = 0;
			var total = $(".ptotal").map(function() {
				return tempint + parseInt(this.innerHTML);
			}).get();
			for (var i = 1, n = total.length; i < n; i++) {
				tempint += total[i];
			}
			console.log(tempint);
			$(".total").text(tempint).change();
		});
	}
	function getalldata() {
		var table = $("#example").dataTable();
		var data = table.fnGetData();
		console.log(data);
	}
	function getpaytotal() {
		$(".total").change(
				function() {
					console.log($(this).text());
					var paytotal = parseInt($(this).text())
							+ ($("#tax").val() * $(this).text()) / 100;
					$("#paytotal").text(paytotal);
				});
		$("#tax").change(
				function() {
					var paytotal = parseInt($(".total").text())
							+ ($("#tax").val() * $(".total").text()) / 100;
					$("#paytotal").text(paytotal);
				});
	}
	function getexcess(){
		$("#pay").change(function(){
			var excess = parseInt($("#pay").val()) - parseInt($("#paytotal").text());
			$("#excess").val(excess);
		});
	}
	function autocompletecustomer(){
		var options = {
				  url: "customerlistjson.action",
				  getValue: "customers.customername",
				  list: {	
				    match: {
				      enabled: true
				    }
				  },
				  theme: "square"
				};
		$("#txtsearchcustomer").easyAutocomplete(options);
	}
</script>
<style>
.details-control {
	cursor: pointer;
}

.product-block {
	width: 115px;
	height: 160px;
	border: solid 1px;
	float: left;
	margin: 5px;
	cursor: url("/Struts22/img/cart-cursor.png"), auto;
}

.product-img {
	width: 100%;
	height: 95px;
}

.product-img img {
	width: 100%;
	height: 100%;
}

.product-price {
	font-weight: bold;
	color: white;
	background-color: black;
	text-align: right;
}
</style>
<div class="botbar">
	<a href="#" id="botbaractive">Hàng hóa</a> <a href="#">Nhập kho</a> <a
		href="#">Chuyển hàng</a> <a href="#">Kiểm hàng</a>
	<div class="botbarfunction">
		Thêm hóa đơn <input type="text" class="form-control" id="txtsearch"
			style="width: 200px; display: inline-block;" placeholder="Tìm kiếm hàng hóa" />
		</button>
		<div style="display:inline-block">
		<input type="text" class="form-control" id="txtsearchcustomer" placeholder="Tìm kiếm khách hàng"
			style="width: 200px; display: inline-block; margin-left: 20px" />
			</div>
		<button onclick="loadtablebykey()" class="botbarbutton">
			<span class="glyphicon glyphicon-plus"></span><span class="glyphicon glyphicon-user"></span>
		</button>
		<div style="float: right;">
			<button class="botbarbutton">
				<span class="glyphicon glyphicon-export"></span> Xuất Excel
			</button>
		</div>
	</div>
</div>

<div class="row" style="margin-bottom: 50px">
	<div class="col-md-5"
		style="margin-top: 10px; padding-left: 20px; margin-bottom: 50px">
		<div class="product-tool">
			<select id="groupitem">
			</select> Phân trang:
			<div class="pagecontainer" style="display: inline-block;">
				<div class="page-block"
					style="padding: 5px; border: solid 1px; background-color: #F1F1F1">1</div>
			</div>
		</div>
		<div class="product-container"
			style="margin-top: 10px; display: inline-block;"></div>
	</div>
	<div class="col-md-7 ">
		<p style="margin-top: 5px; margin-left: 15px">
			Người mua : <span style="color: blue">Khách vãng lai</span>
		</p>
		<div class="tablecontainer" style="min-height: 250px;">
			<table id="example" class="display" cellspacing="0" width="100%">
				<thead>
					<tr>
						<th>Mã hàng hóa</th>
						<th>Tên hàng hóa</th>
						<th>Số lượng</th>
						<th>Đơn giá</th>
						<th>Thành tiền</th>
					</tr>
				</thead>
			</table>
			<br />
			<table width="100%">
				<tr style="font-weight: bold; font-size: large;">
					<td align="right" width="70%">Tong cong:&nbsp;</td>
					<td class="total">0</td>
				</tr>
			</table>
		</div>
		<div class="purchase-detail row">
			<div class="col-md-6">
				<div class="purchase-box"
					style="margin: 5px; border: solid 1px; padding: 15px">
					<p>Thanh toán</p>
					<hr />
					<table width="100%">
						<tr align="right">
							<td>Tổng cộng</td>
							<td id="paytotal" style="color: red; font-size: large;">0</td>
						</tr>
						<tr align="right">
							<td>Thuế</td>
							<td><input type="text" id="tax" style="text-align: right;"
								value=0 /></td>
						</tr>
						<tr align="right">
							<td>Thanh toán</td>
							<td><input type="text" id="pay" style="text-align: right;" /></td>
						</tr>
						<tr align="right">
							<td>Tiền thừa</td>
							<td><input type="text" id="excess"
								style="text-align: right;" /></td>
						</tr>
					</table>
				</div>
				<div>
					<input type="button" onclick="getalldata()" style="width: 100px"
						value="Luu" />
				</div>
			</div>
			<div class="col-md-6">
				<div class="note-box"
					style="background-color: #d1e2ff; padding: 15px; margin: 5px; border: solid 1px; height: 100px">
					<p>
						<span class=" glyphicon glyphicon-pencil"></span>&nbsp;Ghi chu
					</p>
					<input type="text" placeholder="Ghi chu"
						style="background-color: #d1e2ff; border: none" />
				</div>
			</div>
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