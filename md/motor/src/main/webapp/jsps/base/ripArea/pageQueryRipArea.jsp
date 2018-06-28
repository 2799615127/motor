<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@ page isELIgnored="false"%>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro"%>
<%
	String userName = request.getParameter("userName");
	request.getSession().setAttribute("userName", userName);
%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>table</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">


<style type="text/css">

body {
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
	top: 0;
}

.hide {
	display: none;
}
</style>


<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/js/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/js/bootstrap-table/bootstrap-table.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/js/bootstrap-select/css/bootstrap-select.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/js/sweetalert/sweetalert.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/js/toastr/toastr.min.css">

<script src="${pageContext.request.contextPath }/js/jquery-3.1.1.min.js"></script>

<script type="text/javascript" src="${pageContext.request.contextPath }/js/bootstrap/js/bootstrap.min.js"></script>

<script type="text/javascript" src="${pageContext.request.contextPath }/js/bootstrap-select/js/bootstrap-select.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/bootstrap-table/bootstrap-table.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/sweetalert/sweetalert.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/toastr/toastr.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jsps/base/ripArea/js/ripAarea-min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jsps/base/ripArea/js/ripArea-subArea.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jsps/base/ripArea/js/ripArea-worker.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jsps/base/ripArea/js/ripArea-customer.js"></script>

</head>

