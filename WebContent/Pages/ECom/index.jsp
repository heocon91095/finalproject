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
		getinfolist();
		getproductlist();
	});
	function getinfolist() {
		$
				.ajax({
					url : "listinfo.action",
					success : function(data) {
						data.infos
								.forEach(function(entry) {
									entry.date = entry.date.substr(0,
											entry.date.indexOf("G"));
									var str = "<div class='info'>"
											+ "<a href='infodetail.action?infoid="+entry.infoid+"'>"
											+ entry.infohead
											+ "</a>"
											+ "<div align='right' style='font-size: smaller;'>"
											+ entry.date
											+ "</div>"
											+ "<hr style='margin-top: 3px; margin-bottom:5px'/>"
											+ "</div>";
									$("#infolist").append(str);
								});
					}
				});
	}
	function getgrouplist(){
		return $.ajax({
			url : "pgrouplist.action"
		});
	}
	function getproductbygroup(data){
		return $.ajax({
			url : "productlist.action",
			data:{group :data,
				n : 8}
		});
	}
	function getproductlist(){
		$.when(getgrouplist()).then(function(dataG,textStatus,jqXHR){
			dataG.pgs.forEach(function(group){
				var str = "<div style='background-color:teal;color:white;padding:5px;width:200px;text-align:center'>"+group.pgroupname+"</div><hr style='margin-top:0px;background-color:teal;height:5px;border:0' /><div class='row' id='g"+group.pgroupid+"'>"
				$.when(getproductbygroup(group.pgroupname)).then(function(data,textStatus,jqXHR){
					data.products.forEach(function(product){
						$("#g"+group.pgroupid).append(drawproduct(product));
						$.when(getproductdetail(product.productid)).then(function(dataD,textStatus,jqXHR){
							console.log(dataD);
							var detailstr = "<div style='color:white;padding-left:5px;padding-top:5px'>"
							+"<p>Màn hình: "+dataD.pd.display+"</p>"
							+"<p>HĐH: "+dataD.pd.os+"</p>"
							+"<p>CPU: "+dataD.pd.cpu+"</p>"
							+"<p>Ram:"+dataD.pd.ram+"</p>"
							+"<p>Camera :"+dataD.pd.backcam+"</p>"
							+"<p align='right' style='padding-right:10px'><a href='eproductdetail.action?productid="+dataD.productid+"' style='color:white'>Chi tiết...</a></p>"
							+"</div>";
							$("#preview"+product.productid).append(detailstr);
						});
						hovershowdetail(product.productid);
						addproduct2cart();
					});	
				});
				str += "</div>"
				$(".product-container").append(str);
			});
		});
	}
	function hovershowdetail(data){
		$("#p"+data).hover(function (){
			$("#preview"+data).show();
		},function (){
			$("#preview"+data).hide();
		});
	}
	function getproductdetail(data)
	{
		return $.ajax({
			url : "getproductdetail.action",
			data:{productid :data}
		});
	}
	function addproduct2cart(){
		$(".buy").unbind();
		$(".buy").click(function(){
			var id = $(this).attr("id");
			id = id.substr(1,id.length);
			var name = $(this).attr("name");
			var unitprice = $(this).attr("unitprice");
			if(localStorage.getItem("cartlist") == null)
				{
				var cartlist =[];
				cartlist.push(id);
				var array = JSON.stringify(cartlist);
				localStorage.setItem("cartlist",array);
				var item = (1+":"+name+"|"+unitprice);
				localStorage.setItem(id,item);
				}
			else{
				var cartlist = JSON.parse(localStorage.getItem("cartlist"));
				if(localStorage.getItem(id) == null)
					{
						cartlist.push(id);
						var array = JSON.stringify(cartlist);
						localStorage.setItem("cartlist",array);
						var item = (1+":"+name+"|"+unitprice);
						localStorage.setItem(id,item);
					}
				else{
					var number = localStorage.getItem(id);
					var number = parseInt(number.substr(0,number.indexOf(":")));
					number++;
					var item = (number+":"+name+"|"+unitprice);
					localStorage.setItem(id,item);
				}
			}
			$("#alertsuccess").show();
		});
	}
	function drawproduct(data){
		console.log(data);
		return "<!-- Product Card Made by Tai -->"
		+"<div class='col-md-3 col-sm-6'>"
		+"<div style='margin: 10px; border: 0.5px solid #d6d6d6;'>"
			+"<div style='height: 180px;' id='p"+data.productid+"'><img src='/Struts22/img/product/"+data.prductimg+"' style='max-width:100%;height:100%;max-height:100%;float:left' /><div id='preview"+data.productid+"' hidden style='background: rgba(119, 119, 119, 0.8);height:100%;width:100%;z-index:10;float:left;margin-top:-180px'></div></div>"
			+"<p style='font-size: large; padding-left: 5px'>"+data.productname+"</p>"
			+	"<div style='font-size: large; color: red; padding-left: 5px; display: inline-block; width: 100%'>"
				+data.priceout
				+" VND<div style='float: right;'>"
					+"<button class='buy' name='"+data.productname+"' unitprice="+data.priceout+" id='b"+data.productid+"' style='color: white; background-color: red; width: 70px; border: none; padding: 5px'>"
					+	"<span class='glyphicon glyphicon-shopping-cart'></span>"
					+"</button>"
				+"</div>"
			+"</div>"
		+"</div>"
	+"</div>"
	+"<!-- Product Card Made by Tai End -->"
	}
