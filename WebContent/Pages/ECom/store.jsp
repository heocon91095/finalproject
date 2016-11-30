<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<style>
#map {
	height: 500px;
	width: 100%;
}
</style>
<h3>Địa chỉ cửa hàng</h3>
<div>280 An Dương Vương, Q.5, TP.HCM</div>
<br />	
<div id="map"></div>
<script>
	function initMap() {
		var uluru = {
			lat : 10.761096,
			lng : 106.6800412
		};
		var map = new google.maps.Map(document.getElementById('map'), {
			zoom : 17,
			center : uluru
		});
		var marker = new google.maps.Marker({
			position : uluru,
			map : map
		});
	}
</script>
<script async defer
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAGH4c64HmnJJA56lvuewmpYTsJaNbeSTU&callback=initMap">
	

		
	</script>