<body>
	<!-- 导航区 -->  
  
	<ul class="nav nav-tabs" role="tablist" id="tablist"> 
  		<li role="presentation" class="active">
  			<a href="#home" role="tab" data-toggle="tab" id="basicManage">基本定区管理</a>
  		</li>  
  		
  		<li role="presentation">
  			<a href="#profile" role="tab" data-toggle="tab" id="subAreaManage">定区的分区管理</a>
  		</li>  
  		
  		<li role="presentation">
  			<a href="#messages" role="tab" data-toggle="tab" id="workerManage">定区的职员管理</a>
  		</li>  
 		
  		<li role="presentation">
 			<a href="#settings" role="tab" data-toggle="tab" id="clientManage">定区的客户管理</a>
 		</li>  
	</ul>  

	<div class="tab-content">
	<div role="tabpanel" class="tab-pane active" id="home">	
		<div class="panel-body" style="padding-bottom:0px;">
		<div class="panel panel-default">
			<div class="panel-heading">查询条件</div>
			<div class="panel-body">
				<form id="formSearch" class="form-horizontal">
					<div class="form-group" style="margin-top:15px">
						<label class="control-label col-sm-1"
							for="txt_search_departmentname">定区名</label>
						<div class="col-sm-3">
							<input type="text" class="form-control"
								id="txt_search_departmentname">
						</div>
						<label class="control-label col-sm-1" for="txt_search_statu">区域负责人</label>
						<div class="col-sm-3">
							<input type="text" class="form-control" id="txt_search_statu">
						</div>
						<div class="col-sm-4" style="text-align:left;">
							<button type="button" style="margin-left:50px" id="btn_query"
								class="btn btn-primary">查询</button>
						</div>
					</div>
				</form>
			</div>
		</div>
		<div id="toolbar" class="btn-group">
			<shiro:hasPermission name="增加定区">
			<button id="btn_add" type="button" class="btn btn-default" data-toggle="modal"
				data-target="#addModel">
				<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>增加
			</button>
			</shiro:hasPermission>
			<shiro:hasPermission name="修改定区">
			<button id="btn_edit" type="button" class="btn btn-default" data-toggle="modal">
				<span class="glyphicon glyphicon-pencil" aria-hidden="true" ></span>修改
			</button>
			</shiro:hasPermission>
			<shiro:hasPermission name="删除定区">
			<button id="btn_delete" type="button" class="btn btn-default">
				<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>删除
			</button>
			</shiro:hasPermission>
		</div>
		<table id="tb_departments"></table>
	</div>

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
									<label for="lastname" class="col-sm-2 control-label">定区名称</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" id="name"
											placeholder="请输入定区名称">
									</div>
								</div>
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">定区负责人</label>
									<div class="col-sm-10">
										<select id="functionarys" name="functionarys" class="selectpicker"></select>
									</div>
								</div>
			
								<div class="form-group">
									<div class="text-center">
										<button id="sub" class="btn btn-primary">提交</button>
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
									<label for="firstname" class="col-sm-2 control-label">编码</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" id="update_code"
											placeholder="请输入编码">
									</div>
								</div>
								
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">定区名称</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" id="update_name"
											placeholder="请输入定区名称">
									</div>
								</div>
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">定区负责人</label>
									<div class="col-sm-10">
										<select id="update_functionarys" name="functionarys" class="selectpicker"></select>
									</div>
								</div>
			
								<div class="form-group">
									<div class="text-center">
										<button id="update_sub" class="btn btn-primary" data-dismiss="modal">提交</button>
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
		
	</div>
	
	<div role="tabpanel" class="tab-pane" id="profile">
	
	<div class="modal fade" id="subAreaManagerModel" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true" onclick="clean()">&times;</button>
					<div class="panel panel-success">
						<div class="panel-heading">
							<h3 class="panel-title">定区的分区管理</h3>
						</div>
						<div class="panel-body">
							<form class="form-horizontal" onsubmit="return check()"
								role="form">
								<div class="form-group">
									<div style="margin-left:50px;">
										<input type="text" id="findXIAN" style="margin-left:30px;"/>
										<label class="control-label" style="text-align: left;">县/区/旗</label>
										<button id="find_subarea" class="btn btn-primary" style="margin-left:30px;">查询</button>
									</div>
									<div class="col-md-12"><br/></div>
									<div class="text-center">
										<button id="hold_sub" class="btn btn-primary" data-dismiss="modal">保存</button>
										<button class="btn btn-info" data-dismiss="modal">取消</button>
									</div>
								</div>
								<div>
									<table id="subAreaManager_tb"></table>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
		</div>
		
		<div class="col-md-5 col-md-offset-0.5" style="float: left;">
			<table id="tb_departments_subArea"></table>
		</div>
		<div id="subArea_toolbar" style="float: left;">
			<button id="btn_manager" type="button" class="btn btn-default" 
				data-target="#subAreaManagerModel">
				<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>点击管理
			</button>
		</div>
		<div class="col-md-5" style="float: left;">
			<table id="tb_subArea"></table>
		</div>
	</div>
	
	
	
	
	
	<div role="tabpanel" class="tab-pane" id="messages">
		
		<div class="modal fade" id="workerManagerModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true" onclick="clean()">&times;</button>
					<div class="panel panel-success">
						<div class="panel-heading">
							<h3 class="panel-title">定区的职员管理</h3>
						</div>
						<div class="panel-body">
							<form class="form-horizontal" onsubmit="return check()"
								role="form">
								<div class="form-group">
									<div class="text-center">
										<button id="hold_sub_worker" class="btn btn-primary" data-dismiss="modal">保存</button>
										<button class="btn btn-info" data-dismiss="modal"">取消</button>
									</div>
								</div>
								
								<div>
									<table id="workerManager_tb"></table>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
		</div>
	
	
	
	
		<div class="col-md-5 col-md-offset-0.5" style="float: left;">
			<table id="tb_departments_worker"></table>
		</div>
		
		<div id="worker_toolbar" class="btn-group" style="float: left;">
			<button id="btn_manager_worker" class="btn btn-default" >
				<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>点击管理
			</button>
		</div>
		
		<div class="col-md-5" style="float: left;">
			<table id="tb_worker"></table>
		</div>
		
	</div>  	
	
	
	
    <div role="tabpanel" class="tab-pane" id="settings">
		<div class="modal fade" id="customerManagerModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true" onclick="clean()">&times;</button>
					<div class="panel panel-success">
						<div class="panel-heading">
							<h3 class="panel-title">定区的客户管理</h3>
						</div>
						<div class="panel-body">
							<form class="form-horizontal" onsubmit="return check()"
								role="form">
								<div class="form-group">
									<div class="text-center">
										<button id="hold_sub_customer" class="btn btn-primary" data-dismiss="modal">保存</button>
										<button class="btn btn-info" data-dismiss="modal"">取消</button>
									</div>
								</div>
								
								<div>
									<table id="customerManager_tb"></table>
								</div>
			
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
		</div>
		
		<div class="col-md-5 col-md-offset-0.5" style="float: left;">
			<table id="tb_departments_customer"></table>
		</div>
		
		<div id="worker_toolbar" class="btn-group" style="float: left;">
			<button id="btn_manager_customer" type="button" class="btn btn-default" >
				<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>点击管理
			</button>
		</div>
		
		<div class="col-md-5" style="float: left;">
			<table id="tb_customer"></table>
		</div>
	
	</div>  
	</div>
	
</body>
</html>
