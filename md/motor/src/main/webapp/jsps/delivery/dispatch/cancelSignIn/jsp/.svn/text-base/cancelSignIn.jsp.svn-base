<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>人工调度</title>
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
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jsps/delivery/dispatch/cancelSignIn/css/cancelSignIn.css" />
</head>
<body>

    <div class="panel-body" style="padding-bottom: 0px;">
		<div class="panel panel-default">
			<div class="panel-heading">
				<a data-toggle="collapse" data-parent="#accordion"
					href="#collapseOne" > 查询条件 </a>
			</div>
			<div class="panel-collapse collapse on" id="collapseOne">
				<form id="formSearch" class="form-horizontal">
					<div class="form-group" style="margin-top:15px">
						<label class="control-label col-sm-1"
							for="applyNo">申请单号</label>
						<div class="col-sm-3">
							<input type="text" class="form-control"
								id="applyNo" name="applyNo">
						</div>
						
						
						<label class="control-label col-sm-1"
							for="lowApplyTime">申请时间</label>
						<div class="col-sm-3">
							<input type="text" class="form-control form_datetime"
							 id="lowApplyTime">
						</div>
						
						<label class="control-label col-sm-1"
							for="highApplyTime">至</label>
						<div class="col-sm-3">
							<input type="text" class="form-control form_datetime"
							 id="highApplyTime">
						</div>
						<br>
						<br>
						
						<label class="control-label col-sm-1" for="applyName">申请人</label>
						<div class="col-sm-3">
							<input type="text" class="form-control"
								id="applyName" name="applyName">
						</div>
						
						
						<label class="control-label col-sm-1" for="approveStatus">审批状态</label>
						<div class="col-sm-3">
							<select id="approveStatus" name="approveStatus" class="selectpicker show-tick form-control">
							  <option></option>				
							  <option value="0">待审批</option>
							  <option value="1">审批中</option>
							  <option value="2">审批通过</option>
							  <option value="3">取消审批</option>
							</select>
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
		
			<button id="btn_add" type="button" class="btn btn-default" data-toggle="modal" data-target="#myModal">
				<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增保存
			</button>
			<button id="btn_delete" type="button" class="btn btn-default">
				<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>作废
			</button>			
			
			<button id="btn_edit" type="button" class="btn btn-default"  data-toggle="modal">
				<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>确认
			</button>
			
			<button id="btn_enter" type="button" class="btn btn-default" >
				<span class="glyphicon glyphicon-log-out" aria-hidden="true" ></span>导出
			</button>
			
		</div>
		<table id="tb_departments"></table>
	</div>
			<!-- 新增模态框（Modal） -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<div class="panel panel-success">
						<div class="panel-heading">
							<h3 class="panel-title">新增保存</h3>
						</div>
						
						<div class="panel-body">
							<form class="form-horizontal" onsubmit="return check()"
								role="form" id="addUserForm">
								
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label" for="staffNumber">职员编号</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" id="staffNumber"
											placeholder="请输入职员编号" name="staffNumber">
									</div>
								</div>
								
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label" for="jobListNo">工作单号</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" id="jobListNo"
											placeholder="请输入工作单号" name="jobListNo">
									</div>
								</div>
								
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label" for="orgName">派送单位</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" id="orgName"
											placeholder="" name="orgName" disabled="disabled">
									</div>
								</div>
								
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label" for="applyReason">申请原因</label>
									<div class="col-sm-10">
										<textarea rows="1" cols="60" id="applyReason" name="applyReason"
										style="max-width:425px;min-width:438px;min-height:30px;max-height:120px;">
										</textarea>
									
									</div>
								</div>
								
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label" for="approvesStatus">审批状态</label>
									<div class="col-sm-10">
										<select id="approvesStatus" name="approvesStatus" class="selectpicker show-tick form-control">
											<option value="0">待审批</option>
											<option value="1">审批中</option>
											<option value="2">审批通过</option>
											<option value="3">取消审批</option>
										</select>
									</div>
								</div>
								
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label" for="signInType">签收状态</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" id="signInType"
											placeholder="" name="signInType" disabled="disabled">
									</div>
								</div>
								
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label" for="confirmStatus">确认状态</label>
									<div class="col-sm-10">
										<select id="confirmStatus" name="confirmStatus" class="selectpicker show-tick form-control">
											<option value="0">同意</option>
											<option value="1">拒绝</option>
											<option value="2">新增</option>
											<option value="3">作废</option>
										</select>
									</div>
								</div>
								
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label" for="confirmReason">确认原因</label>
									<div class="col-sm-10">
										<textarea rows="1" cols="60" id="confirmReason" name="confirmReason"
										style="max-width:425px;min-width:438px;min-height:30px;max-height:120px;">
										</textarea>
									
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" id="add">提交</button>
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
	function formatDate(ns) {
		var now = new Date(ns);
		var year=now.getYear()+1900;
		var month=now.getMonth()+1;
		var date=now.getDate();
		var hour=now.getHours();
		var minute=now.getMinutes();
		var second=now.getSeconds();
		return year+"-"+month+"-"+date;
	}
	  		var TableInit = function() {
			var oTableInit = new Object();
			//初始化Table 
			oTableInit.Init = function() {
				$('#tb_departments').bootstrapTable({
					url : '../../../../../cancelpageQuery.action', //请求后台的URL（*） 
					method : 'get', //请求方式（*） 
					toolbar : '#toolbar', //工具按钮用哪个容器 
					striped : true, //是否显示行间隔色 
					cache : false, //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*） 
					pagination : true, //是否显示分页（*） 
					sortable : false, //是否启用排序 
					//sortOrder : "asc", //排序方式
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
					uniqueId : "cancelApplyId", //每一行的唯一标识，一般为主键列 
					showToggle : true, //是否显示详细视图和列表视图的切换按钮 
					cardView : false, //是否显示详细视图
					detailView : false, //是否显示父子表
					maintainSelected:true,
					columns : [ {
						checkbox : true
					}, {
						field : 'applyNo',
						title : '申请单号'
					}, {
						field : 'jobListNo',
						title : '工作单号'
					}, {
						field : 'orgName',
						title : '派送单位'
					}, {
						field : 'sendTime',
						title : '派送时间',
						formatter:function (value){
							return formatDate(value)
						}
					}, {
						field : 'signInType',
						title : '签收状态',
						formatter : function(value, row, index) {
							if (row.signInType == '0') {
								return '正常';
							} else if(row.signInType == '1'){
								return '返单';
							}else {
								return '转发签收';
							}
						}
					} , {
						field : 'approveStatus',
						title : '审批状态',
						formatter : function(value, row, index) {
							if (row.approveStatus == '0') {
								return '待审批';
							} else if(row.approveStatus == '1'){
								return '审批中';
							}else if(row.approveStatus == '2'){
								return '审批通过';
							}else {
								return '取消审批';
							}
						}
					}, {
						field : 'applyReason',
						title : '申请原因'
					}, {
						field : 'applyName',
						title : '申请人'
					}, {
						field : 'applyOrgName',
						title : '申请单位'
					}, {
						field : 'applyTime',
						title : '申请时间',
						formatter:function (value){
							return formatDate(value)
						}
					}, {
						field : 'confirmPeople',
						title : '确认人'
					}, {
						field : 'confirmTime',
						title : '确认时间',
						formatter:function (value){
							return formatDate(value)
						}
					}, {
						field : 'confirmStatus',
						title : '确认状态',
						formatter : function(value, row, index) {
							if (row.confirmStatus == '0') {
								return '同意';
							} else if(row.confirmStatus == '1'){
								return '拒绝';
							}else if(row.confirmStatus == '2'){
								return '新增';
							}else {
								return '作废';
							}
						}
					}]
					
				});
				 oTableInit.queryParams = function(params) {
					var temp = {
						//这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的 
						limit : params.limit, //页面大小 
						offset : params.offset, //页码 
						applyNo : $("#applyNo").val(),
						lowApplyTime : $("#lowApplyTime").val(),
						highApplyTime : $("#highApplyTime").val(),
						applyName : $("#applyName").val(),
						approveStatus : $("#approveStatus").val()
					};
					return temp;
				}; 
			
			};

			return oTableInit;
		};
		
		
		$("#btn_query").click(function(){
			 
			 var obj = {
					 url:"../../../../../cancelpageQuery.action",
					 silent:true,
					 query:{
						applyNo : $("#applyNo").val(),
						lowApplyTime : $("#lowApplyTime").val(),
						highApplyTime : $("#highApplyTime").val(),
						applyName : $("#applyName").val(),
						approveStatus : $("#approveStatus").val()
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
					var select = $('#tb_departments').bootstrapTable(
					'getSelections');
				});
							
			$("#add").click(function(){
				 //获取单行数据
	       	    var select = $('#tb_departments').bootstrapTable('getSelections');
	       	    var orgId="";
				for(var i=0;i<$("#orgNamess").children().length;i++){
					if($("#orgNamess").children()[i].selected){
						orgId = $($("#orgNamess").children()[i]).attr("id");
					}
				}
				
			});

				$("#btn_edit").click(
						function() {
							var select = $('#tb_departments').bootstrapTable(
									'getSelections');
							if (select.length === 0) {
								toastr.warning('请选择一行进行修改!');
							}else if(select.length>1){
								toastr.warning('一次只能修改一行!');
							}else{							  
								 $("#Model").modal("show");
							}

						});
				
				$("#update").click(function(){
					 //获取单行数据
		       	    var select = $('#tb_departments').bootstrapTable('getSelections');
		       	    var dispatchId = [];
	    			//获取单行数据
	    				for (var i = 0; i < select.length; i++) {
	    					dispatchId[i] = select[i]['dispatchId'];
	    				}
					
		       	 $.ajax({
						type: "GET", 
						url:'../../../../../retreat.action',
						data :{retreatReason:$("#retreatReason").val(),dispatchId:dispatchId[0]},
						success:function(result) {
							if (result == "success") {
								toastr.success('退回成功!');
							} else {
								toastr.error('退回失败!');
							}
							$('#tb_departments').bootstrapTable('refresh');
						}
					});
					 
				});

				$("#btn_delete").click(
						function() {
							var select = $('#tb_departments').bootstrapTable(
									'getSelections');
							if (select.length === 0) {
								toastr.warning('请选择一行进行修改!');
							}else if(select.length>1){
								toastr.warning('一次只能修改一行!');
							}else{							  
								 $("#Model1").modal("show");
							} 

						});
				
			};
			return oInit;
		};
		
		
		$("#staffNumber").blur(function(){
		    
			   $.ajax({
					url:"/noob/findOrgNameByStaffNumber.action",
					type:"post",
					data:{
						staffNumber : $("#staffNumber").val()
						},
					success:function(response){
						$("#orgName").val(response.orgName);
					}
				});
			
		});
		
		$(function() {
			//1.初始化Table 
			var oTable = new TableInit();
			oTable.Init();
			//2.初始化Button的点击事件 
			var oButtonInit = new ButtonInit();
			oButtonInit.Init();
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
		
		$(".form_datetime").datetimepicker({
		      format: "yyyy-mm-dd",
		      autoclose: true,
		      todayBtn: true,
		      language:'zh-CN',
		      pickerPosition:"bottom-right",
		      minView:2,
		     
		    });

		function cancel() {
			$('body').css('overflow', 'auto');
			$('body').css('padding-right', '0px');
			$('.model').addClass('hide');
			$('.model-dialog').addClass('hide');
		}
		
		function check(){
			 
			//校验逻辑
			
			return false;
		}
		
	</script>

</body>
</html>