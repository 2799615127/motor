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
<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<div class="panel panel-success">
					<div class="panel-heading">
						<h3 class="panel-title">录入</h3>
					</div>
					<form class="form-horizontal" onsubmit="return check()" role="form">
						<div class="form-group" style="margin-top: 15px">
							<div class="panel-body">
								<label class="control-label col-sm-2"
									for="txt_search_departmentname" style="margin-top: 15px">工作单号</label>
								<div class="col-sm-4" style="margin-top: 15px">
									<input type="text" disabled="disabled" class="form-control" id="add_coSourcingNo">
								</div>
								<label class="control-label col-sm-2"
									for="txt_search_departmentname" style="margin-top: 15px">意见备注</label>
								<div class="col-sm-4" style="margin-top: 15px">
									<input type="text" class="form-control" id="add_remarks">
								</div>
								<label class="control-label col-sm-2"
									for="txt_search_departmentname" style="margin-top: 15px">关联异常</label>
								<div class="col-sm-4" style="margin-top: 15px">
									<select id="exceptionInfo" style="width: 100px; height: 30px">
										<option value="">请选择</option>
									</select>

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
		<div class="panel panel-default">
			<div class="panel-heading">查询条件</div>
			<div class="panel-body">
				<form id="formSearch" class="form-horizontal">
					<div class="form-group" style="margin-top: 15px">
						<label class="control-label col-sm-2"
							for="txt_search_departmentname" style="margin-top: 15px">工作单号</label>
						<div class="col-sm-2">
							<input type="text" class="form-control" style="margin-top: 15px"
								id="coSourcingNo">
						</div>
						<div class="col-sm-4" style="text-align: left;">
							<button type="button"
								style="margin-left: 650px; margin-top: 15px" id="btn_query"
								class="btn btn-primary">查询</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<div id="toolbar" class="btn-group">
		<div id="toolbar" class="btn-group">
			<div id="toolbar" class="btn-group">
				<button id="btn_edit" type="button" class="btn btn-default">
					<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>录入
				</button>
			</div>
		</div>
	</div>
	<table id="tb_departments"></table>
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
				url : "/noob/exceptionSettingController/exceSettingPageQuery.action",
				success : function(data) {
					for (var i = 0; i < data.length; i++) {
						$('#exceptionInfo').append(
								"<option value='" + data[i].exceptionId + "' >"
										+ data[i].exceptionType + "</option>");
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
										url : '/noob/ExceptionReceiveController/exceptionReceivePageQuery.action', //请求后台的URL（*）
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
										queryParams : function queryParams(
												params) { //设置查询参数  
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
											field : 'coSourcingNo',
											title : '工作单号'
										}, {
											field : 'nameOfAPart',
											title : '品名 '
										}, {
											field : 'weight',
											title : '重量'
										}, {
											field : 'admissibilityOfUnits',
											title : '受理单位'
										}, {
											field : 'shippingType',
											title : '发货类型'
										}, {
											field : 'delivery',
											title : '发货方式'
										}, {
											field : 'timeLimitForService',
											title : '送达时限',
											formatter:function (value){
												return formatDate(value)
											}
										}, {
											field : 'important',
											title : '重要提示'
										}, {
											field : 'reachGround',
											title : '到达地'
										}, ],

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
					$('#btn_query').click(function(){
						var obj={
								url : "/noob/ExceptionReceiveController/exceptionReceivePageQuery.action",
								silent : true,
								query : {
									coSourcingNo:$("#coSourcingNo").val() 
								}	
						};
						$('#tb_departments').bootstrapTable(
								'refresh', obj);
					});
					$('#btn_edit').click(
							function(){
								var select = $('#tb_departments').bootstrapTable(
								'getSelections');
						if (select.length == 0) {
							toastr.warning("请选择一行");
						}else if(select.length == 1){
							$("#add_coSourcingNo").val(select[0]['coSourcingNo']);
							$('#myModal').modal({
								keyboard : true
							})
						}else{
							toastr.warning("只能选择一行");
						}
					});
					$('#sub').click(function(){
						if($('#add_coSourcingNo').val().trim().length==0){
							toastr.warning("工作单号不能为空");
						}if($('#add_remarks').val().trim().length==0){
							toastr.warning("备注不能为空");
						}if($('#exceptionInfo').val()==''||$('#exceptionInfo').val().trim().length==0){
							toastr.warning("请选择你要关联的异常");
						}else{
						 $.ajax({
							 url:"/noob/ExceptionManageController/addExceptionManage.action",
							 type:"GET",
							 data:{
								 coSourcingNo:$('#add_coSourcingNo').val(),
								 remarks:$('#add_remarks').val(),
								 exceptionNo:$('#exceptionInfo').val()
							 },success : function(result) {
								 if(result="sessecc"){
									 toastr.warning("添加成功");
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