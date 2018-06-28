<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%  
	String userName = request.getParameter("userName");
	String orgName = request.getParameter("orgName");
%> 
<%@ page isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js"></script>

<!-- bootstrap组件引用 -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/bootstrap/js/bootstrap.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/js/bootstrap/css/bootstrap.min.css">

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/jsps/delivery/receipt/jobsImport/css/fileinput.min.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/js/bootstrap-editable/bootstrap-editable.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/js/bootstrap-datetimepicker/css/bootstrap-datetimepicker.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/jsps/delivery/receipt/jobsImport/css/worksheetLead.css" />
<script
	src="${ pageContext.request.contextPath }/js/jquery-3.1.1.min.js"
	type="text/javascript"></script>
<link rel="stylesheet" type="text/css"
	href="${ pageContext.request.contextPath }/js/bootstrap/css/bootstrap.min.css">
<script type="text/javascript"
	src="${ pageContext.request.contextPath }/js/bootstrap/js/bootstrap.min.js"></script>
<!-- 下拉框 -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/bootstrap-select/js/bootstrap-select.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/js/bootstrap-select/css/bootstrap-select.min.css" />

<link
	href="${ pageContext.request.contextPath }/css/bootsrap-checkbox/bootstrap-checkbox.css"
	rel="stylesheet" />
<!-- 表格 -->
<script
	src="${ pageContext.request.contextPath }/js/bootstrap-table/bootstrap-table.js"></script>
<link
	href="${ pageContext.request.contextPath }/js/bootstrap-table/bootstrap-table.css"
	rel="stylesheet" />
<script
	src="${ pageContext.request.contextPath }/js/bootstrap-table/locale/bootstrap-table-zh-CN.js"></script>

<script type="text/javascript"
	src="${pageContext.request.contextPath}/jsps/transfer/sorting/closeWrap/js/closeWrap.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/jsps/transfer/sorting/closeWrap/js/addCloseWrap.js"></script>

