<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width" />

<meta http-equiv="Cache-Cont ol" content="max-age=0" />
<meta http-equiv="Cache-control" content="no-cache" />

<title>Insert title here</title>
<!--合作网络设置 -->
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
			<button type="button" class="close" data-dismiss="modal"
				aria-hidden="true">&times;
			</button>
			<div class="panel panel-success">
				<div class="panel-heading">
					<h3 class="panel-title">修改</h3><br>
				</div>
				<form class="form-horizontal" onsubmit="return check()" role="form">
					<div class="form-group" style="margin:20px">
						<label for="lastname" class="col-sm-2 control-label" >加盟商Id</label>
						<div class="col-sm-8">
							<input type="text" class="form-control"
								id="allianceBusinessIDing" disabled="disabled">
						</div>
					</div>
					<div class="form-group">
						<label for="lastname" class="col-sm-2 control-label">晚点标准(小时)</label>
						<div class="col-sm-8">
							<select id="delayStandarding" style="width: 70px">
								<option>01</option>
								<option>02</option>
								<option>03</option>
								<option>04</option>
								<option>05</option>
								<option>06</option>
								<option>07</option>
								<option>08</option>
								<option>09</option>
								<option>10</option>
								<option>11</option>
								<option>12</option>
							</select>
						</div>
					</div>
					<div class="modal-footer">
					  <button type="button" class="btn btn-primary" id="subs"
						 data-dismiss="modal">提交更改</button>
					  <button type="button" class="btn btn-default4" data-dismiss="modal">关闭</button>
				   </div>
				</form>
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
					<div class="panel-body">
						<form class="form-horizontal" onsubmit="return check()"
							role="form">
							<div class="form-group">
								<label for="lastname" class="col-sm-2 control-label">加盟商地址</label>
								<div class="col-sm-10">
									<label class="col-sm-2 control-label">省市县</label> <select
										class="select" id="province_code" name="province_code"
										onchange="getCity()">
										<option value="">请选择</option>
									</select> <select class="select" id="city_code" name="city_code"
										onchange="getArea()">
										<option value="">请选择</option>
									</select> <select class="select" id="area_code" name="area_code">
										<option value="">请选择</option>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label for="lastname" class="col-sm-2 control-label">加盟商名</label>
								<div class="col-sm-10">
									<input type="text" class="form-control"
										id="allianceBusinessNameing" placeholder="请输入加盟商名">
								</div>
							</div>
							<div class="form-group">
								<label for="lastname" class="col-sm-2 control-label">晚点标准(小时)</label>
								<div class="col-sm-10">
									<select id="delayStandards" style="width:70px;">
										<option>01</option>
										<option>02</option>
										<option>03</option>
										<option>04</option>
										<option>05</option>
										<option>06</option>
										<option>07</option>
										<option>08</option>
										<option>09</option>
										<option>10</option>
										<option>11</option>
										<option>12</option>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label for="lastname" class="col-sm-2 control-label">作废标志</label>
								<div class="col-sm-10">
									<select id="cancellationMarkes" class="form-control"
										onchange="selectOnchang(this)">
										<option value="1">初始化为作废</option>
										<option value="0">正常使用</option>
									</select>
								</div>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-primary" id="sub"
									data-dismiss="modal">提交更改</button>
								<button type="button" class="btn btn-default4"
									data-dismiss="modal">关闭</button>
							</div>
						</form>
					</div>
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
							for="txt_search_departmentname">加盟商代码</label>
						<div class="col-sm-2">
							<input type="text" class="form-control" id="allianceBusinessCode">
						</div>
						<label class="control-label col-sm-2" for="txt_search_statu">作废标志</label>
						<div class="col-sm-2">
							<select id="cancellationMark" class="form-control"
								onchange="selectOnchang(this)">
								<option value="0">否</option>
								<option value="1">是</option>
								<option value="">全部</option>
							</select>
						</div>
						<div class="col-sm-4" style="text-align: left;">
							<button type="button" style="margin-left: 50px" id="btn_query"
								class="btn btn-primary">查询</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<div>
		<div id="toolbar" class="btn-group">
			<button id="btn-add" type="button" class="btn btn-default1"
				data-toggle="modal" data-target="#myModal">
				<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增
			</button>
			<button id="btn_update" type="button" class="btn btn-default">
				<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>修改
			</button>
			<button id="btn_delete" type="button" class="btn btn-default">
				<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>作废
			</button>
			<button id="btn_restore" type="button" class="btn btn-default">
				<span class="glyphicon glyphicon-refresh" aria-hidden="true"></span>还原
			</button>
		</div>
		<table id="tb_departments"></table>
	</div>

	<script type="text/javascript">
		$(function() {
			$.ajax({
				type : "post",
				url : "/noob/region/provinceQuery.action",
				success : function(data) {
					for (var i = 0; i < data.length; i++) {
						$('#province_code').append(
								"<option value='" + data[i].id + "' >"
										+ data[i].id + "</option>");
					}
				},
				error : function() {
					toastr.error("加载省失败");
				}
			});
		})

		/*加载市下拉选*/
		function getCity() {
			var id = $("#province_code").val();
			$("#city_code").empty();
			$("#area_code").empty();
			$.ajax({
				type : "post",
				url : "/noob/region/cityQuery.action",
				data : {
					"province" : id
				},
				success : function(data) {
					$('#city_code').append(
							"<option value='' selected='selected' >" + '请选择'
									+ "</option>");
					$('#area_code').append(
							"<option value='' selected='selected' >" + '请选择'
									+ "</option>");
					for (var i = 0; i < data.length; i++) {
						$('#city_code').append(
								"<option value='" + data[i].id + "' >"
										+ data[i].id + "</option>");
					}
				},
				error : function() {
					toastr.error("加载市失败");
				}
			});
		};
		/*加载地区下拉选*/
		function getArea() {
			var provinceID= $("#province_code").val();
			var id = $("#city_code").val();
			$("#area_code").empty();
			$.ajax({
				type : "get",
				url : "/noob/region/districtQuery.action",
				data : {
					"city" : id,
					"province":provinceID
				},
				success : function(data) {
					$('#area_code').append(
							"<option value='' selected='selected' >" + '请选择'
									+ "</option>");
					for (var i = 0; i < data.length; i++) {
						$('#area_code').append(
								"<option value='" + data[i].id+ "' >"
										+ data[i].id + "</option>");
					}
				},
				error : function() {
					toastr.error("加载区失败");
				}
			});
		}

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
									url : '/noob/AllianceBusiness/allianceBusinessPageQuery.action', //请求后台的URL（*）
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
											pageSize : params.pageSize, //页码
											cancellationMark : $(
													"#cancellationMark").val()
										};
										return param;
									},//传递参数（*）
									columns : [
											{
												checkbox : true
											},
											{
												field : 'allianceBusinessCode',
												title : '网络合作代码'
											},
											{
												field : 'allianceBusinessName',
												title : '网络合作名'
											},
											{
												field : 'delayStandard',
												title : '晚点标准'
											},
											{
												field : 'cancellationMark',
												title : '作废标志',
												formatter : function(value,
														row, index) {
													if (row.cancellationMark == '0') {
														return '否';
													} else {
														return '是';
													}
												}
											}, {
												field : 'strUpdateTime',
												title : '修改时间'
											}, ],
									rowStyle : function(row, index) {
										//这里有5个取值代表5中颜色['active', 'success', 'info', 'warning', 'danger'];
										var strclass = {};
										if (row.cancellationMark == "1") {
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
					pageSize : params.pageSize, //页码
					cancellationMark : $("#cancellationMark").val()
				};
				return temp;
			};
			return oTableInit;
		};

		var ButtonInit = function() {
			var oInit = new Object();
			var postdata = {};

			oInit.Init = function() {
				// 初始化页面上面的按钮事件
				$("#btn_query")
						.click(
								function() {
									var obj = {
										url : "/noob/AllianceBusiness/allianceBusinessPageQuery.action",
										silent : true,
										query : {
											allianceBusinessCode : $(
													'#allianceBusinessCode')
													.val(),//到底应该是模糊查询还是？？？
											cancellationMark : $(
													'#cancellationMark').val()
										}
									};
									$('#tb_departments').bootstrapTable(
											'refresh', obj);
								});
				$("#btn_add").click(function() {
					test();
				});
				
				$("#subs").click(function(){
					$.ajax({
						type:"get",
						url:"/noob/AllianceBusiness/updateDelayStandardU.action",
						data:{
							allianceBusinessId:$("#allianceBusinessIDing").val(),
							delayStandard:$("#delayStandarding").val()+":00:00"
						},success : function(result) {
							if (result == "success") {
								//重定向到本页面
								$('#tb_departments')
										.bootstrapTable(
												'refresh',
												{
													url : "/noob/AllianceBusiness/allianceBusinessPageQuery.action"
												});
								toastr
										.success('修改成功!');
							} else {
								toastr
										.error('修改失败或有数据没有被修改!');
							}
						}
					});
				});

				$("#sub")
						.click(
								function() {
									if ($("#area_code").val() == "") {
										toastr.waring("请选择地址");
									} else if ($("#delayStandard") == "") {
										toastr.waring("请选择晚点标准");
									} else if ($("#allianceBusinessName") == "") {
										toastr.waring("请输入加盟商名");
									} else {
										$
												.ajax({
													type : "get",
													url : "/noob/AllianceBusiness/addAllianceBusinessU.action",
													data : {
														province : $(
																"#province_code")
																.val(),
														city : $("#city_code")
																.val(),
														area : $("#area_code")
																.val(),
														allianceBusinessName : $(
																"#allianceBusinessNameing")
																.val(),
														delayStandard : $(
																"#delayStandards")
																.val()
																+ ":00:00",
														cancellationMark : $(
																"#cancellationMarkes")
																.val()
													},
													success : function(result) {
														if (result == "success") {
															//重定向到本页面
															$('#tb_departments')
																	.bootstrapTable(
																			'refresh',
																			{
																				url : "/noob/AllianceBusiness/allianceBusinessPageQuery.action"
																			});
															toastr
																	.success('添加成功!');
														} else {
															toastr
																	.error('添加失败!');
														}
													}

												});
									}

								});

				$("#btn_update")
						.click(
								function() {
									var select = $('#tb_departments')
											.bootstrapTable('getSelections');
									if (select.length == 0) {
										toastr.warning("请至少选择一行");
									} else {
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
													var arrs = [];
													for (var i = 0; i < select.length; i++) {
														arrs[i] = select[i]['allianceBusinessId'];
													}
													$(
															'#allianceBusinessIDing')
															.val(arrs);
													$('#myUpdateModal').modal({
														keyboard : true
													})
												});
									}
								});
				$("#btn_delete")
						.click(
								function() {
									var select = $('#tb_departments')
											.bootstrapTable('getSelections');
									if (select.length == 0) {
										toastr.warning("请至少选择一行");
									} else {
										swal(
												{
													title : "操作提示", //弹出框的title  
													text : "确定作废吗？", //弹出框里面的提示文本  
													type : "warning", //弹出框类型  
													showCancelButton : true, //是否显示取消按钮  
													confirmButtonColor : "#DD6B55",//确定按钮颜色  
													cancelButtonText : "取消",//取消按钮文本  
													confirmButtonText : "是的，确定作废！",//确定按钮上面的文档  
													closeOnConfirm : true
												},
												function() {
													var arrs = [];
													for (var i = 0; i < select.length; i++) {
														arrs[i] = select[i]['allianceBusinessId'];
													}
													$
															.ajax({
																type : "GET",
																url : '/noob/AllianceBusiness/updateCancellationMarkU.action',
																data : {
																	allianceBusinessIds : arrs,
																	cancellationMark : 1
																},
																success : function(
																		result) {
																	if (result == "success") {
																		//重定向到本页面
																		$(
																				'#tb_departments')
																				.bootstrapTable(
																						'refresh',
																						{
																							url : "/noob/AllianceBusiness/allianceBusinessPageQuery.action"
																						});
																		toastr
																				.success('删除成功!');
																	} else {
																		toastr
																				.error('删除失败!');
																	}
																}

															});

												});
									}
								});
				$("#btn_restore")
						.click(
								function() {
									var select = $('#tb_departments')
											.bootstrapTable('getSelections');
									if (select.length == 0) {
										toastr.warning("请至少选择一行");
									} else {
										swal(
												{
													title : "操作提示", //弹出框的title  
													text : "确定还原吗？", //弹出框里面的提示文本  
													type : "warning", //弹出框类型  
													showCancelButton : true, //是否显示取消按钮  
													confirmButtonColor : "#DD6B55",//确定按钮颜色  
													cancelButtonText : "取消",//取消按钮文本  
													confirmButtonText : "是的，确定还原！",//确定按钮上面的文档  
													closeOnConfirm : true
												},
												function() {
													var arrs = [];
													for (var i = 0; i < select.length; i++) {
														arrs[i] = select[i]['allianceBusinessId'];
													}
													$
															.ajax({
																type : "GET",
																url : '/noob/AllianceBusiness/updateCancellationMarkU.action',
																data : {
																	allianceBusinessIds : arrs,
																	cancellationMark : 0
																},
																success : function(
																		result) {
																	if (result == "success") {
																		//重定向到本页面
																		$(
																				'#tb_departments')
																				.bootstrapTable(
																						'refresh',
																						{
																							url : "/noob/AllianceBusiness/allianceBusinessPageQuery.action"
																						});
																		toastr
																				.success('还原成功!');
																	} else {
																		toastr
																				.error('还原失败!');
																	}
																}
															});
												});
									}
								});
			};

			return oInit;
		};
	</script>

</body>
</html>