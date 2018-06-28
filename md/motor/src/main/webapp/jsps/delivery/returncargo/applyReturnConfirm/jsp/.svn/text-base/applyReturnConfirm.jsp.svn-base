<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>返货申请确认</title>
<!-- Jquery组件引用 -->
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


<!-- bootstrap组件引用 -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/js/bootstrap-datetimepicker/css/bootstrap-datetimepicker.css" />
<!-- bootstrap table组件以及中文包的引用 -->

<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/bootstrap-datetimepicker/js/bootstrap-datetimepicker.js"></script>

<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/bootstrap-datetimepicker/js/bootstrap-datetimepicker.zh-CN.js"></script>


<!-- 校验 -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/bootstrap-validator/bootstrapValidator.min.js"></script>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/js/bootstrap-validator/bootstrapValidator.min.css"
	type="text/css" />
	
<!-- 导入自己写的css和js -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/jsps/delivery/returncargo/applyReturnConfirm/css/applyReturnConfirm.css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/jsps/delivery/returncargo/applyReturnConfirm/js/applyReturnConfirm.js"></script>

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
						<label class="control-label col-sm-1" for="txt_search_statu">录入人</label>
						<div class="col-xs-2">
							<input type="text" class="form-control" id="txt_entryPerson">
						</div>
						<label class="control-label col-sm-1" for="txt_search_statu">录入日期</label>

						<div class="input-append date form_datetime col-sm-2">
							<input size="20" type="text" id="firstEntryTime" value=""
								readonly> <span class="add-on"><i class="icon-th"></i></span>
						</div>
						<label class="control-label col-sm-1" for="txt_search_statu">录入日期至</label>
						<div class="input-append date form_datetime col-sm-3">
							<input size="20" type="text" id="lastEntryTime" value="" readonly>
							<span class="add-on"><i class="icon-th"></i></span>
						</div>

						<br /> <br /> <label class="control-label col-sm-1"
							for="txt_search_statu">录入单位</label>
						<div class="col-xs-2">
							<input type="text" class="form-control" id="entryUnit">
						</div>
						<label class="control-label col-sm-1" for="txt_search_statu">返货类型</label>
						<div class="col-xs-2">
							<select data-width="150px" class="selectpicker show-menu-arrow"
								id="searchApplyType">
								<option value="">无</option>
							</select>
						</div>



						<label class="control-label col-sm-1" for="txt_search_statu">接收单位</label>
						<div class="col-xs-2">
							<input type="text" class="form-control" id="receivingUnit">
						</div>
						<br /> <br /> <label class="control-label col-sm-1"
							for="handleState">处理状态</label>
						<div class="col-xs-2">
							<select data-width="150px" class="selectpicker show-menu-arrow"
								id="handleState">
								<option value="">无</option>
								<option value="1">未确认</option>
								<option value="2">同意返货</option>
								<option value="3">拒绝</option>
								<option value="4">同意转发</option>
							</select>
						</div>

						<label class="control-label col-sm-3" for="implementState">执行状态</label>
						<div class="col-xs-2">
							<select data-width="150px" class="selectpicker show-menu-arrow"
								id="implementState">
								<option value="">无</option>
								<option value="1">未执行</option>
								<option value="2">已转发</option>
								<option value="3">已返货</option>
							</select>
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
				<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>处理申请
			</button>
			<button id="btn_card" type="button" class="btn btn-default">

				<span aria-hidden="true"></span>卡片
			</button>

		</div>
		<table id="tb_departments"></table>

		<div class="modal fade" id="editModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<div class="panel panel-success">
							<div class="panel-heading">
								<h3 class="panel-title">处理申请返货</h3>
							</div>
							<div class="panel-body">
								<form class="form-horizontal" onsubmit="return check()"
									role="form" id="editApplyForm">
									<div class="form-group">
										<label for="firstname" class="col-sm-2 ">申请单号</label>
										<div class="col-sm-10">
											<input type="text" class="form-control" id="editApplyId"
												disabled="true" />
										</div>
									</div>
									<div class="form-group">
										<label for="lastname" class="col-sm-2 ">返货类型</label>
										<div class="col-sm-10">
											<select class="selectpicker show-menu-arrow"
												data-width="440px" data-size="5" id="editApplyType">
											</select>
										</div>
									</div>

									<div class="form-group">
										<label for="lastname" class="col-sm-2 ">处理状态</label>
										<div class="col-sm-10">
											<select class="selectpicker show-menu-arrow"
												data-width="440px" data-size="5" id="editHandleState">
												<option value="1">未确认</option>
												<option value="2">同意返货</option>
												<option value="3">拒绝</option>
												<option value="4">同意转发</option>
											</select>
										</div>
									</div>

									<div id="test" class="form-group" style="display: none;">
										<label for="lastname" class="col-sm-2 ">拒绝类型</label>
										<div class="col-sm-10">
											<select class="selectpicker show-menu-arrow"
												data-width="440px" data-size="5" id="editRefuseType">
											</select>
										</div>
									</div>

									<div class="form-group">
										<label for="lastname" class="col-sm-2 ">处理意见</label>
										<div class="col-sm-10">
											<input type="text" class="form-control"
												id="editHandleOpinion" placeholder="请输入处理意见"
												name="editHandleOpinion" />
										</div>
									</div>
									<div class="modal-footer">
										<button type="submit" class="btn btn-primary" id="editApply">确认处理</button>
										<button type="button" class="btn btn-default4"
											data-dismiss="modal">关闭</button>
									</div>



								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 卡片详情的模态框 -->
		<div class="modal fade" id="cardModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<div class="panel panel-success">
							<div class="panel-heading">
								<h3 class="panel-title">返货详情卡片</h3>
							</div>
							<div class="panel-body">
									<div class="form-group">
										<label for="firstname" class="col-sm-2 ">申请单号</label>
										<div class="col-sm-10">
											<input type="text" class="form-control" id="cardApplyId"
												disabled="true" />
										</div>
									</div>
									<div class="form-group">
										<label for="lastname" class="col-sm-2 ">返货类型</label>
										<div class="col-sm-10">
											<input type="text" class="form-control" id="cardApplyType"
												disabled="true" />
										</div>
									</div>
									<div class="form-group">
										<label for="lastname" class="col-sm-2 ">申请备注</label>
										<div class="col-sm-10">
											<input type="text" class="form-control" id="cardRemarks"
												disabled="true" />
										</div>
									</div>
									<div class="form-group">
										<label for="lastname" class="col-sm-2 ">处理状态</label>
										<div class="col-sm-10">
										<input type="text" class="form-control" id="cardHandleState"
												disabled="true" />
										</div>

									</div>

									<div id="cRefuseType" class="form-group" style="display: none;">
										<label for="lastname" class="col-sm-2 ">拒绝类型</label>
										<div class="col-sm-10">
										<input type="text" class="form-control" id="cardRefuseType"
												disabled="true" />
										</div>
									</div>

									<div class="form-group">
										<label for="lastname" class="col-sm-2 ">处理意见</label>
										<div class="col-sm-10">
											<input type="text" class="form-control" id="cardHandleOpinion"
												disabled="true" />
										</div>
										
									</div>
									
									
									<div class="form-group">
										<label for="lastname" class="col-sm-2 ">录入人</label>
										<div class="col-sm-10">
											<input type="text" class="form-control" id="cardEntryPerson"
												disabled="true" />
										</div>
									</div>
									
									<div class="form-group">
										<label for="lastname" class="col-sm-2 ">录入单位</label>
										<div class="col-sm-10">
											<input type="text" class="form-control" id="cardEntryUnit"
												disabled="true" />
										</div>
									</div>
									
									<div class="form-group">
										<label for="lastname" class="col-sm-2 ">录入时间</label>
										<div class="col-sm-10">
											<input type="text" class="form-control" id="cardEntryTime"
												disabled="true" />
										</div>
									</div>
									
									
									<div id="confirmation" class="form-group" style="display: none;">
										
										<div class="form-group">	
												<label for="lastname" class="col-sm-2 ">确认人</label>
												<div class="col-sm-10">
												<input type="text" class="form-control" id="cardConfirmationPerson"
													disabled="true" />
											</div>
										</div>
										
										<div class="form-group">
											<label for="lastname" class="col-sm-2 ">确认单位</label>
										
											<div class="col-sm-10">
												<input type="text" class="form-control" id="cardConfirmationUnit"
													disabled="true" />
											</div>
										</div>
										
										<div class="form-group">
											<label for="lastname" class="col-sm-2 ">确认时间</label>
											<div class="col-sm-10">
												<input type="text" class="form-control" id="cardConfirmationTime"
													disabled="true" />
											</div>
										</div>
										
									</div>
									
						
									<div class="modal-footer">
										<button type="button" class="btn btn-default4"
											data-dismiss="modal">关闭</button>
									</div>



							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>