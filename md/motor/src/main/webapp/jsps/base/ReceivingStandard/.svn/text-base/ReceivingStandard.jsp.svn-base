<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<title>Insert title here</title>

<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/js/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/jsps/base/ReceivingStandard/css/Rece.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/js/bootstrap-table/bootstrap-table.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/js/bootstrap-datetimepicker/css/bootstrap-datetimepicker.css">

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/js/sweetalert/sweetalert.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/js/toastr/toastr.css">

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/js/toastr/toastr.min.css">


<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/bootstrap-table/bootstrap-table.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/sweetalert/sweetalert.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/toastr/toastr.min.js"></script>

<script type="text/javascript"
	src="${pageContext.request.contextPath }/jsps/base/ReceivingStandard/js/Rece.js"></script>

<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/bootstrap-datetimepicker/js/bootstrap-datetimepicker.js"></script>

<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/bootstrap-datetimepicker/js/bootstrap-datetimepicker.zh-CN.js"></script>


<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>

	<style type="text/css">
		#isnullMsg,#errorMsg,#updaMag,#bigMag,#sizeMsg,#cuntMsg{
		 display: none;
		 text-align:center;
		 color:red;
		}
	</style>
</head>
<body>
	<div class="panel-body" style="padding-bottom: 0px;">
		<div class="panel panel-default">
	       <!-- 查询 -->
			<div class="panel-heading" >
			<a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
					查询条件
                </a>
			</div>			
			<div class="panel-body" id="collapseOne">
				<form id="formSearch" class="form-horizontal">
					<div class="form-group" style="margin-top:10px ">
					
						<label class="control-label col-sm-1"
							for="txt_search_departmentname">最大重量</label>
						<div class="col-sm-3">
							<input type="text" class="form-control" id="txt_search_maxWeight">
						</div>
						
                        <label class="control-label col-sm-1"
							for="txt_search_departmentname">最小重量</label>
						<div class="col-sm-3">
							<input type="text"  class="form-control" id="txt_search_minWeight" />
						</div>
						
						<label class="control-label col-sm-1" for="txt_search_statu">操作人</label>
						<div class="col-sm-3">
							<input type="text" class="form-control" id="txt_search_statu">
						</div>
					
						<label class="control-label col-sm-1" for="txt_search_statu"  id="start">开始时间</label> 
						<div class="input-append date form_datetime col-sm-3" >  
							<input id="startTime" size="35" type="text" value="" readonly="readonly" >
							<span class="add-on"><i class="icon-th"></i></span> 	
						</div>
						
						<label class="control-label col-sm-1" for="txt_search_statu" id="end">结束时间</label>
						<div class="input-append date form_datetime col-sm-3" id="ss">	
							<input id="endTime" size="35" type="text" value="" readonly="readonly">
							<span class="add-on"><i class="icon-th"></i></span> 
						</div>
						
						<div class="col-sm-1" style="text-align:right" id="quey" >
							<button type="button" id="btn_query"
								class="btn btn-primary">查询</button>
						</div>
				
					 </div>
				</form>	
			</div>
		
		</div>
		<div id="toolbar" class="btn-group" >
			<shiro:hasPermission name="新增收派标准">
			<button id="btn_add" type="button" class="btn btn-default"
				 data-toggle="modal">
				<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增
			</button>
			</shiro:hasPermission>
			<shiro:hasPermission name="修改收派标准">
			<button id="btn_edit" type="button" class="btn btn-default"
				data-toggle="modal">
				<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>修改
			</button>
			</shiro:hasPermission>
			<shiro:hasPermission name="作废收派标准">
			<button id="btn_delete" type="button" class="btn btn-default">
				<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>作废
			</button>
			</shiro:hasPermission>
		  	<shiro:hasPermission name="还原收派标准">
		  	<button id="btn_recover" type="button" class="btn btn-default">
          		<span class="glyphicon glyphicon-repeat"  aria-hidden="true">还原</span>
          	</button>
          	</shiro:hasPermission>
		</div>
		<table id="tb_departments"></table>
	</div>


     <!-- 添加模态框 -->
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
							<form class="form-horizontal" role="form">
								<div class="form-group">
									<div class="col-sm-11" id="errorMsg">该标准已存在</div>
									<div class="col-sm-11" id="isnullMsg"  >不能为空</div>
									<div class="col-sm-11" id="sizeMsg">请输入正确的重量</div>
									<label for="firstname" class="col-sm-2 control-label">最大重量</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" id="maxWeight"
											placeholder="最大重量">
									</div>
								</div>

								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">最小重量</label>
									<div class="col-sm-10" >
										<input type="text" class="form-control" id="minWeight"
											placeholder="最小重量">
									</div>
								</div>
							
							    <input type="hidden" id="username" value="<%=userName %>"/>

								<div class="form-group">
									<div class="text-center">
										<input id="sub" type="reset" class="btn btn-primary" value="提交" type="button"></input>
										<input  class="btn btn-info" data-dismiss="modal"
											onclick="cancel()" value="取消" type="button"></input>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

     <!-- 修改的模态框 -->
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
							<form class="form-horizontal"
								role="form">
								<div class="form-group">
								<div class="col-sm-11" id=updaMag>请进行修改</div>
								<div class="col-sm-11" id=bigMag>请输入正确的重量</div>
								<div class="col-sm-11" id="cuntMsg">该标准已存在</div>
								
									<label for="firstname" class="col-sm-2 control-label">最大重量</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" id="max"
											placeholder="请输入最大重量">
									</div>
								</div>

								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">最小重量</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" id="min"
											placeholder="请输入最小重量">
									</div>
								</div>
								<div class="form-group">
									<div class="text-center">
										<input id="upd" class="btn btn-primary" value="提交" type="button"></input>
										<input class="btn btn-info" data-dismiss="modal"
											onclick="cancel()"type="button" value="取消" type="button"></input>
									</div>
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
