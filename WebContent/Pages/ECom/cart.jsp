<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<script type="text/javascript">
	var plist = [];
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
		countptotal();
		getpaytotal();
		add2cart();
	});
	function addbillmain(customer) {
		var today = new Date();
		var dayformat = today.getFullYear() + "-" + (today.getMonth() + 1)
				+ "-" + (today.getDay() - 1);
		var bill = {
			customerid : customer,
			total : $("#paytotal").text(),
			tax : 0,
			pay : 0,
			excess : 0 - parseInt($("#paytotal").text()),
			note : $("#note").val(),
			status : "Chờ xử lý"
		};
		return $.ajax({
			url : "addbill.action",
			data : bill,
			type : "post",
		});
	}
	function addbilldetail(bid) {
		tabledata = getalldata();
		console.log(tabledata);
		tabledata.forEach(function(entry) {
			var billdetail = {
				billid : bid,
				productid : entry[0],
				productname : entry[1],
				number : $("#n" + entry[0]).val(),
				unitprice : entry[3],
				totalprice : parseInt(entry[3]) * $("#n" + entry[0]).val()
			};
			$.ajax({
				url : "addbilldetail",
				data : billdetail,
				success : function(data1) {
					console.log("ok");
				}
			});
		});
	}
	function addbill() {
		$.when(addcustomer()).then(
				function(dataC, textStatus, jqXHR) {
					$.when(addbillmain(dataC.customerid)).then(
							function(dataB, textStatus, jqXHR) {
								addbilldetail(dataB.bill.billid)
							});
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
	function add2cart() {
		if (localStorage.getItem("cartlist") != null) {
			var cartlist = JSON.parse(localStorage.getItem("cartlist"));
			cartlist.forEach(function(entry) {
				var product = localStorage.getItem(entry);
				if (product != null) {
					var code = entry;
					var number = product.substr(0, product.indexOf(":"));
					var name = product.substr(product.indexOf(":") + 1, product
							.indexOf("|") - 2);
					var unitprice = product.substr(product.indexOf("|") + 1,
							product.length);
					addtocart(code, name, number, unitprice);
				}
			});
		}
	}
	function addtocart(id, name, number, price) {
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
	function addcustomer() {
		return $.ajax({
			url : "addcustomer.action",
			data : {
				customername : $("#cname").val(),
				phone : $("#cphone").val(),
				address : $("#caddress").val(),
				mail : $("#cmail").val(),
				group : "Khách thường",
			},
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
		$(".total").change(function() {
			var paytotal = parseInt($(this).text());
			$("#paytotal").text(paytotal);
		});
	}
</script>
<div class="row">
	<h1>Giỏ hàng</h1>
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
			<form id="getbill">
				<div class="purchase-box"
					style="margin: 5px; border: solid 1px; padding: 15px">
					<p>Thanh toán</p>
					<hr />
					<table width="100%"
						style="border-collapse: separate; border-spacing: 10px;">
						<tr align="right">
							<td>Tổng cộng</td>
							<td id="paytotal" style="color: red; font-size: large;">0</td>
						</tr>
						<tr align="right">
							<td>Tên</td>
							<td><input type="text" class="form-control" id="cname" /></td>
						</tr>
						<tr align="right">
							<td>Số điện thoại</td>
							<td><input type="text" class="form-control" id="cphone" /></td>
						</tr>
						<tr align="right">
							<td>Email</td>
							<td><input type="text" class="form-control" id="cmail" /></td>
						</tr>
						<tr align="right">
							<td>Địa chỉ</td>
							<td><input type="text" class="form-control" id="caddress" /></td>
						</tr>
					</table>
				</div>
			</form>
		</div>
		<div class="col-md-6">
			<div class="note-box"
				style="background-color: #d1e2ff; padding: 15px; margin: 5px; border: solid 1px; height: 100px">
				<p>
					<span class=" glyphicon glyphicon-pencil"></span>&nbsp;Ghi chu
				</p>
				<input type="text" id="note" placeholder="Ghi chu"
					style="background-color: #d1e2ff; border: none" />
			</div>
			<div style="padding: 15px; margin: 5px">
				<input type="button" class="botbarbutton" onclick="addbill()"
					style="font-size: large" value="Mua ngay" />
			</div>
		</div>
	</div>
</div>