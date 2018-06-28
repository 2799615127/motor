<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>T218 is No.1</title>
<style type="text/css">
body, html {
	width: 100%;
	height: 100%;
	margin: 0;
	font-family: "微软雅黑";
}

#l-map {
	height: 500px;
	width: 100%;
}
</style>
<script
	src="${ pageContext.request.contextPath }/js/jquery-3.1.1.min.js"
	type="text/javascript"></script>
<!-- bootstrap组件引用 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/bootstrap/css/bootstrap.min.css">
<title>根据起终点名称查询铁路换乘</title>
<script type="text/javascript"
	src="http://api.map.baidu.com/api?v=3.0&ak=cHEzHzIG3PblnQQgGNbm4QrZirnk9lYd"></script>
<style type="text/css">
body, html, #container {
	width: 100%;
	height: 100%;
	overflow: hidden;
	margin: 0;
	font-family: "微软雅黑";
}
#collapse{
	position: fixed;
	left:30%;
	top:30%;
	background:url(images/result.png) no-repeat 0 -142px;
	width:1%;
	height:12%;
}

#title{
	padding:3% 0;
}
</style>
</head>
<body>
	<div id="wai" style="float: left;height:100%; width: 30%;background-color:#eee; overflow-y: scroll;">
		<div id="title">
			<label class="control-label col-sm-1" for="txt_search_statu">起点:</label>
			<div class="col-sm-3">
					<input type="text" id="startAddress" class="form-control"/>
			</div>
			<label class="control-label col-sm-1" for="txt_search_statu">终点:</label>
			<div class="col-sm-3">
					<input type="text" class="form-control" id="arriveAddress"/>
			</div>
			
			<button id="search" class="btn btn-primary">查询</button>
		</div>
		<div id="log"></div>
	</div>
	<div id="container" style="float: right; width: 70%;"></div>
	<div id="collapse">
    </div>
	<script type="text/javascript">
		var map = new BMap.Map("container");
		map.centerAndZoom(new BMap.Point(113.010532,28.140207), 14);
		var transit = new BMap.TransitRoute(map, {
			renderOptions : {
				map : map,
				autoViewport : true,
				panel : "log"
			},
			// 配置跨城公交的换成策略为优先出发早
			intercityPolicy : BMAP_INTERCITY_POLICY_EARLY_START,
			// 配置跨城公交的交通方式策略为飞机优先
			transitTypePolicy : BMAP_TRANSIT_TYPE_POLICY_TRAIN
		});
		map.enableScrollWheelZoom(true);     //开启鼠标滚轮缩放
		map.addControl(new BMap.NavigationControl());    
		map.addControl(new BMap.ScaleControl());    
		map.addControl(new BMap.OverviewMapControl());    
		map.addControl(new BMap.MapTypeControl());  
		$("#search").click(function(){
			map.clearOverlays();
			var startAddress = $("#startAddress").val();
			var arriveAddress = $("#arriveAddress").val();
			if(startAddress!=null && startAddress != ""&&arriveAddress!=null && arriveAddress != ""){
				var geoc = new BMap.Geocoder();
				geoc.getPoint(startAddress, function(start) {
					geoc.getPoint(arriveAddress, function(end) {
						transit.search(start, end);
					});
				});
			}else if(startAddress!=null && startAddress != ""){
				var local = new BMap.LocalSearch(map, {
					renderOptions:{map: map}
				});
				local.search(startAddress);
			}else if(arriveAddress!=null && arriveAddress != ""){
				var local = new BMap.LocalSearch(map, {
					renderOptions:{map: map}
				});
				local.search(arriveAddress);
			}
		});
		$("#collapse").click(function(){
			if($("#wai").width()>0){
				$("#wai").css("width","0");
				$("#container").css("width","100%");
				$("#collapse").css("left","0");
				$("#collapse").css("background","url(image/result.png) no-repeat 0 -242px");
			}else{
				$("#wai").css("width","30%");
				$("#container").css("width","70%");
				$("#collapse").css("left","30%");
				$("#collapse").css("background","url(image/result.png) no-repeat 0 -142px");
			}
		});

		/*定点查询*/
		/* var start = "";
		var startSearch = new BMap.LocalSearch(map);
		startSearch.setSearchCompleteCallback(function (searchResult) {
			var poi = searchResult.getPoi(0);
			start = new BMap.Point(poi.point.lng, poi.point.lat);
			map.centerAndZoom(poi.point, 13);
		});
		startSearch.search("长沙");
		
		var end = "";
		var endSearch = new BMap.LocalSearch(map);
		endSearch.setSearchCompleteCallback(function (searchResult) {
			var poi = searchResult.getPoi(0);
			end = new BMap.Point(poi.point.lng, poi.point.lat);
			map.centerAndZoom(poi.point, 13);
		});
		endSearch.search("永州"); */
	</script>
</body>
</html>
