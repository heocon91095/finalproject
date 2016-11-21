<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<script src="https://code.jquery.com/jquery-2.2.4.min.js"
	integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="
	crossorigin="anonymous"></script>
<script>
	$(document).ready(function() {
		$.ajax({
			url : "gettemplate.action",
			success : function(data) {
				$("#header").html(data.template.header);
				$("#footer").html(data.template.footer);
			}
		});
	});
</script>
<style>
.ptable {
	border-collapse: collapse;
	border: 1px solid black;
}
</style>
<div id="header"></div>
<h1 align="center">Hoá đơn mua hàng</h1>
<table align="center">
	<tr>
		<td width="300px">Người mua: ${customer.customername}</td>
		<td width="300px">Số điện thoại: ${customer.phone}</td>
	</tr>
	<tr>
		<td width="300px">Mã đơn: #${bill.billid}</td>
		<td width="300px">Tổng tiền: ${bill.total} VND</td>
	</tr>
</table>
<br />
<table class="ptable" border="1" align="center">
	<tr>
		<th width="200px">Tên sản phẩm</th>
		<th width="200px">Số lượng</th>
		<th width="200px">Đơn giá</th>
		<th width="200px">Thành tiền</th>
	</tr>
	<s:iterator value="billdetail">
		<tr>
			<td align="center"><s:property value="productname" /></td>
			<td align="center"><s:property value="number" /></td>
			<td align="center"><s:property value="unitprice" /></td>
			<td align="center"><s:property value="totalprice" /></td>
		</tr>
	</s:iterator>
</table>
<br />
<div style="margin-left: 70%; font-weight: bold;">Kí tên</div>
<div style="position:absolute ;width:100%; bottom: 0" id="footer"></div>