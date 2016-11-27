<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<style>
#example th {
	font-size: 12px;
}

#example td {
	font-size: 12px;
}
</style>
<script type="text/javascript">
	var data1 = null;
	$(document).ready(function() {
		$(".active").removeClass("active");
		$("#navinfo").addClass("active");
		$('#example').dataTable({
			"searching" : false,
			"columnDefs" : [ {
				"className" : "dt-center",
				"targets" : "_all"
			} ]
		});
		loadtable();
		$("#addnew").click(function() {
			window.location.href = "createinfo.action"
		});
		$("#addgroup").click(function() {
			$("#groupModal").modal('toggle');
		});
		$("#submitgroup").click(function() {
			addgroup();
			$("#groupModal").modal('toggle');
		});

	});
	function getcustomerbygroup(data) {
		console.log(data);
		loadtable(data);
	}
	function drawtable(data) {
		var str = "<a title='Edit' href='#' id='e"+data.infoid+"'>"
				+ "<span class='glyphicon glyphicon-edit' style='color:green' cusid='"+data.infoid+"' ></span>"
				+ "</a> | "
				+ "<a title='Remove' href='#' id='r"+data.infoid+"'>"
				+ "<span class='glyphicon glyphicon-trash'style='color:red' cusid='"+data.infoid+"' ></span>"
				+ "</a> | "
				+ "<a title='Barcode' href='#' id='b"+data.infoid+"'>"
				+ "<span class='glyphicon glyphicon-envelope'style='color:orange' cusid='"+data.infoid+"' ></span>"
				+ "</a>";
		$('#example').DataTable().row.add(
				[ data.infoid, data.infohead, data.date, str ]).draw(false);
		$("#r" + data.infoid).click(function() {
			remove(data.infoid);
		});
		$("#e" + data.infoid).click(function() {
			window.location.href = "editinfo.action?infoid=" + data.infoid;
		});
		$("#b" + data.infoid).click(function() {
			sendemail(data.infoid, data.infohead)
		});
	}
	function loadtable(data) {
		$.ajax({
			url : "listinfo.action",
			method : "post",
			async : "false",
			data : {
				group : data,
			},
			success : function(data) {
				$("#example").DataTable().clear();
				data.infos.forEach(function(entry) {
					drawtable(entry);
				});
			},
		});
	}
	function loadtablebykeyword() {
		console.log($("#txt_cmsearch").val());
		$.ajax({
			url : "/Struts22/getrplist",
			method : "post",
			async : "false",
			data : {
				searchvalue : $("#txt_cmsearch").val(),
			},
			success : function(data) {
				$("#example").DataTable().clear();
				data1 = JSON.stringify(data.customers);
				console.log(data1);
				data.customers.forEach(function(entry) {
					drawtable(entry);
				});
			},
		});
	}
	function remove(data) {
		$.ajax({
			url : "removeinfo.action",
			data : {
				infoid : data
			},
			success : function(data) {
				console.log("ok");
				$("#example").DataTable().clear();
				loadtable();
			}
		});
	}
	function sendemail(id, head) {
		var str = "MobileStore có tin mới :" + head
				+ "\n\n Truy cập trang web để biết thêm chi tiết"
		$.ajax({
			url : "maillist.action",
			success : function(data) {
				data.mails.forEach(function(entry) {
					$.ajax({
						url : "sendemail.action",
						data : {
							to : entry.mail,
							content : str
						},
						success : function(data) {
							console.log("sended");
						}
					});
				})
			}
		})
	}
</script>
<div class="botbar">
	<a href="#" id="botbaractive">Khách hàng</a>
	<div class="botbarfunction">
		Thông tin | <input type="text" class="form-control" id="txtsearch"
			placeholder="Nhập từ khóa"
			style="width: 200px; display: inline-block;" /> Từ ngày: <input
			type="date" class="form-control" id="datestart" placeholder="Từ ngày"
			style="width: 160px; display: inline-block;" /> Đến ngày:<input
			type="date" placeholder="Đến ngày" class="form-control" id="dateend"
			style="width: 160px; display: inline-block;" />
		<button onclick="loadtablebykey()" class="botbarbutton">
			<span class="glyphicon glyphicon-search"></span>
		</button>
		<div style="float: right;">
			<button class="botbarbutton" id="addnew">
				<span class="glyphicon glyphicon-plus"></span> Thêm
			</button>
		</div>
	</div>
</div>
<div class="row" style="margin-left: 15px; margin-right: 5px">
	<div class="tablecontainer">
		<table id="example" class="display" cellspacing="0" width="100%">
			<thead>
				<tr>
					<th width="7%">Mã tin</th>
					<th width="30%">Chủ đề</th>
					<th>Ngày tạo</th>
					<th>Chức năng</th>
				</tr>
			</thead>
		</table>
	</div>

</div>