<!-- fileinput引用 -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/jsps/delivery/receipt/jobsImport/js/fileinput.js"></script>
<!-- zh引用 -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/jsps/delivery/receipt/jobsImport/js/zh.js"></script>
<!-- layer引用 -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/jsps/transfer/sorting/closeWrap/js/layer.js"></script>
<!-- editable引用 -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/bootstrap-editable/edittable.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/bootstrap-editable/bootstrap-table-editable.js"></script>
<!-- datetimepicker引用 -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/bootstrap-datetimepicker/js/bootstrap-datetimepicker.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/bootstrap-datetimepicker/js/bootstrap-datetimepicker.zh-CN.js"></script>
<!-- bwizard引用 -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/jsps/delivery/receipt/jobsImport/js/bwizard.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/toastr/toastr.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/js/toastr/toastr.min.css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/sweetalert/sweetalert.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/js/sweetalert/sweetalert.css" />
<script type="text/javascript">
	$(function() {

		var oTable = new TableInit();

		oTable.Init();

		oTable.InitSubTable();

		var oTableCloseWrapData = new TableInitAddCloseData();

		oTableCloseWrapData.Init();
		
		var oTableWrapData = new TableInitEditCloseData();
		  oTableWrapData.Init();
		

		//初始化操作消息提示框
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

	var TableInit = function() {
		var oTableInit = new Object();
		//初始化Table
		oTableInit.Init = function() {
			$('#tb_departments').bootstrapTable({
				url : '../../../../closeWrapPageQuery.action',//请求后台的URL（*）
				method : 'get', //请求方式（*） 
				toolbar : '#toolbars', //工具按钮用哪个容器 
				striped : true, //是否显示行间隔色 
				cache : false, //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*） 
				pagination : true, //是否显示分页（*） 
				sortable : true, //是否启用排序 
				sortOrder : "asc", //排序方式
				sidePagination : "server", //分页方式：client客户端分页，server服务端分页（*） 
				pageNumber : 1, //初始化加载第一页，默认第一页 
				pageSize : 10, //每页的记录行数（*） 
				pageList : [ 5, 10, 20, 50 ], //可供选择的每页的行数（*） 
				strictSearch : true,

				minimumCountColumns : 2, //最少允许的列数
				clickToSelect : true, //是否启用点击选中行 
				uniqueId : "closeId", //每一行的唯一标识，一般为主键列 

				detailView : false, //是否显示父子表
				maintainSelected : true,
				queryParams : function queryParams(params) { //设置查询参数  
					var param = {
						limit : params.limit,
						offset : params.offset

					};
					return param;
				},//传递参数（*）
				columns : [ {
					checkbox : true
				}, {
					field : 'closeWrapId',
					align : 'center',
					title : '合包号'
				}, {
					field : 'username',
					align : 'center',
					title : '合包人'
				}, {
					field : 'sealNo',
					align : 'center',
					title : '封签号'
				},

				],

				onDblClickRow : function(row, tr) {
					// 进行你的操作，如弹出新窗口
					/*  var archivesId = row.archivesId;
					 $("#archivesIdS").val(archivesId); */
					$('#tb_departments').bootstrapTable('refresh');
				}
			});
		};

		$(function() {
			$("#btn_enter").click(function() {
				$('#ImportModal').modal('show');
				$('#step2').attr('aria-hidden', false).attr('class',
				'bwizard-activated');
			});

			

		
			// div上传导入文件点击事件
			$('#uploadLead a').click(
					function(e) {
						e.preventDefault();
						$('#download').attr('class', '');
						$('#uploadLead').attr('class', 'active');
						$('#step1').attr('aria-hidden', true).attr('class',
								'hide');
						$('#step2').attr('aria-hidden', false).attr('class',
								'bwizard-activated');
						$('#next').addClass('hide');
						$('#after').removeClass('hide');
						$('#over').removeClass('hide');
					});
			$('#after').click(
					function() {
						$('#download').attr('class', 'active');
						$('#uploadLead').attr('class', '');
						$('#step1').attr('aria-hidden', false).attr('class',
								'bwizard-activated');
						$('#step2').attr('aria-hidden', true).attr('class',
								'hide');
						$('#next').removeClass('hide');
						$('#after').addClass('hide');
						$('#over').addClass('hide');
					});

		});

		$(function() {
			$("#btn_addEnter").click(function() {
				$("#myModalIN").modal('show');
				$('#stepL2').attr('aria-hidden', false).attr('class',
				'bwizard-activated');
			});

			// div上传导入文件点击事件
			$('#uploadLeadL a').click(
					function(e) {
						e.preventDefault();
						$('#downloadL').attr('class', '');
						$('#uploadLeadL').attr('class', 'active');
						$('#stepL1').attr('aria-hidden', true).attr('class',
								'hide');
						$('#stepL2').attr('aria-hidden', false).attr('class',
								'bwizard-activated');
						$('#nextL').addClass('hide');
						$('#afterL').removeClass('hide');
						$('#overL').removeClass('hide');
					});
			$('#afterL').click(
					function() {
						$('#downloadL').attr('class', 'active');
						$('#uploadLeadL').attr('class', '');
						$('#stepL1').attr('aria-hidden', false).attr('class',
								'bwizard-activated');
						$('#stepL2').attr('aria-hidden', true).attr('class',
								'hide');
						$('#nextL').removeClass('hide');
						$('#afterL').addClass('hide');
						$('#overL').addClass('hide');
					});
		})

		$("#input-file").fileinput({
			uploadUrl : "../../../../uploadPackageLead.action",
			language : 'zh',// 设置语言
			maxFileCount : 1,
			allowedFileExtensions : [ 'xls' ]
		// 接收的文件后缀
		}).on(
				"fileuploaded",
				function(event, data, previewId, index) {
					//var oTable = new TableInit();
					//oTable.Init(data.response.list);
					$(".kv-file-remove").trigger("click");
					$('#ImportModal').modal('hide');
					if (data.response.status == "success") {
						$("#table-footer").bootstrapTable('removeAll');
						toastr.success("导入成功");
						$("#table-footer").bootstrapTable('load',
								data.response.list);
					

						$("#input-file").fileinput('reset');
					} else {
						toastr.error("导入失败");

					}
				});
		$("#input-fileL").fileinput({
			uploadUrl : "../../../../uploadPackageLead.action",
			language : 'zh',// 设置语言
			maxFileCount : 1,
			allowedFileExtensions : [ 'xls' ]
		// 接收的文件后缀
		}).on(
				"fileuploaded",
				function(event, data, previewId, index) {
					//var oTable = new TableInit();
					//oTable.Init(data.response.list);
					$(".kv-file-remove").trigger("click");
					$('#myModalIN').modal('hide');
					if (data.response.status == "success") {
						toastr.success("导入成功");
						$("#table-footer").bootstrapTable('append',
								data.response.list);
						$('#quantilyWorkOrderNum').attr('disabled', false);
						$('#delete').attr('disabled', false);
						$('#lead').attr('disabled', false);

						$("#input-fileL").fileinput('reset');
					} else {
						toastr.error("导入失败");

					}
				});

		//子集表格
		oTableInit.InitSubTable = function() {
			$("#table-footer").bootstrapTable({
				url : '../../../../closeDetailQuery.action',//请求后台的URL（*）
				method : 'get', //请求方式（*） 
				toolbar : '#toolbar', //工具按钮用哪个容器 
				striped : true, //是否显示行间隔色 
				cache : false, //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*） 
				pagination : true, //是否显示分页（*） 
				sortable : true, //是否启用排序 
				sortOrder : "asc", //排序方式
				maintainSelected : true,
				queryParams : function queryParams(params) { //设置查询参数  
					var param = {
						limit : params.limit,
						offset : params.offset,

					};
					return param;
				},//传递参数（*） 
				sidePagination : "client", //分页方式：client客户端分页，server服务端分页（*） 
				pageNumber : 1, //初始化加载第一页，默认第一页 
				pageSize : 5, //每页的记录行数（*） 
				pageList : [ 5, 10, 20, 50 ], //可供选择的每页的行数（*） 
				strictSearch : true,

				minimumCountColumns : 2, //最少允许的列数
				clickToSelect : true, //是否启用点击选中行 
				uniqueId : "detailId", //每一行的唯一标识，一般为主键列 

				detailView : false, //是否显示父子表

				columns : [ {
					checkbox : true
				}, {
					field : 'oddNumber',
					align : 'center',
					title : '单号'
				}, ]
			});
		}

		return oTableInit;
	};
	var TableInitAddCloseData = function() {
		var oTableCloseWrapData = new Object();
		// 初始化订单属性Table
		oTableCloseWrapData.Init = function() {
			$('#table-bottom').bootstrapTable({
				url : '', // 请求后台的URL（*）
				method : 'get', // 请求方式（*）
				toolbar : '#toolbar', // 工具按钮用哪个容器
				striped : true, // 是否显示行间隔色
				cache : false, // 是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
				pagination : true, // 是否显示分页（*）
				sortable : false, // 是否启用排序
				sortOrder : "asc", // 排序方式
				queryParams : oTableCloseWrapData.queryParams,// 传递参数（*）
				sidePagination : "server", // 分页方式：client客户端分页，server服务端分页（*）
				pageNumber : 1, // 初始化加载第一页，默认第一页
				pageSize : 6, // 每页的记录行数（*）
				pageList : [ 5, 10, 15, 20 ], // 可供选择的每页的行数（*）
				search : false, // 是否显示表格搜索，此搜索是客户端搜索，不会进服务端，所以，个人感觉意义不大
				strictSearch : true,
				minimumCountColumns : 2, // 最少允许的列数
				clickToSelect : true, // 是否启用点击选中行
				uniqueId : "", // 每一行的唯一标识，一般为主键列
				detailView : false, // 是否显示父子表
				columns : [{
					field : 'oddNumber',
					title : '单号'
				}, {
					field : 'nameOfAPart',
					title : '品名'
				}, {
					field : 'whither',
					title : '到达地'
				}, {
					field : 'factQuantity',
					title : '件数'
				}, {
					field : 'billingQuantity',
					title : '实际件数'
				}, { 
					field : 'factWeight',
				    title : '重量'
			    }, {
				
					field : 'size',
					title : '体积'
				}, {
					field : 'poll',
					title : '票数'
				}, {
					field : 'serviceTimeLimit',
					title : '到达时限',
					formatter:FormatDate
				}, {
					field : 'important',
					title : '重要提示'
				}, {
					field : 'mannedRequire',
					title : '配送要求'
				}, {
					field : 'inputType',
					title : '输入类型',
				} ]
			});
		};

		// 初始化工单咨询Table
		// 得到查询的参数
		oTableCloseWrapData.queryParams = function(params) {
			var temp = {
				// 这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
				pageSize : params.limit,
				start : params.offset,
			};
			return temp;
		};

		return oTableCloseWrapData;
	};
	
	
	var TableInitEditCloseData = function() {
		var oTableWrapData = new Object();
		// 初始化订单属性Table
		oTableWrapData.Init = function() {
			$('#table-edit').bootstrapTable({
				url : '', // 请求后台的URL（*）
				method : 'get', // 请求方式（*）
				toolbar : '#toolbar', // 工具按钮用哪个容器
				striped : true, // 是否显示行间隔色
				cache : false, // 是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
				pagination : true, // 是否显示分页（*）
				sortable : false, // 是否启用排序
				sortOrder : "asc", // 排序方式
				queryParams : oTableWrapData.queryParams,// 传递参数（*）
				sidePagination : "client", // 分页方式：client客户端分页，server服务端分页（*）
				pageNumber : 1, // 初始化加载第一页，默认第一页
				pageSize : 6, // 每页的记录行数（*）
				pageList : [ 5, 10, 15, 20 ], // 可供选择的每页的行数（*）
				search : false, // 是否显示表格搜索，此搜索是客户端搜索，不会进服务端，所以，个人感觉意义不大
				strictSearch : true,
				minimumCountColumns : 2, // 最少允许的列数
				clickToSelect : true, // 是否启用点击选中行
				uniqueId : "", // 每一行的唯一标识，一般为主键列
				detailView : false, // 是否显示父子表
				columns : [ {
					field : 'oddNumber',
					title : '单号'
				}, {
					field : 'nameOfAPart',
					title : '品名'
				}, {
					field : 'whither',
					title : '到达地'
				}, {
					field : 'factQuantity',
					title : '件数'
				}, {
					field : 'billingQuantity',
					title : '实际件数'
				}, { 
					field : 'factWeight',
				    title : '重量'
			    }, {
				
					field : 'size',
					title : '体积'
				}, {
					field : 'poll',
					title : '票数'
				}, {
					field : 'serviceTimeLimit',
					title : '到达时限',
					formatter:FormatDate
				}, {
					field : 'important',
					title : '重要提示'
				}, {
					field : 'mannedRequire',
					title : '配送要求'
				}, {
					field : 'inputType',
					title : '输入类型',
				} ]
			});
		};

		// 初始化工单咨询Table
		// 得到查询的参数
		oTableWrapData.queryParams = function(params) {
			var temp = {
				// 这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
				pageSize : params.limit,
				start : params.offset,
			};
			return temp;
		};

		return oTableWrapData;
	};
	
	
</script>
<style>
.col-sm-2 {
	margin-bottom: 10px;
}
;
</style>
</head>
<body>

	<!-- 左右表格 -->
	<div style="width: 80%;">
		<!-- style="float: left;width:48%;margin:0px 0px 0px 13px" -->
		<table id="tb_departments"></table>
	</div>

	<div style="width: 29%">
		<!-- style="float: right;width:48%;margin:0px 13px 0px 0px" -->
		<table id="table-footer"></table>
	</div>

	<!-- 合包 按钮区-->
	<div id="toolbars" class="btn-group">
		<button id="btn_accept" type="button" class="btn btn-default">
			<span class="glyphicon glyphicon-import" aria-hidden="true"></span>接受数据
		</button>
		<button id="btn_enter" type="button" class="btn btn-default">
			<span class="glyphicon glyphicon-log-in" aria-hidden="true"></span>导入数据
		</button>
		<button id="btn_addEnter" type="button" class="btn btn-default">
			<span class="glyphicon glyphicon-log-in" aria-hidden="true"></span>追加导入数据
		</button>
		<button id="btn_delete" type="button" class="btn btn-default">
			<span class="glyphicon glyphicon-trash" aria-hidden="true"></span>删除合包
		</button>
		<button id="btn_edit" type="button" class="btn btn-default">
			<span class="glyphicon  glyphicon-pencil" aria-hidden="true"></span>修改合包
		</button>
		<button id="add_btn" type="button" class="btn btn-default">
			<span class="glyphicon glyphicon-plus"></span>生成合包信息
		</button>


	</div>



	<!-- 添加模态框（Modal） -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog" style="width: 1050px;">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-
						hidden="true">&times;</button>
					<div class="panel panel-success">
						<div class="panel-heading">
							<h3 class="panel-title">添加</h3>
						</div>
						<div class="panel-body">

							<div class="panel-collapse collapse in" id="collapseConsult">
								<form id="" class="form-horizontal">


									<button id="btn_add" type="button" class="btn btn-success">
										<span class=" 	glyphicon glyphicon-ok" aria-hidden="true"></span>保存
									</button>
									<button id="btn_cal" type="button" class="btn btn-warning"
										" data-dismiss="modal">
										<span class=" glyphicon glyphicon-remove" aria-hidden="true"></span>取消
									</button>

									<div class="form-group" style="margin-top: 15px">


										<label class="control-label col-sm-1" for="txt_search_statu">合包号
										</label>
										<div class="col-sm-2">
											<input type="text" class="form-control" id="close_closeNo" placeholder="请双击获取合包号">
										</div>

										<label class="control-label col-sm-1" for="txt_search_statu">封签号</label>
										<div class="col-sm-2">
											<input type="text" class="form-control" id="close_sealNo"
												disabled>
										</div>

										<label class="control-label col-sm-1" for="txt_search_statu">到达地</label>
										<div class="col-sm-2">
											<input type="text" class="form-control" id="close_arriveLocal" disabled>
										</div>

										<label class="control-label col-sm-1" for="txt_search_statu"
											style="width: 9%">送达时限</label>
										<div class="col-sm-2" style="width: 16%">
											<input type="text" class="form-control" id="close_time"
												disabled>
										</div>

										<label class="control-label col-sm-1" for="txt_search_statu">总票数</label>
										<div class="col-sm-2">
											<input type="text" class="form-control" id="close_totalPoll"
												disabled>
										</div>

										<label class="control-label col-sm-1" for="txt_search_statu">总件数</label>
										<div class="col-sm-2">
											<input type="text" class="form-control" id="close_Number"
												disabled>
										</div>

										<label class="control-label col-sm-1" for="txt_search_statu">总重量</label>
										<div class="col-sm-2">
											<input type="text" class="form-control" id="close_weight"
												disabled>
										</div>

										<label class="control-label col-sm-1" for="txt_search_statu"
											style="width: 9%">配送要求</label>
										<div class="col-sm-2"
											style="width: 16%;">
											<input type="text" class="form-control" id="close_mannedRequire"
												disabled>
										</div>

										<label class="control-label col-sm-1" for="txt_search_statu">合包人</label>
										<div class="col-sm-2">
											<input type="text" class="form-control" id="close_username" disabled>
										</div>
											<label class="control-label col-sm-1" for="txt_search_statu">总体积</label>
										<div class="col-sm-2">
											<input type="text" class="form-control" id="close_volume"
												disabled>
										</div>
										
										<!-- 隐藏域获得用户名和对应的组织名 -->
								    <input type="hidden" value="<%=userName%>" id="userName" />
								      <input type="hidden" value="<%=orgName%>" id="orgName" />

									</div>

								</form>
							</div>
						</div>
						<div class="modal-footer">

							<table id="table-bottom"></table>

						</div>
					</div>
				</div>

			</div>
		</div>

	</div>
	
	<div class="modal fade" id="ImportModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">导入合包数据</h4>
				</div>
				<div class="modal-body">
					<div id="wizard" class="bwizard clearfix">
					
						<div class="tab-content">
							
							<div id="step2" role="tabpanel" class="hide" aria-hidden="true"
								style="">
								<div class="panel panel-default" id="hide"
									style="margin-top: 20px;">
									<div class="file-loading">
										<input id="input-file" name="myFile" type="file" multiple />
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<!-- <button type="button" id="next" class="btn btn-primary">下一步</button>
					<button type="button" class="btn btn-default" data-dismiss="modal"
						onclick="cancel()">关闭</button>
					<button type="button" id="after" class="btn btn-primary hide">上一步</button> -->
					<button type="button" class="btn btn-default" data-dismiss="modal"
						onclick="cancel()">完成</button>
				

				</div>
			</div>
		</div>
	</div>

	<div class="modal fade" id="myModalIN" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">追加导入合包数据</h4>
				</div>
				<div class="modal-body">
					<div id="wizard" class="bwizard clearfix">
						
						<div class="tab-content">
							
							<div id="stepL2" role="tabpanel" class="hide" aria-hidden="true"
								style="">
								<div class="panel panel-default" id="hide"
									style="margin-top: 20px;">
									<div class="file-loading">
										<input id="input-fileL" name="myFile" type="file" multiple />
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
                  <button type="button" class="btn btn-default" data-dismiss="modal"
						onclick="cancel()">完成</button>
					
				</div>
			</div>
		</div>
	</div>


	<!--下载模态框 -->
	<div class="modal fade" id="myModal2" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog" style="width: 720px;">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-
						hidden="true">&times;</button>
					<div class="panel panel-success">
						<div class="panel-heading">
							<h3 class="panel-title">下载</h3>
						</div>
						<div class="panel-body">
							<form class="form-horizontal" onsubmit="return check()"
								role="form">
								<div id="wizard" class="bwizard clearfix">
	                         <div id="step1" role="tabpanel" class="bwizard-activated "
								aria-hidden="false" style="">
								<div style="margin-top: 20px; margin-bottom: 20px;">
									导入模板下载 &nbsp;&nbsp; <a
										href="../../../../CloseImprtSerive?filename=Package.xls">
										<button type="button" class="btn btn-success"
											id="downloadBoard">
											<span aria-hidden="true"></span> 下载
										</button>
									</a>
								</div>
								<div>
									<div class="mid-wrap import">
										<span class="mid-wrap-tit">导入说明</span>
										<h4>填写excel模版</h4>
										<div id="templateCaption">
											<p>1)下载EXCEL空白格式模板,填充数据</p>
											<p>2)模板中红色字体的列为必填项;</p>
										</div>
									</div>
								</div>
							</div>
							</div>
							</form>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default4" data-dismiss="modal">提交</button>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="editModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog" style="width: 1050px;">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-
						hidden="true">&times;</button>
					<div class="panel panel-success">
						<div class="panel-heading">
							<h3 class="panel-title">修改</h3>
						</div>
						<div class="panel-body">

							<div class="panel-collapse collapse in" id="collapseConsult">
								<form id="" class="form-horizontal">


									<button id="endit" type="button" class="btn btn-success">
										<span class=" 	glyphicon glyphicon-ok" aria-hidden="true"></span>保存
									</button>
									<button id="btn_cal" type="button" class="btn btn-warning"
										 data-dismiss="modal">
										<span class=" glyphicon glyphicon-remove" aria-hidden="true"></span>取消
									</button>

									<div class="form-group" style="margin-top: 15px">


										<label class="control-label col-sm-1" for="txt_search_statu">合包号
										</label>
										<div class="col-sm-2">
											<input type="text" class="form-control" id="edit_CloseWrapId">
										</div>

										<label class="control-label col-sm-1" for="txt_search_statu">封签号</label>
										<div class="col-sm-2">
											<input type="text" class="form-control" id="edit_sealNo"
												disabled>
										</div>

										<label class="control-label col-sm-1" for="txt_search_statu">到达地</label>
										<div class="col-sm-2">
											<input type="text" class="form-control" id="edit_contacts">
										</div>

										<label class="control-label col-sm-1" for="txt_search_statu"
											style="width: 9%">送达时限</label>
										<div class="col-sm-2" style="width: 16%">
											<input type="text" class="form-control" id="edit_tele"
												disabled>
										</div>

										<label class="control-label col-sm-1" for="txt_search_statu">总票数</label>
										<div class="col-sm-2">
											<input type="text" class="form-control" id="edit_poll"
												disabled>
										</div>

										<label class="control-label col-sm-1" for="txt_search_statu">总件数</label>
										<div class="col-sm-2">
											<input type="text" class="form-control" id="edit_number"
												disabled>
										</div>

										<label class="control-label col-sm-1" for="txt_search_statu">总重量</label>
										<div class="col-sm-2">
											<input type="text" class="form-control" id="edit_weight"
												disabled>
										</div>

					            <label class="control-label col-sm-1" for="txt_search_statu"
											style="width: 9%;margin-right:12px">配送要求</label>
										<div class="col-sm-2" style="width: 14%;  padding-right:5px; padding-left:0px">
											<select class="form-control" id="edit_mannedRequire" >
											</select>
										</div>

										<label class="control-label col-sm-1" for="txt_search_statu">合包人</label>
										<div class="col-sm-2">
											<input type="text" class="form-control" id="edit_username" disabled>
										</div>
											<label class="control-label col-sm-1" for="txt_search_statu">总体积</label>
										<div class="col-sm-2">
											<input type="text" class="form-control" id="edit_volume"
												disabled>
										</div>
										<div>
										</div>
										

									</div>

								</form>
							</div>
						</div>
						<div class="modal-footer">

							<table id="table-edit"></table>

						</div>
					</div>
				</div>

			</div>
		</div>

	</div> 

</body> 
</html>
