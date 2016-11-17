<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<div class="row">
	<h1>${product.productname}</h1>
	<hr />
	<div class="col-md-8" style="padding: 10px">
		<img alt="product" src="/Struts22/img/product/zenfone3.jpg"
			style="width: 100%">
	</div>
	<div class="col-md-4" style="padding: 10px">
		<h2 style="color: red">${product.priceout}&nbsp;VND</h2>

		<table class="table">
			<thead>
				<tr>
					<th colspan="2"><h2>Thông số kĩ thuật</h2></th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>Màn hình:</td>
					<td>${pd.display}</td>
				</tr>
				<tr>
					<td>Hệ điều hành:</td>
					<td>${pd.os}</td>
				</tr>
				<tr>
					<td>Camera sau:</td>
					<td>${pd.backcam}</td>
				</tr>
				<tr>
					<td>Camera trước:</td>
					<td>${pd.frontcam}</td>
				</tr>
				<tr>
					<td>CPU:</td>
					<td>${pd.cpu}</td>
				</tr>
				<tr>
					<td>Ram:</td>
					<td>${pd.ram}</td>
				</tr>
				<tr>
					<td>Bộ nhớ trong:</td>
					<td>${pd.storage}</td>
				</tr>
				<tr>
					<td>Thẻ nhớ:</td>
					<td>${pd.sdcard}</td>
				</tr>
				<tr>
					<td>Sim:</td>
					<td>${pd.sim}</td>
				</tr>
				<tr>
					<td>Pin:</td>
					<td>${pd.battery}</td>
				</tr>
				<tr>
					<td>Đặc biệt:</td>
					<td>${pd.special}</td>
				</tr>
			</tbody>
		</table>
	</div>
</div>
<div align="center"><button class="botbarbutton" style="font-size: large;">Mua hàng<span class="glyphicon glyphicon-shopping-cart"></span></button></div>