<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%
	String userName = request.getParameter("userName");
	String orgName = request.getParameter("orgName");
	request.getSession().setAttribute("userName", userName);
	request.getSession().setAttribute("orgName", orgName);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>路由基础设置</title>
<!-- Jquery组件引用 -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js"></script>

<!-- bootstrap组件引用 -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/bootstrap/js/bootstrap.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/jsps/delivery/receipt/business/css/bootstrap.min.css">

<!-- bootstrap table组件以及中文包的引用 -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/bootstrap-table/bootstrap-table.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/js/bootstrap-table/bootstrap-table.css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>

<!-- 时间框Js文件和Css的引用 -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/bootstrap-datetimepicker/js/bootstrap-datetimepicker.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/bootstrap-datetimepicker/js/bootstrap-datetimepicker.zh-CN.js"></script>	
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/js/bootstrap-datetimepicker/css/bootstrap-datetimepicker.css" />

<!-- 提示框Js文件和Css的引用 -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/toastr/toastr.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/js/toastr/toastr.min.css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/sweetalert/sweetalert.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/js/sweetalert/sweetalert.css" />

<!-- 页面下拉框Js文件和css的引用 -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/bootstrap-select/js/bootstrap-select.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/js/bootstrap-select/css/bootstrap-select.min.css" />

<!-- 可编辑表格 -->
<script type="text/javascript" 
	src="${pageContext.request.contextPath}/js/bootstrap-editable/bootstrap-editable.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/bootstrap-editable/bootstrap-table-editable.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/js/bootstrap-editable/bootstrap-editable.css">
	
<!-- 自己的 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/jsps/delivery/receipt/business/js/dateFormat.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/jsps/route/foundation/js/train.js"></script>

<style type="text/css">
	.form-group{
		margin-bottom: 0px;
	}
</style>

<script type="text/javascript">
	$(function() {
		// 初始化提示框的位置
		toastr.options.positionClass = 'toast-top-center';
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

		//1.初始化Table
		var oTable = new TableInit();
		oTable.Init();
		//2.初始化Button的点击事件
		var oButtonInit = new ButtonInit();
		oButtonInit.Init();
		
		// 录入时间
		$('#searchEnterTime').datetimepicker({
			 language: 'zh-CN',
	         autoclose: true,
	         todayHighlight: true
		});
		
		// 最后修改时间
		$('#searchLastUpdateTime').datetimepicker({
			 language: 'zh-CN',
	         autoclose: true,
	         todayHighlight: true
		});
		
		
	});
