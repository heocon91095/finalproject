<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<script src="//cdn.tinymce.com/4/tinymce.min.js"></script>
<script>
	tinymce.init({
		selector : 'textarea',
		plugins : "image",
		insert_menubar : "insert"
	});
	function getdata() {
		var date = new Date();
		var header = $("#header").val();
		var label = $("#label").val();
		console.log(label);
		var body = (tinymce.activeEditor.getContent());
		$.ajax({
			url : "addinfo.action",
			type:"post",
			data : {
				head : header,
				body : body,
				labelimg : label,
				time : date
			},
			success : function(data){
				console.log("ok");
				$("#alertsuccess").show();
			}
		});
	}
	function preview() {
		var date = new Date();
		var html = "<div style='margin-top:20px;margin-left:100px;margin-right:100px'><h1 align='center' style='color:blue'>"
				+ $("#header").val()
				+ "</h1>"
				+ "<hr />"
				+ "<div align='right'>"
				+ date
				+ "</div>"
				+ "<div>"
				+ tinymce.activeEditor.getContent() + "</div>"
		var newWindow = window.open();
		newWindow.document.write(html);
	}
</script>
<div class="botbar">
	<a href="info.action" id="botbaractive">Danh sách thông tin</a>
</div>
<div style="margin-top: 15px; margin-left: 100px; margin-right: 100px">
	<h2>Tạo mới thông tin</h2>
	<div>
		<label>Tiêu đề:&nbsp;</label><input type="text" class="form-control"
			id="header" />
	</div>
	<div>
		<label>Link ảnh tiêu đề:&nbsp;</label><input type="text" class="form-control"
			id="label" />
	</div>
	<label>Nội dung:</label>
	<textarea id="body" style="height: 300px"></textarea>
	<br />
	<div align="right">
		<input type="button" class="botbarbutton" onclick="getdata()"
			value="Save" /> <input type="button" class="botbarbutton"
			onclick="preview()" value="Preview" />
	</div>
</div>
<div hidden id="alertsuccess" class="alert alert-success"
	style="position: fixed; bottom: 0; z-index: 10; left: 50%; transform: translateX(-50%);">
	<a href="#" class="close" onclick="$('#alertsuccess').hide()"
		aria-label="close" style="padding-left: 10px">&times;</a> <strong>Thêm
		thông tin thành công!</strong>
</div>