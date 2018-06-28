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
<title>取派设置</title>

<!-- Jquery组件引用 -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js"></script>

<!-- bootstrap组件引用 -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/bootstrap/js/bootstrap.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/jsps/base/staff/css/bootstrap.min.css">

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

<!-- 页面Js文件和Css的引用 -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/jsps/base/staff/js/staff-table.js"></script>
	<script type="text/javascript"
	src="${pageContext.request.contextPath}/jsps/base/staff/js/relief-table.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/jsps/base/staff/css/staff.css" />

<!-- 页面下拉框Js文件和Css的引用 -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/bootstrap-select/js/bootstrap-select.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/js/bootstrap-select/css/bootstrap-select.min.css" />
	
<!-- 页面校验Js文件和Css的引用 -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/jsps/base/staff/js/bootstrapValidator.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/jsps/base/staff/js/bootstrapValidator.min.css" />
	
<!-- 时间框Js文件和Css的引用 -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/bootstrap-datetimepicker/js/bootstrap-datetimepicker.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/bootstrap-datetimepicker/js/bootstrap-datetimepicker.zh-CN.js"></script>	
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/js/bootstrap-datetimepicker/css/bootstrap-datetimepicker.css" />	

<script type="text/javascript">
	$(function () {
		$("[data-toggle='tooltip']").tooltip(); 
	});
</script>
<style type="text/css">
	.prompt{
		color: #a94442;
	}
</style>	

