<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>进港分单</title>

<!-- Jquery组件引用 -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js"></script>

<!-- bootstrap组件引用 -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/bootstrap/js/bootstrap.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/js/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/js/bootstrap-datetimepicker/css/bootstrap-datetimepicker.css" />
<!-- bootstrap table组件以及中文包的引用 -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/bootstrap-table/bootstrap-table.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/js/bootstrap-table/bootstrap-table.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/js/sweetalert/sweetalert.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/js/toastr/toastr.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/js/toastr/toastr.min.css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/bootstrap-datetimepicker/js/bootstrap-datetimepicker.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/bootstrap-datetimepicker/js/bootstrap-datetimepicker.zh-CN.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/sweetalert/sweetalert.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/toastr/toastr.js.map"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/toastr/toastr.min.js"></script>

<!-- 下拉框 -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/js/select2/select2.css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/select2/select2.full.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/select2/select2.min.js"></script>

<script type="text/javascript"
	src="${pageContext.request.contextPath}/jsps/delivery/receipt/business/js/dateFormat.js"></script>

<script type="text/javascript"
	src="${pageContext.request.contextPath}/jsps/transfer/outward/lnboundOrder/js/separatedList.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/jsps/transfer/outward/lnboundOrder/js/undividedList.js"></script>

<style type="text/css">
<
style type ="text /css">body {
	font-size: 24px;
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
	top: -90px;
}

.hide {
	display: none;
	
}
</style>

