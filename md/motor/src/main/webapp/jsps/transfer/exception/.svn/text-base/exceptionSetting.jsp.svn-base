<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width" />

<meta http-equiv="Cache-Control" content="max-age=0" />
<meta http-equiv="Cache-control" content="no-cache" />

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
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/toastr/toastr.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/js/toastr/toastr.min.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/sweetalert/sweetalert.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/js/sweetalert/sweetalert.css">
</head>
<div class="modal fade" id="myUpdateModal" tabindex="-1" role="dialog"
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
					<form class="form-horizontal" onsubmit="return check()" role="form">
						<div class="form-group" style="margin-top: 15px">
							<div class="panel-body">
							    <label class="control-label col-sm-2"
									for="txt_search_departmentname"  style="margin-top: 15px">异常id</label>
								<div class="col-sm-4" style="margin-top: 15px">
									<input type="text" class="form-control" disabled="disabled" id="update_exceptionId">
								</div>
								<label class="control-label col-sm-2"
									for="txt_search_departmentname" style="margin-top: 15px">异常项目</label>
								<div class="col-sm-4" style="margin-top: 15px">
									<input type="text" class="form-control" id="update_exceptionItems">
								</div>
								<label class="control-label col-sm-2"
									for="txt_search_departmentname" style="margin-top: 15px">继续运输</label>
								<div class="col-sm-4" style="margin-top: 15px">
									<select id="update_continueTransportation"
										style="width: 100px; height: 30px">
										<option value="0">是</option>
										<option value="1">否</option>
									</select>
								</div>
								<label class="control-label col-sm-2"
									for="txt_search_departmentname" style="margin-top: 15px">需要处理</label>
								<div class="col-sm-4" style="margin-top: 15px">
									<select id="update_manage"
										style="width: 100px; height: 30px">
										<option value="0">是</option>
										<option value="1">否</option>
									</select>
								</div>
								<label class="control-label col-sm-2"
									for="txt_search_departmentname" style="margin-top: 15px">自动标志</label>
								<div class="col-sm-4" style="margin-top: 15px">
									<select id="update_automaticSign"
										style="width: 100px; height: 30px">
										<option value="0">是</option>
										<option value="1">否</option>
									</select>
								</div>
								<label class="control-label col-sm-2"
									for="txt_search_departmentname" style="margin-top: 15px">单位选择</label>
								<div class="col-sm-4" style="margin-top: 15px">
									<select id="update_secondReceivingUnit"
										style="width: 100px; height: 30px">
										<option value="">请选择</option>
									</select>

								</div>
								<label class="control-label col-sm-2"
									for="txt_search_departmentname" style="margin-top: 15px">异常类型</label>
								<div class="col-sm-4" style="margin-top: 15px">
									<input type="text" class="form-control" id="update_exceptionType">
								</div>
								<label class="control-label col-sm-2"
									for="txt_search_departmentname" style="margin-top: 15px">异常备注</label>
								<div class="col-sm-4" style="margin-top: 15px">
									<input type="text" class="form-control" id="update_exceptionRemark">
								</div>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-primary" id="update"
									data-dismiss="modal">提交更改</button>
								<button type="button" class="btn btn-default4"
									data-dismiss="modal">关闭</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>


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
					<form class="form-horizontal" onsubmit="return check()" role="form">
						<div class="form-group" style="margin-top: 15px">
							<div class="panel-body">
								<label class="control-label col-sm-2"
									for="txt_search_departmentname" style="margin-top: 15px">异常项目</label>
								<div class="col-sm-4" style="margin-top: 15px">
									<input type="text" class="form-control" id="add_exceptionItems">
								</div>
								<label class="control-label col-sm-2"
									for="txt_search_departmentname" style="margin-top: 15px">异常类型</label>
								<div class="col-sm-4" style="margin-top: 15px">
									<input type="text" class="form-control" id="add_exceptionType">
								</div>
								<label class="control-label col-sm-2"
									for="txt_search_departmentname" style="margin-top: 15px">继续运输</label>
								<div class="col-sm-4" style="margin-top: 15px">
									<select id="add_continueTransportation"
										style="width: 100px; height: 30px">
										<option value="0">是</option>
										<option value="1">否</option>
									</select>
								</div>
								<label class="control-label col-sm-2"
									for="txt_search_departmentname" style="margin-top: 15px">需要处理</label>
								<div class="col-sm-4" style="margin-top: 15px">
									<select id="add_manage"
										style="width: 100px; height: 30px">
										<option value="0">是</option>
										<option value="1">否</option>
									</select>
								</div>
								<label class="control-label col-sm-2"
									for="txt_search_departmentname" style="margin-top: 15px">自动标志</label>
								<div class="col-sm-4" style="margin-top: 15px">
									<select id="add_automaticSign"
										style="width: 100px; height: 30px">
										<option value="0">是</option>
										<option value="1">否</option>
									</select>
								</div>
								<label class="control-label col-sm-2"
									for="txt_search_departmentname" style="margin-top: 15px">单位选择</label>
								<div class="col-sm-4" style="margin-top: 15px">
									<select id="add_secondReceivingUnit"
										style="width: 100px; height: 30px">
										<option value="">请选择</option>
									</select> 
								</div>
								<label class="control-label col-sm-2"
									for="txt_search_departmentname" style="margin-top: 15px">异常备注</label>
								<div class="col-sm-4" style="margin-top: 15px">
									<input type="text" class="form-control" id="add_exceptionRemark">
								</div>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-primary" id="sub"
									data-dismiss="modal">提交更改</button>
								<button type="button" class="btn btn-default4"
									data-dismiss="modal">关闭</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
