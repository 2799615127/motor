<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>noob速递--后台管理首页</title>
	<!-- 新增 -->
	<link rel="stylesheet" type="text/css" href="css/demo.css" />
	<link rel="stylesheet" type="text/css" href="css/ns-default.css" />
	<link rel="stylesheet" type="text/css" href="css/ns-style-other.css" />
	<!-- 新增 -->
	<link rel="icon" href="index/images/logo.jpg" type="image/x-icon">
	<link rel="stylesheet" type="text/css" href="index/lib/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="index/stylesheets/theme.css">
    <link rel="stylesheet" href="index/lib/font-awesome/css/font-awesome.css">
	
    <script src="index/lib/jquery-3.1.1.min.js" type="text/javascript"></script>
    
    <script src="index/lib/bootstrap/js/bootstrap.js"></script>
    <!-- 新增 -->
    <script src="js/modernizr.custom.js"></script>
	<script src="js/classie.js"></script>
	<script src="js/notificationFx.js"></script>
	<script src="js/popover.js"></script>
	<!-- 新增 -->
    <!-- <link rel="stylesheet" type="text/css" href="js/bootstrap-tab/css/bootstrap-tab.css">
	<script src="js/bootstrap-tab/js/bootstrap-tab.js" type="text/javascript"></script> -->
    
    <style type="text/css">
    	.navbar-context{
    		width:90%;
    		margin:auto;
    	}
        #line-chart {
            height:300px;
            width:800px;
            margin: 0px auto;
            margin-top: 1em;
        }
        .brand { font-family: georgia, serif; }
        .brand .first {
            color: #ccc;
            font-style: italic;
            font-size: 30px;
        }
        .brand .second {
            color: #fff;
            font-style: italic;
            font-size: 30px;
            font-weight: bold;
        }
        .right-tree{
        	float: right;
        }
        
        a{
        	text-decoration: none;
        }
        
        .nav-list li{
        	width:95%;
        	margin:auto;
        }
        
        .nav-list .nav-header{
        	height:auto;
        }
        
        #myModal{
        	height: 700px;
        }
        
        .nav-tabs li{
        	border: 1px solid #CCC;
        	border-top-left-radius: 2px;
        	border-top-right-radius: 2px;
        }
        
        .tab-title{
        	float: left;
        }
        
        .close{
        	float: right;
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
    </style>
    
    <script type="text/javascript">
	    $("[rel=tooltip]").tooltip();
    	$(function(){
    			
    			//新增
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
    						message : '<p>有新通知:</p>'+
    								  '<p>'+response[0].disseminateAbstract+
    								  '&nbsp;&nbsp;<a id="serverMessageCon"tabindex="0" class="serverMessageCon" role="button" data-toggle="popover" data-trigger="focus" title="'+response[0].disseminateAbstract+'" data-content="'+response[0].disseminateContent+'">查看详情</a>'
    								  +'</p>',
    						layout : 'other',
    						effect : 'loadingcircle',
    						ttl : 60000,
    						type : 'notice', // notice, warning or error
    						onClose : function() {
    							//bttn.disabled = false;
    						}
    					});

    	    			$('[data-toggle="popover"]').popover();
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
    			//新增
    		
    		$('.demo-cancel-click').click(function(){return false;});
    		
    		$(".menuTab").click(function(){
        		var id = $(this).text();
            	var url = $(this).attr("title");
            	$(".tab-title").css("color","#0088CC");
            	$(".nav-tabs li").css("border","none");
            	
            	var flag = true;
            	for(var i=0;i<$(".tab-title").length;i++){
            		if($($(".tab-title")[i]).attr("id")===url){
            			$($(".tab-title")[i]).parent().css({
            				"border": "1px solid #CCC",
        	            	"border-top-left-radius": "2px",
        	            	"border-top-right-radius": "2px"
            			});
            			$($(".tab-title")[i]).css({"color":"black"});
            			flag = false; 
            		}
            	}
            	if(flag){
            		$('iframe').attr("src",url);
            		var strHtml = "<li>"
            			+"<a id='"+url+"' style='color:black;' class='tab-title' onclick='menuAClick(this)' href='#myModal' data-toggle='tab'>"+id
            			+"</a>"
            			+"<button class='close' onclick='closeBtn(this)' name='"+url+"'>&times;</button>"
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
        		"border": "1px solid #CCC",
            	"border-top-left-radius": "2px",
            	"border-top-right-radius": "2px"
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
	        		"border": "1px solid #CCC",
	            	"border-top-left-radius": "2px",
	            	"border-top-right-radius": "2px"
	        	});
				
				$($(".tab-title")[last]).css({
					"color":"black",
	    			"border":"none"
				});
			}
    	}
    </script>
  </head>
  <!-- 修改style -->
  <body style="background-color: #C0C0C0;">
  <!-- 修改style -->
  	<input type="hidden" id="messageCount" value="0"/>
  	<div class="notification-shape shape-progress" id="notification-shape" >
		<svg width="70px" height="70px">
			<path d="m35,2.5c17.955803,0 32.5,14.544199 32.5,32.5c0,17.955803 -14.544197,32.5 -32.5,32.5c-17.955803,0 -32.5,-14.544197 -32.5,-32.5c0,-17.955801 14.544197,-32.5 32.5,-32.5z"/>
		</svg>
	</div>
    <div class="navbar">
        <div class="navbar-inner">
        	<div class="navbar-context">
                <ul class="nav pull-right">
                    <li class="divider visible-phone"></li>
                    <li><a tabindex="-1" href="logout.action">退出用户</a></li>
                    <li id="fat-menu" class="dropdown">
                        <a href="#" role="button" class="dropdown-toggle" data-toggle="dropdown">
                            <i class="icon-user"></i>
                            <c:choose>
								<c:when test="${empty user.userName}">
									<a href="login.jsp">请先登录</a>
								</c:when>
								<c:otherwise>
									<shiro:principal/>
								</c:otherwise>
							</c:choose>
                        </a>
                    </li>
                </ul>
                <a class="brand" href="index.jsp">
                	<span class="first">
                		<img src="index/images/logo.jpg" height="27%" width="27%"/>
                		noob
                	</span> 
                	<span class="second">速递</span>
                </a>
        	</div>
        </div>
    </div>
    
    <div class="sidebar-nav">
        <a href="#sys-menu" class="nav-header collapsed" data-toggle="collapse"> 系统管理 <i class="icon-chevron-up"></i></a>
        <ul id="sys-menu" class="nav nav-list collapse">
            <li><a class="menuTab" href="#" title="jsps/sys/user/jsp/userList.jsp">用户管理</a></li>
            <li><a class="menuTab" href="#" title="jsps/sys/authority/jsp/resource.jsp">资源管理</a></li>
            <li><a class="menuTab" href="#" title="jsps/sys/authority/jsp/role.jsp">角色管理</a></li>
            <li><a class="menuTab" href="#" title="jsps/sys/authority/jsp/authority.jsp">权限分配</a></li>
            <li><a class="menuTab" href="#" title="jsps/sys/log/log.jsp">操作日志</a></li>
        </ul>
        
        <a href="#base-menu" class="nav-header collapsed" data-toggle="collapse"> 基本设置 <i class="icon-chevron-up"></i></a>
        <ul id="base-menu" class="nav nav-list collapse">
            <li><a class="menuTab" href="#" title="jsps/base/baseFiles/jsp/baseFiles.jsp">基础档案设置</a></li>
            <li><a class="menuTab" href="#" title="jsps/base/ReceivingStandard/ReceivingStandard.jsp?userName=${ user.userName }">收派标准</a></li>
        	<li><a class="menuTab" href="#" title="jsps/base/bus/bus.jsp?userName=${ user.userName }">班车设置</a></li>
        	<li><a class="menuTab" href="#" title="jsps/base/staff/jsps/staff.jsp">取派设置/替班</a></li>
        	<li><a class="menuTab" href="#" title="jsps/base/region/region.jsp">区域设置</a></li>
        	<li><a class="menuTab" href="#" title="jsps/base/subarea/jsp/subarea.jsp">管理分区</a></li>
        	<li><a class="menuTab" href="#" title="jsps/base/ripArea/pageQueryRipArea.jsp">管理定区/调度排班</a></li>
        	<li><a class="menuTab" href="#" title="jsps/base/deliveryTimeManage/jsp/deliveryTimeManage.jsp">取派时间管理</a></li>
        	<li><a class="menuTab" href="#" title="jsps/base/customer/customer.jsp">客户管理</a></li>
        	<li><a class="menuTab" href="#" title="jsps/base/organization/organization.jsp">组织管理</a></li>
        </ul>
        
        <a href="#delivery-menu" class="nav-header collapsed" data-toggle="collapse"> 取派管理 <i class="icon-chevron-up"></i></a>
        <ul id="delivery-menu" class="nav nav-list collapse">
            <li class="nav-list-second">
            	<a href="#accept-menu" id="nav-list-second1" data-toggle="collapse">
            		受理
            		<span title="open" class="right-tree glyphicon glyphicon-plus"></span>
            	</a>
            	<ul id="accept-menu" class="nav nav-list collapse">
		            <li><a class="menuTab" href="#" title="jsps/delivery/receipt/business/jsps/recsipt.jsp?userName=${ user.userName }&orgName=${ user.orgName }">业务受理</a></li>
		            <li><a class="menuTab" href="#" title="jsps/delivery/receipt/fastWorkSpeedy/fastWorkSpeedy.jsp">工作单快速录入</a></li>
		            <li><a class="menuTab" href="#" title="jsps/delivery/receipt/jobListEntering/jobListEntering.jsp">工作单录入</a></li>
		            <li><a class="menuTab" href="#" title="jsps/delivery/receipt/jobsImport/jobsImport.jsp">工作单导入</a></li>
		            <li><a class="menuTab" href="#" title="">工作单查询</a></li>
        		</ul>
            </li>
            
            <li class="nav-list-second">
            	<a href="#dispatch-menu" id="nav-list-second2" data-toggle="collapse">
            		调度
            		<span title="open" class="right-tree glyphicon glyphicon-plus"></span>
            	</a>
            	<ul id="dispatch-menu" class="nav nav-list collapse">
		            <li><a class="menuTab" href="#" title="jsps/delivery/dispatch/checkMachineTurnSingle/checkMachineTurnSingle.jsp">查台转单</a></li>
		            <li><a class="menuTab" href="#" title="jsps/delivery/dispatch/artificialDispatch/jsp/artificialDispatch.jsp">人工调度</a></li>
		            <li><a class="menuTab" href="#" title="">工作单打印</a></li>
		            <li><a class="menuTab" href="#" title="">签收录入</a></li>
		            <li><a class="menuTab" href="#" title="">取消签收录入申请确认</a></li>
        			<li><a class="menuTab" href="#" title="jsps/delivery/dispatch/disseminate/jsp/disseminate.jsp?userId=${user.userId}">宣传任务</a></li>
        		</ul>
            </li>
            
            <li class="nav-list-second">
            	<a href="#return-menu" id="nav-list-second3" data-toggle="collapse">
            		返货
            		<span title="open" class="right-tree glyphicon glyphicon-plus"></span>
            	</a>
            	<ul id="return-menu" class="nav nav-list collapse">
		            <li><a class="menuTab" href="#" title="jsps/delivery/returncargo/applyReturnCargo/jsp/applyReturnCargo.jsp">返货申请</a></li>
		            <li><a class="menuTab" href="#" title="jsps/delivery/returncargo/applyReturnConfirm/jsp/applyReturnConfirm.jsp">返货申请确认</a></li>
		            <li><a class="menuTab" href="#" title="jsps/delivery/returncargo/createRetrunGoods/jsp/returnGoods.jsp">生成返货单</a></li>
		            <li><a class="menuTab" href="#" title="jsps/delivery/returncargo/differentShift/jsp/differentShift.jsp">异调工作单</a></li>
        		</ul>
            </li>
            
            <li class="nav-list-second">
            	<a href="#pack-menu" id="nav-list-second4" data-toggle="collapse">
            		包装
            		<span class="right-tree glyphicon glyphicon-plus"></span>
            	</a>
            	<ul id="pack-menu" class="nav nav-list collapse">
		            <li><a class="menuTab" href="#" title="jsps/delivery/pack/packNuclearManipulation.jsp?username=${user.userName}&userId=${user.userId}">核重操作</a></li>
		            <li><a class="menuTab" href="#" title="">核重监控</a></li>
		            <li><a class="menuTab" href="#" title="">条码打印</a></li>
		            <li><a class="menuTab" href="#" title="">包装信息录入</a></li>
		            <li><a class="menuTab" href="#" title="">包装信息查询</a></li>
        		</ul>
            </li>
            
            <li class="nav-list-second">
            	<a href="#sign-menu" id="nav-list-second5" data-toggle="collapse">
            		签单
            		<span class="right-tree glyphicon glyphicon-plus"></span>
            	</a>
            	<ul id="sign-menu" class="nav nav-list collapse">
		            <li><a class="menuTab" href="#" title="">签单信息录入</a></li>
		            <li><a class="menuTab" href="#" title="">签单信息接收</a></li>
		            <li><a class="menuTab" href="#" title="">签单信息查询</a></li>
		            <li><a class="menuTab" href="#" title="">原单登记核销</a></li>
        		</ul>
            </li>
            
            <li class="nav-list-second">
            	<a href="#big-logistics-menu" id="nav-list-second6" data-toggle="collapse">
            		大物流
            		<span class="right-tree glyphicon glyphicon-plus"></span>
            	</a>
            	<ul id="big-logistics-menu" class="nav nav-list collapse">
		            <li><a class="menuTab" href="#" title="">大物流发货对照</a></li>
        		</ul>
            </li>
            
            <li class="nav-list-second">
            	<a href="#accept-query-menu" id="nav-list-second7" data-toggle="collapse">
            		受理查询
            		<span class="right-tree glyphicon glyphicon-plus"></span>
            	</a>
            	<ul id="accept-query-menu" class="nav nav-list collapse">
		            <li><a class="menuTab" href="#" title="">调度历史查询</a></li>
		            <li><a class="menuTab" href="#" title="">PDA短信取货查询</a></li>
		            <li><a class="menuTab" href="#" title="">网络工作单查询</a></li>
        		</ul>
            </li>
            
            <li class="nav-list-second">
            	<a href="#dispatch-query-menu" id="nav-list-second8" data-toggle="collapse">
            		调度查询
            		<span class="right-tree glyphicon glyphicon-plus"></span>
            	</a>
            	<ul id="dispatch-query-menu" class="nav nav-list collapse">
		            <li><a class="menuTab" href="#" title="jsps/delivery/dispatch/dispatchInquiry/dispatchControl.jsp">取派调度令监控</a></li>
		            <li><a class="menuTab" href="#" title="jsps/delivery/dispatch/dispatchInquiry/signForInquiry.jsp">签收查询</a></li>
		            <li><a class="menuTab" href="#" title="jsps/delivery/dispatch/dispatchInquiry/controlInquiry.jsp">取货监控查询</a></li>
        		</ul>
            </li>
            
            <li class="nav-list-second">
            	<a href="#cooperate-menu" id="nav-list-second9" data-toggle="collapse">
            		合作网络管理
            		<span class="right-tree glyphicon glyphicon-plus"></span>
            	</a>
            	<ul id="cooperate-menu" class="nav nav-list collapse">
		            <li><a class="menuTab" href="#" title="jsps/delivery/coopnetman/jsp/responsibilityNetworkSetting.jsp">责任网点设置</a></li>
		            <li><a class="menuTab" href="#" title="jsps/delivery/coopnetman/jsp/delegationQuery.jsp">委派查询</a></li>
		            <li><a class="menuTab" href="#" title="jsps/delivery/coopnetman/jsp/dispatchedQuery.jsp">受派查询</a></li>
		            <li><a class="menuTab" href="#" title="jsps/delivery/coopnetman/jsp/statisticalAnalysisOfDelegation.jsp">委派统计分析</a></li>
        		</ul>
            </li>
        </ul>
        
        <a href="#transfer-menu" class="nav-header collapsed" data-toggle="collapse"> 中转管理 <i class="icon-chevron-up"></i></a>
        <ul id="transfer-menu" class="nav nav-list collapse">
            <li><a href="index.html">Home</a></li>
        </ul>
        
        <a href="#route-menu" class="nav-header collapsed" data-toggle="collapse"> 路由管理 <i class="icon-chevron-up"></i></a>
        <ul id="route-menu" class="nav nav-list collapse">
            <li><a href="index.html">Home</a></li>
        </ul>
        
        <a href="#finance-menu" class="nav-header collapsed" data-toggle="collapse"> 财务管理 <i class="icon-chevron-up"></i></a>
        <ul id="finance-menu" class="nav nav-list collapse">
            <li><a href="index.html">Home</a></li>
        </ul>
        
        <a href="#manage-report-menu" class="nav-header collapsed" data-toggle="collapse"> 经营管理报表 <i class="icon-chevron-up"></i></a>
        <ul id="manage-report-menu" class="nav nav-list collapse">
            <li><a href="index.html">Home</a></li>
        </ul>
        
        <a href="#finance-report-menu" class="nav-header collapsed" data-toggle="collapse"> 财务管理报表 <i class="icon-chevron-up"></i></a>
        <ul id="finance-report-menu" class="nav nav-list collapse">
        	<li><a href="index.html">Home</a></li>
        </ul>
    </div>
    <div class="content">
    	<ul class="nav nav-tabs">
    		<li><a id="jfreechar.jsp" style='color:black;' class="tab-title" onclick="menuAClick(this)" href="#myModal" data-toggle="tab">首页</a></li>
		</ul>
	    <iframe id="myModal" src="jfreechar.jsp" frameBorder="0" width="100%"> 
			
	    </iframe>
    </div>
  </body>
</html>