</head>
<body>
	<!-- 标签页切换标签 -->
	<ul id="myTab" class="nav nav-tabs">
		<li><a href="#separatedList" data-toggle="tab"
			onclick="separatedList()">已分单</a></li>
		<li><a href="#undividedList" data-toggle="tab"
			onclick="undividedList()">未分单</a></li>
	</ul>

	<div id="myTabContent" class="tab-content">
		<div id="separatedList" class="tab-pane fade in active">
			<div class="panel-body" style="padding-bottom: 0px;">
				<div class="panel panel-default">
					<div class="panel-heading">
						<a data-toggle="collapse" data-parent="#accordion"
							href="#collapseOne"> 进港已分单查询 </a>
					</div>
					<div class="panel-collapse collapse on" id="collapseOne">
						<form id="formSearch" class="form-horizontal">
							<div class="form-group" style="margin-top: 15px">
								<div>
									<label class="control-label col-xs-2">发送单位:系统登录人所在单位</label>
								</div>
								<br />
								<br /> <label class="control-label col-sm-1" for="staffNumber">分单状态</label>
								<div class="col-xs-2">
									<select id="modeOfTransfer" name="modeOfTransfer"
										class="js-example-basic-multiple form-control">
										<option value="ripAreaCode">已分单</option>
										<option value="staffNumber">未分单</option>
									</select>
								</div>
								<label for="firstname" class="col-sm-1 control-label"
									for="transferToTherTarget">运转中心</label>
								<div class="col-xs-2">
									<select id="transferToTherTarget" name="transferToTherTarget"
										class="js-example-basic-multiple form-control">

									</select>
								</div>
								<label class="control-label col-sm-1" for="ssmNum">派送单位</label>
								<div class="col-xs-2">
									<input type="text" class="form-control" id="ssmNum">
								</div>
								<br /> <br /> <label class="control-label col-sm-1"
									for="workOrderTime">送达时限</label>
								<div class="col-xs-2">
									<input type="text" class="form-control form_datetime"
										id="workOrderTime">
								</div>
								<label class="control-label col-sm-1" for="telephone">分拨批次</label>
								<div class="col-xs-2">
									<select id="modeOfTransfer" name="modeOfTransfer"
										class="js-example-basic-multiple form-control">
										<option value="ripAreaCode"></option>
										<option value="staffNumber"></option>
									</select>
								</div>
								<label class="control-label col-sm-1" for="telephone">货物状态</label>
								<div class="col-xs-2">
									<select id="modeOfTransfer" name="modeOfTransfer"
										class="js-example-basic-multiple form-control">
										<option value="ripAreaCode">已入库</option>
										<option value="staffNumber">未入库</option>
										<option value="staffNumber">已出库</option>
									</select>
								</div>
								<br /> <br /> <label class="control-label col-sm-1"
									for="telephone">分单类型</label>
								<div class="col-xs-2">
									<select id="modeOfTransfer" name="modeOfTransfer"
										class="js-example-basic-multiple form-control">
										<option value="ripAreaCode">系统分单</option>
										<option value="staffNumber">人工分单</option>
									</select>
								</div>
								<label class="control-label col-sm-1" for="businessRecsiptNo">分单时间</label>
								<div class="col-xs-2">
									<input type="text" class="form-control form_datetime"
										id="businessRecsiptNo">
								</div>
								<label class="control-label col-sm-1" for="workOrderTime">入库时间</label>
								<div class="col-xs-2">
									<input type="text" class="form-control form_datetime"
										id="workOrderTime">
								</div>
								<div class="col-xs-2" style="text-align: left;">
									<button type="button" style="margin-left: 50px; width: 120px;"
										id="btn_query" class="btn btn-primary">查询</button>
								</div>
							</div>
						</form>
					</div>
				</div>
				<table id="tb_separatedList"></table>
			</div>
		</div>

		<div id="undividedList" class="tab-pane fade">
			<div class="panel-body" style="padding-bottom: 0px;">
				<div class="panel panel-default">
					<div class="panel-heading">
						<a data-toggle="collapse" data-parent="#accordion"
							href="#collapseOneundividedList"> 进港未分单查询 </a>
					</div>
					<div class="panel-collapse collapse on"
						id="collapseOneundividedList">
						<form id="formSearch" class="form-horizontal">
							<div class="form-group" style="margin-top: 15px">
								<label class="control-label col-sm-1" for="staffPassword">工作单号</label>
								<div class="col-xs-2">
									<input type="text" class="form-control" id="staffPassword">
								</div>
								<label class="control-label col-sm-1" for="businessRecsiptNo">入库时间:</label>
								<div class="col-xs-2">
									<input type="text" class="form-control form_datetime"
										id="businessRecsiptNo">
								</div>
								<div class="col-xs-2">
									<input type="text" class="form-control form_datetime"
										id="businessRecsiptNo">
								</div>
								<br /> <br /> 
								<label for="firstname"
									class="col-sm-1 control-label" for="transferToTherTarget">运转中心</label>
								<div class="col-xs-2">
									<select id="transferToTherTarget" name="transferToTherTarget"
										class="js-example-basic-multiple form-control">

									</select>
								</div>
								<label class="control-label col-sm-1" for="telephone">货物状态</label>
								<div class="col-xs-2">
									<select id="modeOfTransfer" name="modeOfTransfer"
										class="js-example-basic-multiple form-control">
										<option value="ripAreaCode">已入库</option>
										<option value="staffNumber">未入库</option>
									</select>
								</div>
								<div class="col-xs-2" style="text-align: left;">
									<button type="button" style="margin-left: 50px; width: 120px;"
										id="btn_query2" class="btn btn-primary">查询</button>
								</div>
							</div>
						</form>
					</div>
				</div>
				<div id="toolbar" class="btn-group">
					<button id="save" type="button" class="btn btn-default"
						data-toggle="modal" data-target="#myModal">
						<span class="glyphicon  glyphicon-retweet" aria-hidden="true"></span>保存
					</button>
					<button id="repeat" type="button" class="btn btn-default">
						<span class="glyphicon glyphicon-share" aria-hidden="true"></span>退回
					</button>
				</div>
				<table id="tb_undividedList"></table>
			</div>
			<div class="modal fade" id="myModal" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button>
							<div class="panel panel-success">
								<div class="panel-heading">
									<h3 class="panel-title">保存</h3>
								</div>
								<div class="panel-body">
									<form class="form-horizontal" role="form" id="addUserForm">
										<div class="form-group">
											<label for="firstname" class="col-sm-2 control-label"
												for="modeOfTransfer">航班车次</label>
											<div class="col-sm-10">
												<input type="text" class="form-control" id="staffPassword">
											</div>
										</div>
										<div class="form-group">
											<label for="firstname" class="col-sm-2 control-label"
												for="transferToTherTarget">货票号</label>
											<div class="col-sm-10">
												<input type="text" class="form-control" id="staffPassword">
											</div>
										</div>
										<div class="form-group">
											<label for="firstname" class="col-sm-2 control-label"
												for="modeOfTransfer">件数</label>
											<div class="col-sm-10">
												<input type="text" class="form-control" id="staffPassword">
											</div>
										</div>
										<div class="form-group">
											<label for="firstname" class="col-sm-2 control-label"
												for="modeOfTransfer">制单人</label>
											<div class="col-sm-10">
												<input type="text" class="form-control" id="staffPassword">
											</div>
										</div>
										<div class="form-group">
											<label for="firstname" class="col-sm-2 control-label"
												for="modeOfTransfer">提货人</label>
											<div class="col-sm-10">
												<input type="text" class="form-control" id="staffPassword">
											</div>
										</div>
										<div class="form-group">
											<label for="firstname" class="col-sm-2 control-label"
												for="modeOfTransfer">异常记录</label>
											<div class="col-sm-10">
												<input type="text" class="form-control" id="staffPassword">
											</div>
										</div>
									</form>
								</div>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-primary" id="add">确定</button>
							<button type="button" class="btn btn-default4"
								data-dismiss="modal">取消</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>