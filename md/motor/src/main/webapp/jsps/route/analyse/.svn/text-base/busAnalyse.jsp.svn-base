<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>noob is No.1</title>
<style type="text/css">
html {
	height: 100%;
}

body {
	height: 100%;
	margin: 0px;
	padding: 0px;
}

#container {
	height: 100%;
	width:70%;
	float: right;
}

#left{
	width:30%;
	height:100%;
	float:left;
	overflow-y:scroll;
	background: #EEE;
}

.anchorBL{
	display:none;
}
 
#log{
	margin: 7% 0 0 0;
}

#input{
	padding:3% 0;
}

#collapse{
	position: fixed;
	left:30%;
	top:30%;
	background:url(images/result.png) no-repeat 0 -142px;
	width:1%;
	height:12%;
}

</style>
<script type="text/javascript"
	src="http://api.map.baidu.com/api?v=2.0&ak=cHEzHzIG3PblnQQgGNbm4QrZirnk9lYd">
	//v2.0版本的引用方式：src="http://api.map.baidu.com/api?v=2.0&ak=您的密钥"
</script>
<script src="${ pageContext.request.contextPath }/js/jquery-3.1.1.min.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="${ pageContext.request.contextPath }/js/bootstrap/css/bootstrap.min.css">
<script type="text/javascript" src="${ pageContext.request.contextPath }/js/bootstrap/js/bootstrap.min.js"></script>
</head>

<body>
	<div id="left" class="panel-collapse collapse in">
		<div id="input">
			<label class="control-label col-sm-1" for="txt_search_statu">起点:</label>
			<div class="col-sm-3">
				<input type="text" class="form-control" id="startCity">
			</div>
			<label class="control-label col-sm-1" for="txt_search_statu">终点:</label>
			<div class="col-sm-3">
				<input type="text" class="form-control" id="endCity">
			</div>
			<div class="col-sm-3">
				<button type="button" id="query-btn"
					class="btn btn-primary">查询</button>
			</div>
		</div>
		<div id="log"></div>
	</div>
	<div id="container"></div>
	<div id="collapse">
    </div>
	<script type="text/javascript">
		var map = new BMap.Map("container");    
		map.centerAndZoom(new BMap.Point(113.010532,28.140207), 18); 
		var driving = new BMap.DrivingRoute(map, {    
		    renderOptions: {    
		        map: map,    
		        autoViewport: true,
		        panel:"log"
		    }    
		});  
		
		map.addControl(new BMap.NavigationControl());    
		map.addControl(new BMap.ScaleControl());    
		map.addControl(new BMap.OverviewMapControl());    
		map.addControl(new BMap.MapTypeControl());  
		
		$(function(){
			$("#collapse").click(function(){
				if($("#left").width()>0){
					$("#left").css("width","0");
					$("#container").css("width","100%");
					$("#collapse").css("left","0");
					$("#collapse").css("background","url(img/result.png) no-repeat 0 -242px");
				}else{
					$("#left").css("width","30%");
					$("#container").css("width","70%");
					$("#collapse").css("left","30%");
					$("#collapse").css("background","url(img/result.png) no-repeat 0 -142px");
				}
			});
			
			$("#query-btn").click(function(){
				map.clearOverlays();
				var startCity = $("#startCity").val();
				var endCity = $("#endCity").val();
				if((startCity!=null&&startCity!="") && (endCity!=null&&endCity!="")){
					var geoc = new BMap.Geocoder();
					geoc.getPoint(startCity, function(start) {
						geoc.getPoint(endCity, function(end) {
							driving.search(start, end);
						});
					});
				}else if(startCity!=null && startCity != ""){
					var local = new BMap.LocalSearch(map, {
						renderOptions:{map: map}
					});
					local.search(startCity);
				}else if(endCity!=null && endCity != ""){
					var local = new BMap.LocalSearch(map, {
						renderOptions:{map: map}
					});
					local.search(endCity);
				}
			});
		});
		
		map.enableScrollWheelZoom(true);
	</script>
</body>
</html>