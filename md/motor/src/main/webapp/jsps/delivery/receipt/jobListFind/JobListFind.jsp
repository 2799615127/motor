<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page isELIgnored="false"%>

<%
	String orgId = request.getParameter("orgId");
	String orgName = request.getParameter("orgName");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>工作单查询</title>

<script src="${pageContext.request.contextPath }/js/jquery-3.1.1.min.js"></script>

<script type="text/javascript" src="${pageContext.request.contextPath }/js/bootstrap/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/js/bootstrap/css/bootstrap.min.css">

<script type="text/javascript" src="${pageContext.request.contextPath }/js/bootstrap-table/bootstrap-table.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/js/bootstrap-table/bootstrap-table.css">
<script type="text/javascript" src="${pageContext.request.contextPath }/js/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>

<script type="text/javascript" src="${pageContext.request.contextPath }/js/toastr/toastr.min.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/js/toastr/toastr.min.css">

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/js/bootstrap-select/css/bootstrap-select.min.css">
<script type="text/javascript" src="${pageContext.request.contextPath }/js/bootstrap-select/js/bootstrap-select.min.js"></script>

<script type="text/javascript" src="${pageContext.request.contextPath }/js/bootstrap-datetimepicker/js/bootstrap-datetimepicker.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/bootstrap-datetimepicker/js/bootstrap-datetimepicker.zh-CN.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/js/bootstrap-datetimepicker/css/bootstrap-datetimepicker.css">


<script type="text/javascript" src="${pageContext.request.contextPath}/jsps/delivery/receipt/jobListFind/js/JobListFind.js"></script>

</head>
<body>
	<input type="hidden" id="myOrgNameIn" value="<%=orgName %>">
		<div id="toolbar" class="btn-group">
			<button id="btn_add" type="button" class="btn btn-default" data-toggle="modal"
				data-target="#findMoreModel">
				<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>查询
			</button>
			<button id="btn_cancel" type="button" class="btn btn-default">
				<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>作废
			</button>
			<button id="btn_giveUpCancel" type="button" class="btn btn-default">
				<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>取消作废
			</button>
			<!-- <button id="btn_add" type="button" class="btn btn-default" data-toggle="modal"
				data-target="#addModel">
				<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>修改
			</button>
			
			
			<button id="btn_add" type="button" class="btn btn-default" data-toggle="modal"
				data-target="#addModel">
				<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>任务提示
			</button>
			<button id="btn_add" type="button" class="btn btn-default" data-toggle="modal"
				data-target="#addModel">
				<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>日志查询
			</button>
			<button id="btn_add" type="button" class="btn btn-default" data-toggle="modal"
				data-target="#addModel">
				<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>打印查询结果
			</button>
			<button id="btn_add" type="button" class="btn btn-default" data-toggle="modal"
				data-target="#addModel">
				<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>取消
			</button>
			<button id="btn_add" type="button" class="btn btn-default" data-toggle="modal"
				data-target="#addModel">
				<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>保存
			</button>
			<button id="btn_add" type="button" class="btn btn-default" data-toggle="modal"
				data-target="#addModel">
				<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>打印标签
			</button>
			<button id="btn_add" type="button" class="btn btn-default" data-toggle="modal"
				data-target="#addModel">
				<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>打印工作单
			</button> -->
		</div>
		
		<div class="modal fade" id="findMoreModel" tabindex="-1"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog" style="width:800px;">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true" onclick="clean()">&times;</button>
					<div class="panel panel-success">
						<div class="panel-heading">
							<h3 class="panel-title">查询</h3>
						</div>
						<div class="panel-body">
							<form class="form-horizontal" onsubmit="return check()"
								role="form">
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">工作单号:</label>
									<div class="col-sm-2">
										<input type="text" class="form-control" id="jobListCodeIn">
									</div>
									
									<label for="lastname" class="col-sm-2 control-label">开单起始时间:</label>
									<div class="col-sm-2">
										<input type="text" class="form-control" id="startJobListTimeS">
									</div>
									
									<label for="lastname" class="col-sm-2 control-label">开单终止时间:</label>
									<div class="col-sm-2">
										<input type="text" class="form-control" id="endJobListTimeS">
									</div>
								</div>
								
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">委托单位:</label>
									<div class="col-sm-2">
										<input type="text" class="form-control" id="senderUnitIn">
									</div>
									
									<label for="lastname" class="col-sm-2 control-label">件数:</label>
									<div class="col-sm-2">
										<input type="text" class="form-control" id="billingQuantityIn">
									</div>
									
									<label for="lastname" class="col-sm-2 control-label">收货单位:</label>
									<div class="col-sm-2">
										<input type="text" class="form-control" id="addresseeUnitIn">
									</div>
								</div>
								
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">是否补录:</label>
									<div class="col-sm-2">
										<input type="checkbox" class="form-control" id="jobListCodeIn">
									</div>
									
									<label for="lastname" class="col-sm-2 control-label">数据状态:</label>
									<div class="col-sm-2">
										<select id="integrityStateS" class="selectpicker form-control"></select>
									</div>
									
									<label for="lastname" class="col-sm-2 control-label">受理单位:</label>
									<div class="col-sm-2">
										<input type="hidden" id="orgIdH" value="<%=orgId %>">
										<select type="text" class="selectpicker form-control" id="billingOperationUnitS"></select>
									</div>
								</div>
								
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">单据状态:</label>
									<div class="col-sm-2">
										<select id="signInTypeS" class="selectpicker form-control"></select>
									</div>
									
								</div>
								<div class="form-group">
									<div class="text-center">
										<button id="subFind" class="btn btn-primary" data-dismiss="modal">点击查询</button>
										<button class="btn btn-info" data-dismiss="modal">取消</button>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
		
		
		
		

		<table id="jobListFindTb"></table>
</body>
</html>