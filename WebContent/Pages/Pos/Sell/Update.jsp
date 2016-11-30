<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<script type="text/javascript">
	var plist = [];
	var valueid;
	$(document).ready(function() {
		$(".active").removeClass("active");
		$("#navs").addClass("active");
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
		loadtablebykey();
		getgrouplist();
		countptotal();
		getpaytotal();
		getexcess();
		getcustomerlist();
		getcustomergrouplist();
		getcustomername();
		getbilldetail();
		$("#createcustomer").click(function() {
			$("#add input,#add textarea,#add #cmgroup").val(" ");
			$('#cmid').removeAttr('disabled');
			$("#submitbutton").text("Thêm");
			$("#submitbutton").click(function() {
				addcustomer();
			});
			getcustomerlist();
			$("#myModal").modal('toggle');
		});
	});
	function addcustomer() {
		$.ajax({
			url : "addcustomer.action",
			data : $("#add").serialize(),
			success : function(data) {
				console.log("ok");

				loadtable();
				//jQuery.noConflict();
				$("#myModal").modal('toggle');
				$("#alertsuccessaddcustomer").show();
			}
		});
	}
	function addbill() {
		var today = new Date();
		var dayformat = today.getFullYear() + "-" + (today.getMonth() + 1)
				+ "-" + (today.getDay() - 1);
		var bill = {
			customerid : $("#txtcustomer").val(),
			total : $("#paytotal").text(),
			tax : $("#tax").val(),
			pay : $("#pay").val(),
			excess : $("#excess").val(),
			note : $("#note").val(),
			status : $("#status").val(),
			billid : ${bill.billid}
		};
		console.log(bill);
		$.ajax({
			url : "updatebill.action",
			data : bill,
			type : "post",
			success : function(data) {
				console.log(data);
				var bid = data.bill.billid;
				valueid = bid;
				tabledata = getalldata();
				console.log(tabledata);
				$("#alertsuccess").show();
				tabledata.forEach(function(entry) {
					var billdetail = {
						billid : bid,
						productid : entry[0],
						productname : entry[1],
						number : $("#n" + entry[0]).val(),
						unitprice : entry[3],
						totalprice : parseInt(entry[3])
								* $("#n" + entry[0]).val()
					};
					console.log(billdetail);
					$.ajax({
						url : "updatebilldetail",
						data : billdetail,
						success : function(data1) {
							console.log("ok");
						}
					});
				});
			}
		});
	}
	function getcustomergrouplist() {
		$(".groupitem").html("");
		$.ajax({
			url : "cgrouplist.action",
			success : function(data) {
				data.customergroups.forEach(function(entry) {
					var str1 = "<option value='"+entry.cgroupname+"'>"
							+ entry.cgroupname + "</option>"
					$("#cmgroup").append(str1);
				});
			}
		});
	}
	function getcustomerlist() {
		return $
				.ajax({
					url : "getcustomerlist.action",
					method : "post",
					async : false,
					success : function(data) {
						var option;
						data.customers
								.forEach(function(entry) {
									option += "<option value='"+entry.customerid+"' data-value ='"+entry.customername+"'>"
											+ entry.customername + "</ option>";
								});
						$("#listcustomer").html(option);
						$("#txtcustomer").change(
								function() {
									console.log($(this));
									var name = $(
											"#listcustomer [value='"
													+ $(this).val() + "']")
											.text();
									$("#paycustomer").text(name);
								});
					},
				});
	}
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
		$.ajax({
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
	function getgroup() {
		$("#groupitem").change(function() {
			var gid = $(this).val();
			console.log(gid);
			loadtable(gid);
		})
	}
	function loadtable(data) {
		$.ajax({
			url : "productlist.action",
			method : "get",
			data : {
				group : data,
			},
			async : "false",
			success : function(data) {
				$(".product-container").empty();
				data1 = JSON.stringify(data.products);
				console.log(data1);
				var count = 0;
				data.products.forEach(function(entry) {
					++count;
					if ((count - 1) % 12 == 0) {
						var str = "<li><a href='#'>" + (((count - 1) / 12) + 1)
								+ "</a></li> "
						$(".pagination").append(str);
					}
					if (count <= 12) {
						drawproductgrid(entry, true, count);
					} else {
						drawproductgrid(entry, false, count);
					}

				});
				$(".product-block").click(function() {
					var obj = $(this);
					var id = obj.attr('id');
					console.log(id);
					var name = $("#" + id + " .name").val();
					var price = $("#" + id + " .price").val();
					addtocart(id, name,1, price);
				});
				$(".pagination li").click(
						function() {
							var obj = $(this);
							var number = obj.text();
							console.log(number);
							$(".product-block").each(
									function(i, obj) {
										console.log(obj);
										//$(this).removeAttr("hidden");
										$(this).hide();
										var count = $(this).attr("count");
										if (count > ((number - 1) * 12)
												&& count <= (number * 12)) {
											$(this).show();
										}
									});
						});
			},
		});
	}
	function loadtablebykey() {
		$("#txtsearch").change(function() {
			$.ajax({
				url : "productlist.action",
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
	function drawproductgrid(data, option, count) {
		if (option) {
			var str = "<div class='product-block' count='"+count+"' id ='"+data.productid+"' >"
					+ "<div class='product-img'>"
					+ "<img src='/Struts22/img/product/"+data.prductimg+"' />"
					+ "</div>"
					+ "<input type='hidden' class='price' value="+data.priceout+" />"
					+ "<input type='hidden' class='name' value="+data.productname+" />"
					+ "<div class='product-price'>"
					+ data.priceout
					+ "</div>"
					+ "<div class='product-detail'>"
					+ data.productname
					+ " <br />Tồn kho : 1" + "</div>" + "</div>";
		} else {
			var str = "<div class='product-block' count='"+count+"' hidden id ='"+data.productid+"' >"
					+ "<div class='product-img'>"
					+ "<img src='/Struts22/img/product/"+data.prductimg+"' />"
					+ "</div>"
					+ "<input type='hidden' class='price' value="+data.priceout+" />"
					+ "<input type='hidden' class='name' value="+data.productname+" />"
					+ "<div class='product-price'>"
					+ data.priceout
					+ "</div>"
					+ "<div class='product-detail'>"
					+ data.productname
					+ " <br />Tồn kho : 1" + "</div>" + "</div>";
		}
		$(".product-container").append(str);
	}
	function addtocart(id, name,number, price) {
		if ($.inArray(id, plist) > -1) {
			$("#n" + id).val(parseInt($("#n" + id).val()) + 1).change();
		} else {
			plist.push(id);
			$(".pnumber").unbind();
			$(".ptotal").unbind();
			console.log(id);
			var strsl = "<input class='pnumber' style='text-align:right' type='number' id ='n"+id+"' value="+number+" />"
			$('#example').DataTable().row
					.add([ id, name, strsl, price, price ]).draw(false);
			countptotal();
			counttotal();
			$(".pnumber").trigger("change");
		}
	}
	//get data to update
	function getbilldetail() {
		$.ajax({
			url : "getbilldetail.action",
			data : {
				billid : "${bill.billid}"
			},
			type : "get",
			success : function(data) {
				data.billdetail.forEach(function(entry) {
					addtocart(entry.id.productid , entry.productname, entry.number,
							entry.unitprice)
				});
			}
		});
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
		return data;
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
	function getexcess() {
		$("#pay").change(
				function() {
					var excess = parseInt($("#pay").val())
							- parseInt($("#paytotal").text());
					$("#excess").val(excess);
				});
	}

	function getcustomername() {
		$.ajax({
			url : "getcustomer.action",
			data : {
				customerid : "${bill.customerid}"
			},
			type : "get",
			success : function(data) {
				$("#paycustomer").text(data.customer.customername);
			}
		});
	}
	function addbillandprint()
	{
		addbill();
		setTimeout(function(){ window.location.href = "printbill.action?billid="+valueid;}, 1000);
	}
</script>
<style>
.details-control {
	cursor: pointer;
}

.product-block {
	width: 160px;
	height: 170px;
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
	<a href="billlist.action" id="botbaractive">Hóa đơn</a>
	<div class="botbarfunction">
		Sửa hóa đơn| <input type="text" class="form-control" id="txtsearch"
			style="width: 200px; display: inline-block;"
			placeholder="Tìm kiếm hàng hóa" />
		</button>
		<div style="display: inline-block">
			<input id="txtcustomer" list="listcustomer" class="form-control"
				placeholder="Tìm kiếm khách hàng"
				style="width: 200px; display: inline-block; margin-left: 20px" />
			<datalist id="listcustomer">
			</datalist>
		</div>
		<button id="createcustomer" class="botbarbutton">
			<span class="glyphicon glyphicon-plus"></span><span
				class="glyphicon glyphicon-user"></span>
		</button>
		<div style="float: right;">
			<button class="botbarbutton">
				<span class="glyphicon glyphicon-export"></span> Xuất Excel
			</button>
		</div>
	</div>
</div>

<div class="row">
	<div class="col-md-5"
		style="margin-top: 10px; padding-left: 20px; margin-bottom: 50px">
		<div class="product-tool"
			style="display: inline-block; display: flex; align-items: center;">
			Nhóm:<select id="groupitem" class="form-control"
				style="display: inline-block; vertical-align: middle; width: 100px">
			</select>&nbsp; Trang:
			<ul class="pagination">
			</ul>
		</div>
		<div class="product-container"
			style="margin-top: 10px; display: inline-block;"></div>
	</div>
	<div class="col-md-7 ">
		<p style="margin-top: 5px; margin-left: 15px">
			Mã hóa đơn : <span style="color: blue" id="billid">${bill.billid}</span>
			Người mua : <span id="paycustomer" style="color: blue"></span> Tình
			trạng <select id="status">
				<option value="Đã giao hàng">Đã giao hàng</option>
				<option value="Đã thanh toán">Đã thanh toán</option>
				<option value="Đã xác nhận">Đã xác nhận</option>
				<option value="Chờ xử lý">Chờ xử lý</option>
				<option value="Hủy">Hủy</option>
			</select>
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
					<table width="100%"
						style="border-collapse: separate; border-spacing: 10px;">
						<tr align="right">
							<td>Tổng cộng</td>
							<td id="paytotal" style="color: red; font-size: large;">${bill.total}</td>
						</tr>
						<tr align="right">
							<td>Thuế</td>
							<td><input type="number" class="form-control" id="tax"
								style="text-align: right;" value=${bill.tax } /></td>
						</tr>
						<tr align="right">
							<td>Thanh toán</td>
							<td><input type="number" class="form-control" id="pay"
								value=${bill.pay } style="text-align: right;" /></td>
						</tr>
						<tr align="right">
							<td>Tiền thừa</td>
							<td><input type="number" class="form-control" id="excess"
								value=${bill.excess } style="text-align: right;" /></td>
						</tr>
					</table>
				</div>
				<div>
					<input type="button" onclick="addbill()" style="width: 100px"
						value="Lưu" class="botbarbutton" /> 
					<input type="button" onclick="addbillandprint()" style="width: 100px"
						value="Lưu và in" class="botbarbutton" /> 
				</div>
			</div>
			<div class="col-md-6">
				<div class="note-box"
					style="background-color: #d1e2ff; padding: 15px; margin: 5px; border: solid 1px; height: 100px">
					<p>
						<span class=" glyphicon glyphicon-pencil"></span>&nbsp;Ghi chú
					</p>
					<textarea id="note" placeholder="Ghi chú"
						style="background-color: #d1e2ff; border: none; height: 75%; width: 100%">${bill.note}</textarea>

				</div>
			</div>
		</div>
	</div>
</div>
<div hidden id="alertsuccess" class="alert alert-success"
	style="position: fixed; bottom: 0; z-index: 10; left: 50%; transform: translateX(-50%);">
	<a href="#" class="close" onclick="$('#alertsuccess').hide()"
		aria-label="close" style="padding-left: 10px">&times;</a> <strong>Bán
		hàng thành công!</strong> Hóa đơn đã được lập
</div>
<div hidden id="alertsuccessaddcustomer" class="alert alert-success"
	style="position: fixed; bottom: 0; z-index: 10; left: 50%; transform: translateX(-50%);">
	<a href="#" class="close"
		onclick="$('#alertsuccessaddcustomer').hide()" aria-label="close"
		style="padding-left: 10px">&times;</a> <strong>Thêm khách
		hàng thành công!</strong>
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