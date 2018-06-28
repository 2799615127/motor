<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro"%>
<%
	String userName = request.getParameter("userName");
	request.getSession().setAttribute("userName", userName);
	
	String orgName = request.getParameter("orgName");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>班车设置</title>
	<!-- Jquery组件引用 -->
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js"></script>

	<!-- bootstrap组件引用 -->
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/js/bootstrap/js/bootstrap.js"></script>
	<link rel="stylesheet" type="text/css"
		href="${pageContext.request.contextPath}/js/bootstrap/css/bootstrap.min.css">

	<!-- bootstrap table组件以及中文包的引用 -->
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/js/bootstrap-table/bootstrap-table.js"></script>
	<link rel="stylesheet" type="text/css"
		href="${pageContext.request.contextPath}/js/bootstrap-table/bootstrap-table.css" />
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/js/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>

	<!-- 提示框Js文件和Css的引用 -->
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/js/toastr/toastr.min.js"></script>
	<link rel="stylesheet" type="text/css"
		href="${pageContext.request.contextPath}/js/toastr/toastr.min.css" />
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/js/sweetalert/sweetalert.min.js"></script>
	<link rel="stylesheet" type="text/css"
		href="${pageContext.request.contextPath}/js/sweetalert/sweetalert.css" />

	<!-- 页面下拉框Js文件和Css的引用 -->
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/js/bootstrap-select/js/bootstrap-select.min.js"></script>
	<link rel="stylesheet" type="text/css"
		href="${pageContext.request.contextPath}/js/bootstrap-select/css/bootstrap-select.min.css" />
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/jsps/base/bus/js/bus-table.js"></script>
	
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/bootstrap-validator/bootstrapValidator.min.css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap-validator/bootstrapValidator.min.js"></script>	
		
	<style type="text/css">
	/* style type ="text /css"> */
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
	</style>
    <script type="text/javascript">
	    
	    
	    
    </script>
