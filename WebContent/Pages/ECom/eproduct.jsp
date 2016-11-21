<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<style>
.carousel-inner>.item>img, .carousel-inner>.item>a>img {
	width: 100%;
	height: 70% margin: auto;
}
</style>
<script>
	$(document).ready(function() {
		getproducerlist();
		getproductlist();
	});
	function getproducerlist() {
		$.ajax({
			url : "getproducerlist",
			success : function(data) {
				data.producers.forEach(function(entry) {
					var str = "<option value='"+entry.producername+"'>"
							+ entry.producername + "</option>";
					$("#producerlist").append(str);
				});
			}
		});
	}
	function getgrouplist() {
		return $.ajax({
			url : "pgrouplist.action"
		});
	}
	function getproductbygroup(data) {
		return $.ajax({
			url : "productlist.action",
			data : {
				group : data
			}
		});
	}
	function getproductlist() {
		$
				.when(getproductbygroup("${group}"))
				.then(
						function(data, textStatus, jqXHR) {
							data.products
									.forEach(function(product) {
										$(".product-container").append(
												drawproduct(product));
										$
												.when(
														getproductdetail(product.productid))
												.then(
														function(dataD,
																textStatus,
																jqXHR) {
															console.log(dataD);
															var detailstr = "<div style='color:white;padding-left:5px;padding-top:5px'>"
																	+ "<p>Màn hình: "
																	+ dataD.pd.display
																	+ "</p>"
																	+ "<p>HĐH: "
																	+ dataD.pd.os
																	+ "</p>"
																	+ "<p>CPU: "
																	+ dataD.pd.cpu
																	+ "</p>"
																	+ "<p>Ram:"
																	+ dataD.pd.ram
																	+ "</p>"
																	+ "<p>Camera :"
																	+ dataD.pd.backcam
																	+ "</p>"
																	+ "<p align='right' style='padding-right:10px'><a href='eproductdetail.action?productid="
																	+ dataD.productid
																	+ "' style='color:white'>Chi tiết...</a></p>"
																	+ "</div>";
															$(
																	"#preview"
																			+ product.productid)
																	.append(
																			detailstr);
														});
										hovershowdetail(product.productid);
										addproduct2cart();
									});
						});
	}
	function hovershowdetail(data) {
		$("#p" + data).hover(function() {
			$("#preview" + data).show();
		}, function() {
			$("#preview" + data).hide();
		});
	}
	function getproductdetail(data) {
		return $.ajax({
			url : "getproductdetail.action",
			data : {
				productid : data
			}
		});
	}
	function addproduct2cart() {
		$(".buy").unbind();
		$(".buy").click(
				function() {
					var id = $(this).attr("id");
					id = id.substr(1, id.length);
					var name = $(this).attr("name");
					var unitprice = $(this).attr("unitprice");
					if (localStorage.getItem("cartlist") == null) {
						var cartlist = [];
						cartlist.push(id);
						var array = JSON.stringify(cartlist);
						localStorage.setItem("cartlist", array);
						var item = (1 + ":" + name + "|" + unitprice);
						localStorage.setItem(id, item);
					} else {
						var cartlist = JSON.parse(localStorage
								.getItem("cartlist"));
						if (localStorage.getItem(id) == null) {
							cartlist.push(id);
							var array = JSON.stringify(cartlist);
							localStorage.setItem("cartlist", array);
							var item = (1 + ":" + name + "|" + unitprice);
							localStorage.setItem(id, item);
						} else {
							var number = localStorage.getItem(id);
							var number = parseInt(number.substr(0, number
									.indexOf(":")));
							number++;
							var item = (number + ":" + name + "|" + unitprice);
							localStorage.setItem(id, item);
						}
					}
					console.log(localStorage.getItem("cartlist"));
					console.log(localStorage.getItem(id));
				});
	}
	function drawproduct(data) {
		console.log(data);
		return "<!-- Product Card Made by Tai -->"
				+ "<div class='col-md-3 col-sm-6'>"
				+ "<div style='margin: 10px; border: 0.5px solid #d6d6d6;'>"
				+ "<div style='height: 180px;' id='p"+data.productid+"'><img src='/Struts22/img/product/"
				+ data.prductimg
				+ "' style='max-width:100%;height:100%;max-height:100%;float:left' /><div id='preview"
				+ data.productid
				+ "' hidden style='background: rgba(119, 119, 119, 0.8);height:100%;width:100%;z-index:10;float:left;margin-top:-180px'></div></div>"
				+ "<p style='font-size: large; padding-left: 5px'>"
				+ data.productname
				+ "</p>"
				+ "<div style='font-size: large; color: red; padding-left: 5px; display: inline-block; width: 100%'>"
				+ data.priceout
				+ " VND<div style='float: right;'>"
				+ "<button class='buy' name='"+data.productname+"' unitprice="+data.priceout+" id='b"+data.productid+"' style='color: white; background-color: red; width: 70px; border: none; padding: 5px'>"
				+ "<span class='glyphicon glyphicon-shopping-cart'></span>"
				+ "</button>" + "</div>" + "</div>" + "</div>" + "</div>"
				+ "<!-- Product Card Made by Tai End -->"
	}
	function advancesearch() {
		var price = getpricerange();
		var producer = $("#producerlist").val();
		var componentinfo = $("#componentinfo").val();
		if (componentinfo != "") {
			var component = $("#component").val();
		} else {
			var component = null;
		}
		$
				.ajax({
					url : "advancesearch.action",
					data : {
						group : "${group}",
						pricestart : price[0],
						priceend : price[1],
						producer : producer,
						component : component,
						componentinfo : componentinfo
					},
					success : function(data) {
						$(".product-container").empty();
						data.products.forEach(function(product) {
									$(".product-container").append(drawproduct(product));
									$.when(getproductdetail(product.productid)).then(
													function(dataD, textStatus,jqXHR) {
														console.log(dataD);
														var detailstr = "<div style='color:white;padding-left:5px;padding-top:5px'>"
																+ "<p>Màn hình: "
																+ dataD.pd.display
																+ "</p>"
																+ "<p>HĐH: "
																+ dataD.pd.os
																+ "</p>"
																+ "<p>CPU: "
																+ dataD.pd.cpu
																+ "</p>"
																+ "<p>Ram:"
																+ dataD.pd.ram
																+ "</p>"
																+ "<p>Camera :"
																+ dataD.pd.backcam
																+ "</p>"
																+ "<p align='right' style='padding-right:10px'><a href='eproductdetail.action?productid="
																+ dataD.productid
																+ "' style='color:white'>Chi tiết...</a></p>"
																+ "</div>";
														$(
																"#preview"
																		+ product.productid)
																.append(
																		detailstr);
													});
									hovershowdetail(product.productid);
									addproduct2cart();
								});
					},
					error : function() {
						console.log("Error")
					}
				});
	}
	function getpricerange() {
		var value = [];
		var str = $("#price").val();
		value.push(parseInt(str.substr(0, str.indexOf("|"))));
		value.push(parseInt(str.substr(str.indexOf("|") + 1, str.length)));
		return value;
	}
