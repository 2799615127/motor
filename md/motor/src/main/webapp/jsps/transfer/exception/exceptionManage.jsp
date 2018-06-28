<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro"%>
<%
	String userName = request.getParameter("userName");
	request.getSession().setAttribute("userName", userName);
%>
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
<div class="modal fade" id="affirm" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<div class="panel panel-success">
					<div class="panel-heading">
						<h3 class="panel-title">确认</h3>
					</div>
					<form class="form-horizontal" onsubmit="return check()" role="form">
						<div class="form-group" style="margin-top: 15px">
							<div class="panel-body">
								<label class="control-label col-sm-2"
									for="txt_search_departmentname" style="margin-top: 15px">异常Id</label>
								<div class="col-sm-4" style="margin-top: 15px">
									<input type="text" class="form-control" disabled="disabled"
										id="affirm_exceptionId">
								</div>
								<label class="control-lable col-sm-2"
									for="txt_search_departmentname" style="margin-top: 15px">备注</label>
								<div class="col-sm-4" style="margin-top: 15px">
									<input type="text" class="form-control" id="affirm_remarks">
								</div>
								<label class="control-lable col-sm-2"
									for="txt_search_departmentname" style="margin-top: 15px">处理结果</label>
								<div class="col-sm-4" style="margin-top: 15px">
									<input type="text" class="form-control" id="affirm_result">
								</div>
								<label class="control-lable col-sm-2"
									for="txt_search_departmentname" style="margin-top: 15px">确认结果</label>
								<div class="col-sm-4" style="margin-top: 15px">
									<select id="affirm_affirmFruit"
										style="width: 100px; height: 30px">
										<option value="0">满意</option>
										<option value="1">不满意</option>
									</select>
								</div>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-primary" id="sub_affirm"
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

