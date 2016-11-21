<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
	var data; 
	var mode=0;
	$(document).ready(function() {
		$(".active").removeClass("active");
		$("#navp").addClass("active");
		drawchart();
	});
	function addgroup() {
		$.ajax({
			url : "addpgroup.action",
			data : $("#formaddgroup").serialize(),
			success : function(data) {
				console.log("ok");
				getgrouplist();
			}
		});
	}
	function drawchart() {
		$.ajax({
			url : "getdatareport.action",
			data:{
				startdate : $("#startdate").val(),
				enddate :$("#enddate").val()
			},
			success : function(datareport) {
				data = datareport;
				drawmychart(datareport);
			}
		})
	}
	function drawmychart(datareport)
	{
		google.charts.load('current', {
			'packages' : [ 'corechart' ]
		});

		// Set a callback to run when the Google Visualization API is loaded.
		if(mode ==0)
		google.charts.setOnLoadCallback(drawChart);
		else 
			google.charts.setOnLoadCallback(drawChart1);
		// Callback that creates and populates a data table,
		// instantiates the pie chart, passes in the data and
		// draws it.
		function drawChart() {

			// Create the data table.
			var data = new google.visualization.DataTable();
			data.addColumn('string', 'Topping');
			data.addColumn('number', 'Sản phẩm');
			data.addRows(datareport.data);

			// Set chart options
			var options = {
				'title' : 'Thống kê số lượng sản phẩm bán ra',
				'width' : 800,
				'height' : 600
			};

			// Instantiate and draw our chart, passing in some options.
			var chart = new google.visualization.PieChart(document
					.getElementById('chart_div'));
			chart.draw(data, options);
		}
		function drawChart1() {

			// Create the data table.
			var data = new google.visualization.DataTable();
			data.addColumn('string', 'Topping');
			data.addColumn('number', 'Sản phẩm');
			data.addRows(datareport.data);

			// Set chart options
			var options = {
				'title' : 'Thống kê số lượng sản phẩm bán ra',
				'width' : 800,
				'height' : 600
			};

			// Instantiate and draw our chart, passing in some options.
			var chart = new google.visualization.BarChart(document
					.getElementById('chart_div'));
			chart.draw(data, options);
		}
	}
	function switchchart()
	{
		if(mode ==0) mode=1;
		else mode =0;
		drawmychart(data);
	}
</script>
<style>
.details-control {
	cursor: pointer;
}
</style>
<div class="botbar">
	<div class="botbarfunction form-inline">
		Thống kê | <span style="color: black">Từ ngày</span> <input
			type="date" class="form-control" id="startdate"
			style="width: 200px; display: inline-block;" /> <span
			style="color: black">Đến ngày</span><input  type="date"
			class="form-control" id="enddate"
			style="width: 200px; display: inline-block;" />
		<button class="botbarbutton" onclick="drawchart()">
			<span class="glyphicon glyphicon-search"></span>
		</button>
		<button class="botbarbutton" onclick="switchchart()">
			<span class="glyphicon glyphicon-transfer"></span>
		</button>
		<div style="float: right;">
			<button class="botbarbutton">
				<span class="glyphicon glyphicon-export"></span> Xuất Excel
			</button>
		</div>
	</div>
</div>

<div id="chart_div" align="center"></div>
