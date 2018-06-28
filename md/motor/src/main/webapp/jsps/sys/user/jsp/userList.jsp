<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro"%>
<%
	String userName = request.getParameter("userName");
	request.getSession().setAttribute("userName", userName);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户管理</title>
   <!-- Jquery组件引用 -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js"></script>
	
	<!-- bootstrap组件引用 -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap/js/bootstrap.js"></script>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/bootstrap-datetimepicker/css/bootstrap-datetimepicker.css" />
	<!-- bootstrap table组件以及中文包的引用 -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap-table/bootstrap-table.js"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/bootstrap-table/bootstrap-table.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/sweetalert/sweetalert.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/toastr/toastr.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/toastr/toastr.min.css" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap-datetimepicker/js/bootstrap-datetimepicker.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap-datetimepicker/js/bootstrap-datetimepicker.zh-CN.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/sweetalert/sweetalert.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/toastr/toastr.js.map"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/toastr/toastr.min.js"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jsps/sys/user/css/user.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/bootstrap-validator/bootstrapValidator.min.css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap-validator/bootstrapValidator.min.js"></script>
<style type="text/css">
   #userName_prompt{
      text-align: center;
      color:red;
   }
   
   #password_prompt{
      text-align: center;
      color:red;
   }
   
   #salary_prompt{
      text-align: center;
      color:red;
   }
   
   #birthday_prompt{
      text-align: center;
      color:red;
   }
   
   #telephone_prompt{
      text-align: center;
      color:red;
   }
   
   #oldPassword_prompt{
      text-align: center;
      color:red;
   }
   
   #newPassword_prompt{
      text-align: center;
      color:red;
   }
   
   #userNamess{
      text-align: center;
      color: red;
      display: none;
   }
