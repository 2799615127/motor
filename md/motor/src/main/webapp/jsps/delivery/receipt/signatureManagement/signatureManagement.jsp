<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>签单信息录入</title>



<script src="${pageContext.request.contextPath }/js/jquery-3.1.1.min.js"></script>

<script type="text/javascript" src="${pageContext.request.contextPath }/js/bootstrap/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/js/bootstrap/css/bootstrap.min.css">

<script type="text/javascript" src="${pageContext.request.contextPath }/js/bootstrap-table/bootstrap-table.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/js/bootstrap-table/bootstrap-table.css">
<script type="text/javascript" src="${pageContext.request.contextPath }/js/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/js/bootstrap-select/css/bootstrap-select.min.css">
<script type="text/javascript" src="${pageContext.request.contextPath }/js/bootstrap-select/js/bootstrap-select.min.js"></script>

<!-- select2 组件引用 -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/select2/select2.css"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/select2/select2.full.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/select2/select2.min.js"></script>

<script type="text/javascript" src="${pageContext.request.contextPath }/js/toastr/toastr.min.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/js/toastr/toastr.min.css">

<script type="text/javascript" src="${pageContext.request.contextPath }/jsps/delivery/receipt/signatureManagement/js/signatureManagement.js"></script>

<style type="text/css">
.content{
	margin-top:15px;
	border-radius:5px;
	border: 1px solid #ddd;
}
#replaceBtn{
	margin-top:23px;
}
.bootstrap-select{
	paddint-right:0px;
}
</style>

</head>
<body>
	<div class="col-sm-12"><br/></div>
	<div id="toolbar" class="col-md-12 btn-group" style="margin-left:2%">
		<button id="btn_add" type="button" class="btn btn-default">
			<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>保存
		</button>
		
		<div class="col-md-3 col-md-offset-4">
			<label class="myLabel control-label" style="margin-top:10px;margin-left:50px;">替换界面:</label>
		</div>
	</div>
	
	<div class="content col-md-5" style="margin-left:2%">
		<div class="col-md-12"><br/></div>
		<div class="col-md-4">
		<label class="myLabel control-label">返单号:</label>
		<input type="text" class="myInput form-control" readonly="readonly" id="repeatOrderIdIn" value="双击获取"/>
		</div>
		<div class="col-md-4">
		<label class="myLabel control-label">接收单位:</label>
		<select class="selectpicker form-control" id="receiveUnit"></select>
		</div>
		<div class="col-md-4">
		<label class="myLabel control-label">总票数:</label>
		<input type="text" class="myInput form-control" readonly="readonly" id="totalVotes" value="0"/>
		</div>
		<div class="col-md-12"><br/></div>
	</div>
	
	<div class="content col-md-3" style="margin-left:2%">
		<div class="col-md-12"><br/></div>
		<div class="col-md-6">
		<label class="myLabel control-label">替换类型:</label>
		<select class="selectpicker form-control" id="replaceType"></select>
		</div>
		<div class="col-md-6">
		<button class="btn btn-primary" id="btn_update" style="margin-top:25px;">替换</button>
		</div>
		<div class="col-md-12"><br/></div>
	</div>
	
	<div class="col-md-12 btn-group" style="margin:15px 0px 15px 10px;">
		<button id="btn_addJobList" type="button" class="btn btn-default">
			<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>录入工作单
		</button>
		<button id="btn_addReturnNote" type="button" class="btn btn-default">
			<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>添加返单备注
		</button>
	</div>
	
	<div class="modal fade" id="addModel" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<div class="panel panel-success">
						<div class="panel-heading">
							<h3 class="panel-title">添加返单备注</h3>
						</div>
						<div class="panel-body">
							<form class="form-horizontal" onsubmit="return check()"
								role="form">
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">返单备注</label>
									<div class="col-sm-10">
										<input class="myInput form-control" id="addReturnNoteIn">
									</div>
								</div>
			
								<div class="form-group">
									<div class="text-center">
										<button id="subReturnNote" class="btn btn-primary" data-dismiss="modal">提交</button>
										<button class="btn btn-info" data-dismiss="modal" onclick="cancel()">取消</button>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
	
	<div class="col-md-12">
		<table id="myTable"></table>
	</div>
</body>
</html>