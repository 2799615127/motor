<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String timeId = request.getParameter("timeId");//用request得到
String description=request.getParameter("description");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js"></script>

<!-- bootstrap组件引用 -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/bootstrap/js/bootstrap.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/js/bootstrap/css/bootstrap.min.css">

<!-- bootstrap table组件以及中文包的引用 -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/bootstrap-table/bootstrap-table.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/js/bootstrap-table/bootstrap-table.css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/bootstrap-select/js/bootstrap-select.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/js/bootstrap-select/css/bootstrap-select.min.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/js/toastr/toastr.min.js"></script>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/toastr/toastr.min.css">
</head>

<body>
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal"
			aria-hidden="true">&times;</button>
		<div class="panel panel-success">
			<div class="panel-heading">
				<h3 class="panel-title">修改</h3>
			</div>
			<div class="panel-body">
				<form class="form-horizontal" onsubmit="return check()" role="form">
					<div class="form-group">
						<label for="firstname" class="col-sm-2 control-label">时间Id</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="timeId"
							  value="${param.timeId}" disabled="disabled">
						</div>
					</div>
					<div class="form-group">
						<label for="lastname" class="col-sm-2 control-label">平均上班时间</label>
						<div class="col-sm-10">
							<div class="col-sm-10">
								<label class="col-sm-3 control-label">小时：</label>
								<div class="col-sm-3">
									<select id="averageOnDutyTimeHr" style="width: 75px"
										class="form-control" onchange="selectOnchang(this)">
										 <option>07</option>
                                         <option>08</option>
                                         <option>09</option>
                                         <option>20</option>
                                         <option>21</option>
                                         <option>22</option>
									</select>
								</div>
								<label class="col-sm-3 control-label">分钟：</label>
								<div class="col-sm-3">
									<select id="averageOnDutyTimeMin" style="width: 75px"
										class="form-control" onchange="selectOnchang(this)">
										<option>00</option>
										<option>10</option>
										<option>20</option>
										<option>30</option>
										<option>40</option>
										<option>50</option>
										<option>60</option>
									</select>
								</div>
							</div>
						</div>
					</div>


					<div class="form-group">
						<label for="lastname" class="col-sm-2 control-label">平均下班时间</label>
						<div class="col-sm-10">
							<div class="col-sm-10">
								<label class="col-sm-3 control-label">小时：</label>
								<div class="col-sm-3">
									<select id="averageKnockOffTimeHr" style="width: 75px"
										class="form-control" onchange="selectOnchang(this)">
										 <option>19</option>
                                         <option>20</option>
                                         <option>21</option>
                                         <option>07</option>
                                         <option>08</option>
                                         <option>09</option>
									</select>
								</div>
								<label class="col-sm-3 control-label">分钟：</label>
								<div class="col-sm-3">
									<select id="averageKnockOffTimeMin" style="width: 75px"
										class="form-control" onchange="selectOnchang(this)">
										<option>00</option>
										<option>10</option>
										<option>20</option>
										<option>30</option>
										<option>40</option>
										<option>50</option>
										<option>60</option>
									</select>
								</div>
							</div>
						</div>
					</div>
					<div class="form-group">
						<label for="lastname" class="col-sm-2 control-label">周六上班时间</label>
						<div class="col-sm-10">
							<div class="col-sm-10">
								<label class="col-sm-3 control-label">小时：</label>
								<div class="col-sm-3">
									<select id="satOnDutyTimeHr" style="width: 75px"
										class="form-control" onchange="selectOnchang(this)">
										 <option>07</option>
                                         <option>08</option>
                                         <option>09</option>
                                         <option>20</option>
                                         <option>21</option>
                                         <option>22</option>
									</select>
								</div>
								<label class="col-sm-3 control-label">分钟：</label>
								<div class="col-sm-3">
									<select id="satOnDutyTimeMin" style="width: 75px"
										class="form-control" onchange="selectOnchang(this)">
										<option>00</option>
										<option>10</option>
										<option>20</option>
										<option>30</option>
										<option>40</option>
										<option>50</option>
										<option>60</option>
									</select>
								</div>
							</div>
						</div>
					</div>
					<div class="form-group">
						<label for="lastname" class="col-sm-2 control-label">周六下班时间</label>
						<div class="col-sm-10">
							<div class="col-sm-10">
								<label class="col-sm-3 control-label">小时：</label>
								<div class="col-sm-3">
									<select id="satKnockOffTimeHr" style="width: 75px"
										class="form-control" onchange="selectOnchang(this)">
										 <option>19</option>
                                         <option>20</option>
                                         <option>21</option>
                                         <option>07</option>
                                         <option>08</option>
                                         <option>09</option>
									</select>
								</div>
								<label class="col-sm-3 control-label">分钟：</label>
								<div class="col-sm-3">
									<select id="satKnockOffTimeMin" style="width: 75px"
										class="form-control" onchange="selectOnchang(this)">
										<option>00</option>
										<option>10</option>
										<option>20</option>
										<option>30</option>
										<option>40</option>
										<option>50</option>
										<option>60</option>
									</select>
								</div>
							</div>
						</div>
					</div>
					<div class="form-group">
						<label for="lastname" class="col-sm-2 control-label">周日上班时间</label>
						<div class="col-sm-10">
							<div class="col-sm-10">
								<label class="col-sm-3 control-label">小时：</label>
								<div class="col-sm-3">
									<select id="sundayOnDutyTimeHr" style="width: 75px"
										class="form-control" onchange="selectOnchang(this)">
										 <option>07</option>
                                         <option>08</option>
                                         <option>09</option>
                                         <option>20</option>
                                         <option>21</option>
                                         <option>22</option>
									</select>
								</div>
								<label class="col-sm-3 control-label">分钟：</label>
								<div class="col-sm-3">
									<select id="sundayOnDutyTimeMin" style="width: 75px"
										class="form-control" onchange="selectOnchang(this)">
										<option>00</option>
										<option>10</option>
										<option>20</option>
										<option>30</option>
										<option>40</option>
										<option>50</option>
										<option>60</option>
									</select>
								</div>
							</div>
						</div>
					</div>
					<div class="form-group">
						<label for="lastname" class="col-sm-2 control-label">周日下班时间</label>
						<div class="col-sm-10">
							<div class="col-sm-10">
								<label class="col-sm-3 control-label">小时：</label>
								<div class="col-sm-3">
									<select id="sundayKnockOffTimeHr" style="width: 75px"
										class="form-control" onchange="selectOnchang(this)">
										 <option>19</option>
                                         <option>20</option>
                                         <option>21</option>
                                         <option>07</option>
                                         <option>08</option>
                                         <option>09</option>
									</select>
								</div>
								<label class="col-sm-3 control-label">分钟：</label>
								<div class="col-sm-3">
									<select id="sundayKnockOffTimeMin" style="width: 75px"
										class="form-control" onchange="selectOnchang(this)">
										<option>00</option>
										<option>10</option>
										<option>20</option>
										<option>30</option>
										<option>40</option>
										<option>50</option>
										<option>60</option>
									</select>
								</div>
							</div>
						</div>
					</div>
					<div class="form-group">
						<label for="lastname" class="col-sm-2 control-label">描述</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="description"
								placeholder="${param.description}"
								 onfocus="if(this.value=='请输入描述')this.value=''" 
										onblur="if(this.value=='')this.value='请输入描述'">
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<div class="modal-footer">
		<button type="button" class="btn btn-primary" id="sub"
			data-dismiss="modal">提交更改</button>
		<button type="button" class="btn btn-default4" data-dismiss="modal" id="return">返回</button>
	</div>
	<script type="text/javascript">
       $(function(){
    	   
    	   toastr.options= {  
   				closeButton: false,  //是否显示关闭按钮
   				debug: false,   //是否为调试
   				progressBar: true,  //是否显示进度条
   				positionClass: "toast-top-center",  //在页面中显示的位置
   				onclick: null,  //点击事件
   				showDuration: "100",  //显示动作时间
   				hideDuration: "1000",  //隐藏动作时间
   				timeOut: "2000",  //自动关闭超时时间
   				extendedTimeOut: "1000",  
   				showEasing: "swing",  
   				hideEasing: "linear",  
   				preventDuplicates: true ,
   				preventOpenDuplicates: true, //重复内容的提示框在开启时只出现一个
   				showMethod: "fadeIn",  //显示的方式
   				hideMethod: "fadeOut" //隐藏的方式
   			}; 
    	   
    	   //点击方法初始化
    	   var oButtonInit = new ButtonInit();
           oButtonInit.Init();
       });
       var ButtonInit = function() {
    	   $("#return").click(function(){
    		   $(location).attr('href',"/noob/jsps/base/deliveryTimeManage/jsp/deliveryTimeManage.jsp");
    	   });
    	   //修改按钮的点击方法
    	   $("#sub").click(function(){
    		   if(''==$("#description").val()||null==$("#description").val()){
    			   toastr.warning("状态不能为空");
    		   }else{
    			   $.ajax({
    	   	    		url:"/noob/deliveryTime/updateDeliveryTimeManage.action",
    	   	    	    type:"GET",
    	   	    	    data:{
    	   	    	    	   timeId:$("#timeId").val(),
    	   	    	           timeName:$("#averageKnockOffTimeHr").val()+"点"+$("#averageKnockOffTimeMin").val()+"到"+$("#averageKnockOffTimeHr").val()+"点"+$("#averageKnockOffTimeMin").val(),
    	     	    		   averageOnDutyTime:$("#averageOnDutyTimeHr").val()+":"+$("#averageOnDutyTimeMin").val()+":00",
    	     	    		   averageKnockOffTime:$("#averageKnockOffTimeHr").val()+":"+$("#averageKnockOffTimeMin").val()+":00",
    	     	    		   satOnDutyTime:$("#satOnDutyTimeHr").val()+":"+$("#satOnDutyTimeMin").val()+":00",
    	     	    		   satKnockOffTime:$("#satKnockOffTimeHr").val()+":"+$("#satKnockOffTimeMin").val()+":00",
    	     	    		   sundayOnDutyTime:$("#sundayOnDutyTimeHr").val()+":"+$("#sundayOnDutyTimeMin").val()+":00",
    	     	    		   sundayKnockOffTime:$("#sundayKnockOffTimeHr").val()+":"+$("#sundayKnockOffTimeMin").val()+":00",
    	     	    		   description:$("#description").val()
    	   	    	    },
    	   	    	   success:function(result){
    	   	    		   if(result=="success"){
    	   	    			   //重定向到deliveryTimeManage页面
    	   	    			   $(location).attr('href',"/noob/jsps/base/deliveryTimeManage/jsp/deliveryTimeManage.jsp");
    	   	    		   }else{
    	   	    			   toastr.error('添加失败');
    	   	    		   }
    	   	    	   }
    	   	    	});
    		   }
   	    	
   	    });
       };
   </script>
</body>
</html>