</style>
</head>
<body>
    <div class="panel-body" style="padding-bottom: 0px;">
		<div class="panel panel-default">
			<div class="panel-heading">
				<a data-toggle="collapse" data-parent="#accordion"
					href="#collapseOne" > 查询条件 </a>
			</div>
			<div class="panel-collapse collapse in" id="collapseOne">
				<form id="formSearch" class="form-horizontal">
					<div class="form-group" style="margin-top:15px">
						<label class="control-label col-sm-1"
							for="userName">用户名</label>
						<div class="col-sm-3">
							<input type="text" class="form-control"
								id="userName" name="userName">
						</div>
						<label class="control-label col-sm-1" for="gender">性别</label>
						<div class="col-sm-3">
						<select id="gender" name="gender" class="selectpicker show-tick form-control">
						  <option></option>				
						  <option>男</option>
						  <option>女</option>
						</select>
							</div>
						<br>
						<br>
						<label class="control-label col-sm-1" for="lowBirthday">小出生期</label>
						<!-- <div class="input-append date form_datetime col-sm-3">
							<input size="44" type="text" id="lowBirthday" value="" readonly> <span
								class="add-on" ><i class="icon-th"></i></span>
						</div> -->
						<div class="col-sm-3">
							<input type="text" class="form-control form_datetime"
							 id="lowBirthday">
						</div>
						<label class="control-label col-sm-1" for="highBirthday">大出生期</label>
						<!-- <div class="input-append date form_datetime col-sm-3">
							<input size="44" type="text" id="highBirthday" value="" readonly> <span
								class="add-on"><i class="icon-th"></i></span>
						</div> -->
						<div class="col-sm-3">
							<input type="text" class="form-control form_datetime"
							 id="highBirthday">
						</div>
						<div class="col-sm-4" style="text-align:left;">
							<button type="button" style="margin-left:50px" id="btn_query"
								class="btn btn-primary">查询</button>
						</div>
					</div>
				</form>
			</div>
		</div>
		<div id="toolbar" class="btn-group">
			<shiro:hasPermission name="新增用户">
			<button id="btn_add" type="button" class="btn btn-default" data-toggle="modal" data-target="#myModal">
				<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增
			</button>
			</shiro:hasPermission>
			<shiro:hasPermission name="修改用户">
			<button id="btn_edit" type="button" class="btn btn-default"  data-toggle="modal">
				<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>修改
			</button>	
			</shiro:hasPermission>		
			<shiro:hasPermission name="作废用户">
			<button id="btn_delete" type="button" class="btn btn-default">
				<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>冻结
			</button>
			</shiro:hasPermission>
			<shiro:hasPermission name="还原用户">
			<button id="btn_recover" type="button" class="btn btn-default">
          		<span class="glyphicon glyphicon-repeat"  aria-hidden="true"></span>还原
            </button>
			</shiro:hasPermission>
		</div>
		<table id="tb_departments"></table>
	</div>

			<!-- 添加模态框（Modal） -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<div class="panel panel-success">
						<div class="panel-heading">
							<h3 class="panel-title">添加</h3>
						</div>
						
						<div class="panel-body">
							<form class="form-horizontal" onsubmit="return check()"
								role="form" id="addUserForm">
								<div class="form-group">
								    <div id="userNamess">
								       用户名已存在
								    </div>
									<label for="lastname" class="col-sm-2 control-label" for="userNames">用户名</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" id="userNames" name="userName"
											placeholder="请输入用户名">
									</div>
									<div id="userName_prompt" class="prompt"></div>
									
								</div>
								<div class="form-group">
								
									<label for="lastname" class="col-sm-2 control-label" for="password">密码</label>
									<div class="col-sm-10">
										<input type="password" class="form-control" id="password"
											placeholder="请输入密码" name="password">
									</div>
									<div id="password_prompt" class="prompt"></div>
								</div>
								<div class="form-group">
								
									<label for="lastname" class="col-sm-2 control-label" for="salary">工资</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" id="salary"
											placeholder="请输入工资" name="salary">
									</div>
									<div id="salary_prompt" class="prompt"></div>
								</div>
								<div class="form-group">
								
									<label for="lastname" class="col-sm-2 control-label" for="birthday">出生日期</label>
									<!-- <div class="input-append date form_datetime col-sm-10">
										<input size="44" type="text" id="birthday"
											class="form-control" placeholder="请输入出生日期" name="birthday">
										<span class="add-on"><i class="icon-th"></i></span>
									</div> -->
									<div class="col-sm-10">
										<input type="text" class="form-control form_datetime"
							 				 placeholder="请输入出生日期" name="birthday" id="birthday">
									</div>
									<div id="birthday_prompt" class="prompt"></div>
								</div>
					
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label" for="gender">性别</label>
									<div class="col-sm-10">
										<select id="genders" name="genders" class="selectpicker show-tick form-control">
											
											<option>男</option>
											<option>女</option>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label" for="orgNames">组织名</label>
									<div class="col-sm-10">
										<select id="orgNames" name="orgNames" class="selectpicker show-tick form-control">
											
										</select>
									</div>
								</div>
								<div class="form-group">
								    
									<label for="lastname" class="col-sm-2 control-label" for="telephone">电话</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" id="telephone"
											placeholder="请输入电话号码" name="telephone">
									</div>
									<div id="telephone_prompt" class="prompt"></div>
								</div>
							</form>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-primary" id="add">提交</button>
					<button type="button" class="btn btn-default4" data-dismiss="modal">关闭</button>
				</div>
			</div>
		</div>
	</div> 
			
		<!-- 修改模态框（Modal） -->
	<div class="modal fade" id="Model" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<div class="panel panel-success">
						<div class="panel-heading">
							<h3 class="panel-title">修改</h3>
						</div>
						<div class="panel-body">
							<form class="form-horizontal" onsubmit="return check()"
								role="form">
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">旧密码</label>
									<div class="col-sm-10">
										<input type="password" class="form-control" id="oldPassword"
											placeholder="请输入旧密码" onblur="checkOldPassword(this)" onfocus="cancelPromptR(this)">
									</div>
									 <div id="oldPassword_prompt" class="prompt"></div>
								</div>
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">新密码</label>
									<div class="col-sm-10">
										<input type="password" class="form-control" id="newPassword"
											placeholder="请输入新密码" onblur="checkNewPassword(this)" onfocus="cancelPromptR(this)">
									</div>
									<div id="newPassword_prompt" class="prompt"></div>
								</div>
								</form>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" id="update" data-dismiss="modal">修改</button>
					<button type="button" class="btn btn-default4" data-dismiss="modal">关闭</button>
				</div>
			</div>
		</div>
	</div>
								
	<script type="text/javascript">
	var TableInit = function() {
		var oTableInit = new Object();
		//初始化Table 
		oTableInit.Init = function() {
			$('#tb_departments').bootstrapTable({
				url : '../../../../userList.action', //请求后台的URL（*） 
				method : 'get', //请求方式（*） 
				toolbar : '#toolbar', //工具按钮用哪个容器 
				striped : true, //是否显示行间隔色 
				cache : false, //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*） 
				pagination : true, //是否显示分页（*） 
				sortable : false, //是否启用排序 
				sortOrder : "asc", //排序方式 
				queryParams : oTableInit.queryParams,//传递参数（*）
				sidePagination : "server", //分页方式：client客户端分页，server服务端分页（*） 
				pageNumber : 1, //初始化加载第一页，默认第一页 
				pageSize : 5, //每页的记录行数（*） 
				pageList : [ 5, 25, 50, 100 ], //可供选择的每页的行数（*） 
				search : false, //是否显示表格搜索，此搜索是客户端搜索，不会进服务端，所以，个人感觉意义不大 
				strictSearch : true,
				showColumns : true, //是否显示所有的列 
				showRefresh : true, //是否显示刷新按钮
				minimumCountColumns : 2, //最少允许的列数
				clickToSelect : true, //是否启用点击选中行 
				height : 350, //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度 
				uniqueId : "userId", //每一行的唯一标识，一般为主键列 
				showToggle : true, //是否显示详细视图和列表视图的切换按钮 
				cardView : false, //是否显示详细视图
				detailView : false, //是否显示父子表
			    columns : [ {
					checkbox : true
				}, {
					field : 'userName',
					title : '用户名'
				}, {
					field : 'salary',
					title : '工资'
				}, {
					field : 'birthday',
					title : '出生日期'
				}, {
					field : 'gender',
					title : '性别'
				}, {
					field : 'orgName',
					title : '组织名'
				}, {
					field : 'telephone',
					title : '电话'
				}, {
					field : 'status',
					title : '是否禁用',
					formatter : function(value, row, index) {
						if (row.status == '0') {
							return '否';
						} else {
							return '是';
						}
					}
				}],
				rowStyle : function(row, index) {
					// 这里有5个取值代表5中颜色['active', 'success', 'info', 'warning',
					// 'danger'];
					var strclass = {};
					if (row.status == "1") {
						strclass = {
							css : {
								'background-color' : '#FFCCCC'
							}
						};// 还有一个active
					}
					return strclass
				}
				
			});
		}; //得到查询的参数

		 oTableInit.queryParams = function(params) {
			var temp = {
				//这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的 
				limit : params.limit, //页面大小 
				offset : params.offset, //页码 
				userName : $("#userName").val(),
				gender:$("#gender").val(),
	            lowBirthday:$("#lowBirthday").val(),
	            highBirthday:$("#highBirthday").val(),
			};
			return temp;
		}; 

		return oTableInit;
	};
	
	
	$("#btn_query").click(function(){
		 
		 var obj = {
				 url:"../../../../userList.action",
				 silent:true,
				 query:{
					 userName : $("#userName").val(),
					 gender:$("#gender").val(),
		             lowBirthday:$("#lowBirthday").val(),
		             highBirthday:$("#highBirthday").val(),
				 }
		 };
   	$('#tb_departments').bootstrapTable('refresh',obj);      	
   });  

	var ButtonInit = function() {
		var oInit = new Object();
		var postdata = {};
		oInit.Init = function() {
			//初始化页面上面的按钮事件 
			$("#btn_add").click(function() {
				clean();
				test();
				
					//初始化组织类型下拉框
					$.ajax({
						type:"post",
						async:true,
						url : '../../../../findAllOrganization.action',
						success:function(response){
							var html = "";
							for(var i=0;i<response.length;i++) {
								html = html+"<option id='"+response[i].orgId+"'>"+response[i].orgName+"</option>";
							}
							$("#orgNames").append(html);
							$(".selectpicker").selectpicker("refresh");
						}
					});
					
					$("#addUserForm").data('bootstrapValidator').destroy();
					$('#addUserForm').data('bootstrapValidator', null); 
					
					validatorAdd();

					$("#userNamess").css("display","none");
				});
			
			$("#add").click(function(){
				validatorAdd();
				var userName = $("#userNames").val();
				var password = $("#password").val();
				var salary = $("#salary").val();
				var birthday = $("#birthday").val();
				var telephone = $("#telephone").val();
				if(userName == "" || userName == null){
					toastr.error('用户名不能为空!');
				}else if(password == "" || password == null){
					toastr.error('密码不能为空!');
				}else if(salary == "" || salary == null){
					toastr.error('工资不能为空!');
				}else if(telephone == "" || telephone == null){
					toastr.error('电话号码不能为空!');
				}else{
				$.ajax({
					type:"GET",
					url:'../../../../findUserByUserName.action',
					data:{userName:$("#userNames").val()},
					async:false,
					success:function(result){
						if(result=="success"){
							var orgId="";
							for(var i=0;i<$("#orgNames").children().length;i++){
								if($("#orgNames").children()[i].selected){
									orgId = $($("#orgNames").children()[i]).attr("id");
								}
							}
							
							$.ajax({
								type: "GET", 
								url:'../../../../addUser.action',
								data :{userId:$('#userId').val(),userName:$('#userNames').val(),
									   password:$('#password').val(),salary:$('#salary').val(),
									   birthday:$('#birthday').val(),gender:$('#genders').val(),
									   orgId:orgId,telephone:$('#telephone').val(),
									   status:$('#status').val()},					   
								success:function(result) {				
									if (result == "success") {						
										toastr.success('添加成功!');
									} else {
										toastr.error('添加失败!');
									}
									
									$('#tb_departments').bootstrapTable('refresh',{url:'../../../../userList.action'}); 
								}
									   
							});
							$("#myModal").modal("hide");

						}else{
							$("#userNamess").css("display","block");
						}
					}
				});
			 }
				 
			});			

			$("#btn_edit").click(
					
					function() {
						var select = $('#tb_departments').bootstrapTable(
								'getSelections');
						var status = []; 
						var userId =[];
						for (var i = 0; i < select.length; i++) {
							userId[i] = select[i]['userId'];
							status[i] = select[i]['status'];
						}
						if (select.length === 0) {
							toastr.warning('请选择一行进行修改!');
						}else if(select.length>1){
							toastr.warning('一次只能修改一行!');
						}else if(status[0] === 1){
							toastr.warning('该用户已被禁用');
						}else{							  
							 $("#Model").modal("show");
						}
						
						$(".prompt").text("");
						clean();
					});
							
			$("#update").click(function(){
				 //获取单行数据
	       	    var select = $('#tb_departments').bootstrapTable('getSelections');
	       		
	       	    var userId = [];
    			//获取单行数据
    				for (var i = 0; i < select.length; i++) {
    					userId[i] = select[i]['userId'];
    				}
	    			
				
				
					
					$.ajax({
						type: "GET", 
						url:'../../../../updatePwd.action',
						data :{newPassword:$("#newPassword").val(),oldPassword:$("#oldPassword").val(),userId:userId[0]},
						success:function(result) {
							if (result == "success") {
								toastr.success('修改成功!');
							} else {
								toastr.error('修改失败!');
							}
							$('#tb_departments').bootstrapTable('refresh',{url:'../../../../userList.action'});
						}
					});
					
				
				
			});

			$("#btn_delete").click(
					function() {
						var select = $('#tb_departments').bootstrapTable(
								'getSelections');
						var status = []; 
						var userId =[];
						for (var i = 0; i < select.length; i++) {
							userId[i] = select[i]['userId'];
							status[i] = select[i]['status'];
						}
						if (select.length === 0) {
							toastr.warning('请至少选择一行进行冻结!');
						}else if(status[0] === 1){
							toastr.warning('该用户已被禁用');
						}else {
							swal({  
								title: "操作提示",   //弹出框的title  
								text: "确定冻结吗？",  //弹出框里面的提示文本  
								type: "warning",    //弹出框类型  
								showCancelButton: true, //是否显示取消按钮  
								confirmButtonColor: "#DD6B55",//确定按钮颜色  
								cancelButtonText: "取消",//取消按钮文本  
								confirmButtonText: "是的，确定冻结！",//确定按钮上面的文档  
								closeOnConfirm: true  
							}, function () { 
								
								var arrs = [];
								for (var i = 0; i < select.length; i++) {
									arrs[i] = select[i]['userId'];
								}
								
								$.ajax({
									type: "GET", 
									url:'../../../../deleteUserByUserId.action',
									data : {userIds:arrs},
									success:function(result) {
										if (result == "success") {
											toastr.success('冻结成功!');
										} else {
											toastr.error('冻结失败!');
										}
										$('#tb_departments').bootstrapTable('refresh',{url:'../../../../userList.action'}); 
									}
								});

								$('#tb_departments').bootstrapTable('remove', {
									field : 'userId',
									values : arrs
								});
								
							});
					
						}

					});
			
			$("#btn_recover").click(
					function() {
						var select = $('#tb_departments').bootstrapTable(
								'getSelections');
						var status = []; 
						var userId =[];
						for (var i = 0; i < select.length; i++) {
							userId[i] = select[i]['userId'];
							status[i] = select[i]['status'];
						}
						if (select.length === 0) {
							toastr.warning('请至少选择一行进行还原!');
						}else if(status[0] === 0){
							toastr.warning('该用户已在使用中');
						}else{
							swal({  
								title: "操作提示",   //弹出框的title  
								text: "确定还原吗？",  //弹出框里面的提示文本  
								type: "warning",    //弹出框类型  
								showCancelButton: true, //是否显示取消按钮  
								confirmButtonColor: "#DD6B55",//确定按钮颜色  
								cancelButtonText: "取消",//取消按钮文本  
								confirmButtonText: "是的，确定还原！",//确定按钮上面的文档  
								closeOnConfirm: true  
							}, function () { 
								
								var arrs = [];
								for (var i = 0; i < select.length; i++) {
									arrs[i] = select[i]['userId'];
								}
								
								$.ajax({
									type: "GET", 
									url:'../../../../regainUserByUserId.action',
									data : {userIds:arrs},
									success:function(result) {
										if (result == "success") {
											toastr.success('还原成功!');
										} else {
											toastr.error('还原失败!');
										}
										$('#tb_departments').bootstrapTable('refresh',{url:'../../../../userList.action'}); 
									}
								});
								
							});
					
						}

					});

		};
		return oInit;
	};
	
	$(".form_datetime").datetimepicker({
	      format: "yyyy-mm-dd",
	      autoclose: true,
	      todayBtn: true,
	      language:'zh-CN',
	      pickerPosition:"bottom-right",
	      minView:2,
	     
	    });

	$(function() {
		//1.初始化Table 
		var oTable = new TableInit();
		oTable.Init();
		//2.初始化Button的点击事件 
		var oButtonInit = new ButtonInit();
		oButtonInit.Init();
		validatorAdd();
		toastr.options.positionClass = 'toast-top-center';
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
	});

	function test() {
		var oldWidth = $('body').outerWidth();
		var marginLeft = (document.documentElement.clientWidth - $(
				".model-dialog").outerWidth()) / 2;
		var marginHeight = (document.documentElement.clientHeight - $(
				".model-dialog").outerHeight()) / 2;
		$('.model-dialog').css('margin-left', marginLeft);
		$('.model-dialog').css('margin-top', marginHeight);
		$('body').css('overflow', 'hidden');
		var newWidth = $('body').outerWidth();
		var scrollbarWidth = newWidth - oldWidth;
		$('body').css('padding-right', scrollbarWidth + 'px');
		$('.model').removeClass('hide');
		$('.model-dialog').removeClass('hide');
		
	}
	
	function validatorAdd(){
		$('#addUserForm').bootstrapValidator({
			message: 'This value is not valid',
			feedbackIcons:{
			valid: 'glyphicon glyphicon-ok',
			invalid: 'glyphicon glyphicon-remove',
			validating: 'glyphicon glyphicon-refresh'
		},
		    fields: {
		    	userName: {
		            validators: {
		               notEmpty: {
		                 message: '用户名不能为空!',
		               }
		            }
		        },
		        password: {
	                 validators: {
	                     notEmpty: {
	                         message: '密码不能为空!'
	                     },
	                     stringLength: {
	                         min: 6,
	                         max: 12,
	                         message: '密码长度必须在6到12位之间!'
	                     }
	                 }
	             },

		        salary: {
		            validators: {
		               notEmpty: {
		                 message: '工资不能为空!',
		               },
		               regexp: {
	                         regexp: /^[1-9][\d]*\.[\d]{2}$/,
	                         message: '工资格式不正确!'
	                     }
		               
		            }
		        },
		        birthday: {
		            validators: {
		               notEmpty: {
		                  message: '出生日期不能为空!'
		               }
		             }
		        },
		        
		        telephone: {
	                 validators: {
	                     notEmpty: {
	                         message: '电话不能为空!'
	                     },
	                     regexp: {
	                         regexp: /^1(3|4|5|7|8)\d{9}$/,
	                         message: '电话号码格式不正确!'
	                     }
	                 }
	             }
		    }
	    });
    }



	function cancel() {
		$('body').css('overflow', 'auto');
		$('body').css('padding-right', '0px');
		$('.model').addClass('hide');
		$('.model-dialog').addClass('hide');
	}
	
	function clean() {
		$('#userNames').val("");
		$('#password').val("");
		$('#salary').val("");
		$('#birthday').val("");
		$('#telephone').val("");
		$(".prompt").text("");
		$("#orgNames").children("option").remove();
		$("#oldPassword").val("");
		$("#newPassword").val("");

	}
	
	
	//校验旧密码
	function checkOldPassword(obj) {
		//校验是否为空
		if (obj.value.length == 0) {
			$("#"+obj.id + "_prompt").text("输入的旧密码不能为空!!!");
			$("#update").prop('disabled', true);
		}else if ((obj.value.length) < 6 || (obj.value.length) > 12) {
			//获得密码框后的提示框对象
			$("#"+obj.id + "_prompt").text("输入的密码只能在6~12位之间!!!");
			$("#update").prop('disabled', true);
		}else{
			$("#update").prop('disabled', false);
		};
		
	};
	
	//校验新密码
	function checkNewPassword(obj) {
		//校验是否为空
		if (obj.value.length == 0) {
			$("#"+obj.id + "_prompt").text("输入的新密码不能为空!!!");
			$("#update").prop('disabled', true);
		}else if ((obj.value.length) < 6 || (obj.value.length) > 12) {
			//获得密码框后的提示框对象
			$("#"+obj.id + "_prompt").text("输入的密码只能在6~12位之间!!!");
			$("#update").prop('disabled', true);
		}else{
			$("#update").prop('disabled', false); 
		};
		
	};
	
	//清除提示
	function cancelPromptR(obj) {
		$("#"+obj.id + "_prompt").text("");
	};
	
	</script>
    	
</body>
</html>