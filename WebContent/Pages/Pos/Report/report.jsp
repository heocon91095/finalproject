<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
	var name;
	var title;
	var mode = 0;
	var chartype = 1;
	var data;
	$(document).ready(function() {
		$(".active").removeClass("active");
		$("#navreport").addClass("active");
		drawchart();
		$("#drawchart1").click(function() {
			drawchart()
		});
		$("#drawchart2").click(function() {
			drawchart2()
		});
	});
	function drawchart2() {
		chartype = 2
		$.ajax({
			url : "getdatareportmoney.action",
			data : {
				startdate : $("#startdate").val(),
				enddate : $("#enddate").val()
			},
			success : function(datareport) {
				title = "Thống kê doanh thu theo ngày";
				name = "Doanh thu";
				data = datareport;
				datareport.data.forEach(function(entry) {
					entry[0] = entry[0].substr(0, entry[0].indexOf("T"))
				})
				drawmychart(datareport);
			}
		})
	}
	function drawchart() {
		$.ajax({
			url : "getdatareport.action",
			data : {
				startdate : $("#startdate").val(),
				enddate : $("#enddate").val()
			},
			success : function(datareport) {
				title = "Thống kê số lượng sản phẩm bán ra";
				data = datareport;
				name = "Sản phẩm";
				drawmychart(datareport);
			}
		})
	}
	function drawmychart(datareport) {
		google.charts.load('current', {
			'packages' : [ 'corechart' ]
		});

		// Set a callback to run when the Google Visualization API is loaded.
		google.charts.setOnLoadCallback(drawChart);
		// Callback that creates and populates a data table,
		// instantiates the pie chart, passes in the data and
		// draws it.
		function drawChart() {
			// Create the data table.
			var data = new google.visualization.DataTable();
			data.addColumn('string', 'Topping');
			data.addColumn('number', name);
			data.addRows(datareport.data);

			// Set chart options
			var options = {
				'title' : title,
				'width' : 800,
				'height' : 600
			};

			// Instantiate and draw our chart, passing in some options.
			if (mode == 0) {
				var chart = new google.visualization.PieChart(document
						.getElementById('chart_div'));
				chart.draw(data, options);
			} else {
				var chart = new google.visualization.BarChart(document
						.getElementById('chart_div'));
				chart.draw(data, options);
			}
		}
	}
	function switchchart() {
		if (mode == 0)
			mode = 1;
		else
			mode = 0;
		if (chartype == 1)
			drawchart();
		else
			drawchart2();
	}
	function excel() {
		console.log(data);
		var str = "<table><tr><th colsan=2>"+title+"</th></tr>"
				+ "<tr><th>"+name+"</th><th>Số lượng</th></tr>";
		 data.data.forEach(function(entry) {
			str += "<tr><td>" + entry[0] + "</td><td>" + entry[1]
					+ "</td></tr>";
		}); 
		str += "</table>";
		$("#exceltable").html(str);
		var html = $("#exceltable").html();
		window
				.open('data:application/vnd.ms-excel;charset=utf-8,\uFEFF'
						+ html);
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
			style="color: black">Đến ngày</span><input type="date"
			class="form-control" id="enddate"
			style="width: 200px; display: inline-block;" />
		<button class="botbarbutton" onclick="drawchart()">
			<span class="glyphicon glyphicon-search"></span>
		</button>
		<button class="botbarbutton" onclick="switchchart()">
			<span class="glyphicon glyphicon-transfer"></span>
		</button>
		<div style="float: right;">
			<button class="botbarbutton" onclick="excel()">
				<span class="glyphicon glyphicon-export"></span> Xuất Excel
			</button>
		</div>
	</div>
</div>
<div class="row">
	<div class="col-md-3" style="background-color: #c6dcff">
		<div class="groupcontainer">
			Thống kê
			<div class="groupitem">
				<div>
					<a href='#' class="group" id="drawchart1">Số lượng sản phẩm bán
						ra</a>
				</div>
				<div>
					<a href='#' class="group" id="drawchart2">Doanh thu theo ngày</a>
				</div>
			</div>
		</div>
	</div>
	<div class="col-md-9">
		<div id="chart_div" align="center"></div>
	</div>
</div>
<div hidden id="exceltable"></div>
