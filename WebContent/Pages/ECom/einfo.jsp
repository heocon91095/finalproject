<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<script>
	$(document).ready(function() {
		getinfolist();
	});
	function getinfolist() {
		return $.ajax({
			url : "listinfo.action",
			success : function(data) {
				data.infos.forEach(function(entry){
					var str = "<div align='center'>"
					+"<h2 ><a href='infodetail.action?infoid="+entry.infoid+"'>"+entry.infohead+"</a></h2>"
					+"<hr /><p align='right'>"+entry.date+"</p>"
							+"<div style='height: 200px; overflow: hidden'>"
						+"<img src='"+entry.labelimg+"' /></div><br />"
					+"<div align='left' style='height: 100px; overflow: hidden'>"+entry.infobody+"</div>"
					+"<hr /></div>";
					$("#info").append(str);
				})
			}
		});
	}
</script>
<div id="info">
</div>