</script>
<div class="container-fluid" style="margin-top: 10px">
	<div class="row form-inline text-center" style="font-size: large">
		Nhà sản xuất:<select class="form-control" id="producerlist"
			style="margin-left: 5px; margin-right: 20px">
			<option value=null>Tất cả</option>
		</select> Giá: <select class="form-control"
			style="margin-left: 5px; margin-right: 20px" id="price">
			<option value="-1|-1">Tất cả mức giá</option>
			<option value="0|1000000">Dưới 1 triệu</option>
			<option value="1000000|3000000">Từ 1 - 3 triệu</option>
			<option value="3000000|7000000">Từ 3 - 7 triệu</option>
			<option value="7000000|10000000">Từ 7 - 10 triệu</option>
			<option value="10000000|15000000">Từ 10 - 15 triệu</option>
			<option value="15000000|100000000">Trên 15 triệu</option>
		</select> Tính năng: <select id="component" class="form-control"
			style="margin-left: 5px; margin-right: 10px">
			<option value="display">Màn hình</option>
			<option value="os">Hệ điều hành</option>
			<option value="frontcam">Camera trước</option>
			<option value="backcam">Camera sau</option>
			<option value="cpu">CPU</option>
			<option value="ram">Ram</option>
			<option value="storage">Bộ nhớ</option>
			<option value="sdcard">Thẻ nhớ</option>
			<option value="sim">Sim</option>
			<option value="battery">Pin</option>
			<option value="special">Đặc biệt</option>
		</select> <input type="text" class="form-control" id="componentinfo" />
		<button id="advancesearch" class="botbarbutton"
			onclick="advancesearch()">
			<span class="glyphicon glyphicon-search"></span>
		</button>
	</div>
	<hr />
	<!-- Product here -->
	<div class="product-container" style="margin-top: 10px"></div>
</div>