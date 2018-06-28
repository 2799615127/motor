<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">	
	<meta name="description" content="这是一个 index 页面">
	<meta name="keywords" content="index">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
	<meta name="renderer" content="webkit">
	<meta http-equiv="Cache-Control" content="no-siteapp" />
	<title>noob速递--后台管理首页</title>
	<link rel="icon" type="image/png" href="assets/i/favicon.png">
	<link rel="apple-touch-icon-precomposed" href="assets/i/app-icon72x72@2x.png">
	<meta name="apple-mobile-web-app-title" content="Amaze UI" />
	<link rel="stylesheet" href="assets/css/amazeui.min.css"/>
	<link rel="stylesheet" href="assets/css/admin.css">
	<link rel="stylesheet" type="text/css" href="css/demo.css" />
	<link rel="stylesheet" type="text/css" href="css/ns-default.css" />
	<link rel="stylesheet" type="text/css" href="css/ns-style-other.css" />
	<style type="text/css">
		#myModal{
        	height: 700px;
        }
        
        a.serverMessageCon:link{
		  background-color: ;
		  text-decoration: none;
		}
		a.serverMessageCon:hover{
		  background-color: ;
		  text-decoration: none;
		}
		a.serverMessageCon:active{
		  background-color: ;
		  text-decoration: none;
		}
		a.serverMessageCon:visited{
		  background-color: ;
		  text-decoration: none;
		}
		.alert{
        	width:100%;
        	position: fixed;
        	text-align:right;
        	height: 33px;
        	font-size: 18px;
        	padding-top:5px;
        	bottom: 0px;
        	background: #006666;
        }
        
        #myPopover{
        	border:none;
        	line-height:1;
        	background: white;
        	color: #72BF7B;
        	font-size:15px;
        }
	</style>
	<script src="js/modernizr.custom.js"></script>
	<script src="js/classie.js"></script>
	<script src="js/notificationFx.js"></script>
	<!-- <script src="js/popover.js"></script> -->
	
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/app.js"></script>
	<script src="assets/js/amazeui.min.js"></script>
	<script type="text/javascript">
	   //$("[rel=tooltip]").tooltip();
    	$(function(){
    		serverSendMessage();
			findResourceByUserName();
			findRoleByUserName();
    		
			jQuery(".sideMenu").slide({
				titCell:"h3", //鼠标触发对象
				targetCell:"ul", //与titCell一一对应，第n个titCell控制第n个targetCell的显示隐藏
				effect:"slideDown", //targetCell下拉效果
				delayTime:300 , //效果时间
				triggerTime:150, //鼠标延迟触发时间（默认150）
				defaultPlay:false,//默认是否执行效果（默认true）
				returnDefault:true //鼠标从.sideMen移走后返回默认状态（默认false）
			});
			
			jQuery(".deliveryMenu").slide({
				titCell:"h4", //鼠标触发对象
				targetCell:"dl", //与titCell一一对应，第n个titCell控制第n个targetCell的显示隐藏
				effect:"slideDown", //targetCell下拉效果
				delayTime:300 , //效果时间
				triggerTime:150, //鼠标延迟触发时间（默认150）
				defaultPlay:false,//默认是否执行效果（默认true）
				returnDefault:true //鼠标从.sideMen移走后返回默认状态（默认false）
			});
			
    		$('.demo-cancel-click').click(function(){return false;});
    		$(".menuTab").click(function(){
        		var id = $(this).text();
            	var url = $(this).attr("title");
            	$(".tab-title").css("color","#0088CC");
            	$(".nav-tabs li").css("border","none");
            	
            	var flag = true;
            	for(var i=0;i<$(".tab-title").length;i++){
            		if($($(".tab-title")[i]).attr("id")===url){
            			$($(".tab-title")[i]).css({"color":"black"});
            			flag = false; 
            		}
            	}
            	if(flag){
            		$('iframe').attr("src",url);
            		var strHtml = "<li>"
            			+"<a id='"+url+"' style='color:black;' class='tab-title' onclick='menuAClick(this)' href='#myModal' data-toggle='tab'>"
            			+"<button type='button' class='am-btn am-btn-default am-radius am-btn-xs'>"+id+"</button>"
            			+"</a>"
            			+"<a href='#' name='"+url+"' onclick='closeBtn(this)' class='am-close am-close-spin' >×</a>"
            			+"</li>";
            		$(".nav-tabs").append(strHtml);
            		
            		$("#"+url).parent().css({
                		"border": "1px solid #CCC",
    	            	"border-top-left-radius": "2px",
    	            	"border-top-right-radius": "2px"
                	});
            	}else{
            		$('iframe').attr("src",url);
            	}
	        	return false;
        	});
	    });
    	
    	var serverSendMessage = function(){
    		if(typeof(EventSource)!=="undefined"){
  			  var source=new EventSource("/noob/disseminate/serverSendMessage.action");
  			  source.onmessage=function(event){
  				var data = event.data;
  				
  				if(data != $("#messageCount").val()){
  					var response = null;
  					//异步同步数据库
						$.ajax({
							url:"/noob/disseminate/findAllDisseminate.action",
							type:"post",
							data:{"start":0,
								"pageSize":1,
								"status":0},
							async:false,
							success:function(responseData){
								response = responseData.rows;
							}
						});
  					var svgshape = document.getElementById( 'notification-shape' );
  					// create the notification
  					var notification = new NotificationFx({
  						wrapper : svgshape,
  						message: "<p>有新通知:</p>"+
							  "<p>"+response[0].disseminateAbstract+
							  "&nbsp;&nbsp;"+
							  "<button class='am-btn am-btn-success' id='myPopover'>"+
  					  		  "查看详情</button></p>",
  						layout : 'other',
  						effect : 'loadingcircle',
  						ttl : 60000,
  						type : 'notice', // notice, warning or error
  						onClose : function() {
  							//bttn.disabled = false;
  						}
  					});

  					$('#myPopover').popover({
  		  				content: response[0].disseminateContent,
  		  				trigger: 'hover focus'
  		  			});
  					
  					// show the notification
  					notification.show();

  					// disable the button (for demo purposes only)
  					this.disabled = true;
  					
  					$("#messageCount").val(data);
  				}		  
  			  };
  			}else{
  				alert("浏览器不兼容");
  			}
    	}
    	
    	var findResourceByUserName = function(){
    		//获得某个用户下所分配的一级资源
    		$.ajax({
    			url:"sys/findResourceByUserNameQuery.action",
				type:"post",
				data:{"userName":"${sessionScope.user.userName}"},
				async:false,
				success:function(response){
					var html = "";
					for(var i=0;i<response.length;i++){
						var resource = response[i];
						html = "<h3 class='"+resource.code+"'><em></em> <a href='#'>"+resource.resourceName+"</a></h3>"
							+"<ul id='"+resource.resourceId+"'></ul>";
						$(".deliveryMenu").append(html);
								
						var childResList = resource.childResList;
						for(var j=0;childResList!=null && j<childResList.length;j++){
							var secondResouce = childResList[j];
							if(secondResouce.childResList==null||secondResouce.childResList==""){
								var location = paramName(secondResouce.location);
								var liHtml = "<li><a id='"+secondResouce.resourceId+"' class='menuTab' href='#' title='"+location+"'>"+secondResouce.resourceName+"</a></li>";
								$("#"+resource.resourceId).append(liHtml);
							}else{
								if(secondResouce.childResList[0].resourceTypeName=="btn"){
									var location = paramName(secondResouce.location);
									var liHtml = "<li><a id='"+secondResouce.resourceId+"' class='menuTab' href='#' title='"+location+"'>"+secondResouce.resourceName+"</a></li>";
									$("#"+resource.resourceId).append(liHtml);
								}else if(secondResouce.childResList[0].resourceTypeName=="menu"){
								    var secondHtml = "<li><h4><em></em> <a href='#'>"+secondResouce.resourceName+"</a></h4></li>"
								    			+"<dl id='"+secondResouce.resourceId+"'></dl>";
					            	$("#"+resource.resourceId).append(secondHtml);
					            		
					            	for(var k=0;secondResouce.childResList!=null && k<secondResouce.childResList.length;k++){
					            		var threeResource = secondResouce.childResList[k];
					            		var location = paramName(threeResource.location);
					            		var threeHtml = "<dd><a id='"+secondResouce.resourceId+"' class='menuTab' href='#' title="
					            					+location
					            					+">"
					            					+threeResource.resourceName
					            					+"</a></dd>";
					            		$("#"+secondResouce.resourceId).append(threeHtml);
					            	}
								}
							}
						}
					}
				}
    		});
    		
    		//获得某个用户下所分配的单独资源，并且这些单独资源的父资源未被分配给这个用户
    		$.ajax({
    			url:"sys/findAloneResourceByUserNameQuery.action",
				type:"post",
				data:{"userName":"${sessionScope.user.userName}"},
				async:false,
				success:function(response){
					for(var i=0;i<response.length;i++){
						var resource = response[i];
						if(resource.keyword=="2"){
							if($("#"+resource.parentId).attr("id")==undefined){
								var firstResource = "";
								$.ajax({
									url:"sys/findResourceByIdQuery.action",
									type:"post",
									data:{"resourceId":resource.parentId},
									async:false,
									success:function(response){
										firstResource = response;
									}
								});
								html = "<h3 class='"+firstResource.code+"'><em></em> <a href='#'>"+firstResource.resourceName+"</a></h3>"
									+"<ul id='"+firstResource.resourceId+"'></ul>";
								$(".deliveryMenu").append(html);
								
								var childResList = resource.childResList;
								if(childResList==null || childResList=="" || childResList[0].resourceTypeName=="btn"){
									var location = paramName(resource.location);
									var liHtml = "<li><a id='"+resource.resourceId+"' class='menuTab' href='#' title='"+location+"'>"+resource.resourceName+"</a></li>";
									$("#"+firstResource.resourceId).append(liHtml);
								}else{
									var secondHtml = "<li><h4><em></em> <a href='#'>"+resource.resourceName+"</a></h4></li>"
								    			+"<dl id='"+resource.resourceId+"'></dl>";
					            	$("#"+firstResource.resourceId).append(secondHtml);
					            		
					            	for(var j=0;resource.childResList!=null && j<resource.childResList.length;j++){
					            		var threeResource = resource.childResList[j];
					            		var location = paramName(threeResource.location);
					            		var threeHtml = "<dd><a id='"+threeResource.resourceId+"' class='menuTab' href='#' title="
					            					+location
					            					+">"
					            					+threeResource.resourceName
					            					+"</a></dd>";
					            		$("#"+resource.resourceId).append(threeHtml);
					            	}
								}
							}else{
								var childResList = resource.childResList;
								if(childResList==null || childResList=="" || childResList[0].resourceTypeName=="btn"){
									var location = paramName(resource.location);
									var liHtml = "<li><a id='"+resource.resourceId+"' class='menuTab' href='#' title='"+location+"'>"+resource.resourceName+"</a></li>";
									$("#"+resource.parentId).append(liHtml);
								}else{
									var secondHtml = "<li><h4><em></em> <a href='#'>"+resource.resourceName+"</a></h4></li>"
								    			+"<dl id='"+resource.resourceId+"'></dl>";
					            	$("#"+resource.parentId).append(secondHtml);
					            		
					            	for(var j=0;resource.childResList!=null && j<resource.childResList.length;j++){
					            		var threeResource = resource.childResList[j];
					            		var location = paramName(threeResource.location);
					            		var threeHtml = "<dd><a id='"+threeResource.resourceId+"' class='menuTab' href='#' title="
					            					+location
					            					+">"
					            					+threeResource.resourceName
					            					+"</a></dd>";
					            		$("#"+resource.resourceId).append(threeHtml);
					            	}
								}
							}
						}else if(resource.keyword=="3"){
							if($("#"+resource.parentId).attr("id")==undefined){
								var secondResource = "";
								$.ajax({
									url:"sys/findResourceByIdQuery.action",
									type:"post",
									data:{"resourceId":resource.parentId},
									async:false,
									success:function(response){
										secondResource = response;
									}
								});
								
								if($("#"+secondResource.parentId).attr("id")==undefined){
									var firstResource = "";
									$.ajax({
										url:"sys/findResourceByIdQuery.action",
										type:"post",
										data:{"resourceId":secondResource.parentId},
										async:false,
										success:function(response){
											firstResource = response;
										}
									});
									html = "<h3 class='"+firstResource.code+"'><em></em> <a href='#'>"+firstResource.resourceName+"</a></h3>"
										+"<ul id='"+firstResource.resourceId+"'></ul>";
									$(".deliveryMenu").append(html);
									
									if(resource.resourceTypeName=="menu"){
										var secondHtml = "<li><h4><em></em> <a href='#'>"+secondResource.resourceName+"</a></h4></li>"
									    			+"<dl id='"+secondResource.resourceId+"'></dl>";
						            	$("#"+firstResource.resourceId).append(secondHtml);
			            				
			            				var location = paramName(resource.location);
			            				var liHtml = "<dd><a id='"+resource.resourceId+"' class='menuTab' href='#' title='"+location+"'>"+resource.resourceName+"</a></dd>";
										$("#"+resource.parentId).append(liHtml);
									}else{
										var location = paramName(secondResource.location);
										var secondHtml = "<li><a id='"+secondResource.resourceId+"' class='menuTab' href='#' title='"+location+"'>"+secondResource.resourceName+"</a></li>";
										$("#"+secondResource.parentId).append(secondHtml);
									}
								}else{
									if(resource.resourceTypeName=="menu"){
										var secondHtml = "<li><h4><em></em> <a href='#'>"+secondResource.resourceName+"</a></h4></li>"
									    			+"<dl id='"+secondResource.resourceId+"'></dl>";
						            	$("#"+secondResource.parentId).append(secondHtml);
			            				
			            				var location = paramName(resource.location);
			            				var liHtml = "<dd><a id='"+resource.resourceId+"' class='menuTab' href='#' title='"+location+"'>"+resource.resourceName+"</a></dd>";
										$("#"+resource.parentId).append(liHtml);
									}else{
										var location = paramName(secondResource.location);
										var secondHtml = "<li><a id='"+secondResource.resourceId+"' class='menuTab' href='#' title='"+location+"'>"+secondResource.resourceName+"</a></li>";
										$("#"+secondResource.parentId).append(secondHtml);
									}
								}
							}else{
								if(resource.resourceTypeName=="menu"){
									var location = paramName(resource.location);
		            				var liHtml = "<dd><a id='"+resource.resourceId+"' class='menuTab' href='#' title='"+location+"'>"+resource.resourceName+"</a></dd>";
									$("#"+resource.parentId).append(liHtml);
								}
							}
						}
					}
				}
    		});
    	}
    	
    	function paramName(locationData){
    		var locArray = locationData.split("?");
			var location = locArray[0];
			for(var i=1; i<locArray.length; i++){
				if(i==1){
					if(locArray[i]=="userName"){
						location = location+"?userName=${sessionScope.user.userName}";
					}else if(locArray[i]=="orgName"){
						location = location+"?orgName=${sessionScope.user.orgName}";
					}else if(locArray[i]=="userId"){
						location = location+"?userId=${sessionScope.user.userId}";
					}else if(locArray[i]=="orgId"){
						location = location+"?orgId=${sessionScope.user.orgId}";
					}
				}else{
					if(locArray[i]=="userName"){
						location = location+"&userName=${sessionScope.user.userName}";
					}else if(locArray[i]=="orgName"){
						location = location+"&orgName=${sessionScope.user.orgName}";
					}else if(locArray[i]=="userId"){
						location = location+"&userId=${sessionScope.user.userId}";
					}else if(locArray[i]=="orgId"){
						location = location+"&orgId=${sessionScope.user.orgId}";
					}
				}
			}
			return location;
    	}
    	
    	var nav_list_click=function(obj){
    		var str = $(obj).children(".right-tree").attr("class");
			var oOper = $(obj).children(".right-tree");
			if(str=="right-tree glyphicon glyphicon-plus"){
				oOper.attr({"class":"right-tree glyphicon glyphicon-minus"});
			}
			if(str=="right-tree glyphicon glyphicon-minus"){
				oOper.attr({"class":"right-tree glyphicon glyphicon-plus"});
			}
    	}
    	
    	function menuAClick(obj){
    		var url = $(obj).attr("id");
    		$('iframe').attr("src",url);
    		$(".tab-title").css("color","#0088CC");
        	$(".nav-tabs li").css("border","none");
        	$(obj).parent().css({
        	});
    		$(obj).css({
    			"color":"black",
    			"border":"none"
    		});
    	}
    	
    	function closeBtn(obj){
    		$(obj).parent().remove();
    		var url = $(obj).attr("name");
			if($('iframe').attr("src")==url){
				var last = $(".nav-tabs li").length-1;
				
				url = $($(".tab-title")[last]).attr("id");
				$('iframe').attr("src",url);
				
				$($(".tab-title")[last]).parent().css({
	        	});
				
				$($(".tab-title")[last]).css({
					"color":"black",
	    			"border":"none"
				});
			}
    	}
    	
    	function findRoleByUserName(){
    		$.ajax({
				url:"sys/findRoleByUserNameQuery.action",
				type:"post",
				data:{"userName":"${sessionScope.user.userName}"},
				success:function(response){
					$("#userRole").text(response.rows[0].roleName);
				}
			});
    	}
    </script>