</script>
<div class="container-fluid" style="margin-top: 10px">
	<div class="row">
		<div class="col-md-8">
			<!-- Bootstrap slideshow -->
			<div id="myCarousel" class="carousel slide" data-ride="carousel">
				<!-- Indicators -->
				<ol class="carousel-indicators">
					<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
					<li data-target="#myCarousel" data-slide-to="1"></li>
					<li data-target="#myCarousel" data-slide-to="2"></li>
					<li data-target="#myCarousel" data-slide-to="3"></li>
				</ol>

				<!-- Wrapper for slides -->
				<div class="carousel-inner" role="listbox" style="height: 260px">
					<div class="item active" style="height: 260px">
						<img src="/Struts22/img/product/galaxyj7.jpg" alt="Samsung"
							style="height: 260px">
					</div>

					<div class="item">
						<img src="/Struts22/img/product/zenfone3.jpg" alt="Asus"
							style="height: 260px">
					</div>
	
					<div class="item">
						<img src="/Struts22/img/product/htcone.jpg" alt="HTC"
							style="height: 260px">
					</div>

					<div class="item">
						<img src="/Struts22/img/product/redminote4.jpg" alt="Mi"
							style="height: 260px">
					</div>
				</div>

				<!-- Left and right controls -->
				<a class="left carousel-control" href="#myCarousel" role="button"
					data-slide="prev"> <span
					class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
					<span class="sr-only">Previous</span>
				</a> <a class="right carousel-control" href="#myCarousel" role="button"
					data-slide="next"> <span
					class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
					<span class="sr-only">Next</span>
				</a>
			</div>
		</div>
		<div class="col-md-4">
			<div
				style="padding: 5px; background-color: teal; color: white; width: 160px">Thông
				tin</div>
			<div style="width: 100%; border: solid 2px teal; padding: 10px">
				<div id="infolist">
				</div>
			</div>
		</div>
	</div>
	<!-- Product here -->
	<div class="product-container" style="margin-top: 10px">
	</div>
</div>
<div hidden id="alertsuccess" class="alert alert-success"
	style="position: fixed; bottom: 0; z-index: 10; left: 50%; transform: translateX(-50%);">
	<a href="#" class="close" onclick="$('#alertsuccess').hide()"
		aria-label="close" style="padding-left: 10px">&times;</a> <strong>Đã thêm vào giỏ hàng</strong>
</div>