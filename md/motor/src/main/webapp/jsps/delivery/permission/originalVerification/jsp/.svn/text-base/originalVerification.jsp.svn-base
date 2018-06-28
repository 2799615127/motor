<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>原单登记核销</title>
<script
	src="${ pageContext.request.contextPath }/js/jquery-3.1.1.min.js"
	type="text/javascript"></script>
<link rel="stylesheet" type="text/css"
	href="${ pageContext.request.contextPath }/js/bootstrap/css/bootstrap.min.css">
<script type="text/javascript"
	src="${ pageContext.request.contextPath }/js/bootstrap/js/bootstrap.min.js"></script>

<link rel="stylesheet"
	href="${ pageContext.request.contextPath }/js/bootstrap-select/css/bootstrap-select.min.css">
<script
	src="${ pageContext.request.contextPath }/js/bootstrap-select/js/bootstrap-select.min.js"></script>

<link rel="stylesheet"
	href="${ pageContext.request.contextPath }/js/toastr/toastr.min.css">
<script
	src="${ pageContext.request.contextPath }/js/toastr/toastr.min.js"></script>

<link rel="stylesheet"
	href="${ pageContext.request.contextPath }/js/sweetalert/sweetalert.css">
<script
	src="${ pageContext.request.contextPath }/js/sweetalert/sweetalert.min.js"></script>

<script
	src="${ pageContext.request.contextPath }/js/bootstrap-table/bootstrap-table.js"></script>
<link
	href="${ pageContext.request.contextPath }/js/bootstrap-table/bootstrap-table.css"
	rel="stylesheet" />
<script
	src="${ pageContext.request.contextPath }/js/bootstrap-table/locale/bootstrap-table-zh-CN.js"></script>

<!-- 导入自己写的css和js -->
<link rel="stylesheet" type="text/css" 
	href="${pageContext.request.contextPath}/jsps/delivery/returncargo/applyReturnCargo/css/applyReturnCargo.css">

<script type="text/javascript"
	src="${pageContext.request.contextPath }/jsps/delivery/permission/originalVerification/js/originalVerification.js">
</script>
</head>
<body>
	<div class="panel-body" style="padding-bottom: 0px;">
		<div class="panel panel-default">
			<div class="panel-heading">
				<a data-toggle="collapse" data-parent="#accordion"
					href="#collapseOne"> 查询条件 </a>
			</div>
			<div class="panel-collapse collapse in" id="collapseOne">
				<form id="formSearch" class="form-horizontal">
					<div class="form-group" style="margin-top: 15px">
						<label class="control-label col-sm-1" for="txt_search_statu">工作单号</label>
						<div class="col-xs-2">
							<input type="text" class="form-control" id="txt_entryPerson">
						</div>
						
						<label class="control-label col-sm-1" for="txt_entering">返单类型</label>
						<div class="col-xs-2">
							<input type="text" class="form-control" id="txt_entryPrson">
						</div>
						
						<label class="control-label col-sm-1" for="txt_search_statu">返单要求</label>
						<div class="col-xs-2">
							<input type="text" class="form-control" id="txt_entryParson">
						</div>
						<br /> <br /> 
						<label class="control-label col-sm-1"
							for="txt_search_statu">返单时间</label>
						<div class="col-xs-2">
							<input type="text" class="form-control" id="entryUnit">
						</div>

						<label class="control-label col-sm-1" for="txt_search_statu">接受时间</label>

						<div class="col-xs-2">
							<select data-width="150px" class="selectpicker show-menu-arrow"
								id="searchApplyType">
									<option value="">无</option>
							</select>
						</div>

						<label class="control-label col-sm-1"
							for="txt_search_statu">受理单位</label>
						<div class="col-xs-2">
							<input type="text" class="form-control" id="receivingUnit">
						</div>
						<br /> <br /> 
						<label class="control-label col-sm-1"
							for="txt_search_statu">接收单位</label>
						<div class="col-xs-2">
							<input type="text" class="form-control" id="receivingUnit">
						</div>
						
						<label class="control-label col-sm-1"
							for="txt_search_statu">委托单位</label>
						<div class="col-xs-2">
							<input type="text" class="form-control" id="receivingUnit">
						</div>
						
						<label class="control-label col-sm-1"
							for="txt_search_statu">接收人</label>
						<div class="col-xs-2">
							<input type="text" class="form-control" id="receivingUnit">
						</div>
						<br /> <br /> 
						<label class="control-label col-sm-1"
							for="txt_search_statu">返单人</label>
						<div class="col-xs-2">
							<input type="text" class="form-control" id="receivingUnit">
						</div>
						
						<label class="control-label col-sm-1"
							for="txt_search_statu">状态</label>
						<div class="col-xs-2">
							<input type="text" class="form-control" id="receivingUnit">
						</div>
						<div class="col-sm-2" style="text-align: left;">
							<button type="button" style="margin-left: 50px" id="query-btn"
								class="btn btn-primary">查询</button>
						</div>
					</div>
				</form>
			</div>
		</div>
		<div id="toolbar" class="btn-group">
			<!-- 按钮触发模态框 -->
			

			<button id="btn_edit" type="button" class="btn btn-default"
				data-toggle="modal">
				<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>核销
			</button>
			<button id="btn_delete" type="button" class="btn btn-default">
				<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>返核销
			</button>
			<button id="btn_stamp" type="button" class="btn btn-default">
				<span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span>打印
			</button>
		</div>
	</div>
	<table id="tb_departments"></table>

</body>
</html>