</head>

<body>
	<header class="am-topbar admin-header">
	  <div class="am-topbar-brand">
	  	<img src="assets/i/logo.jpg" width="40" height="40" "/>
	  	<img src="assets/i/logo.png"/>
	  </div>
	  <div class="am-collapse am-topbar-collapse" id="topbar-collapse">
	    <ul class="am-nav am-nav-pills am-topbar-nav admin-header-list">
	   <li class="am-dropdown tognzhi" data-am-dropdown>
	  <button class="am-btn am-btn-primary am-dropdown-toggle am-btn-xs am-radius am-icon-bell-o" data-am-dropdown-toggle> 用户管理<span class="am-badge am-badge-danger am-round">1</span></button>
	  <ul class="am-dropdown-content">
	    <li class="am-dropdown-header">${sessionScope.user.userName}</li>	
	    <li><a href="#">消息<span class="am-badge am-badge-danger am-round">1</span></a></li>
	    <li><a href="logout.action">退出</a></li>	    
	  </ul>
	</li>
	      <li class="am-hide-sm-only" style="float: right;"><a href="javascript:;" id="admin-fullscreen"><span class="am-icon-arrows-alt"></span> <span class="admin-fullText">开启全屏</span></a></li>
	    </ul>
	  </div>
	</header>
	<div class="am-cf admin-main"> 
	
	<div class="nav-navicon admin-main admin-sidebar">
	    
	    
	    <div class="sideMenu am-icon-dashboard" style="color:#aeb2b7; margin: 10px 0 0 0;"> 欢迎<span id="userRole"></span>：${sessionScope.user.userName}</div>
	    <div class="sideMenu">
		    <div class="deliveryMenu">
		    </div>
	    </div>
	</div>
	<div class=" admin-content">
			<div class="daohang">
				<ul class="nav-tabs">
					<li>
						<a id="jfreechar.jsp" style='color:black;' class="tab-title" onclick="menuAClick(this)" href="#myModal" data-toggle="tab">
							<button type="button" class="am-btn am-btn-default am-radius am-btn-xs" > 首页</button>
						</a> 
					</li>										
				</ul>
	</div>
	<div class="admin">
	   <iframe id="myModal" src="jfreechar.jsp" frameBorder="0" width="100%"> 
	   </iframe>
	   <script type="text/javascript">jQuery(".slideTxtBox").slide();</script> 
	</div>
	</div>
	</div>
	<input type="hidden" id="messageCount" value="0"/>
  	<div class="notification-shape shape-progress" id="notification-shape" style="font-size:16px;">
		<svg width="70px" height="70px">
			<path d="m35,2.5c17.955803,0 32.5,14.544199 32.5,32.5c0,17.955803 -14.544197,32.5 -32.5,32.5c-17.955803,0 -32.5,-14.544197 -32.5,-32.5c0,-17.955801 14.544197,-32.5 32.5,-32.5z"/>
		</svg>
	</div>
	<div class="alert alert-block alert-success">
		<i class="icon-ok green"></i> 欢迎使用 <strong class="green">
			noob速递后台管理系统 <small>(v1.0)</small> 
			目前共有<span class="salient"> ${ sessionScope.userCount } </span>人在线 
		</strong>
	</div>
</body>
</html>