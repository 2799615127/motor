<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%
	request.getSession().setAttribute("userId", 
			request.getParameter("userId"));
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>宣传任务</title>
	<script src="${ pageContext.request.contextPath }/js/jquery-3.1.1.min.js" type="text/javascript"></script>
	<link rel="stylesheet" type="text/css" href="${ pageContext.request.contextPath }/js/bootstrap/css/bootstrap.min.css">
	<script type="text/javascript" src="${ pageContext.request.contextPath }/js/bootstrap/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/js/bootstrap-datetimepicker/css/bootstrap-datetimepicker.css" />
	<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/bootstrap-datetimepicker/js/bootstrap-datetimepicker.js"></script>
	<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/bootstrap-datetimepicker/js/bootstrap-datetimepicker.zh-CN.js"></script>
    <link rel="stylesheet" href="${ pageContext.request.contextPath }/js/bootstrap-select/css/bootstrap-select.min.css">
  	<script src="${ pageContext.request.contextPath }/js/bootstrap-select/js/bootstrap-select.min.js"></script>
    
    <link rel="stylesheet" href="${ pageContext.request.contextPath }/js/toastr/toastr.min.css">
  	<script src="${ pageContext.request.contextPath }/js/toastr/toastr.min.js"></script>
    
    <link rel="stylesheet" href="${ pageContext.request.contextPath }/js/sweetalert/sweetalert.css">
  	<script src="${ pageContext.request.contextPath }/js/sweetalert/sweetalert.min.js"></script>
    
    <script src="${ pageContext.request.contextPath }/js/bootstrap-table/bootstrap-table.js"></script>
    <link href="${ pageContext.request.contextPath }/js/bootstrap-table/bootstrap-table.css" rel="stylesheet" />
    <script src="${ pageContext.request.contextPath }/js/bootstrap-table/locale/bootstrap-table-zh-CN.js"></script>

	
	
	<script src="${pageContext.request.contextPath}/js/ocupload/jquery.ocupload-1.1.2.js"></script>
    <style type="text/css">
		body {
			margin: 0;
			padding: 0
		}
		
		.background {
			margin-left: 100px;
		}
		
		p {
			height: 40px;
			line-height: 40px;
		}
		
		.open-model {
			text-align: center;
		}
		
		.open-model input {
			padding: 10px 20px;
			font-size: 24px;
			line-height: 24px;
			border: 0px;
			background: #F53639;
			color: #FFF;
			cursor: pointer;
		}
		
		.open-model input:hover {
			background: #F3726D;
		}
		
		.open-model input:focus {
			border: 0px;
			outline-width: 0px;
		}
		
		.model {
			opacity: 0.75;
			background: #666;
			position: fixed;
			left: 0;
			right: 0;
			top: 0;
			bottom: 0;
			z-index: 1000;
		}
		
		.model-dialog {
			width: 600px;
			height: 400px;
			background: white;
			position: absolute;
			z-index: 1001;
			left: 0;
			top: 0;
		}
		
		.hide {
			display: none;
		}
		
		.control-label{
			width:120px;
		}
		
		
		.alert{
			display: none;
		}
		
		.modelBtn{
			text-align: center;
		}
		
		.emptyMsg{
			display: none;
			color: red;
			text-align: center;
		}
		
		a:hover,a:visited,a:active,a:link{
			text-decoration: none;
		}
	</style>
	
	<script type="text/javascript" src="${ pageContext.request.contextPath }/jsps/delivery/dispatch/disseminate/js/disseminate.js"></script>
</head>

