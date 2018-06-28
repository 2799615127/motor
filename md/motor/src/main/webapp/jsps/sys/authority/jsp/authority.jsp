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
<title>权限分配</title>
	<link rel="stylesheet" type="text/css" href="${ pageContext.request.contextPath }/js/bootstrap/css/bootstrap.min.css">
	<script src="${ pageContext.request.contextPath }/js/jquery-3.1.1.min.js" type="text/javascript"></script>
	<script type="text/javascript" src="${ pageContext.request.contextPath }/js/bootstrap/js/bootstrap.min.js"></script>
    
    <link rel="stylesheet" href="${ pageContext.request.contextPath }/js/bootstrap-select/css/bootstrap-select.min.css">
  	<script src="${ pageContext.request.contextPath }/js/bootstrap-select/js/bootstrap-select.min.js"></script>
    
    <link rel="stylesheet" href="${ pageContext.request.contextPath }/js/toastr/toastr.min.css">
  	<script src="${ pageContext.request.contextPath }/js/toastr/toastr.min.js"></script>
    
    <script src="${ pageContext.request.contextPath }/js/bootstrap-table/bootstrap-table.js"></script>
    <link href="${ pageContext.request.contextPath }/js/bootstrap-table/bootstrap-table.css" rel="stylesheet" />
    <script src="${ pageContext.request.contextPath }/js/bootstrap-table/locale/bootstrap-table-zh-CN.js"></script>
    
    <link rel="stylesheet" href="${ pageContext.request.contextPath }/js/sweetalert/sweetalert.css">
  	<script src="${ pageContext.request.contextPath }/js/sweetalert/sweetalert.min.js"></script>
    
    <link rel="stylesheet" href="${ pageContext.request.contextPath }/js/bootstrap-jqxtreegrid/css/jqxbase.css">
  	<link rel="stylesheet" href="${ pageContext.request.contextPath }/js/bootstrap-jqxtreegrid/css/jqx.energyblue.css">
  	<script src="${ pageContext.request.contextPath }/js/bootstrap-jqxtreegrid/js/jqxcore.js"></script>
  	<script src="${ pageContext.request.contextPath }/js/bootstrap-jqxtreegrid/js/jqxdata.js"></script>
  	<script src="${ pageContext.request.contextPath }/js/bootstrap-jqxtreegrid/js/jqxbuttons.js"></script>
  	<script src="${ pageContext.request.contextPath }/js/bootstrap-jqxtreegrid/js/jqxscrollbar.js"></script>
  	<script src="${ pageContext.request.contextPath }/js/bootstrap-jqxtreegrid/js/jqxdatatable.js"></script>
  	<script src="${ pageContext.request.contextPath }/js/bootstrap-jqxtreegrid/js/jqxtreegrid.js"></script>
  	
  	<style>
  		.tab-pane{
  			padding: 15px;
  		}
  		
  		a:hover,a:visited,a:active,a:link{
			text-decoration: none;
		}
		
		.control-label{
			width:120px;
		}
		
		.col-sm-2{
			width:130px;
		}
		
		.bs-checkbox{
			background-color:white
		}
  	</style>
  	
    <script type="text/javascript" src="${ pageContext.request.contextPath }/jsps/sys/authority/js/authority.js"></script>