</head>
<body>
	<div class="panel-body" style="padding-bottom:0px;">
        <div class="panel panel-default">
            <div class="panel-heading">查询条件</div>
            <div class="panel-body">
                <form id="formSearch" class="form-horizontal">
                    <div class="form-group" style="margin-top:15px">
                        <label class="control-label col-sm-1" for="txt_search_departmentname">承运商</label>
                        <div class="col-sm-3">
                            <input type="text" class="mhcys form-control" id="txt_search_departmentname" placeholder="请输入">
                        </div>
                        <label class="control-label col-sm-1" for="txt_search_statu">司机</label>
                        <div class="col-sm-3">
                            <input type="text" class="mhsj form-control" id="txt_search_statu" placeholder="请输入">
                        </div>
                        <div class="col-sm-4" style="text-align:left;">
                            <button type="button" style="margin-left:50px" id="btn_query" class="btn btn-primary">查询</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>  
       </div>     

        <div id="toolbar" class="btn-group">
        	<shiro:hasPermission name="新增班车">
            <button id="btn_add" type="button" class="btn btn-default" data-toggle="modal"
				data-target="#myModal">
                <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增
            </button>
            </shiro:hasPermission>
            <shiro:hasPermission name="修改班车 ">
            <button id="btn_edit" type="button" class="btn btn-default">
                <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>修改
            </button>
            </shiro:hasPermission>
            <shiro:hasPermission name="删除班车 ">
            <button id="btn_delete" type="button" class="btn btn-default">
                <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>删除
            </button>
            </shiro:hasPermission>
        </div>
        <table id="tb_departments"></table>
		
	<!-- 添加模态框（Modal） -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<div class="panel panel-success">
						<div class="panel-heading">
							<h3 class="panel-title">新增</h3>
						</div>
						<div class="panel-body">
							<form class="form-horizontal" onsubmit="return check()"
								role="form" id="addBusFrom">
								<div class="form-group">
									<label for="lastname" class="col-sm-3 control-label">车牌号</label>
									<div class="col-sm-8">
										<input type="text" class="form-control" id="plateIdAdd" name="plateIdAdd"
											placeholder="请输入车牌号">
									</div>
								</div>
								<div class="form-group">
									<label for="lastname" class="col-sm-3 control-label">承运商</label>
									<div class="col-sm-8">
										<input type="text" class="form-control" id="acceptTraderAdd"
											name="acceptTraderAdd" placeholder="请输入承运商">
									</div>
								</div>
								<div class="form-group">
									<label for="lastname" class="col-sm-3 control-label">司机</label>
									<div class="col-sm-8">
										<select class="form-control" id="driverAdd" name="driverAdd">
										</select>
									</div>
								</div>
								<div class="form-group">
									<label for="lastname" class="col-sm-3 control-label">电话</label>
									<div class="col-sm-8">
										<input type="text" class="form-control" id="telephoneAdd"
											name="telephoneAdd" placeholder="请输入电话号码">
									</div>
								</div>
								<div class="form-group">
									<label for="lastname" class="col-sm-3 control-label">车型</label>
									<div class="col-sm-8">
										<select class="form-control" id="motorcycleTypeAdd" name="motorcycleTypeAdd">
										</select>
									</div>
								</div>
								<div class="form-group">
									<label for="firstname" class="col-sm-3 control-label">线路类型</label>
									<div class="col-sm-8">
										<select class="form-control" id="routeTypeAdd" name="routeTypeAdd">
										</select>
									</div>
								</div>
								<div class="form-group">
									<label for="lastname" class="col-sm-3 control-label">线路名称</label>
									<div class="col-sm-8">
										<input type="text" class="form-control" id="routeNameAdd"
											name="routeNameAdd" placeholder="请输入线路名称">
									</div>
								</div>
								<div class="form-group">
									<label for="lastname" class="col-sm-3 control-label">操作人</label>
									<div class="col-sm-8">
										<input type="text" class="form-control" id="operationStaffIdAdd"
											name="operationStaffIdAdd" value="<%=userName %>" disabled/>
									</div>
								</div>
								<div class="form-group">
									<label for="lastname" class="col-sm-3 control-label">操作单位</label>
									<div class="col-sm-8">
										<input type="text" class="form-control" id="operateUnitAdd"
											name="operateUnitAdd" value="<%=orgName %>" disabled/>
									</div>
								</div>
								<div class="form-group">
									<label for="lastname" class="col-sm-3 control-label">吨控</label>
									<div class="col-sm-8">
										<input type="text" class="form-control" id="tonsAdd"
											name="tonsAdd" placeholder="吨控(必输项)">
									</div>
								</div>
								<div class="form-group">
									<label for="lastname" class="col-sm-3 control-label">备注</label>
									<div class="col-sm-8">
										<input type="text" class="form-control" id="remarkAdd"
											placeholder="备注">	
									</div>
								</div>
								<div class="form-group">
									<label for="lastname" class="col-sm-3 control-label">作废</label>
									<div class="col-sm-8">
										<select class="form-control" id="cancelAdd">
											<option value="0">激活</option>
										</select>			
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button id="btn_sub" type="button" class="btn btn-primary" data-dismiss="modal">添加</button>
					<button type="button" class="btn btn-default4" data-dismiss="modal">关闭</button>
				</div>
				<input type="hidden" value="<%=orgName%>" id="orgName" />
			</div>
		</div>
	</div>
	<!-- 修改模态框（Modal） -->	
	<div class="modal fade" id="myModal-footer2" tabindex="-1" role="dialog" 
		   aria-labelledby="myModalLabel" aria-hidden="true">
		   <div class="modal-dialog">
		      <div class="modal-content">
		      
		      <div class="modal-header">
		      		<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<div class="panel panel-success">
						<div class="panel-heading">
							<h3 class="panel-title">修改</h3>
						</div>
		      		</div>
		      		<div class="panel-body">
						<form class="form-horizontal" onsubmit="return check()"
							role="form" id="updateBusFrom">
							<div class="form-group">
								<label for="lastname" class="col-sm-3 control-label">车牌号</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="plateIdUp" name="plateIdUp"
										placeholder="请输入车牌号">
								</div>
							</div>
							<div class="form-group">
								<label for="lastname" class="col-sm-3 control-label">承运商</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="acceptTraderUp"
										name="acceptTraderUp" placeholder="请输入承运商">
								</div>
							</div>
							<div class="form-group">
								<label for="lastname" class="col-sm-3 control-label">司机</label>
								<div class="col-sm-8">
									<select class="form-control" id="driverUp" name="driverUp">
									</select>
								</div>
							</div>
							<div class="form-group">
								<label for="lastname" class="col-sm-3 control-label">电话</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="telephoneUp"
										name="telephoneUp" placeholder="请输入电话号码">
								</div>
							</div>
							<div class="form-group">
								<label for="lastname" class="col-sm-3 control-label">车型</label>
								<div class="col-sm-8">
									<select class="form-control" id="motorcycleTypeUp" name="motorcycleTypeUp">
									</select>
								</div>
							</div>
							<div class="form-group">
								<label for="firstname" class="col-sm-3 control-label">线路类型</label>
								<div class="col-sm-8">
									<select class="form-control" id="routeTypeUp" name="routeTypeUp">
									</select>
								</div>
							</div>
							<div class="form-group">
								<label for="lastname" class="col-sm-3 control-label">线路名称</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="routeNameUp"
										name="routeNameUp" placeholder="请输入线路名称">
								</div>
							</div>
							<div class="form-group">
								<label for="lastname" class="col-sm-3 control-label">操作人</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="operationStaffIdUp"
										name="operationStaffIdUp" value="<%=userName %>" disabled/>
								</div>
							</div>
							<div class="form-group">
								<label for="lastname" class="col-sm-3 control-label">操作单位</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="operateUnitUp"
										name="operateUnitUp" value="<%=orgName%>" disabled/>
								</div>
							</div>
							<div class="form-group">
								<label for="lastname" class="col-sm-3 control-label">吨控</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="tonsUp"
										name="tonsUp" placeholder="吨控(必输项)">
								</div>
							</div>
							<div class="form-group">
								<label for="lastname" class="col-sm-3 control-label">备注</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="remarkUp"
										name="remarkUp" placeholder="备注">	
								</div>
							</div>
							<div class="form-group">
								<label for="lastname" class="col-sm-3 control-label">作废</label>
								<div class="col-sm-8">
									<select class="form-control" id="cancelUp">
										<option value="0">激活</option>
										<option value="1">作废</option>
									</select>			
								</div>
							</div>
						</form>
					</div>
		      
		       <div class="modal-footer">
					<button id="subset_edit" type="button" class="btn btn-primary" data-dismiss="modal">提交更改</button>
					<button type="button" class="btn btn-default4" data-dismiss="modal">关闭</button>
			   </div>
		      </div>
		   </div>
		</div>	   
     </div>
       
  
</body>
</html>