</script>
</head>
<body>
	<div class="panel-body" style="padding-bottom:0px;">
		<div class="panel panel-default">
			<div class="panel-heading">
				<a data-toggle="collapse" href="#collapseOneWork">查询条件 </a>
			</div>
			<div class="panel-collapse collapse on" id="collapseOneWork">
				<form id="formSearch" class="form-horizontal">
					<div class="form-group" style="margin-top: 15px">
						<!-- 城市 -->
						<label class="control-label col-sm-1"
							for="searchCity">城市</label>
						<div class="col-sm-3">
							<input type="text" class="form-control"
								id="searchCity">
						</div>
						<!-- 编码 -->
						<label class="control-label col-sm-1" for="searchCityCode">编码</label>
						<div class="col-sm-3">
							<input type="text" class="form-control" id="searchCityCode">
						</div>
						<!-- 名称 -->
						<label class="control-label col-sm-1" for="searchBaseName">名称</label>
						<div class="col-sm-3" style="width: 22%">
							<input type="text" class="form-control" id="searchBaseName">
						</div>
						<!-- 地址 -->
						<label class="control-label col-sm-1" for="searchAddress">地址</label>
						<div class="col-sm-3">
							<input type="text" class="form-control" id="searchAddress">
						</div>
						<!-- 联系电话 -->
						<label class="control-label col-sm-1" for="searchTelephone">联系电话</label>
						<div class="col-sm-3">
							<input type="text" class="form-control" id="searchTelephone">
						</div>
						<!-- 备注 -->
						<label class="control-label col-sm-1" for="searchRemark">备注</label>
						<div class="col-sm-3" style="width: 22%">
							<input type="text" class="form-control" id="searchRemark">
						</div>
						<!-- 录入人 -->
						<label class="control-label col-sm-1" for="searchEnterName">录入人</label>
						<div class="col-sm-3">
							<input type="text" class="form-control" id="searchEnterName">
						</div>
						<!-- 录入单位 -->
						<label class="control-label col-sm-1" for="searchEnterOrgName">录入单位</label>
						<div class="col-sm-3">
							<input type="text" class="form-control" id="searchEnterOrgName">
						</div>
						<!-- 录入时间 -->
						<label class="control-label col-sm-1" for="searchEnterTime">录入时间</label>
						<div class="col-sm-3" style="width: 22%">
							<input type="text" class="form-control" data-date-format="yyyy-mm-dd hh:ii:ss" id="searchEnterTime">
						</div>
						<!-- 最后修改人 -->
						<label class="control-label col-sm-1" for="searchLastUpdateName">最后修改人</label>
						<div class="col-sm-3">
							<input type="text" class="form-control" id="searchLastUpdateName">
						</div>
						<!-- 最后修改时间 -->
						<label class="control-label col-sm-1" for="searchLastUpdateTime">最后修改时间</label>
						<div class="col-sm-3">
							<input type="text" class="form-control" data-date-format="yyyy-mm-dd hh:ii:ss" id="searchLastUpdateTime">
						</div>
						<div class="col-sm-3" style="text-align: left;">
							<button type="button" style="margin-left: 90px" id="searchSubmit"
								class="btn btn-primary">查询</button>
						</div>
					</div>
				</form>
			</div>
		</div>
		<div id="toolbar" class="btn-group">
			<button id="btn_addRouteBase" type="button" class="btn btn-default" data-toggle="modal" data-target="#myModalAdd">
				<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>增加
			</button>
			<button id="btn_updateRouteBase" type="button" class="btn btn-default">
				<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>修改
			</button>
			<button id="btn_canCelRouteBase" type="button" class="btn btn-default">
				<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>删除
			</button>
			<select id="searchType" class="selectpicker show-tick">
				<option value="1">汽车站</option>
				<option value="2">火车站</option>
				<option value="3">机场</option>
				<option value="4">港口</option>
				<option value="5">零担货场</option>
			</select>
		</div>
		<table id="tb_train"></table>
	</div>
	
	<!-- 模态框添加(Modal) -->
	<div class="modal fade" id="myModalAdd" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	    <div class="modal-dialog">
	        <div class="modal-content">
	            <div class="modal-header">
	                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>	               
	               <div class="panel panel-success">
		                <div class="panel-heading">
							<h3 class="panel-title">添加</h3>
						</div>
						<div class="panel-body">
							<form id="addForm" class="form-horizontal" role="form">
								<div class="form-group">
									<label for="city" class="col-sm-2 control-label">城市</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" id="addCity" placeholder="请输入城市">
									</div>
								</div>
								<div class="form-group">
									<label for="cityCode" class="col-sm-2 control-label">编码</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" id="addCityCode" placeholder="请输入编码">
									</div>
								</div>
								<div class="form-group">
									<label for="baseName" class="col-sm-2 control-label">名称</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" id="addBaseName" placeholder="请输入名称">
									</div>
								</div>
								<div class="form-group">
									<label for="address" class="col-sm-2 control-label">地址</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" id="addAddress" placeholder="请输入地址">
									</div>
								</div>
								<div class="form-group">
									<label for="telephone" class="col-sm-2 control-label">电话</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" id="addTelephone" placeholder="请输入电话">
									</div>
								</div>
								<div class="form-group">                                           
									<label for="remark" class="col-sm-2 control-label">备注</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" id="addRemark" placeholder="请输入备注">
									</div>
								</div>
								<div class="form-group">                                           
									<label for="remark" class="col-sm-2 control-label">经度</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" id="addLongitude" placeholder="请输入经度">
									</div>
								</div>
								<div class="form-group">                                           
									<label for="remark" class="col-sm-2 control-label">纬度</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" id="addLatitude" placeholder="请输入纬度">
									</div>
								</div>
							</form>
						</div>
					</div>
	            </div>	            
	            <div class="modal-footer">
	            	<button type="button" id="addRoute" class="btn btn-primary">添加</button>
	                <button type="button" class="btn btn-default4" data-dismiss="modal">关闭</button>
	            </div>
			 </div>
			</div>
		</div>
</body>
</html>