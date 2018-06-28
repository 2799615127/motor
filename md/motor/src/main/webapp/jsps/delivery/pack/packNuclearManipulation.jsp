<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<% 
String userName = request.getParameter("userName");
String userId = request.getParameter("userId");
String orgName = request.getParameter("orgName");
request.getSession().setAttribute("userName", userName);
request.getSession().setAttribute("userId", userId);
request.getSession().setAttribute("orgName", orgName);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>核重操作</title>
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
<!-- 下拉框 -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/js/select2/select2.css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/select2/select2.full.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/select2/select2.min.js"></script>

<!-- 我的JS -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/jsps/delivery/pack/js/editTable.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/jsps/delivery/pack/js/html5shiv.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/jsps/delivery/pack/js/respond.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/jsps/delivery/pack/js/packNuclearManipulation.js"></script>


</head>
<body>
	<div class="panel-body" style="padding-bottom: 0px;">
		<div class="panel panel-default">
			<div class="panel-heading">原工单信息</div>
			<input id="userName" type="hidden" value="${userName}" /> <input
				id="orgName" type="hidden" value="${orgName}" /> <input id="userId"
				type="hidden" value="${userId}" />
			<div class="panel-heading">
				<div class="panel-collapse" id="collapseOne">
					<form id="formSearch" class="form-horizontal">
						<div class="form-group" style="margin-top: 15px">
							<label class="control-label col-sm-1">订单号</label>
							<div class="col-sm-2">
								<select id="display_JLNo"
									class="js-example-basic-multiple form-control">
								</select>
							</div>
							<label class="control-label col-sm-1" for="display">原件数</label>
							<div class="col-sm-2">
								<input type="text" class="form-control" id="display_fQ"
									name="factQuantity" readonly="readonly">
							</div>
							<label class="control-label col-sm-1" for="display">原重量</label>
							<div class="col-sm-2">
								<input type="text" class="form-control" id="display_FW"
									name="factWeight" readonly="readonly">
							</div>
							<label class="control-label col-sm-1" for="display">到达地</label>
							<div class="col-sm-2">
								<input type="text" class="form-control" id="display_WH"
									name="whither" readonly="readonly"> <input
									type="hidden" id="jobListId" />
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>

		<div class="panel panel-default">
			<div class="panel-heading">核对计算信息</div>
			<div class="panel-heading">
				<div class="panel-collapse" id="collapseOne">
					<form id="formSearch" class="form-horizontal">
						<div class="form-group" style="margin-top: 15px">
							<label class="control-label col-sm-1" for="display">已核(件)</label>
							<div class="col-sm-2">
								<input type="text" class="form-control" id="nucleatedParts"
									readonly="readonly">
							</div>
							<label class="control-label col-sm-2" for="display">已核重(KG)</label>
							<div class="col-sm-2">
								<input type="text" class="form-control" id="nucleatedHeavy"
									readonly="readonly">
							</div>
							<label class="control-label col-sm-2" for="display">重量差(KG)</label>
							<div class="col-sm-2">
								<input type="text" class="form-control" id="Gewichtsdifferenz"
									readonly="readonly">
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>

		<div class="container">
			<div class="bs-example" data-example-id="hoverable-table">
				<table class="table table-hover editable">
					<thead>
						<tr>
							<th>条码</th>
							<th>单号</th>
							<th>本次重量</th>
							<th>件数</th>
							<th>操作人</th>
							<th></th>
						</tr>
					</thead>
				</table>
			</div>
		</div>
	</div>


</body>
</html>