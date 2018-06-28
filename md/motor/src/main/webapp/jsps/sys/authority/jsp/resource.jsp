<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro"%>
<%
	String userName = request.getParameter("userName");
	request.getSession().setAttribute("userName", userName);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>资源管理</title>
	<link rel="stylesheet" type="text/css" href="${ pageContext.request.contextPath }/js/bootstrap/css/bootstrap.min.css">
	<script src="${ pageContext.request.contextPath }/js/jquery-3.1.1.min.js" type="text/javascript"></script>
	<script type="text/javascript" src="${ pageContext.request.contextPath }/js/bootstrap/js/bootstrap.min.js"></script>
    
    <link rel="stylesheet" href="${ pageContext.request.contextPath }/js/bootstrap-select/css/bootstrap-select.min.css">
  	<script src="${ pageContext.request.contextPath }/js/bootstrap-select/js/bootstrap-select.min.js"></script>
    
    <link rel="stylesheet" href="${ pageContext.request.contextPath }/js/toastr/toastr.min.css">
  	<script src="${ pageContext.request.contextPath }/js/toastr/toastr.min.js"></script>
    
    <link rel="stylesheet" href="${ pageContext.request.contextPath }/js/bootstrap-jqxtreegrid/css/jqxbase.css">
  	<script src="${ pageContext.request.contextPath }/js/bootstrap-jqxtreegrid/js/jqxcore.js"></script>
  	<script src="${ pageContext.request.contextPath }/js/bootstrap-jqxtreegrid/js/jqxdata.js"></script>
  	<script src="${ pageContext.request.contextPath }/js/bootstrap-jqxtreegrid/js/jqxbuttons.js"></script>
  	<script src="${ pageContext.request.contextPath }/js/bootstrap-jqxtreegrid/js/jqxscrollbar.js"></script>
  	<script src="${ pageContext.request.contextPath }/js/bootstrap-jqxtreegrid/js/jqxdatatable.js"></script>
  	<script src="${ pageContext.request.contextPath }/js/bootstrap-jqxtreegrid/js/jqxtreegrid.js"></script>
  
    <style type="text/css">
		body {
			margin: 0;
			padding: 0;
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
	
	<script type="text/javascript" src="${ pageContext.request.contextPath }/jsps/sys/authority/js/resource.js"></script>
</head>
<body>
	<div class="panel-body" style="padding-bottom:0px;">
		<div class="panel panel-default">
			<div class="panel-heading">
				<a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
					查询条件
                </a>
            </div>
			<div class="panel-collapse collapse in" id="collapseOne">
				<form id="formSearch" class="form-horizontal">
					<div class="form-group" style="margin-top:15px">
						<label class="control-label col-xs-1"
							for="txt_search_departmentname">父资源名</label>
						<div class="col-xs-2">
							<input type="text" class="form-control"
								id="queryParentResourceName">
						</div>
						<label class="control-label col-xs-1"
							for="txt_search_departmentname">资源名</label>
						<div class="col-xs-2">
							<input type="text" class="form-control"
								id="queryResourceName">
						</div>
						<label class="control-label col-xs-1" for="txt_search_statu">资源类型</label>
						<div class="col-xs-2">
							<select id="queryResourceTypeName" class="selectpicker show-menu-arrow form-control" data-hide-disabled="true" data-size="5">
								<option selected id="0">全部</option>
							</select>
						</div>
						<div class="col-xs-1" style="text-align:left;">
							<button type="button" style="margin-left:20px" id="btn_query"
								class="btn btn-primary">查询</button>
						</div>
					</div>
				</form>
			</div>
		</div>
		<div id="toolbar" class="btn-group">
			<shiro:hasPermission name="新增资源">
			<button id="btn_add" type="button" class="btn btn-default">
				<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增
			</button>
			</shiro:hasPermission>
			<shiro:hasPermission name="修改资源">
			<button id="btn_edit" type="button" class="btn btn-default">
				<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>修改
			</button>
			</shiro:hasPermission>
			<shiro:hasPermission name="删除资源">
			<button id="btn_delete" type="button" class="btn btn-default">
				<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>删除
			</button>
			</shiro:hasPermission>
		</div>
		
		<div id="treegrid" style="width:99%;margin-bottom:45px;"></div>
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
									<div class="col-sm-11">
										<span id="resourceNameRepeat" class="emptyMsg">该资源名已存在</span>
									</div>
									<label for="firstname" class="col-sm-2 control-label">资源名</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" id="addResourceName"
											placeholder="请输入资源名">
									</div>
									<div class="col-sm-11">
										<span id="addResourceNameMsg" class="emptyMsg">资源名不能为空</span>
									</div>
								</div>
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">资源类型</label>
									<div class="col-sm-9">
										<select id="resourceTypeName" class="selectpicker show-menu-arrow form-control" data-hide-disabled="true" data-size="5">
										</select>
									</div>
								</div>
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">父资源名</label>
									<div class="col-sm-9">
										<select id="addParentName" class="selectpicker show-menu-arrow form-control" data-hide-disabled="true" data-size="5">
										</select>
									</div>
								</div>
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">路径</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" id="addLocation"
											placeholder="请输入路径">
									</div>
								</div>
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">关键字</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" id="addKeyword"
											placeholder="请输入关键字">
									</div>
								</div>
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">编码</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" id="addCode"
											placeholder="请输入编码">
									</div>
								</div>
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">描述</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" id="addDescription"
											placeholder="请输入描述">
									</div>
								</div>
								
								<div class="form-group modelBtn">
									<input type="button" class="btn btn-primary" id="addResource" value="添加"/>
									<input type="button" class="btn btn-default4" data-dismiss="modal" onclick="clean()" value="关闭"/>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 修改模态框（Modal） -->
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
									<div class="col-sm-11">
										<span id="updateResourceNameRepeat" class="emptyMsg">该资源名已存在</span>
									</div>
									<label for="firstname" class="col-sm-2 control-label">资源Id</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" id="updateResourceId" disabled>
									</div>
								</div>
								<div class="form-group">
									<label for="firstname" class="col-sm-2 control-label">资源名</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" id="updateResourceName"
											placeholder="请输入资源名">
									</div>
									<div class="col-sm-11">
										<span id="updateResourceNameMsg" class="emptyMsg">资源名不能为空</span>
									</div>
								</div>
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">资源类型</label>
									<div class="col-sm-9">
										<select id="updateResourceTypeName" class="selectpicker show-menu-arrow form-control" data-hide-disabled="true" data-size="5">
										</select>
									</div>
								</div>
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">父资源名</label>
									<div class="col-sm-9">
										<select id="updateParentName" class="selectpicker show-menu-arrow form-control" data-hide-disabled="true" data-size="5">
										</select>
									</div>
								</div>
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">路径</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" id="updateLocation"
											placeholder="请输入路径">
									</div>
								</div>
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">关键字</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" id="updateKeyword"
											placeholder="请输入关键字">
									</div>
								</div>
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">编码</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" id="updateCode"
											placeholder="请输入编码">
									</div>
								</div>
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">描述</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" id="updateDescription"
											placeholder="请输入描述">
									</div>
								</div>
								
								<div class="form-group modelBtn">
									<input type="button" class="btn btn-primary" id="updateResource" value="确认修改">
									<input type="button" class="btn btn-default4" data-dismiss="modal" onclick="clean()" value="关闭">
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