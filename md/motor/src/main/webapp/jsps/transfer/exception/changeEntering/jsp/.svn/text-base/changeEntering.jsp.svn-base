<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>资源管理</title>
<script
	src="${pageContext.request.contextPath }/js/jquery-3.1.1.min.js"
	type="text/javascript"></script>
<link rel="stylesheet" type="text/css"
	href="${ pageContext.request.contextPath }/js/bootstrap/css/bootstrap.min.css">
<script type="text/javascript"
	src="${ pageContext.request.contextPath }/js/bootstrap/js/bootstrap.min.js"></script>
<!-- 下拉框 -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/bootstrap-select/js/bootstrap-select.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/js/bootstrap-select/css/bootstrap-select.min.css" />
<!-- 表格 -->
<script
	src="${ pageContext.request.contextPath }/js/bootstrap-table/bootstrap-table.js"></script>
<link
	href="${ pageContext.request.contextPath }/js/bootstrap-table/bootstrap-table.css"
	rel="stylesheet" />
<script
	src="${ pageContext.request.contextPath }/js/bootstrap-table/locale/bootstrap-table-zh-CN.js"></script>
<!-- 外部js -->
<script
	src="${pageContext.request.contextPath }/jsps/transfer/exception/changeEntering/js/changeEntering.js"></script>
<!-- 时间框Js文件和Css的引用 -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/bootstrap-datetimepicker/js/bootstrap-datetimepicker.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/bootstrap-datetimepicker/js/bootstrap-datetimepicker.zh-CN.js"></script>	
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/js/bootstrap-datetimepicker/css/bootstrap-datetimepicker.css" />	
<!-- 提示框Js文件和Css的引用 -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/toastr/toastr.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/js/toastr/toastr.min.css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/sweetalert/sweetalert.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/js/sweetalert/sweetalert.css" />

<script type="text/javascript" src="${pageContext.request.contextPath}/js/linkage.js"></script>
<!-- 下拉框 -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/select2/select2.css"/>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/select2/select2.full.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/select2/select2.min.js"></script>	
<!-- 多选按钮样式 -->
<!-- 页面校验Js文件和Css的引用 -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/jsps/base/staff/js/bootstrapValidator.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/jsps/base/staff/js/bootstrapValidator.min.css" />

 
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

.bootstrap-table {
	margin-bottom: 50px;
}

.modal-body {
	text-align: center;
	width: 400px;
	margin: auto;
}

.col-sm-2.control-label{
  text-align: center;
  width:86px;
}

.form-group{
 margin-left:5px;
}
.control-label.col-sm-1{
  text-align: center;
}

