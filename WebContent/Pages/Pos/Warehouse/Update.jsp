<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<script type="text/javascript">
	var plist = [];
	var valueid;
	$(document).ready(function() {
		$(".active").removeClass("active");
		$("#navwh").addClass("active");
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
		getsuplierlist();
		getsupliergrouplist();
		getsupliername();
		getwhdetail();
		$("#createsuplier").click(function() {
			$("#add input,#add textarea,#add #cmgroup").val(" ");
			$('#cmid').removeAttr('disabled');
			$("#submitbutton").text("Thêm");
			$("#submitbutton").click(function() {
				addsuplier();
			});
			getsuplierlist();
			$("#myModal").modal('toggle');
		});
	});
	function addsuplier() {
		$.ajax({
			url : "addsuplier.action",
			data : $("#add").serialize(),
			success : function(data) {
				console.log("ok");

				loadtable();
				//jQuery.noConflict();
				$("#myModal").modal('toggle');
				$('#alertsuccessaddsuplier').show();
				getsuplierlist();
			}
		});
	}
	function addwarehouse() {
		var warehouse = {
			supilerid : $("#txtsuplier").val(),
			total : $("#paytotal").text(),
			tax : $("#tax").val(),
			pay : $("#pay").val(),
			excess : $("#excess").val(),
			note : $("#note").val(),
			status : $("#status").val(),
			wid : ${wh.wid}
		}
		$.ajax({
			url : "updatewh.action",
			data : warehouse,
			type : "post",
			success : function(data) {
				console.log(data);
				var wid = data.wh.wid;
				valueid= wid;
				tabledata = getalldata();
				console.log(tabledata);
				tabledata.forEach(function(entry) {
					var warehousedetail = {
						wid : wid,
						productid : entry[0],
						productname : entry[1],
						number : $("#n" + entry[0]).val(),
						unitprice : entry[3],
						totalprice : parseInt(entry[3])
								* $("#n" + entry[0]).val()
					};
					$.ajax({
						url : "updatewhdetail.action",
						data : warehousedetail,
						success : function(data1) {
							console.log("ok");
						}
					});
				});
				$('#alertsuccess').show();
			}
		});
	}
	function getsupliergrouplist() {
		$(".groupitem").html("");
		$.ajax({
			url : "sgrouplist.action",
			success : function(data) {
				data.supliergroups.forEach(function(entry) {
					var str1 = "<option value='"+entry.sgroupname+"'>"
							+ entry.sgroupname + "</option>"
					$("#cmgroup").append(str1);
				});
			}
		});
	}
	function getsuplierlist() {
		return $
				.ajax({
					url : "getsuplierlist.action",
					method : "post",
					async : false,
					success : function(data) {
						var option;
						data.supliers
								.forEach(function(entry) {
									option += "<option value='"+entry.suplierid+"' data-value ='"+entry.supliername+"'>"
											+ entry.supliername + "</ option>";
								});
						$("#listsuplier").html(option);
						$("#txtsuplier").change(
								function() {
									console.log($(this));
									var name = $(
											"#listsuplier [value='"
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
					+ "<img src='/Struts22/img/product/galaxynote7.jpg' />"
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
					+ "<img src='/Struts22/img/product/galaxynote7.jpg' />"
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
	function getwhdetail() {
		$.ajax({
			url : "getwarehousedetail.action",
			data : {
				wid : "${wh.wid}"
			},
			type : "get",
			success : function(data) {
				data.WHdetail.forEach(function(entry) {
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
	function getsupliername(){
		$.ajax({
			url : "getsuplier.action",
			data : {
				suplierid : "${wh.supilerid}"
			},
			type : "get",
			success : function(data) {
				$("#supliername").text(data.suplier.supliername);
			}
		});
	}
	function addwarehouseandprint(){
		addwarehouse();
		setTimeout(function(){ window.location.href = "printwh.action?whid="+valueid;}, 1000);
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
	<a href="warehouset.action" id="botbaractive">Danh sách phiếu nhập</a>
	<div class="botbarfunction">
		Tạo phiếu nhập <input type="text" class="form-control" id="txtsearch"
			style="width: 200px; display: inline-block;"
			placeholder="Tìm kiếm hàng hóa" />
		</button>
		<div style="display: inline-block">
			<input id="txtsuplier" list="listsuplier" class="form-control"
				placeholder="Tìm kiếm nhà cung cấp" value="${wh.supilerid}"
				style="width: 250px; display: inline-block; margin-left: 20px" />
			<datalist id="listsuplier">
			</datalist>
		</div>
		<button id="createsuplier" class="botbarbutton">
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
			Mã phiếu nhập : <span style="color: blue">#${wh.wid}</span> Nhà cung
			cấp : <span id="supliername" style="color: blue"></span> Tình trạng <select
				id="status">>
				<option value="Đã thanh toán">Đã thanh toán</option>
				<option value="Nợ">Nợ</option>
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
							<td id="paytotal" style="color: red; font-size: large;">${wh.total}</td>
						</tr>
						<tr align="right">
							<td>Thuế</td>
							<td><input type="number" class="form-control" id="tax"
								style="text-align: right;" value=${wh.tax } /></td>
						</tr>
						<tr align="right">
							<td>Thanh toán</td>
							<td><input type="number" class="form-control" id="pay"
								style="text-align: right;" value=${wh.pay } /></td>
						</tr>
						<tr align="right">
							<td>Tiền thừa</td>
							<td><input type="number" class="form-control" id="excess"
								style="text-align: right;" value=${wh.excess } /></td>
						</tr>
					</table>
				</div>
				<div>
					<input type="button" onclick="addwarehouse()" style="width: 100px"
						value="Lưu" class="botbarbutton" /> <input type="button"
						onclick="addwarehouseandprint()" style="width: 100px"
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
						style="background-color: #d1e2ff; border: none; height: 75%; width: 100%"></textarea>
				</div>
			</div>
		</div>
	</div>
</div>
<div hidden id="alertsuccess" class="alert alert-success"
	style="position: fixed; bottom: 0; z-index: 10; left: 50%; transform: translateX(-50%);">
	<a href="#" class="close" onclick="$('#alertsuccess').hide()"
		aria-label="close" style="padding-left: 10px">&times;</a> <strong>Nhập
		kho thành công!</strong> Phiếu nhập đã được lập
</div>
<div hidden id="alertsuccessaddsuplier" class="alert alert-success"
	style="position: fixed; bottom: 0; z-index: 10; left: 50%; transform: translateX(-50%);">
	<a href="#" class="close" onclick="$('#alertsuccessaddsuplier').hide()"
		aria-label="close" style="padding-left: 10px">&times;</a> <strong>Nhà
		cung cấp thành công!</strong>
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
					<table width="100%" class="popuptable" align="center">
						<tr>
							<td style="white-space: nowrap;" width="30%">Mã nhà cung cấp</td>
							<td><input type="text" name="suplier.suplierid" id="cmid" /></td>
						</tr>
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