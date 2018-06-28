<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>签收录入</title>
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
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jsps/delivery/dispatch/signIn/css/signIn.css" />
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
							for="enterPeople">录入人姓名</label>
						<div class="col-sm-3">
							<input type="text" class="form-control"
								id="enterPeople" name="enterPeople">
						</div>
						
						<label class="control-label col-sm-1"
							for="lowSignTime">签收日期</label>
						<div class="col-sm-3">
							<input type="text" class="form-control form_datetime"
							 id="lowSignTime">
						</div>
						
						<label class="control-label col-sm-1"
							for="highSignTime">至</label>
						<div class="col-sm-3">
							<input type="text" class="form-control form_datetime"
							 id="highSignTime">
						</div>
						<br>
						<br>
						<label class="control-label col-sm-1" for="jobListNo">工作单号</label>
						<div class="col-sm-3">
							<input type="text" class="form-control"
								id="jobListNo" name="jobListNo">
						</div>
						
						<label class="control-label col-sm-1" for="signType">签收类型</label>
						<div class="col-sm-3">
						<select id="signType" name="signType" class="selectpicker show-tick form-control">
						  <option></option>				
						  <option>正常签收</option>
						  <option>部分签收</option>
						  <option>返货</option>
						</select>
							</div>
						
						<label class="control-label col-sm-1" for="staffNumber">派送人工号</label>
						<div class="col-sm-3">
							<input type="text" class="form-control"
								id="staffNumber" name="staffNumber">
						</div>
						<br>
						<br>
						<label class="control-label col-sm-1" for="orgName">派送单位</label>
						<div class="col-sm-3">
							<input type="text" class="form-control"
								id="orgName" name="orgName">
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
				<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>删除未保存
			</button>			
			
			<button id="btn_edit" type="button" class="btn btn-default"  data-toggle="modal">
				<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>修改
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
								role="form" id="addSignInEnterForm">
								
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label" for="jobListsNo">工作单号</label>
									<div class="col-sm-9">
										<select id="jobListsNo" name="jobListsNo" class="selectpicker show-tick form-control">
										</select>
									</div>
									
								</div>
								
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label" for="returnProductSign">返货标志</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" id="returnProductSign"
											placeholder="由工作单号自动带入(0代表不返货,1代表返货)" name="returnProductSign" disabled="disabled">
									</div>
									
								</div>
								
								
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label" for="staffNumbers">派送工号</label>
									<div class="col-sm-9">
										<select id="staffNumbers" name="staffNumbers" class="selectpicker show-tick form-control">
										</select>
									</div>
									
								</div>
								
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label" for="staffName">派送员</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" id="staffName"
											placeholder="由取派员编号自动带入" name="staffName" disabled="disabled">
									</div>
									
								</div>
								
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label" for="orgNames">派件单位</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" id="orgNames"
											placeholder="由取派员编号自动带入" name="orgNames" disabled="disabled">
									</div>
									
								</div>
								
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label" for="addressee">签收人</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" id="addressee"
											placeholder="由工作单号自动带入" name="addressee" disabled="disabled">
									</div>
									
								</div>
								
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label" for="addresseeUnit">签收单位</label>
									<div class="col-sm-9">
										<input type="text" class="form-control"
							 				 placeholder="由工作单号自动带入" name="addresseeUnit" id="addresseeUnit" disabled="disabled">
									</div>
								</div>
								
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label" for="signTypes">签收类型</label>
									<div class="col-sm-9">
										<select id="signTypes" name="signTypes" class="selectpicker show-tick form-control">
											<option value="0">正常签收</option>
											<option value="1">返货签收</option>
										</select>
									</div>
								</div>
								
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label" for="enterWay">录入方式</label>
									<div class="col-sm-9">
										<select id="enterWay" name="enterWay" class="selectpicker show-tick form-control">
											<option value="0">手工</option>
											<option value="1">PDA</option>
											<option value="2">手机</option>
										</select>
									</div>
								</div>
								
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label" for="signMark">签收标志</label>
									<div class="col-sm-9">
										<select id="signMark" name="signMark" class="selectpicker show-tick form-control">
											<option value="0">已签收</option>
											<option value="1">未签收</option>
										</select>
									</div>
								</div>
								
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label" for="cancel">作废标志</label>
									<div class="col-sm-9">
										<select id="cancel" name="cancel" class="selectpicker show-tick form-control">
											<option value="0">不作废</option>
											<option value="1">作废</option>
										</select>
									</div>
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
									<label for="lastname" class="col-sm-2 control-label">签收人</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" id="addressees"
											placeholder="请输入签收人">
									</div>
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
					url : '../../../../../signIn.action', //请求后台的URL（*） 
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
					uniqueId : "signInEnterId", //每一行的唯一标识，一般为主键列 
					showToggle : true, //是否显示详细视图和列表视图的切换按钮 
					cardView : false, //是否显示详细视图
					detailView : false, //是否显示父子表
					columns : [ {
						checkbox : true
					}, {
						field : 'jobListNo',
						title : '工作单号'
					}, {
						field : 'returnProductSign',
						title : '返货标志',
						formatter : function(value, row, index) {
							if (row.returnProductSign == '0') {
								return '不返货';
							} else {
								return '返货';
							}
						}
					}, {
						field : 'staffNumber',
						title : '派送员工号'
					}, {
						field : 'staffName',
						title : '派送人姓名'
					}, {
						field : 'orgName',
						title : '派送单位'
					}, {
						field : 'addressee',
						title : '签收人'
					}, {
						field : 'addresseeUnit',
						title : '签收单位'
					}, {
						field : 'signTime',
						title : '签收时间',
						formatter:function (value){
							return formatDate(value)
						}
					}, {
						field : 'signType',
						title : '签收类型',
						formatter : function(value, row, index) {
							if (row.signType == '0') {
								return '正常签收';
							} else {
								return '反向签收';
							}
						}
					}, {
						field : 'signMark',
						title : '签收标志',
						formatter : function(value, row, index) {
							if (row.signMark == '0') {
								return '已签收';
							} else {
								return '未签收';
							}
						}
					}, {
						field : 'enterPeople',
						title : '录入人'
					}, {
						field : 'enterWay',
						title : '录入方式',
						formatter : function(value, row, index) {
							if (row.enterWay == '0') {
								return '手工';
							} else if(row.enterWay == '1'){
								return 'PDA';
							} else {
								return '手机';
							}
						}
					}, {
						field : 'cancel',
						title : '作废标志',
						formatter : function(value, row, index) {
							if (row.cancel == '0') {
								return '否';
							} else {
								return '是';
							}
						}
					}]
					
				});
				 oTableInit.queryParams = function(params) {
					var temp = {
						//这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的 
						limit : params.limit, //页面大小 
						offset : params.offset, //页码 
						enterPeople : $("#enterPeople").val(),
						lowSignTime : $("#lowSignTime").val(),
						highSignTime : $("#highSignTime").val(),
						jobListNo : $("#jobListNo").val(),
						signType : $("#signType").val(),
						staffNumber : $("#staffNumber").val(),
						orgName : $("#orgName").val()
					};
					return temp;
				}; 
			
			};

			return oTableInit;
		};
		
		
		$("#btn_query").click(function(){
			 
			 var obj = {
					 url:"../../../../../signIn.action",
					 silent:true,
					 query:{
						enterPeople : $("#enterPeople").val(),
						lowSignTime : $("#lowSignTime").val(),
						highSignTime : $("#highSignTime").val(),
						jobListNo : $("#jobListNo").val(),
						signType : $("#signType").val(),
						staffNumber : $("#staffNumber").val(),
						orgName : $("#orgName").val()
					 }
			 };
	   	$('#tb_departments').bootstrapTable('refresh',obj);      	
	   });  

		
		

		var ButtonInit = function() {
			var oInit = new Object();
			var postdata = {};
			oInit.Init = function() {
				//初始化页面上面的按钮事件 
				$("#btn_add").click(
					
					function() {
						var select = $('#tb_departments').bootstrapTable(
								'getSelections');
						
						
						//初始化组织类型下拉框
						$.ajax({
							type:"post",
							async:true,
							url : '../../../../../findAllStaff.action',
							success:function(response){
								var html = "";
								for(var i=0;i<response.length;i++) {
									html = html+"<option id='"+response[i].staffId+"'>"+response[i].staffNumber+"</option>";
								}
								$("#staffNumbers").append(html);
								$(".selectpicker").selectpicker("refresh");
							}
						});
						
						//初始化组织类型下拉框
						$.ajax({
							type:"post",
							async:true,
							url : '../../../../../findAllBasicJobList.action',
							success:function(response){
								var html = "";
								for(var i=0;i<response.length;i++) {
									html = html+"<option id='"+response[i].jobListId+"'>"+response[i].jobListNo+"</option>";
								}
								$("#jobListsNo").append(html);
								$(".selectpicker").selectpicker("refresh");
							}
						});
						
						clean();
							
					});
							
			$("#add").click(function(){
				
				var staffId="";
				for(var i=0;i<$("#staffNumbers").children().length;i++){
					if($("#staffNumbers").children()[i].selected){
						staffId = $($("#staffNumbers").children()[i]).attr("id");
					}
				}
				
				var jobListId = "";
				for(var i=0;i<$("#jobListsNo").children().length;i++){
					if($("#jobListsNo").children()[i].selected){
						jobListId = $($("#jobListsNo").children()[i]).attr("id");
					}
				}
				 
				$.ajax({
					url:'../../../../../addSignInEnter.action',
					type:"get",
					data:{
						   jobListId:jobListId,
						   staffId:staffId,
						   jobListNo:$('#jobListsNo').val(),
						   returnProductSign:$('#returnProductSign').val(),
						   staffNumber:$('#staffNumbers').val(),
						   staffName:$('#staffName').val(),
						   orgName:$('#orgNames').val(),
						   addressee:$('#addressee').val(),
						   addresseeUnit:$('#addresseeUnit').val(),
						   signType:$('#signTypes').val(),
						   signMark:$('#signMark').val(),
						   enterWay:$('#enterWay').val(),
						   cancel:$('#cancel').val()
						   },
					success:function(result){
						if (result == "success") {						
							toastr.success('保存成功!');
						} else {
							toastr.error('保存失败!');
						}
						
						$('#tb_departments').bootstrapTable('refresh',{url:'../../../../../signIn.action'});
						
					}
				});
				
				$("#myModal").modal("hide");
				
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
							
							clean();

						});
				
				$("#update").click(function(){
					 //获取单行数据
		       	    var select = $('#tb_departments').bootstrapTable('getSelections');
		       	    var jobListNo = [];
		       	    var signEnterId = [];
	    			//获取单行数据
	    				for (var i = 0; i < select.length; i++) {
	    					jobListNo[i] = select[i]['jobListNo'];
	    					signEnterId[i] = select[i]['signEnterId'];
	    				}
					
		       	 $.ajax({
						type: "GET", 
						url:'../../../../../updateAddressee.action',
						data :{addressee:$("#addressees").val(),
							   jobListNo:jobListNo[0],
							   signEnterId:signEnterId[0]},
						success:function(result) {
							if (result == "success") {
								toastr.success('修改成功!');
							} else {
								toastr.error('修改失败!');
							}
							$('#tb_departments').bootstrapTable('refresh',{url:'../../../../../signIn.action'});
						}
					});
					 
				});

				$("#btn_delete").click(
						function() {
							var select = $('#tb_departments').bootstrapTable(
									'getSelections');
							var signMark = []; 
							var signEnterId =[];
							var cancel = [];
							for (var i = 0; i < select.length; i++) {
								signEnterId[i] = select[i]['signEnterId'];
								signMark[i] = select[i]['signMark'];
							}
							
							for (var i = 0; i < select.length; i++) {
								signEnterId[i] = select[i]['signEnterId'];
								cancel[i] = select[i]['cancel'];
							}
							if (select.length === 0) {
								toastr.warning('请至少选择一行进行删除!');
							}else if(signMark[0] === 0){
								toastr.warning('该签收单已保存，不可删除!');
							}else if(cancel[0] === 1){
								toastr.warning('该签收单已作废!');
							}else {
								swal({  
									title: "操作提示",   //弹出框的title  
									text: "确定删除吗？",  //弹出框里面的提示文本  
									type: "warning",    //弹出框类型  
									showCancelButton: true, //是否显示取消按钮  
									confirmButtonColor: "#DD6B55",//确定按钮颜色  
									cancelButtonText: "取消",//取消按钮文本  
									confirmButtonText: "是的，确定删除！",//确定按钮上面的文档  
									closeOnConfirm: true  
								}, function () { 
									
									var arrs = [];
									for (var i = 0; i < select.length; i++) {
										arrs[i] = select[i]['signEnterId'];
									}
									
									$.ajax({
										type: "GET", 
										url:'../../../../../deleteSignInEnterBySignEnterId.action',
										data : {signEnterIds:arrs},
										success:function(result) {
											if (result == "success") {
												toastr.success('删除成功!');
											} else {
												toastr.error('删除失败!');
											}
											$('#tb_departments').bootstrapTable('refresh',{url:'../../../../../signIn.action'}); 
										}
									});

									$('#tb_departments').bootstrapTable('remove', {
										field : 'signEnterId',
										values : arrs
									});
									
								});
						
							}

						});
				
			};
			return oInit;
		};
		
		$("#staffNumbers").click(function(){
		    var staffId="";
			for(var i=0;i<$("#staffNumbers").children().length;i++){
				if($("#staffNumbers").children()[i].selected){
					staffId = $($("#staffNumbers").children()[i]).attr("id");
				}
			}
			
			   $.ajax({
					url:"/noob/findStaffNameAndOrgNameByStaffNumber.action",
					type:"post",
					data:{
						staffId : staffId
						},
					success:function(response){
						$("#staffName").val(response.staffName);
						$("#orgNames").val(response.orgName);
					}
				});
			
		});
		
		$("#jobListsNo").click(function(){
			$.ajax({
				url:"../../../../../findReturnProductSignByJobListNo.action",
				type:"post",
				data:{
					jobListNo : $("#jobListsNo").val()
					},
				success:function(response){
					$("#returnProductSign").val(response.returnProductSign);
					$("#addressee").val(response.addressee);
					$("#addresseeUnit").val(response.addresseeUnit);
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
		
		function clean() {
			$('#returnProductSign').val("");
			$('#staffName').val("");
			$('#orgNames').val("");
			$('#addressee').val("");
			$('#addresseeUnit').val("");
			$("#jobListsNo").children("option").remove();
			$("#staffNumbers").children("option").remove();
			$("#signTypes").val("");
			$("#enterWay").val("");
			$("#signMark").val("");
			$("#cancel").val("");
            $("#addressees").val();
		}
	</script>

</body>
</html>