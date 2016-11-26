<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<style>
.taoblock {
	padding: 10px;
	display: inline-block;
	text-align: center;
	font-size: x-large;
	color: white;
	margin: 10px;
	width: 200px;
}

.taoblock:hover {
	color: white;
}
</style>
<script type="text/javascript">
	$(document).ready(function() {
		$(".active").removeClass("active");
		$("#navd").addClass("active");
	});
</script>
<div class="row">
	<div class="center-block col-md-4" style="float: none; margin-top: 5%">
		<img src="<s:url value="/img/user1.png"/>" alt="hinh user"
			style="float: left; height: 100px" />
		<div>Admin1</div>
		<hr />
		<div>Địa chỉ: 280 An duong Vuong</div>
		<div>Số điện thoại: 01246675972</div>
	</div>
</div>
<div class="row">
	<div class="center-block col-md-9" style="float: none; margin-top: 5%">
		<a href="/Hoadon/Index" class="taoblock"
			style="background-color: blue">Thêm hàng hóa</a> <a
			href="/Donnhaphang/Index" class="taoblock"
			style="background-color: green">Hóa đơn</a> <a
			href="/Khachhang/Index" class="taoblock"
			style="background-color: brown">Thêm hóa đơn</a> <a
			href="/Hanghoa/Index" class="taoblock"
			style="background-color: orangered">Khách hàng</a> <a
			href="/Nhacungcap/Index" class="taoblock"
			style="background-color: purple">Nhà cung cấp</a> <a
			href="/Thongke/Index" class="taoblock" style="background-color: teal">Thu
			chi</a> <a href="/Thuchi/Index" class="taoblock"
			style="background-color: gray">Cấu hình</a> <a href="/User/Index"
			class="taoblock" style="background-color: black">Thống kê</a>
	</div>
</div>