</style>
<script type="text/javascript">

	    var TableInit = function () {
	    	
	    	 var oTableInit = new Object();
	    	 
	        //初始化Table
	        oTableInit.Init = function () {
	        	 
	            $('#tb_departments').bootstrapTable({
	            	    url: '/noob/changeEntering/findAllChangeEnteringQuery.action',//请求后台的URL（*）
	            		method : 'get', //请求方式（*） 
						toolbar : '#toolbars', //工具按钮用哪个容器 
						striped : true, //是否显示行间隔色 
						cache : false, //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*） 
						pagination : true, //是否显示分页（*） 
						sortable : false, //是否启用排序 
						sortOrder : "asc", //排序方式
						queryParams : oTableInit.queryParams,//传递参数（*） 
						sidePagination : "server", //分页方式：client客户端分页，server服务端分页（*） 
						pageNumber : 1, //初始化加载第一页，默认第一页 
						pageSize : 10, //每页的记录行数（*） 
						pageList : [ 10, 25, 50, 100 ], //可供选择的每页的行数（*） 
						strictSearch : true,
						maintainSelected:true,//翻页复选框状态不会改变
						showColumns : true, //是否显示所有的列 
						showRefresh : true, //是否显示刷新按钮
						minimumCountColumns : 2, //最少允许的列数
						clickToSelect : true, //是否启用点击选中行 
						uniqueId : "jobListNo", //每一行的唯一标识，一般为主键列 
						showToggle : true, //是否显示详细视图和列表视图的切换按钮 
						cardView : false, //是否显示详细视图
						detailView : false, //是否显示父子表
	                columns: [{
	                    checkbox: true
	                }, 
	                {
	                    field: 'jobListNo',
	                    align: 'center',
	                    title: '工作单号',
	                    width: '150px'
	                },
	                {
	                    field: 'productName',
	                    align: 'center',
	                    width: '170px',
	                    title: '品名'	
	                }, 
	                {
	                    field: 'cameCollect',
	                    align: 'center',
	                    width: '150px',
	                    title: '原到付款'
	                }, 
	                {
	                    field: 'agencyFund',
	                    align: 'center',
	                    width: '150px',
	                    title: '原代收款'
	                }, 
	                {
	                    field: 'changeCameCollect',
	                    align: 'center',
	                    width: '150px',
	                    title: '变更到付款'
	                }, 
	                {
	                    field: 'changeAgencyFund',
	                    align: 'center',
	                    width: '150px',
	                    title: '变更代收款'
	                },
	                {
	                    field: 'sendeeStatus',
	                    align: 'center',
	                    width: '100px',
	                    title: '接收状态'
	                }, 
	                {
	                    field: 'enteringMan',
	                    align: 'center',
	                    width: '100px',
	                    title: '录入人'
	                }, 
	                {
	                    field: 'enteringUnit',
	                    align: 'center',
	                    width: '150px',
	                    title: '录入单位'
	                },
	                {
	                    field: 'sendeeUnit',
	                    align: 'center',
	                    width: '150px',
	                    title: '接收单位'
	                },	
	                {
	                    field: 'enteringTimeStr',
	                    align: 'center',
	                    width: '200px',
	                    title: '录入时间'
	                },
	                {
	                    field: 'changeCause',
	                    align: 'center',
	                    width: '200px',
	                    title: '变更原因'
	                },
	                {
	                    field: 'senderUnit',
	                    align: 'center',
	                    width: '150px',
	                    title: '委托单位'
	                    	
	                },
	                {
	                    field: 'addressee',
	                    align: 'center',
	                    width: '100px',
	                    title: '收货人'
	                },
	                ],
	            });
	           
	            
	        
	        };
	        
	        //得到查询的参数
	        oTableInit.queryParams = function (params) {
	        	//取得下拉框选中行的ID
		    	var sendeeUnit = "";
		    	for (var i = 0; i < $("#txt_search_sendeeUnit").children().length; i++) {
				     if ($("#txt_search_sendeeUnit").children()[i].selected) {
				    	 sendeeUnit = $($("#txt_search_sendeeUnit").children()[i]).attr("id");
				     }
		        };
		        var enteringUnit = "";
		    	for (var i = 0; i < $("#txt_search_enteringUnit").children().length; i++) {
				     if ($("#txt_search_enteringUnit").children()[i].selected) {
				    	 enteringUnit = $($("#txt_search_enteringUnit").children()[i]).attr("id");
				     }
		        };
	            var temp = {  
	            		//这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的 
	        			limit : params.limit, //开始记录数
						offset : params.offset, //页面大小取多少条 数据
						
						//查询条件
						jobListNo:$("#txt_search_jobListNo").val().trim(),
						enteringTimeStr:$("#txt_search_enteringTime").val().trim(),
						enteringTimeEndStr:$("#txt_search_enteringTimeEnd").val().trim(),
						enteringUnit:enteringUnit,
				        sendeeUnit:sendeeUnit,
						sendeeStatus:$("#txt_search_sendeeStatus").val().trim(),
						enteringUnitJunior:$('#txt_search_enteringUnitJunior').val(),
	                    sendeeUnitJunior:$('#txt_search_sendeeUnitJunior').val(),
	            };
	            return temp;
	        }; 
	        
	           return oTableInit;
	      };
	        
	       
    </script>