</head>
<body>
	<!-- 标签页切换标签 -->
	<ul id="myTab" class="nav nav-tabs">
		<%-- <shiro:hasPermission name="分配角色">
	    <li class="active">
	        <a href="#addRole" data-toggle="tab">分配角色</a>
	    </li>
	    </shiro:hasPermission>
	    <shiro:hasPermission name="分配资源">
	    <shiro:lacksPermission name="分配角色">
	    <li class="active">
	    </shiro:lacksPermission>
	    <shiro:hasPermission name="分配角色">
	    <li>
	    </shiro:hasPermission>
	    	<a href="#addAuthority" data-toggle="tab">分配权限</a>
	    </li>
	    </shiro:hasPermission> --%>
	    <li class="active">
	        <a href="#addRole" data-toggle="tab">分配角色</a>
	    </li>
	    <li>
	    	<a href="#addAuthority" data-toggle="tab">分配权限</a>
	    </li>
	</ul>
	<div id="myTabContent" class="tab-content">	
		<%-- <shiro:hasPermission name="分配角色"> --%>
		<div id="addRole" class="tab-pane fade in active" style="padding-bottom: 0px;">
			<div id="userDiv" style="float:left;width:49%;">
				<button id="add_user_role" type="button" class="btn btn-default">
					<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>分配角色
				</button>
				 勾选用户，点击次按钮给多个用户分配角色
				<form id="formSearch" class="form-horizontal">
					<div class="form-group" style="margin-top:15px">
						<label class="control-label col-sm-1"
							for="txt_search_departmentname">用户名</label>
						<div class="col-sm-2">
							<input type="text" class="form-control"
								id="username">
						</div>
						<label class="control-label col-sm-1" for="txt_search_statu">所属组织名</label>
						<div class="col-sm-2">
							<input type="text" class="form-control"
								id="orgName">
						</div>
						<div class="col-sm-2">
							<button type="button" id="query_user_btn"
								class="btn btn-primary">查询用户</button>
						</div>
					</div>
				</form>
				 用户表
				<table id="userGrid"></table>
			</div>
			<div id="roleDiv" style="float:right;width:49%;">
				<button id="save_user_role" type="button" class="btn btn-default">
					<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>保存分配
				</button>
				 双击用户，点击此按钮保存单个用户的角色分配
				<form id="formSearch" class="form-horizontal">
					<div class="form-group" style="margin-top:15px">
						<label class="control-label col-sm-1" for="txt_search_statu">角色名</label>
						<div class="col-sm-2">
							<input type="text" class="form-control" id="roleName">
						</div>
						<label class="control-label col-sm-1" for="txt_search_statu">所属组织类型</label>
						<div class="col-sm-2">
							<select id="queryOrgTypeName" class="selectpicker show-menu-arrow form-control" data-hide-disabled="true" data-size="5">
								<option selected id="0">全部</option>
							</select>
						</div>
						<div class="col-sm-2" style="text-align:center;">
							<button type="button" style="margin-left:50px" id="query_role_btn"
								class="btn btn-primary">查询角色</button>
						</div>
					</div>
				</form>
				 角色表
				<table id="roleGrid"></table>
			</div>
		</div>
		<%-- </shiro:hasPermission> --%>
		<%-- <shiro:hasPermission name="分配资源">
		<shiro:hasPermission name="分配角色">
		<div id="addAuthority" class="tab-pane fade" style="padding-bottom: 0px;">
		</shiro:hasPermission>
		<shiro:lacksPermission name="分配角色">
		<div id="addAuthority" class="tab-pane fade in active" style="padding-bottom: 0px;">
		</shiro:lacksPermission> --%>
		<div id="addAuthority" class="tab-pane fade" style="padding-bottom: 0px;">
			<div id="roleTabDiv" style="float:left;width:49%;">
				<button id="add_role_resource" type="button" class="btn btn-default">
					<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>分配资源
				</button>
				 勾选角色，点击此按钮给多个角色分配资源
				<form id="formSearch" class="form-horizontal">
					<div class="form-group" style="margin-top:15px">
						<label class="control-label col-sm-1"
							for="txt_search_departmentname">角色名</label>
						<div class="col-sm-2">
							<input type="text" class="form-control"
								id="roleName_Tab">
						</div>
						<label class="control-label col-sm-1" for="txt_search_statu">所属组织类型</label>
						<div class="col-sm-2">
							<select id="orgTypeName_Tab" class="selectpicker show-menu-arrow form-control" data-hide-disabled="true" data-size="5">
								<option selected id="0">全部</option>
							</select>
						</div>
						<div class="col-sm-3" style="text-align:center;">
							<button type="button" style="margin-left:50px" id="query_role_Tab_btn"
								class="btn btn-primary">查询角色</button>
						</div>
					</div>
				</form>
				 角色表
				<table id="roleTabGrid"></table>
			</div>
			<div id="resourceDiv" style="float:right;width:49%;">
				<button id="save_role_resource" type="button" class="btn btn-default">
					<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>保存分配
				</button>
				 双击角色，点击此按钮给单个角色分配资源 
				<form id="formSearch" class="form-horizontal">
					<div class="form-group" style="margin-top:15px">
						<label class="control-label col-sm-1" for="txt_search_statu">资源名</label>
						<div class="col-sm-2">
							<input type="text" class="form-control" id="resourceName">
						</div>
						<label class="control-label col-sm-1" for="txt_search_statu">资源类型</label>
						<div class="col-sm-2">
							<select id="queryResourceTypeName" class="selectpicker show-menu-arrow form-control" data-hide-disabled="true" data-size="5">
								<option selected id="0">全部</option>
							</select>
						</div>
						<div class="col-sm-3" style="text-align:center;">
							<button type="button" style="margin-left:50px" id="query_resource_btn"
								class="btn btn-primary">查询资源</button>
						</div>
					</div>
				</form>
				 资源表
				<div id="treegrid"></div>
			</div>
		</div>
		<%-- </shiro:hasPermission> --%>
	</div>
</body>
</html>