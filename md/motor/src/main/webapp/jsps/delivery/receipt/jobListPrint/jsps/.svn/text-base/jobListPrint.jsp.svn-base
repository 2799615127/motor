<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%
	String userName = request.getParameter("userName");
	String orgName = request.getParameter("orgName");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>工作单打印</title>
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

<!-- 提示框Js文件和Css的引用 -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/toastr/toastr.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/js/toastr/toastr.min.css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/sweetalert/sweetalert.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/js/sweetalert/sweetalert.css" />

<!-- 页面下拉框Js文件和Css的引用 -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/bootstrap-select/js/bootstrap-select.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/js/bootstrap-select/css/bootstrap-select.min.css" />

<script type="text/javascript"
	src="${pageContext.request.contextPath}/jsps/delivery/receipt/business/js/dateFormat.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/jsps/delivery/receipt/jobListPrint/js/jobListPrint.js"></script>
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
        
	});
</script>

</head>

<body>
	<!-- 工单 -->
	<div id="workOrder" class="tab-pane"
		style="padding: 15px; padding-bottom: 0px;">
		<div class="panel panel-default">
			<div class="panel-heading">
				<a data-toggle="collapse" data-parent="#accordion"
					href="#collapseOneWork"> 查询条件 </a>
			</div>
			<div class="panel-collapse collapse on" id="collapseOneWork">
				<form id="formSearch" class="form-horizontal">
					<div class="form-group" style="margin-top: 15px">
						<!-- 工作单号 -->
						<label class="control-label col-sm-1"
							for="searchJobListNo">工作单号</label>
						<div class="col-sm-3">
							<input type="text" class="form-control"
								id="searchJobListNo">
						</div>
						<!-- 结算方式 -->
						<label class="control-label col-sm-1" for="searchSettlingAccounts">结算方式</label>
						<div class="col-sm-3">
							<input type="text" class="form-control" id="searchSettlingAccounts">
						</div>
						<!-- 发货类型 -->
						<label class="control-label col-sm-1" for="searchProduct">发货类型</label>
						<div class="col-sm-3" style="width: 22%">
							<input type="text" class="form-control" id="searchProduct">
						</div>
						<!-- 发货方式 -->
						<label class="control-label col-sm-1" for="searchMannedRequire">发货方式</label>
						<div class="col-sm-3">
							<input type="text" class="form-control" id="searchMannedRequire">
						</div>
						<!-- 到达地 -->
						<label class="control-label col-sm-1" for="searchWhither">到达地</label>
						<div class="col-sm-3">
							<input type="text" class="form-control" id="searchWhither">
						</div>
						<div class="col-sm-3" style="text-align: left;">
							<button type="button" style="margin-left: 90px" id="searchSubmit"
								class="btn btn-primary">查询</button>
						</div>
					</div>
				</form>
			</div>
		</div>
		<div id="toolbarWork" class="btn-group"
			style="padding: 0 15px 15px 0;">
			<button id="btn_print" type="button" class="btn btn-default">
				<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>打印
			</button>
		</div>
		<table id="tb_jobList"></table>
	</div>
</body>
</html>