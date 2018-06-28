<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>包装信息录入</title>
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

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/jsps/delivery/pack/css/fontLive.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/jsps/delivery/pack/js/packagingIE.js"></script>
</head>
<body>
	<div class="panel-body" style="padding-bottom: 0px;">
		<div class="panel panel-default" id="packQ">
			<div class="panel-heading">
				<button type="button" id="btn_keep" class="btn btn-primary">保存</button>
			</div>
			<div class="panel-collapse" id="collapseOne">
				<form id="formSearch" class="form-horizontal">
					<div class="form-group" style="margin-top: 15px">

						<label class="control-label col-sm-1 jobListNo_txt">订单号</label>
						<div class="col-sm-2">
							<select id="display_JLNo"
								class="js-example-basic-multiple form-control display_JLNo">
							</select>
						</div>

						<br /> <br /> <label class="control-label col-sm-1 jobListNo_txt"
							for="txt_search_statu">包装费</label>
						<div class="col-sm-2">
							<input type="text" class="form-control display_JLNo" id="bagging" placeholder="计算后的包装费"
								readonly="readonly">
						</div>

						<label class="control-label col-sm-1 jobListNo_txt txt_move"
							for="txt_search_statu">实际重量</label>
						<div class="col-sm-2">
							<input type="text" class="form-control display_JLNo"
								id="factWeight">
						</div>

						<br /> <br /> <label class="control-label col-sm-1 jobListNo_txt"
							for="txt_search_statu">操作员</label>
						<div class="col-sm-2">
							<input type="text" class="form-control display_JLNo"
								id="userName" readonly="readonly">
						</div>

						<label class="control-label col-sm-1 jobListNo_txt txt_move"
							for="txt_search_statu">计费重量</label>
						<div class="col-sm-2">
							<input type="text" class="form-control display_JLNo" placeholder="请输入计费重量"
								id="chargedWeight">
						</div>

						<br /> <br /> <label class="control-label col-sm-1 jobListNo_txt"
							for="txt_search_statu">入库人</label>
						<div class="col-sm-2">
							<input type="text" class="form-control display_JLNo"
								id="getProductManName">
						</div>

						<label class="control-label col-sm-1 jobListNo_txt txt_move"
							for="txt_search_departmentname">实际件数</label>
						<div class="col-sm-2">
							<input type="text" class="form-control display_JLNo"
								id="factQuantity">
						</div>

						<br /> <br /> <label class="control-label col-sm-1 jobListNo_txt">包装员</label>
						<div class="col-sm-2">
							<input type="text" class="form-control display_JLNo"
								id="txt_userName" readonly="readonly">
						</div>

						<label class="control-label col-sm-1 jobListNo_txt txt_move"
							for="txt_search_statu">实际体积</label>
						<div class="col-sm-2">
							<input type="text" class="form-control display_JLNo" id="size" placeholder="请输入实际体积">
						</div>

						<br /> <br /> <label class="control-label col-sm-1 jobListNo_txt"
							for="txt_search_statu">入库时间</label>
						<div class="input-append date form_datetime col-sm-3">
							<input class="form-control" id="storageTime" size="35"
								type="text" value="" readonly="readonly"> <span
								class="add-on"><i class="icon-th"></i></span>
						</div>

						<br /> <br /> <label class="control-label col-sm-1 jobListNo_txt"
							for="txt_search_statu">实际包装</label>
						<div class="col-sm-2" id="di">
							<select class="selectpicker show-menu-arrow" id="txt_pack"
								name="" data-width="170px" data-size="5">
								<option value="纸箱">纸箱</option>
								<option value="木箱">木箱</option>
								<option value="小件箱">小件箱</option>
								<option value="防震板">防震板</option>
								<option value="高密度防震板">高密度防震板</option>
								<option value="编织袋">编织袋</option>
								<option value="气垫膜">气垫膜</option>
								<option value="打包带(塑料)">打包带(塑料)</option>
								<option value="打包带(铁)">打包带(铁)</option>
							</select>
						</div>


						<br /> <br />

						<div class="col-sm-3" id="text_Q">
							<button type="button" id="btn_query_Q" class="btn btn-primary">计算包装费</button>
						</div>


					</div>
				</form>
			</div>
		</div>
		<div id="table_txt">
			<table id="tb_departments_PIQ"></table>
		</div>

	</div>
</body>
</html>