</head>
<body>

	<!-- 变更录入条件查询区 -->
	<div class="panel-body" style="padding-bottom: 0px;">
		<div class="panel panel-default">
			<div class="panel-heading">
				<a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">
				查询条件 
				</a>
			</div>
			
			<div class="panel-collapse collapse on" id="collapseTwo">
			<div class="panel-body" style="padding-bottom: 0px">
				<div class="form-group" style="margin-top: 15px">
					
					<label class="control-label col-sm-1"for="txt_search_departmentname"
					    style="width: 12.33333333%; margin-top: 6px;text-align:center;">工作单号</label>
					<div class="col-sm-2">
						<input type="text" class="form-control"id="txt_search_jobListNo" style="margin-bottom: 10px">
					</div>

					<label class="control-label col-sm-1" for="txt_search_statu"
						style="width: 12.33333333%; text-align: center; margin-top: 6px;">录入时间</label>
					<div class="col-sm-3" style="width:230px;">
						<input type="text" class="form-control" id="txt_search_enteringTime" data-date-format="yyyy-mm-dd hh:ii:ss">
					</div>
					
					<label class="control-label col-sm-1" for="txt_search_statu"
						style="width: 12.33333333%; text-align: center; margin-top: 6px;">至</label>
					<div class="col-sm-3" style="width:230px;">
						<input type="text" class="form-control" id="txt_search_enteringTimeEnd" data-date-format="yyyy-mm-dd hh:ii:ss">
					</div>
				

				</div>
			</div>
			
			<div class="panel-body" style="padding-top: 0px">
				<div class="form-group" style="margin-top: 15px">
					
					<label class="control-label col-sm-1" for="txt_search_statu"
						style="width: 12.33333333%; text-align: center; margin-top: 6px;">录入单位</label>
					<div class="col-sm-2">
						<select id="txt_search_enteringUnit"class="selectpicker show-menu-arrow form-control"data-hide-disabled="true" data-size="5">
						</select>
					</div>
					
					<label class="control-label col-sm-1" for="txt_search_statu"
						style="width: 12.33333333%; text-align: center; margin-top: 6px;">含下级</label>
					<label class="control-label col-sm-1" for="txt_search_statu"
						style="text-align: left; margin-top: 6px;width:106px;"><input type="checkbox" id="txt_search_enteringUnitJunior" value="0"></label>
					
					<label class="control-label col-sm-1" for="txt_search_statu"
						style="width: 12.33333333%; text-align: center; margin-top: 6px;">接收单位</label>
					<div class="col-sm-2">
						<select id="txt_search_sendeeUnit"class="selectpicker show-menu-arrow form-control"data-hide-disabled="true" data-size="5">
						</select>
					</div>
					
					<label class="control-label col-sm-1" for="txt_search_statu"
						style="width: 12.33333333%; text-align: center; margin-top: 6px;">含下级</label>
					<label class="control-label col-sm-1" for="txt_search_statu"
						style="text-align: left; margin-top: 6px;width: 0px;"><input type="checkbox" id="txt_search_sendeeUnitJunior" value="0"></label>
				</div>
			</div>
				<div class="panel-body" style="padding-top: 0px">
				<div class="form-group" style="margin-top: 15px">
					<label class="control-label col-sm-1" for="txt_search_statu"
						style="width: 12.33333333%; text-align: center; margin-top: 6px;">接收状态</label>
					<div class="col-sm-1" style="width: 115px;">
						<select id="txt_search_sendeeStatus"class="selectpicker show-menu-arrow form-control"data-hide-disabled="true" data-size="5">
						  <option>未接收</option>
						  <option>已接收</option>
						</select>
					</div>
					
					 <div class="col-sm-1" style="text-align: right;margin-left:697px;">
					   <button type="button" id="btn_search_submit"class="btn btn-primary">查询</button>
		     		</div>
					
				</div>
			</div>
			</div>
				
			</div>
		</div>

	<div style="margin:0px 13px" id="tableD">
		<table id="tb_departments"  style="table-layout:fixed;">
		</table>
	</div>

	<!--按钮区-->
	<div id="toolbars" class="btn-group">
		<button id="btn_save" type="button" class="btn btn-default">
			<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>保存
		</button>
		<button id="btn_sendee" type="button" class="btn btn-default">
			<span class="glyphicon glyphicon-retweet" aria-hidden="true"></span>&nbsp;接收
		</button>
		<button id="btn_update" type="button" class="btn btn-default">
			<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>修改
		</button>
		<button id="btn_delete" type="button" class="btn btn-default">
			<span class="glyphicon glyphicon-retweet" aria-hidden="true"></span>&nbsp;删除
		</button>
	</div>
	
	<!--保存到付代收变更录入-->
	<div class="modal fade" id="myModal_save" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog" style="width:1000px;">
			<div class="modal-content">
			<form class="form-horizontal" id="save_form" onsubmit="return check()" role="form">	
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-
						hidden="true">&times;</button>
					
					<div class="panel panel-success">
						<div class="panel-heading">
							<h3 class="panel-title">保存</h3>
						</div>
					
						<div class="panel-body">
							<div class="form-group" style="margin-left:5px;">
								<label for="firstname" class="col-sm-2 control-label">工作单号</label>
								<div class="col-sm-3">
                                     <input type="text" class="form-control" id="txt_save_jobListNo" onchange="findJobListMessage()" name="jobListNo">
								</div>
								
								<label for="lastname" class="col-sm-2 control-label" style="width:100px">变更到付款</label>
								<div class="col-sm-3">
								    <input type="text" class="form-control" id="txt_save_changeCameCollect" name="changeCameCollect">
								</div>
								
								<label for="lastname" class="col-sm-2 control-label" style="width:100px">变更代收款</label>
								<div class="col-sm-2">
									<input type="text" class="form-control" id="txt_save_changeAgencyFund" name="changeAgencyFund">
								</div>
							</div>
								
							<div class="form-group" style="margin-left:5px;">
							    <label for="lastname" class="col-sm-2 control-label">变更原因</label>
								<div class="col-sm-3">
									<input type="text" class="form-control" id="txt_save_changeCause" name="changeCause">
								</div>
							    
								<label for="lastname" class="col-sm-2 control-label" style="width:100px">派送单位</label>
								<div class="col-sm-3">
									<select id="txt_save_sendeeUnit"class="selectpicker show-menu-arrow form-control"data-hide-disabled="true"  data-size="5">
									</select>
								</div>
								
								<label for="lastname" class="col-sm-2 control-label" style="width:100px">操作人单位</label>
								<div class="col-sm-2">
								    <input type="text" class="form-control" id="txt_save_enteringUnit" disabled="">
								</div>
							</div>
							
							<div class="form-group" style="margin-left:5px;">
							    <label for="lastname" class="col-sm-2 control-label">原到付款</label>
								<div class="col-sm-3">
									<input type="text" class="form-control" id="txt_save_cameCollect" disabled="">
								</div>
								
								<label for="lastname" class="col-sm-2 control-label" style="width:100px">原代收款</label>
								<div class="col-sm-3">
									<input type="text" class="form-control" id="txt_save_agencyFund" name = "txtCreateFactWeight" disabled="">
								</div>
							    
							    <label for="lastname" class="col-sm-2 control-label" style="width:100px">品名</label>
								<div class="col-sm-2">
									<input type="text" class="form-control" id="txt_save_productName" name="txtCreateSize" disabled="">
								</div>
							</div>
							
							<div class="form-group" style="margin-left:5px;">
								<label for="lastname" class="col-sm-2 control-label">收货人</label>
								<div class="col-sm-3">
									<input type="text" class="form-control" id="txt_save_addressee" name = "txtCreateAddressee" disabled="">
								</div>
								<label for="lastname" class="col-sm-2 control-label" style="width:100px">委托单位</label>
								<div class="col-sm-3">
								     <input type="text" class="form-control" id="txt_save_senderUnit" name = "txtCreateAddressee" disabled=""> 
								</div>
							</div>
					</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-primary" id="btn_submit_saveChangeEntering" >提交</button>
					<button type="button" class="btn btn-default4" data-dismiss="modal">关闭</button>
				</div>
				
				</form>
			</div>
		</div>
	</div>
	
	<!--修改-->
	<div class="modal fade" id="myModal_update" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog" style="width:900px;">
			<div class="modal-content">
			<form class="form-horizontal" id="update_form" onsubmit="return check()" role="form">	
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-
						hidden="true">&times;</button>
					
					<div class="panel panel-success">
						<div class="panel-heading">
							<h3 class="panel-title">修改</h3>
						</div>
						<div class="panel-body">
							<div class="form-group" style="margin-left:5px;">
								
								<label for="lastname" class="col-sm-2 control-label" style="width:173px;">变更到付款</label>
								<div class="col-sm-3">
								    <input type="text" class="form-control" id="txt_update_changeCameCollect" name="changeCameCollect">
								</div>
								
								<label for="lastname" class="col-sm-2 control-label" style="width:173px;">变更代收款</label>
								<div class="col-sm-3">
									<input type="text" class="form-control" id="txt_update_changeAgencyFund" name="changeAgencyFund">
								</div>
							</div>
								
							<div class="form-group" style="margin-left:5px;">
							    <label for="lastname" class="col-sm-2 control-label" style="width:173px;">变更原因</label>
								<div class="col-sm-3">
									<input type="text" class="form-control" id="txt_update_changeCause" name="changeCause">
								</div>
							    
								<label for="lastname" class="col-sm-2 control-label" style="width:173px;">派送单位</label>
								<div class="col-sm-3">
									<select id="txt_update_sendeeUnit"class="selectpicker show-menu-arrow form-control"data-hide-disabled="true"  data-size="5">
									</select>
								</div>
							</div>
					</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-primary" id="btn_submit_updateChangeEntering">提交</button>
					<button type="button" class="btn btn-default4" data-dismiss="modal">关闭</button>
				</div>
				
				</form>
			</div>
		</div>
	</div>
</body>
</html>