<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>跟踪表登记</title>
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

<!-- toastr组件引用 -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/toastr/toastr.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/js/toastr/toastr.min.css">

<!-- sweetalert组件引用 -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/sweetalert/sweetalert.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/js/sweetalert/sweetalert.css">

<!-- 页面下拉框Js文件和Css的引用 -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/bootstrap-select/js/bootstrap-select.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/js/bootstrap-select/css/bootstrap-select.min.css" />

<!-- 下拉框 -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/js/select2/select2.css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/select2/select2.full.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/select2/select2.min.js"></script>

<!-- datetimepicke组件引用 -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/bootstrap-datetimepicker/js/bootstrap-datetimepicker.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/js/bootstrap-datetimepicker/css/bootstrap-datetimepicker.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/bootstrap-datetimepicker/js/bootstrap-datetimepicker.zh-CN.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/jsps/delivery/pack/js/reoperation.js"></script>
	
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/jsps/transfer/logistics/css/logistics.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/jsps/transfer/logistics/js/trackingTableRegistration.js"></script>
</head>
<body>
	<div class="panel-body" style="padding-bottom: 0px;">
		<div class="panel panel-default">
			<div class="panel-heading">包装查询条件</div>
			<div class="panel-collapse" id="collapseOne">
				<form id="formSearch" class="form-horizontal">
					<div class="form-group" style="margin-top: 15px">
						<label class="control-label col-sm-1 jobListNo_txt"
							for="txt_search_statu">线路种类：</label>
						<div class="col-sm-2" id="di">
							<select class="selectpicker show-menu-arrow"  id="lineType"
								name="" data-width="170px" data-size="5">
								<option value="干线">干线</option>
								<option value="周边">周边</option>
								<option value="省内">省内</option>
								<option value="市内">市内</option>
								<option value="临时">临时</option>
							</select>
						</div>
						
						<label class="control-label col-sm-1">线路名称：</label>
						<div class="col-sm-2">
							<select id="display_line"
								class="js-example-basic-multiple form-control">
							</select>
						</div>
					
						<label class="control-label col-sm-1" >物流车：</label>
						<div class="col-sm-2">
							<select id="logisticsCar"
								class="js-example-basic-multiple form-control">
							</select>
						</div>
						
						<div class="col-sm-3" style="text-align: left;">
							<button type="button" id="btn_query" class="btn btn-primary">生成</button>
						</div>
						
					</div>
					
						
					
				</form>
			</div>
			
		</div>
		<div id="tb_CT">
			<table id="tb_departments_CT"></table>
		</div>
		
		<div id="tb_IR">
			<table id="tb_departments_IR"></table>
		</div>
		
	</div>
</body>
</html>