<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>核重监控</title>
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

<!-- datetimepicke组件引用 -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/bootstrap-datetimepicker/js/bootstrap-datetimepicker.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/js/bootstrap-datetimepicker/css/bootstrap-datetimepicker.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/bootstrap-datetimepicker/js/bootstrap-datetimepicker.zh-CN.js"></script>

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/jsps/delivery/pack/css/fontLive.css">

<script type="text/javascript"
	src="${pageContext.request.contextPath}/jsps/delivery/pack/js/reoperation.js"></script>

</head>
<body>
	<div class="panel-body" style="padding-bottom: 0px;">
		<div class="panel panel-default">
			<div class="panel-heading">核重查询条件</div>
			<div class="panel-collapse" id="collapseOne">
				<form id="formSearch" class="form-horizontal">
					<div class="form-group" style="margin-top: 15px">
						<label class="control-label col-sm-1"
							for="txt_search_departmentname">核重单位</label>
						<div class="col-sm-2">
							<input type="text" class="form-control" id="nuclearWeightUnit"
								name="customerName">
						</div>

						<label class="control-label col-sm-1" for="txt_search_statu"
							id="start">称重日期</label>
						<div class="input-append date form_datetime col-sm-3">
							<input class="form-control" id="startTime" size="35" type="text"
								value="" readonly="readonly"> <span class="add-on"><i
								class="icon-th"></i></span>
						</div>

						<label class="control-label col-sm-1" for="txt_search_statu"
							id="end">——</label>
						<div class="input-append date form_datetime col-sm-3" id="ss">
							<input class="form-control" id="endTime" size="35" type="text"
								value="" readonly="readonly"> <span class="add-on"><i
								class="icon-th"></i></span>
						</div>

						<br />
						<br />
						<label class="control-label col-sm-1"
							for="txt_search_departmentname" id="jobNo">单&nbsp;&nbsp;&nbsp;号</label>
						<div class="col-sm-2">
							<input type="text" class="form-control" id="jobListNo">
						</div>

						<label class="control-label col-sm-1"
							for="txt_search_departmentname" id="max">重量差</label>
						<div class="col-sm-2">
							<input type="text" class="form-control" id="maxWeight">
						</div>

						<label class="control-label col-sm-1"
							for="txt_search_departmentname" id="txt_min">——</label>
						<div class="col-sm-2">
							<input type="text" class="form-control" id="minWeight" />
						</div>

						<div class="col-sm-3" style="text-align: left;">
							<button type="button" id="btn_query" class="btn btn-primary">查询</button>
						</div>


					</div>
				</form>
			</div>
		</div>
		<table id="tb_departments"></table>
	</div>
</body>
</html>