<body>
	<!-- 标签页切换标签 -->
	<ul id="myTab" class="nav nav-tabs">
		<shiro:hasPermission name="职员设置">
	    <li class="active">
	        <a href="#staff" data-toggle="tab">取派设置</a>
	    </li>
	    </shiro:hasPermission>
	    <shiro:hasPermission name="替班设置">
	    <shiro:lacksPermission name="职员设置">
	    <li class="active">
	    </shiro:lacksPermission>
	    <shiro:hasPermission name="职员设置">
	    <li>
	    </shiro:hasPermission>
	    	<a href="#relief" data-toggle="tab">替班</a>
	    </li>
	    </shiro:hasPermission>
	</ul>
	
	<div id="myTabContent" class="tab-content">	
	<!-- 取派设置 -->
	<shiro:hasPermission name="职员设置">
	<div id="staff" class="tab-pane fade in active" style="padding-bottom: 0px;">
		<div class="panel panel-default">
			<div class="panel-heading">
				<a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
					查询条件
                </a>
                </div>
			<div class="panel-collapse collapse on" id="collapseOne">
				<form id="formSearch" class="form-horizontal">
					<div class="form-group" style="margin-top: 15px">
						<!-- 取派员编号 -->
						<label class="control-label col-sm-1"
							for="txt_search_departmentname">编号</label>
						<div class="col-sm-3 ">
							<input type="text" class="form-control"
								id="txt_search_staffNumber" name="staffNumber">
						</div>
						<!-- 取派员名 -->
						<label class="control-label col-sm-1"
							for="txt_search_departmentname">取派员名</label>
						<div class="col-sm-3">
							<input type="text" class="form-control" id="txt_search_staffName">
						</div>
						<!-- 收派标准 -->
						<label class="control-label col-sm-1" for="txt_search_statu">收派标准</label>
						<div class="col-sm-3">
							<input type="text" class="form-control"
								id="txt_search_standardName" name="standardName">
						</div>
						<!-- 所属单位 -->
						<label class="control-label col-sm-1" for="txt_search_statu">所属单位</label>
						<div class="col-sm-3">
							<input type="text" class="form-control" id="txt_search_orgName">
						</div>
						<!-- 类型 -->
						<label class="control-label col-sm-1" for="txt_search_statu">类型</label>
						<div class="col-sm-3">
							<input type="text" class="form-control" id="txt_search_subsetName">
						</div>
						<div class="col-sm-4" style="text-align: left;">
							<button type="button" style="margin-left: 90px" id="btn_query"
								class="btn btn-primary">查询</button>
						</div>
					</div>
				</form>
			</div>
		</div>
		<div id="toolbar" class="btn-group">
			<!-- 按钮触发模态框 -->
			<shiro:hasPermission name="新增职员">
			<button id="btn_insert" type="button" class="btn btn-default" data-toggle="modal"
				data-target="#myModal">
				<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增
			</button>
			</shiro:hasPermission>
			<shiro:hasPermission name="修改职员">
			<button type="button" class="btn btn-default" data-toggle="modal"
				id="btn_edit">
				<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>修改
			</button>
			</shiro:hasPermission>
			<shiro:hasPermission name="作废职员">
			<button id="btn_delete" type="button" class="btn btn-default">
				<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>作废
			</button>
			</shiro:hasPermission>
		</div>
		<table id="tb_departments"></table>
	</div>
	</shiro:hasPermission>
	
	<!-- 替班 -->
	<shiro:hasPermission name="替班设置">
	<shiro:lacksPermission name="职员设置">
	<div id="relief" class="tab-pane fade in active" style="padding-bottom: 0px;">
	</shiro:lacksPermission>
	<shiro:hasPermission name="职员设置">
	<div id="relief" class="tab-pane fade" style="padding-bottom: 0px;">
	</shiro:hasPermission>
		<div class="panel panel-default">
			<div class="panel-heading">
				<a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">
					查询条件
                </a>
            </div>
			<div class="panel-collapse collapse on" id="collapseTwo">
				<form id="formSearch" class="form-horizontal">
					<div class="form-group" style="margin-top: 15px">
						<!-- 开始时间 -->
						<label class="control-label col-sm-1"for="txt_search_departmentname">
						开始时间</label>
						<div class="col-sm-3 ">							
							<input type="text" class="form-control" name="startTime" id="txt_search_startTime" data-date-format="yyyy-mm-dd hh:ii:ss">
						</div> 
						
						<!-- 结束时间 -->
						<label class="control-label col-sm-1"
							for="txt_search_departmentname">结束时间</label>
						<div class="col-sm-3">
							<input type="text" class="form-control" name="endTime" id="txt_search_endTime" data-date-format="yyyy-mm-dd hh:ii:ss">	
						</div>
						<!-- 所属单位 -->
						<label class="control-label col-sm-1" for="txt_search_statu">所属单位</label>
						<div class="col-sm-3">
							<input type="text" class="form-control" id="txt_search_orgNames"
								>
						</div>
						<!-- 替班名字 -->
						<label class="control-label col-sm-1" for="txt_search_statu">替班名字</label>
						<div class="col-sm-3">
							<input type="text" class="form-control"
								id="txt_search_staffNames">
						</div>
						<!-- 被替名字 -->
						<label class="control-label col-sm-1" for="txt_search_statu">被替名字</label>
						<div class="col-sm-3">
							<input type="text" class="form-control"
								id="txt_search_covStaffName" name="covStaffName">
						</div>
						<div class="col-sm-4" style="text-align: left;">
							<button type="button" style="margin-left: 90px" id="btn_relief"
								class="btn btn-primary">查询</button>
						</div>
					</div>
				</form>
			</div>
		</div>
		<div id="toolbars" class="btn-group">
			<!-- 按钮触发模态框 -->
			<shiro:hasPermission name="新增替班">
			<button id="bt_reliefInsert" type="button" class="btn btn-default" data-toggle="modal"
				data-target="#reliefModal">
				<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增
			</button>
			</shiro:hasPermission>
			<shiro:hasPermission name="修改替班">
			<button type="button" class="btn btn-default" data-toggle="modal"
				id="btn_reliefEdit">
				<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>修改
			</button>
			</shiro:hasPermission>
			<shiro:hasPermission name="删除替班">
			<button id="btn_reliefDelete" type="button" class="btn btn-default">
				<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>作废
			</button>
			</shiro:hasPermission>
		</div>
		<table id="tb_departmentes"></table>
	</div>
	</shiro:hasPermission>
	
	<!-- 职员添加模态框（Modal） -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content" id="contentAdd">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true" onclick="clean()">&times;</button>
					<div class="panel panel-success">
						<div class="panel-heading">
							<h3 class="panel-title">添加</h3>
						</div>
						<div class="panel-body">
							<form class="form-horizontal" onsubmit="return check()"
								role="form" id="addStaffFrom">
								<!-- 取派员编号 -->
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">编号</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" id="staffNumber" name="staffNumber"
											placeholder="请输入取派员编号" style="width: 410px;" >
										<span id="staffNumber_prompt" class="prompt"></span>	
									</div>
								</div>
								<!-- 取派员名 -->
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">姓名</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" id="staffName" name="staffName"
											placeholder="请输入取派员名" style="width: 410px;" >
										<span id="staffName_prompt" class="prompt"></span>	
									</div>
								</div>
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">查台密码</label>
									<div class="col-sm-10">
										<input type="password" class="form-control" id="staffPassword" name="staffPassword"
											placeholder="请输入查台密码" style="width: 410px;">
										<span id="staffPassword_prompt" class="prompt"></span>	
									</div>
								</div>
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">电话</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" id="telephone" name="telephone"
											placeholder="请输入电话" style="width: 410px;" />
										<span id="telephone_prompt" class="prompt"></span>
									</div>
								</div>
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">PD标志</label>
									<div class="col-sm-10">
										<select class="selectpicker show-menu-arrow" id="PDSign" name="PDSign" data-width="410px" data-size="5">
											<option value="0">有效</option>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">作废标记</label>
									<div class="col-sm-10">
										<select class="selectpicker show-menu-arrow" id="cancelSign" name="cancelSign" data-width="410px" data-size="5">
											<!-- <option value="volvo">请选择作废标记,'0'为有效,'1'为作废,默认为'0'</option> -->
											<option value="0">有效</option>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">选择类型</label>
									<div class="col-sm-10">
										<select name="subsetName" id="subsetName" class="selectpicker show-menu-arrow"  data-width="410px" data-size="5">
										</select>
									</div>
								</div>
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">单位名称</label>
									<div class="col-sm-10">
										<select id="orgName" class="selectpicker show-menu-arrow" name="orgName"  data-width="410px" data-size="5" >
										</select>
									</div>
								</div>
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">收派标准</label>
									<div class="col-sm-10">
										<select id="standardName" class="selectpicker show-menu-arrow" name="standardName" data-width="410px" data-size="5" >
										</select>
									</div>
								</div>
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">收派时间</label>
									<div class="col-sm-10">
										<select id="timeName" class="selectpicker show-menu-arrow" name="timeName" data-width="410px" data-size="5" >
										</select>
									</div>
								</div>
								<div class="modal-footer">
									<input type="submit" class="btn btn-primary" id="addStaffButton" value="确认添加" />
									<input type="button" class="btn btn-default4" data-dismiss="modal" value="关闭" onclick="clean()" />
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 修改职员模态框（Modal） -->
	<div class="modal fade" id="myModalUpdate" tabindex="-1" role="dialog"
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
						<div class="panel-body">
							<form class="form-horizontal" onsubmit="return check()"
								role="form" id="updateStaffFrom">
								<hr/>
								<font color="#000000">根据</font>
								<hr/>	
								<div class="form-group">
									<label for="firstname" class="col-sm-2 control-label">ID</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" id="updateStaffId"
											placeholder="请输入取派员ID" style="width: 410px;" disabled>
									</div>
								</div>
								<font color="#FF0000">修改信息</font>
								<hr/>
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">姓名</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" id="updateStaffName"
											placeholder="请输入取派员名" style="width: 410px;" disabled>
									</div>
								</div>
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">查台密码</label>
									<div class="col-sm-10">
										<input type="password" class="form-control" id="updateStaffPassword"
										placeholder="请输入查台密码" name="updateStaffPassword" style="width: 410px;" >
										<span id="updateStaffPassword_prompt" class="prompt"></span>	
									</div>
								</div>
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">电话</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" id="updateTelephone"
											placeholder="请输入电话" name="updateTelephone" style="width: 410px;">
										<span id="updateTelephone_prompt" class="prompt"></span>	
									</div>
								</div>
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">PD标志</label>
									<div class="col-sm-10">
										<select id="PDSignU" class="selectpicker show-menu-arrow" data-width="410px" data-size="5">
											<option value="0">有效</option>
											<option value="1">无效</option>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">作废标记</label>
									<div class="col-sm-10">
										<select id="cancelSignU" class="selectpicker show-menu-arrow" data-width="410px" data-size="5">
											<option value="0">有效</option>
											<option value="1">作废</option>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">选择类型</label>
									<div class="col-sm-10">
										<select id="subsetNameU" class="selectpicker show-menu-arrow" name="subsetNameU" data-width="410px" data-size="5">
										</select>
									</div>
								</div>
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">单位名称</label>
									<div class="col-sm-10">
										<select id="orgNameU" class="selectpicker show-menu-arrow" name="orgName"  data-width="410px" data-size="5" >
										</select>
									</div>
								</div>
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">收派标准</label>
									<div class="col-sm-10">
										<select id="standardNameU" class="selectpicker show-menu-arrow" name="standardName" data-width="410px" data-size="5" >
										</select>
									</div>
								</div>
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">收派时间</label>
									<div class="col-sm-10">
										<select id="timeNameU" class="selectpicker show-menu-arrow" name="timeName" data-width="410px" data-size="5" >
										</select>
									</div>
								</div>
								<div class="modal-footer">
									<input type="submit" class="btn btn-primary" id="updateStaffButton" value="提交更改"/>
									<input type="button" class="btn btn-default4" data-dismiss="modal" value="关闭" onclick="clean()" />
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 替班添加模态框（Modal） -->
	<div class="modal fade" id="reliefModal" tabindex="-1" role="dialog"
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
								role="form" id="addReliefFrom">
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">开始时间</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" id="txt_search_addStartTime" style="width: 410px;"
										data-date-format="yyyy-mm-dd hh:ii:ss" placeholder="请选择开始时间" name="addStartTime">
										<span id="txt_search_addStartTime_prompt" class="prompt"></span>
									</div>
								</div>
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">结束时间</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" id="txt_search_addEndTime" style="width: 410px;"
										data-date-format="yyyy-mm-dd hh:ii:ss" placeholder="请选择结束时间" name="addEndTime">
										<span id="txt_search_addEndTime_prompt" class="prompt"></span>
									</div>
								</div>
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">作废标记</label>
									<div class="col-sm-10">
										<select class="selectpicker show-menu-arrow" id="txt_search_cancelSign" data-width="410px" data-size="5" >
											<option value="0">有效</option>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">替班人</label>
									<div class="col-sm-10">
										<select id="staffNameR" class="selectpicker show-menu-arrow" data-width="410px" data-size="5">
										</select>
									</div>
								</div>
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">被替班人</label>
									<div class="col-sm-10">
										<select id="covStaffNameR" class="selectpicker show-menu-arrow" name="covStaffNameR" data-width="410px" data-size="5">
										</select>
									</div>
								</div>
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">选择类型</label>
									<div class="col-sm-10">
										<select id="orgNameR" class="selectpicker show-menu-arrow" name="" data-width="410px" data-size="5">
										</select>
									</div>
								</div>
								<div class="modal-footer">
									<input onclick="checkAddRelief()" type="submit" class="btn btn-primary" id="addReliefButton" data-dismiss="modal" value="确认添加"/>
									<input type="button" class="btn btn-default4" data-dismiss="modal" value="关闭" onclick="clean()" />
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 替班修改模态框（Modal） -->
	<div class="modal fade" id="myModalUpdateR" tabindex="-1" role="dialog"
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
						<div class="panel-body">
							<form class="form-horizontal" onsubmit="return check()"
								role="form" id="updateReliefFrom">
								<hr/>
								<font color="#000000">根据</font>
								<hr/>	
								<div class="form-group">
									<label for="firstname" class="col-sm-2 control-label">ID</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" id="updateReliefId"
											placeholder="请输入替班ID" style="width: 410px;" disabled>
									</div>
								</div>
								<font color="#FF0000">修改信息</font>
								<hr/>
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">替班名</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" id="updateStaffNameU"
											placeholder="请输入替班名" style="width: 410px;" disabled>
									</div>
								</div>

								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">被替班名</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" id="updateCovStaffNameU"
											placeholder="请输入被替班名" style="width: 410px;" disabled>
									</div>
								</div>
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">开始时间</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" id="updateStartTimeU" name="updateStartTimeU" 
										data-date-format="yyyy-mm-dd hh:ii:ss" placeholder="请选择开始时间" style="width: 410px;">
										<span id="updateStartTimeU_prompt" class="prompt"></span>
									</div>
								</div>
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">结束时间</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" id="updateEndTimeU" name="updateEndTimeU"
										data-date-format="yyyy-mm-dd hh:ii:ss" placeholder="请选择结束时间" style="width: 410px;">
										<span id="updateEndTimeU_prompt" class="prompt"></span>
									</div>
								</div>
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">作废标记</label>
									<div class="col-sm-10">
										<select id="updateCancelSignU" class="selectpicker show-menu-arrow" data-width="410px" data-size="5">						
											<option value="0">有效</option>
											<option value="1">作废</option>
										</select>
									</div>
								</div>
								
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">单位名称</label>
									<div class="col-sm-10">
										<select id="updateOrgNameU" class="selectpicker show-menu-arrow" data-width="410px" data-size="5" >
										</select>
									</div>
								</div>
								<div class="modal-footer">
									<input onclick="checkAddReliefU()" type="submit" class="btn btn-primary" id="updateReliefButton" data-dismiss="modal" value="提交更改"/>
									<input type="button" class="btn btn-default4" data-dismiss="modal" value="关闭" />
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