<body>
	<div class="panel-body" style="padding-bottom: 0px;">
		<div id="toolbar" class="btn-group">
			<div id="toolbar" class="btn-group">
				<button type="button" class="btn btn-default1" data-toggle="modal"
					data-target="#myModal">
					<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增
				</button>
			</div>
			<div id="toolbar" class="btn-group">
				<button id="btn_edit" type="button" class="btn btn-default">
					<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>修改
				</button>
			</div>
			<div id="toolbar" class="btn-group">
				<button id="btn_delete" type="button" class="btn btn-default">
					<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>作废
				</button>
			</div>
		</div>
		<table id="tb_departments"></table>
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
		return year+"-"+month+"-"+date+" "+hour+":"+minute+":"+second;
	}
	$(function() {
		$.ajax({
			type : "post",
			url : "/noob/exceptionSettingController/orgPageQuery.action",
			success : function(data) {
				for (var i = 0; i < data.length; i++) {
					$('#update_secondReceivingUnit').append(
							"<option value='" + data[i].orgName + "' >"
									+ data[i].orgName + "</option>");
					$('#add_secondReceivingUnit').append(
							"<option value='" + data[i].orgName + "' >"
									+ data[i].orgName + "</option>");
				}
			},
			error : function() {
				toastr.error("加载异常信息失败");
			}
		});
	})
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
		$(function() {
			toastr.options = {
				closeButton : false, //是否显示关闭按钮
				debug : false, //是否为调试
				progressBar : true, //是否显示进度条
				positionClass : "toast-top-center", //在页面中显示的位置
				onclick : null, //点击事件
				showDuration : "100", //显示动作时间
				hideDuration : "1000", //隐藏动作时间
				timeOut : "2000", //自动关闭超时时间
				extendedTimeOut : "1000",
				showEasing : "swing",
				hideEasing : "linear",
				preventDuplicates : true,
				preventOpenDuplicates : true, //重复内容的提示框在开启时只出现一个
				showMethod : "fadeIn", //显示的方式
				hideMethod : "fadeOut" //隐藏的方式
			};
		});

		$(function() {
			//1.初始化Table
			var oTable = new TableInit();
			oTable.Init();

			//2.初始化Button的点击事件
			var oButtonInit = new ButtonInit();
			oButtonInit.Init();

		});

		var TableInit = function() {
			var oTableInit = new Object();
			//初始化Table
			oTableInit.Init = function() {
				//easyui的表格
				$('#tb_departments')
						.bootstrapTable(
								{
									url : '/noob/exceptionSettingController/exceptionSettingPageQuery.action', //请求后台的URL（*）
									method : 'get', //请求方式（*）
									toolbar : '#toolbar', //工具按钮用哪个容器
									striped : true, //是否显示行间隔色
									cache : false, //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
									pagination : true, //是否显示分页（*）
									sortable : false, //是否启用排序
									sortOrder : "asc", //排序方式
									queryParamsType : "undefined",
									queryParams : oTableInit.queryParams,//传递参数（*）
									sidePagination : "server", //分页方式：client客户端分页，server服务端分页（*）
									pageNumber : 1, //初始化加载第一页，默认第一页
									pageSize : 5, //每页的记录行数（*）
									pageList : [ 10, 20, 30, 50 ], //可供选择的每页的行数（*）
									search : true, //是否显示表格搜索，此搜索是客户端搜索，不会进服务端，所以，个人感觉意义不大
									strictSearch : true,
									showColumns : true, //是否显示所有的列
									showRefresh : true, //是否显示刷新按钮
									minimumCountColumns : 1, //最少允许的列数
									clickToSelect : true, //是否启用点击选中行
									uniqueId : "province", //每一行的唯一标识，一般为主键列
									showToggle : true, //是否显示详细视图和列表视图的切换按钮
									cardView : false, //是否显示详细视图
									detailView : false, //是否显示父子表
									queryParams : function queryParams(params) { //设置查询参数  
										var param = {
											pageNumber : params.pageNumber,
											pageSize : params.pageSize
										//页码

										};
										return param;
									},//传递参数（*）
									columns : [
											{
												checkbox : true
											},
											{
												field : 'exceptionNo',
												title : '异常编号'
											},
											{
												field : 'exceptionType',
												title : '异常类型 '
											},
											{
												field : 'exceptionItems',
												title : '异常项目'
											},
											{
												field : 'exceptionRemark',
												title : '异常备注'
											},
											{
												field : 'status',
												title : '作废状态',
												formatter : function(value, row, index) {
													if (row.status == '0') {
														return '是';
													} else {
														return '否';
													}
												}
											},
											{
												field : 'continueTransportation',
												title : '继续运输',
												formatter : function(value, row, index) {
													if (row.continueTransportation == '0') {
														return '是';
													} else {
														return '否';
													}
												}
											},
											{
												field : 'manage',
												title : '需要处理',
												formatter : function(value, row, index) {
													if (row.manage == '0') {
														return '是';
													} else {
														return '否';
													}
												}
											},
											{
												field : 'automaticSign',
												title : '自动标志',
												formatter : function(value, row, index) {
													if (row.automaticSign == '0') {
														return '是';
													} else {
														return '否';
													}
												}
											},
											{
												field : 'exceptionItems',
												title : '接收单位类型'
											},
											{
												field : 'enteringName',
												title : '录入人'
											},
											{
												field : 'enteringTime',
												title : '录入时间',
												formatter:function (value){
													return formatDate(value)
												}
											},{
												field:'secondReceivingUnit',
												title:'单位选择'
											},
											{
												field : 'enteringUnit',
												title : '录入单位'
											},
											{
												field  : 'enteringPersonnelNumber',
												title : '录入人员工号'
											}, ],
									//根据status的数据不同，数据在页面上显示的颜色不同
									rowStyle : function(row, index) {
										//这里有5个取值代表5中颜色['active', 'success', 'info', 'warning', 'danger'];
										var strclass = {};
										if (row.status == "0") {
											strclass = {
												css : {
													'background-color' : '#7FFFD4'
												}
											};//还有一个active
										}
										return strclass
									}

								});
			};
			//得到查询的参数
			oTableInit.queryParams = function(params) {
				var temp = { //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
					pageNumber : params.pageNumber,
					pageSize : params.pageSize
				//页码
				};
				return temp;
			};
			return oTableInit;
		};

		var ButtonInit = function() {
			var oInit = new Object();
			var postdata = {};

			oInit.Init = function() {
				$("#btn_edit")
						.click(
								function() {
									var select = $('#tb_departments')
											.bootstrapTable('getSelections');
									if (select.length == 0) {
										toastr.warning("请至少选择一行");
									} else if(select.length==1) {
										swal(
												{
													title : "操作提示",
													text : "确定修改?",
													type : "warning", //弹出框类型  
													showCancelButton : true, //是否显示取消按钮  
													confirmButtonColor : "#DD6B55",//确定按钮颜色  
													cancelButtonText : "取消",//取消按钮文本  
													confirmButtonText : "是的，确定修改！",//确定按钮上面的文档  
													closeOnConfirm : true
												},
												function() {
													$('#update_exceptionId').val(select[0]['exceptionId']);
													$('#update_exceptionType').val(select[0]['exceptionType']);
													$('#update_exceptionItems').val(select[0]['exceptionItems']);
													$('#update_exceptionRemark').val(select[0]['exceptionRemark']);
													$('#myUpdateModal').modal({
														keyboard : true
													})
											   toastr.success('修改后状态默认为使用');
												});
									}else{
										toastr.warning("只能选择一行");
									}
								});
				$('#btn_delete').click(
						function() {
							var select = $('#tb_departments').bootstrapTable(
									'getSelections');
							if (select.length == 0) {
								toastr.warning("请至少选择一行");
							}else{
								var arrs = [];
								for (var i = 0; i < select.length; i++) {
									arrs[i] = select[i]['exceptionId'];
								}
								$.ajax({
									type:"get",
									url:"/noob/exceptionSettingController/updateExceptionStautsU.action",
									data:{
										exceptionIds:arrs
									},success : function(result) {
										if(result=="sessecc"){
											$('#tb_departments')
											.bootstrapTable(
													'refresh',
													{
														url : "/noob/exceptionSettingController/exceptionSettingPageQuery.action"
													});
											toastr.success('删除成功!');
										}else{
											toastr.warning("删除失败");
										}
									}
								});
							}
						});
				$('#update').click(function(){
					if($('#update_exceptionItems').val()==null && $('#update_exceptionItems').val()==''){
						toastr.warning("异常项目不能为空");
					}else if($('#update_exceptionType').val()==null && $('#update_exceptionType').val()==''){
						toastr.warning("异常类型不能为空");
					}else if($('#update_exceptionRemark').val()==null && $('#update_exceptionRemark').val()==''){
						toastr.warning("异常备注不能为空");
					}else{
						$.ajax({
							type : "get",
							url : "/noob/exceptionSettingController/updateSettingU.action",
							data :{
								exceptionId:$('#update_exceptionId').val(),
								exceptionItems: $('#update_exceptionItems').val(),
								exceptionType: $('#update_exceptionType').val(),
								exceptionRemark: $('#update_exceptionRemark').val(),
								automaticSign: $('#update_automaticSign').val(),
								secondReceivingUnit: $('#update_secondReceivingUnit').val(),
								manage: $('#update_manage').val(),
								continueTransportation: $('#update_continueTransportation').val()
								
							},success : function(result) {
								if(result=="sessecc"){
									$('#tb_departments')
									.bootstrapTable(
											'refresh',
											{
												url : "/noob/exceptionSettingController/exceptionSettingPageQuery.action"
											});
									toastr.success('修改成功!');
								}else{
									toastr.warning("修改失败");
								}
							}
						});
					}
				});
				
				$('#sub').click(function(){
					if( $('#add_exceptionItems').val().trim().length==0){
						toastr.warning("异常项目不能为空");
					}else if($('#add_exceptionType').val().trim().length==0){
						toastr.warning("异常类型不能为空");
					}else if($('#add_exceptionRemark').val().trim().length==0){
						toastr.warning("异常备注不能为空");
					}else{
						$.ajax({
							type : "get",
							url : "/noob/exceptionSettingController/addExceptionSettingU.action",
							data :{
								exceptionItems:$('#add_exceptionItems').val(),//
								exceptionType:$('#add_exceptionType').val(),//
								exceptionRemark:$('#add_exceptionRemark').val(),//
								automaticSign:$('#add_automaticSign').val(),//
								secondReceivingUnit:$('#add_secondReceivingUnit').val(),//
								continueTransportation:$('#add_continueTransportation').val(),
								manage:$('#add_manage').val()//
							},success : function(result) {
								if(result=="sessecc"){
									$('#tb_departments')
									.bootstrapTable(
											'refresh',
											{
												url : "/noob/exceptionSettingController/exceptionSettingPageQuery.action"
											});
									toastr.success('添加成功!');
								}else{
									toastr.warning("添加失败");
								}
							}
						});
					}
				});
			};
			return oInit;
		};
	</script>

</body>
</html>