<div class="modal fade" id="handle" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<div class="panel panel-success">
					<div class="panel-heading">
						<h3 class="panel-title">处理</h3>
					</div>
					<form class="form-horizontal" onsubmit="return check()" role="form">
						<div class="form-group" style="margin-top: 15px">
							<div class="panel-body">
								<label class="control-label col-sm-2"
									for="txt_search_departmentname" style="margin-top: 15px">异常Id</label>
								<div class="col-sm-4" style="margin-top: 15px">
									<input type="text" class="form-control" disabled="disabled"
										id="handle_exceptionId">
								</div>
								<label class="control-lable col-sm-2"
									for="txt_search_departmentname" style="margin-top: 15px">备注</label>
								<div class="col-sm-4" style="margin-top: 15px">
									<input type="text" class="form-control" id="handle_remarks">
								</div>
								<label class="control-lable col-sm-2"
									for="txt_search_departmentname" style="margin-top: 15px">处理结果</label>
								<div class="col-sm-4" style="margin-top: 15px">
									<input type="text" class="form-control" id="handle_result">
								</div>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-primary" id="handle_sub"
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
	<div class="panel-body" style="padding-bottom: 10px;">
		<div class="panel panel-default">
			<div class="panel-heading">查询条件</div>
			<div class="panel-body">
				<form id="formSearch" class="form-horizontal">
					<div class="form-group" style="margin-top: 15px">
						<label class="control-label col-sm-2"
							for="txt_search_departmentname" style="margin-top: 15px">工作单号</label>
						<div class="col-sm-2">
							<input type="text" style="margin-top: 15px" class="form-control"
								id="coSourcingNo">
						</div>
						<label style="margin-top: 15px" class="control-label col-sm-2"
							for="txt_search_statu">异常编码</label>
						<div class="col-sm-2">
							<input type="text" style="margin-top: 15px" class="form-control"
								id="exceptionNo">
						</div>
						<label style="margin-top: 15px" class="control-label col-sm-2"
							for="txt_search_statu">异常类型</label>
						<div class="col-sm-2">
							<input type="text" style="margin-top: 15px" class="form-control"
								id="exceptionType">
						</div>
						<label style="margin-top: 15px" class="control-label col-sm-2"
							for="txt_search_statu">异常项目</label>
						<div class="col-sm-2">
							<input type="text" style="margin-top: 15px" class="form-control"
								id="exceptionItem">
						</div>
						<label style="margin-top: 15px" class="control-label col-sm-2"
							for="txt_search_statu">异常状态</label>
						<div class="col-sm-2">
							<input type="text" style="margin-top: 15px" class="form-control"
								id="exceptionstatus">
						</div>
						<label style="margin-top: 15px" class="control-label col-sm-2"
							for="txt_search_statu">录入时间</label>
						<div class="col-sm-2">
							<input type="text" style="margin-top: 15px" class="form-control"
								id="enteringTime">
						</div>
						<label style="margin-top: 15px" class="control-label col-sm-2"
							for="txt_search_statu">单位选择</label>
						<div class="col-sm-2" style="margin-top: 15px">
							<select id="unit" style="width: 100px; height: 30px">
								<option value="1">处理单位</option>
								<option value="2">录入单位</option>
								<option value="3">所有单位</option>
							</select>
						</div>
						<label style="margin-top: 15px" class="control-label col-sm-2"
							for="txt_search_statu">含下级</label>
						<div class="col-sm-2" style="margin-top: 15px">
							<select id="subordinate" style="width: 100px; height: 30px">
								<option value="1">是</option>
								<option value="2">否</option>
								<option value="3">全部</option>
							</select>
						</div>
						<div class="col-sm-4" style="text-align: left;">
							<button type="button"
								style="margin-left: 300px; margin-top: 20px" id="btn_query"
								class="btn btn-primary">查询</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<div class="panel-body" style="padding-bottom: 0px;">
		<div id="toolbar" class="btn-group">
			<div id="toolbar" class="btn-group">
				<button id="btn_affirm" type="button" class="btn btn-default">
					<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>确认
				</button>
			</div>
			<div id="toolbar" class="btn-group">
				<button id="btn_handle" type="button" class="btn btn-default">
					<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>处理
				</button>
			</div>
		</div>
		<table id="tb_departments"></table>
	</div>

	<script type="text/javascript">
		function formatDate(ns) {
			if (ns == null) {
				return null;
			}
			var now = new Date(ns);
			var year = now.getYear() + 1900;
			var month = now.getMonth() + 1;
			var date = now.getDate();
			var hour = now.getHours();
			var minute = now.getMinutes();
			var second = now.getSeconds();
			return year + "-" + month + "-" + date + " " + hour + ":" + minute
					+ ":" + second;
		}
		//初始化操作消息提示框
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
		})

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
									url : '/noob/ExceptionManageController/findExceptionPageQuery.action', //请求后台的URL（*）
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
									minimumCountColumns : 2, //最少允许的列数
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
									columns : [ {
										checkbox : true
									}, {
										field : 'exceptionNo',
										title : '异常编号'
									}, {
										field : 'coSourcingNo',
										title : '合包号'
									}, {
										field : 'admissibilityOfUnits',
										title : '受理单位'
									}, {
										field : 'nameOfAPart',
										title : '品名'
									}, {
										field : 'principal',
										title : '委托人'
									}, {
										field : 'client',
										title : '委托单位'
									}, {
										field : 'exceptionType',
										title : '异常类型'
									}, {
										field : 'exceptionItem',
										title : '异常项目'
									}, {
										field : 'continueTransportation',
										title : '继续运输',
										formatter : function(value, row, index) {
											if (row.automaticSign == '0') {
												return '是';
											} else {
												return '否';
											}
										}
									}, {
										field : 'manage',
										title : '需要处理',
										formatter : function(value, row, index) {
											if (row.automaticSign == '0') {
												return '是';
											} else {
												return '否';
											}
										}
									}, {
										field : 'actualPortReality',
										title : '实际到港时间',
										formatter : function(value) {
											return formatDate(value)
										}
									}, {
										field : 'remarks',
										title : '备注'
									}, {
										field : 'enteringName',
										title : '录入人'
									}, {
										field : 'enteringTime',
										title : '录入时间',
										formatter : function(value) {
											return formatDate(value)
										}
									}, {
										field : 'enteringUnit',
										title : '录入单位'
									}, {
										field : 'result',
										title : '处理结果'
									}, {
										field : 'processor',
										title : '处理人'
									}, {
										field : 'processingUnit',
										title : '处理单位'
									}, {
										field : 'processTime',
										title : '处理时间',
										formatter : function(value) {
											return formatDate(value)
										}
									}, {
										field : 'exceptionstatus',
										title : '异常状态'
									}, {
										field : 'affirmName',
										title : '确认人'
									}, {
										field : 'affirmUnit',
										title : '确认单位'
									}, {
										field : 'affirmTime',
										title : '确认时间',
										formatter : function(value) {
											return formatDate(value)
										}
									}, {
										field : 'affirmJobNumber',
										title : '确认人员工号'
									}, {
										field : 'affirmFruit',
										title : '确认结果'
									}, ],
									//根据status的数据不同，数据在页面上显示的颜色不同
									rowStyle : function(row, index) {
										//这里有5个取值代表5中颜色['active', 'success', 'info', 'warning', 'danger'];
										var strclass = {};
										if (row.status == "1") {
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
				$('#btn_query')
						.click(
								function() {
									var obj = {
										url : "/noob/ExceptionManageController/findExceptionPageQuery.action",
										silent : true,
										query : {
											coSourcingNo : $('#coSourcingNo')
													.val(),
											exceptionNo : $('#exceptionNo')
													.val(),
											exceptionType : $('#exceptionType')
													.val(),
											exceptionItem : $('#exceptionItem')
													.val(),
											exceptionstatus : $(
													'#exceptionstatus').val(),
											enteringTime : $('#enteringTime')
													.val(),
											unit : $('#unit').val(),
											subordinate : $('#subordinate')
													.val()
										}
									};
									$('#tb_departments').bootstrapTable(
											'refresh', obj);
								});

				$('#btn_handle').click(
						function() {
							var select = $('#tb_departments').bootstrapTable(
									'getSelections');
							if (select.length == 0) {
								toastr.warning("请选择一行");
							} else if (select.length == 1) {
								if (select[0]['exceptionstatus'] == "未处理") {
									$("#handle_exceptionId").val(
											select[0]['exceptionId']);
									$("#handle_remarks").val(
											select[0]['remarks']);
									$('#handle').modal({
										keyboard : true
									})
								} else {
									toastr.warning("只能处理未处理的数据");
								}

							} else {
								toastr.warning("只能选择一行");
							}

						});

				$('#btn_affirm').click(
						function() {
							var select = $('#tb_departments').bootstrapTable(
									'getSelections');
							if (select.length == 0) {
								toastr.warning("请选择一行");
							} else if (select.length == 1) {
								if (select[0]['exceptionstatus'] == "以处理") {
									$("#affirm_exceptionId").val(
											select[0]['exceptionId']);
									$("#affirm_remarks").val(
											select[0]['remarks']);
									$("#affirm_result").val(select[0]['result']);
									$('#affirm').modal({
										keyboard : true
									})
								} else {
									toastr.warning("只能确认已处理的数据");
								}
							} else {
								toastr.warning("只能选择一行");
							}
						});
				$('#handle_sub').click(function(){
					if($('#handle_result').val().trim().length==0){
						toastr.warning("处理数据不能为空");
					}else{
						$.ajax({
							type:"get",
							url:"/noob/ExceptionManageController/updateExceptionManage.action",
							data:{
								exceptionId:$("#handle_exceptionId").val(),
								result:$('#handle_result').val()
							},success : function(result) {
								if(result=="sessecc"){
									$('#tb_departments')
									.bootstrapTable(
											'refresh',
											{
												url : "/noob/ExceptionManageController/findExceptionPageQuery.action"
											});
									toastr.success('处理成功!');
								}else{
									toastr.warning("处理失败"); 
								}
							}
						});
					}
				});
				
				$('#sub_affirm').click(function(){
					$.ajax({
						type:"get",
						url:"/noob/ExceptionManageController/confirmExceptionManageU.action",
						data:{
							exceptionId:$("#affirm_exceptionId").val(),
							affirmFruit:$('#affirm_affirmFruit').val()
						},success : function(result) {
							if(result=="sessecc"){
								$('#tb_departments')
								.bootstrapTable(
										'refresh',
										{
											url : "/noob/ExceptionManageController/findExceptionPageQuery.action"
										});
								toastr.success('处理成功!');
							}else{
								toastr.warning("处理失败"); 
							}
						}
					});
				});

			};
			return oInit;
		};
	</script>

</body>
</html>