<body>
	<div class="panel-body" style="padding-bottom:0px;">
		<div class="panel panel-default" >
			<div class="panel-heading"><a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
					查询条件
                </a>
            </div>
			<div class="panel-collapse collapse in" id="collapseOne" >
				<form id="formSearch" class="form-horizontal">
					<div class="form-group" style="margin-top:15px">
						<label class="control-label col-sm-2" for="txt_search_statu">宣传概要</label>
						<div class="col-sm-3">
							<input type="text" class="form-control" id="txt_search_disseminateAbstract">
						</div>
						<label class="control-label col-sm-2" for="txt_search_statu">状态</label>
						<div class="col-sm-3" style="margin-right: 23%;">
							<select id="txt_search_status" class="selectpicker show-menu-arrow form-control" data-hide-disabled="true" data-size="5">
								<option selected value="0">有效</option>
								<option value="1">作废</option>
							</select>
						</div>
						<!-- 发布时间 -->
						<label class="control-label col-sm-1"for="txt_search_departmentname" style="margin-top: 2%;">
						发布时间</label>
						<div class="col-sm-3 " style="margin-top: 2%;">							
							<input type="text" readonly="readonly" class="form-control" name="dateOfIssue" id="txt_search_DateOfIssue" data-date-format="yyyy-mm-dd">
						</div> 
						<!-- 失效时间 -->
						<label class="control-label col-sm-1"for="txt_search_departmentname" style="margin-top: 2%;">
						失效时间</label>
						<div class="col-sm-3 " style="margin-top: 2%;">							
							<input type="text" readonly="readonly" class="form-control" name="dateOfloseEfficacy" id="txt_search_DateOfloseEfficacy" data-date-format="yyyy-mm-dd">
						</div> 
						
						<div class="col-sm-2" style="text-align:left;">
							<button type="button" style="margin-left:50px" id="query-btn"
								class="btn btn-primary">查询</button>
						</div>
					</div>
				</form>
			</div>
		</div>
		<div id="toolbar" class="btn-group">
			<button id="btn_add" type="button" class="btn btn-default" data-toggle="modal">
				<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增
			</button>
			<button id="btn_edit" type="button" class="btn btn-default" data-toggle="modal">
				<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>修改
			</button>
			<button id="btn_delete" type="button" class="btn btn-default">
				<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>作废
			</button>
		</div>
		
		<table id="tb_departments"></table>
	</div>

	<!-- 添加模态框（Modal） -->
	<div class="modal fade" id="addModel" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true" onclick="clean()">&times;</button>
					<div class="panel panel-success">
						<div class="panel-heading">
							<h3 class="panel-title">添加</h3>
						</div>
						<div class="panel-body">
							<form class="form-horizontal" onsubmit="return check()"
								role="form">
								<div class="form-group">
									<label for="firstname" class="col-sm-2 control-label">宣传概要</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" id="txt_add_disseminateAbstract"
											placeholder="请输入宣传概要">
									</div>
								</div>
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">发布时间</label>
									<div class="col-sm-9">
										<input type="text" placeholder="请选择发布时间" readonly="readonly" class="form-control" name="dateOfIssue" id="txt_add_DateOfIssue" data-date-format="yyyy-mm-dd">
									</div>
								</div>
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">失效时间</label>
									<div class="col-sm-9">
										<input type="text" placeholder="请选择失效时间" readonly="readonly" class="form-control" name="dateOfloseEfficacy" id="txt_add_DateOfloseEfficacy" data-date-format="yyyy-mm-dd">
									</div>
								</div>
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">状态</label>
									<div class="col-sm-9">
										<select id="txt_add_status" class="selectpicker show-menu-arrow form-control" data-hide-disabled="true" data-size="5">
											<option selected value="0">有效</option>
											<option value="1">作废</option>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label for="disseminateContent" class="col-sm-2 control-label">宣传内容</label>
									<div class="col-sm-9">
										<textarea id="txt_add_disseminateContent"class="form-control" rows="3" style="resize:none;"></textarea>
									</div>
								</div>
								<div class="form-group modelBtn">
									<button type="button" class="btn btn-primary" id="addDisseminate">添加</button>
									<button type="button" class="btn btn-default4" data-dismiss="modal" onclick="clean()">关闭</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 修改模态框 -->
	<div class="modal fade" id="updateModel" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true" onclick="clean()">&times;</button>
					<div class="panel panel-success">
						<div class="panel-heading">
							<h3 class="panel-title">修改</h3>
						</div>
						<div class="panel-body">
							<form class="form-horizontal" onsubmit="return check()"
								role="form">
								<div class="form-group">
									<label for="firstname" class="col-sm-2 control-label">宣传概要</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" id="txt_update_disseminateAbstract"
											placeholder="请输入宣传概要">
									</div>
								</div>
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">发布时间</label>
									<div class="col-sm-9">
										<input type="text" placeholder="请选择发布时间" readonly="readonly" class="form-control" name="dateOfIssue" id="txt_update_DateOfIssue" data-date-format="yyyy-mm-dd">
									</div>
								</div>
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">失效时间</label>
									<div class="col-sm-9">
										<input type="text" placeholder="请选择失效时间" readonly="readonly" class="form-control" name="dateOfloseEfficacy" id="txt_update_DateOfloseEfficacy" data-date-format="yyyy-mm-dd">
									</div>
								</div>
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">状态</label>
									<div class="col-sm-9">
										<select id="txt_update_status" class="selectpicker show-menu-arrow form-control" data-hide-disabled="true" data-size="5">
											<option id="effective" value="0">有效</option>
											<option id="nullify" value="1">作废</option>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">宣传内容</label>
									<div class="col-sm-9">
										<input type="hidden" id="txt_update_disseminateId"/>
										<textarea id="txt_update_disseminateContent" class="form-control" rows="3" style="resize:none;"></textarea>
									</div>
								</div>
								
								<div class="form-group modelBtn">
									<button type="button" class="btn btn-primary" id="updateDisseminate">确认修改</button>
									<button type="button" class="btn btn-default4" data-dismiss="modal" onclick="clean()">关闭</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>