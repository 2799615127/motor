<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<% 	SimpleDateFormat time = new SimpleDateFormat("yyyy-MM-dd"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>日志</title>

<!-- Jquery组件引用 -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js"></script>
	
	<!-- bootstrap组件引用 -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap/js/bootstrap.js"></script>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/bootstrap-datetimepicker/css/bootstrap-datetimepicker.css" />
	<!-- bootstrap table组件以及中文包的引用 -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap-table/bootstrap-table.js"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/bootstrap-table/bootstrap-table.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/sweetalert/sweetalert.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/toastr/toastr.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/toastr/toastr.min.css" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap-datetimepicker/js/bootstrap-datetimepicker.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap-datetimepicker/js/bootstrap-datetimepicker.zh-CN.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/sweetalert/sweetalert.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/toastr/toastr.js.map"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/toastr/toastr.min.js"></script>
	
	<!-- 下拉框 -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/select2/select2.css"/>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/select2/select2.full.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/select2/select2.min.js"></script>	
	
	<script type="text/javascript" src="${pageContext.request.contextPath}/jsps/delivery/receipt/business/js/dateFormat.js"></script>
	
<style type="text/css">
<style type ="text /css">body {
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
	<div class="panel-body" style="padding-bottom: 0px;">
		<div class="panel panel-default">
			<div class="panel-heading">
				<a data-toggle="collapse" data-parent="#accordion"
					href="#collapseOne" > 查询条件 </a>
			</div>
			<div class="panel-collapse collapse in" id="collapseOne">
				<form id="formSearch" class="form-horizontal">
					<div class="form-group" style="margin-top:15px">
						<label class="control-label col-sm-1" for="staffNumber">员工号</label>
						<div class="col-xs-2">
							<input type="text" class="form-control" id="staffNumber">
						</div>
						<label class="control-label col-sm-1"
							for="staffPassword">查台密码</label>
						<div class="col-xs-2">
							<input type="password" class="form-control"
								 id="staffPassword">
						</div>
						<label class="control-label col-sm-1"
							for="ssmNum">短信序号</label>
						<div class="col-xs-2">
							<input type="text" class="form-control"
								id="ssmNum">
						</div>
						<br/><br/>
						<label class="control-label col-sm-1"
							for="telephone">来电电话</label>
						<div class="col-xs-2">
							<input type="text" class="form-control"
								id="telephone" name="telephone"  placeholder="自动生成" disabled>
						</div>
						<label class="control-label col-sm-1"
							for="businessRecsiptNo">通知单号</label>
						<div class="col-xs-2">
							<input type="text" class="form-control"
								id="businessRecsiptNo">
						</div>
						<label class="control-label col-sm-1" for="workOrderTime">工单日期</label>
						<div class="col-xs-2">
							<input type="text" class="form-control form_datetime" 
							  value="<%=time.format(new Date()) %>" id="workOrderTime">
						</div>
						<div class="col-xs-2" style="text-align:left;">
							<button type="button" style="margin-left:50px" id="btn_query"
								class="btn btn-primary">查询</button>
						</div>
					</div>
				</form>
			</div>
		</div>
		
		<div id="toolbar" class="btn-group">
			<button id="TurnSingle" type="button" class="btn btn-default" data-toggle="modal">
				<span class="glyphicon  glyphicon-retweet" aria-hidden="true"></span>转单
			</button>
			<button id="repeat" type="button" class="btn btn-default">
				<span class="glyphicon glyphicon-share" aria-hidden="true"></span>重发
			</button>
		</div>
		<table id="tb_departments"></table><br/>
		<table id="tb_newturnSingle"></table>
		<table id="tb_lowturnSingle"></table>
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
							<h3 class="panel-title">转单</h3>
						</div>
						<div class="panel-body">
							<form class="form-horizontal"
								role="form" id="addUserForm">
								<div class="form-group">
									<label for="firstname" class="col-sm-2 control-label" for="modeOfTransfer">转入方式</label>
									<div class="col-sm-10">
										<select id="modeOfTransfer" name="modeOfTransfer" class="js-example-basic-multiple form-control" style="width:440px;">
											<option value="ripAreaCode">定区编码</option>
											<option value="staffNumber">取派员</option>
											<option value="orgName">单位</option>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label for="firstname" class="col-sm-2 control-label" for="transferToTherTarget">转入目标</label>
									<div class="col-sm-10">
										<select id="transferToTherTarget" name="transferToTherTarget" class="js-example-basic-multiple form-control" style="width:440px;"> 
										
										</select>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" id="add" data-dismiss="modal">提交</button>
					<button type="button" class="btn btn-default4" data-dismiss="modal">关闭</button>
				</div>
			</div>
		</div>
	</div> 
	
	
	<script type="text/javascript">
		var TableInit = function() {
			var oTableInit = new Object();
			//初始化Table 
			oTableInit.Init = function() {
				$('#tb_departments').bootstrapTable({
					method : 'get', //请求方式（*） 
					toolbar : '#toolbar', //工具按钮用哪个容器 
					striped : true, //是否显示行间隔色 
					cache : false, //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*） 
					pagination : true, //是否显示分页（*） 
					sortable : false, //是否启用排序 
					sortOrder : "asc", //排序方式
					queryParams : oTableInit.queryParams,
					sidePagination : "server", //分页方式：client客户端分页，server服务端分页（*） 
					pageNumber : 1, //初始化加载第一页，默认第一页 
					pageSize : 10, //每页的记录行数（*） 
					pageList : [10,15,50,100], //可供选择的每页的行数（*） 
					search : false, //是否显示表格搜索，此搜索是客户端搜索，不会进服务端，所以，个人感觉意义不大 
					strictSearch : true,
					showColumns : true, //是否显示所有的列 
					showRefresh : true, //是否显示刷新按钮
					minimumCountColumns : 2, //最少允许的列数
					clickToSelect : true, //是否启用点击选中行 
					height : 400, //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度 
					uniqueId : "workOrderNo", //每一行的唯一标识，一般为主键列 
					showToggle : true, //是否显示详细视图和列表视图的切换按钮 
					cardView : false, //是否显示详细视图
					detailView : false, //是否显示父子表
					
					columns : [ {
						checkbox : true
					},  {
						field : 'workOrderNo',
						title : '工单编号'
					}, {
						field : 'ssmNum',
						title : '短信序号'
					}, {
						field : 'businessRecsiptNo',
						title : '业务通知单号'
					},{
						field : 'workOrderTime',
						title : '工单生成时间',
						formatter:function(value){
							return formatDate(value);
						}
					}, {
						field : 'fetchAddress',
						title : '收件地址'
					}, {
						field : 'contacts',
						title : '联系人'
					}, {
						field : 'telephone',
						title : '联系电话'
					}, {
						field : 'traceNum',
						title : '追单次数'
					},{
						field : 'takeOrgName',
						title : '处理单位'
					}]
				});
				
				$('#tb_newturnSingle').bootstrapTable({
					//url : '/noob/checkMachineTurnSingle/workOrderPageQuery.action', //请求后台的URL（*） 
					method : 'get', //请求方式（*） 
					//toolbar : '#toolbar', //工具按钮用哪个容器 
					striped : true, //是否显示行间隔色 
					cache : false, //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*） 
					pagination : true, //是否显示分页（*） 
					sortable : false, //是否启用排序 
					sortOrder : "asc", //排序方式
					queryParams : oTableInit.queryParamsWork,
					sidePagination : "server", //分页方式：client客户端分页，server服务端分页（*） 
					pageNumber : 1, //初始化加载第一页，默认第一页 
					pageSize : 10, //每页的记录行数（*） 
					pageList : [10,15,50,100], //可供选择的每页的行数（*） 
					search : false, //是否显示表格搜索，此搜索是客户端搜索，不会进服务端，所以，个人感觉意义不大 
					strictSearch : true,
					showColumns : true, //是否显示所有的列 
					showRefresh : true, //是否显示刷新按钮
					minimumCountColumns : 2, //最少允许的列数
					clickToSelect : true, //是否启用点击选中行 
					height : 400, //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度 
					uniqueId : "workOrderNo", //每一行的唯一标识，一般为主键列 
					showToggle : true, //是否显示详细视图和列表视图的切换按钮 
					cardView : false, //是否显示详细视图
					detailView : false, //是否显示父子表
					
					columns : [ {
						checkbox : true
					},  {
						field : 'workOrderNo',
						title : '工单编号'
					}, {
						field : 'workOrderType',
						title : '工单类型'
					}, {
						field : 'takeStatus',
						title : '取件状态'
					}, {
						field : 'ssmNum',
						title : '短信序号'
					}, {
						field : 'workOrderTime',
						title : '工单生成时间',
						formatter:function(value){
							return formatDate(value);
						}
					}, {
						field : 'traceNum',
						title : '追单次数'
					}, {
						field : 'staffNumber',
						title : '小件员编号'
					}, {
						field : 'takeOrgName',
						title : '取件单位'
					}, {
						field : 'sortingCode',
						title : '分拣编码'
					}]
				});
				
				$('#tb_lowturnSingle').bootstrapTable({
					//url : '', //请求后台的URL（*） 
					method : 'get', //请求方式（*） 
					//toolbar : '#toolbar', //工具按钮用哪个容器 
					striped : true, //是否显示行间隔色 
					cache : false, //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*） 
					pagination : true, //是否显示分页（*） 
					sortable : false, //是否启用排序 
					sortOrder : "asc", //排序方式
					queryParams : oTableInit.queryParamsWork,
					sidePagination : "server", //分页方式：client客户端分页，server服务端分页（*） 
					pageNumber : 1, //初始化加载第一页，默认第一页 
					pageSize : 10, //每页的记录行数（*） 
					pageList : [10,15,50,100], //可供选择的每页的行数（*） 
					search : false, //是否显示表格搜索，此搜索是客户端搜索，不会进服务端，所以，个人感觉意义不大 
					strictSearch : true,
					showColumns : true, //是否显示所有的列 
					showRefresh : true, //是否显示刷新按钮
					minimumCountColumns : 2, //最少允许的列数
					clickToSelect : true, //是否启用点击选中行 
					height : 400, //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度 
					uniqueId : "workOrderNo", //每一行的唯一标识，一般为主键列 
					showToggle : true, //是否显示详细视图和列表视图的切换按钮 
					cardView : false, //是否显示详细视图
					detailView : false, //是否显示父子表
					
					columns : [ {
						checkbox : true
					},  {
						field : 'workOrderNo',
						title : '工单编号'
					}, {
						field : 'workOrderType',
						title : '工单类型'
					}, {
						field : 'takeStatus',
						title : '取件状态'
					}, {
						field : 'ssmNum',
						title : '短信序号'
					}, {
						field : 'workOrderTime',
						title : '工单生成时间',
						formatter:function(value){
							return formatDate(value);
						}
					}, {
						field : 'traceNum',
						title : '追单次数'
					}, {
						field : 'staffNumber',
						title : '小件员编号'
					}, {
						field : 'takeOrgName',
						title : '取件单位'
					}, {
						field : 'sortingCode',
						title : '分拣编码'
					}]
				});
			}; //得到查询的参数
			
			
			
			oTableInit.queryParams = function(params) {
				var temp = {
					//这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的 
					limit : params.limit, //页面大小 
					offset : params.offset, //页码 
					staffNumber : $("#staffNumber").val(),
					staffPassword : $("#staffPassword").val(),
					ssmNum : $("#ssmNum").val(),
					telephone : $("#telephone").val(),
					businessRecsiptNo : $("#businessRecsiptNo").val(),
					workOrderTime : $("#workOrderTime").val()
				};
				return temp;
			};
			
			oTableInit.queryParamsWork = function(params) {
				var temp = {
					//这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的 
					limit : params.limit, //页面大小 
					offset : params.offset //页码 
				};
				return temp;
			};
			return oTableInit;
		};
		
		var ButtonInit = function() {
			var oInit = new Object();
			var postdata = {};
			oInit.Init = function() {
				$("#TurnSingle").click(
						function() {
							var select = $('#tb_departments').bootstrapTable(
									'getSelections');
							if (select.length === 0) {
								toastr.warning("请至少选择一行进行转单!");
							}else{
								$("#myModal").modal("show");
							}
							$("#transferToTherTarget").select2({
								ajax: {
									language: "zh-CN", //设置 提示语言
								    url: "/noob/checkMachineTurnSingle/findAllTurnSinglePageQuery.action",
								    data: function (params) {
								        var query = {
								        	ripAreaCode : params.term,
								        	selectName:$("#modeOfTransfer").val()
								        }
								        return query;
								      },
								   	  
								      processResults: function (data) {
								          return {
								            results: data
								          };
								        },
								        cache: true
								  },
								  
								  placeholder: '---请选择---',
								  escapeMarkup: function (markup) { return markup; }, 
								  minimumInputLength: 0,
								  templateResult: function formatRepo(repo){
								  	  return repo.text;  
								  }, 
								  templateSelection:function formatRepoSelection(repo){
									  return repo.text;
								  }
							});
							
							$('#modeOfTransfer').change(function() {
								$('#transferToTherTarget').empty();
							});
						});
				
				$("#add").click(function(){
					var select = $('#tb_departments').bootstrapTable(
						'getSelections');
					var workOrderId = [];
					var workOrderNo = [];
					var ssmNum = [];
					var businessRecsiptNo = [];
					var fetchAddress = [];
					var contacts = [];
					var telephone = [];
					var traceNum = [];
					var takeOrgName = [];
					var businessRecsiptId = [];
					var staffId = [];
					var staffName = [];
					var takeOrgName = [];
					var arrivalCity = [];
					var customerName = [];
					for (var i = 0; i < select.length; i++) {
						workOrderId[i] = select[i]['workOrderId'];
						businessRecsiptId[i] = select[i]['businessRecsiptId'];
						workOrderNo[i] = select[i]['workOrderNo'];
						ssmNum[i] = select[i]['ssmNum'];
						businessRecsiptNo[i] = select[i]['businessRecsiptNo'];
						fetchAddress[i] = select[i]['fetchAddress'];
						contacts[i] = select[i]['contacts'];
						telephone[i] = select[i]['telephone'];
						traceNum[i] = select[i]['traceNum'];
						takeOrgName[i] = select[i]['takeOrgName'];
						staffId[i] = select[i]['staffId'];
						staffName[i] = select[i]['staffName'];
						takeOrgName[i] = select[i]['takeOrgName'];
						arrivalCity[i] = select[i]['arrivalCity'];
						customerName[i] = select[i]['customerName'];
					}
					
					$.ajax({
						type:'post',
						url:'/noob/checkMachineTurnSingle/updateWorkOrderU.action',
						data:{
							workOrderId:workOrderId[0],
							businessRecsiptId:businessRecsiptId[0],
							workOrderNo:workOrderNo[0],
							ssmNum:ssmNum[0],
							businessRecsiptNo:businessRecsiptNo[0],
							fetchAddress:fetchAddress[0],
							contacts:contacts[0],
							telephone:telephone[0],
							traceNum:traceNum[0],
							takeOrgName:takeOrgName[0],
							staffId:staffId[0],
							staffName:staffName[0],
							takeOrgName:takeOrgName[0],
							arrivalCity:arrivalCity[0],
							customerName:customerName[0],
							modeOfTransfer:$("#modeOfTransfer").val(),
							transferToTherTarget:$('#transferToTherTarget').val(),
							ripAreaCode:$('#transferToTherTarget').val(),
							staffNumber:$('#transferToTherTarget').val(),
							orgName:$('#transferToTherTarget').val(),
							selectName:$("#modeOfTransfer").val()
						},
						success:function(result) {				
							if (result == "success") {						
								toastr.success('转单成功!');
							} else {
								toastr.error('转单失败!');
							}
							var obj = {
									url : "/noob/checkMachineTurnSingle/workOrderIdPageQuery.action",
									silent : true,
									query : {
										workOrderId : workOrderId[0]
									}
							};
							$('#tb_lowturnSingle').bootstrapTable('refresh',obj);
							
							$('#tb_newturnSingle').bootstrapTable('refresh',{url:'/noob/checkMachineTurnSingle/workOrderPageQuery.action'});
						}
					}); 
					
					$('#modeOfTransfer').change(function() {
						$('#transferToTherTarget').empty();
					});
				});
				
				
				$("#repeat").click(
						function() {
							var select = $('#tb_departments').bootstrapTable(
									'getSelections');
							if (select.length === 0) {
								toastr.warning("请至少选择一行进行重发!");
							} else {
								swal({  
									title: "操作提示",   //弹出框的title  
									text: "确定重发吗？",  //弹出框里面的提示文本  
									type: "warning",    //弹出框类型  
									showCancelButton: true, //是否显示取消按钮  
									confirmButtonColor: "#DD6B55",//确定按钮颜色  
									cancelButtonText: "取消",//取消按钮文本  
									confirmButtonText: "是的，确定重发！",//确定按钮上面的文档  
									closeOnConfirm: true  
								}, function () {
									var workOrderId = [];
									var workOrderNo = [];
									var ssmNum = [];
									var businessRecsiptNo = [];
									var fetchAddress = [];
									var contacts = [];
									var telephone = [];
									var traceNum = [];
									var takeOrgName = [];
									var businessRecsiptId = [];
									var staffId = [];
									var staffName = [];
									var takeOrgName = [];
									var arrivalCity = [];
									var customerName = [];
									var orgName = [];
									for (var i = 0; i < select.length; i++) {
										workOrderId[i] = select[i]['workOrderId'];
										businessRecsiptId[i] = select[i]['businessRecsiptId'];
										workOrderNo[i] = select[i]['workOrderNo'];
										ssmNum[i] = select[i]['ssmNum'];
										businessRecsiptNo[i] = select[i]['businessRecsiptNo'];
										fetchAddress[i] = select[i]['fetchAddress'];
										contacts[i] = select[i]['contacts'];
										telephone[i] = select[i]['telephone'];
										traceNum[i] = select[i]['traceNum'];
										takeOrgName[i] = select[i]['takeOrgName'];
										staffId[i] = select[i]['staffId'];
										staffName[i] = select[i]['staffName'];
										takeOrgName[i] = select[i]['takeOrgName'];
										arrivalCity[i] = select[i]['arrivalCity'];
										customerName[i] = select[i]['customerName'];
										orgName[i] = select[i]['orgName'];
									}
									$.ajax({
										url: "/noob/checkMachineTurnSingle/repeatWorkOrder.action",
									    type: "post",
									    data:{ workOrderId:workOrderId[0],
											businessRecsiptId:businessRecsiptId[0],
											workOrderNo:workOrderNo[0],
											ssmNum:ssmNum[0],
											businessRecsiptNo:businessRecsiptNo[0],
											fetchAddress:fetchAddress[0],
											contacts:contacts[0],
											telephone:telephone[0],
											traceNum:traceNum[0],
											takeOrgName:takeOrgName[0],
											staffId:staffId[0],
											staffName:staffName[0],
											takeOrgName:takeOrgName[0],
											arrivalCity:arrivalCity[0],
											customerName:customerName[0],
											orgName:orgName[0]},
									    success:function(data){
									    	if(data == "success"){
									    		toastr.success("重发成功");
									    	}else{
									    		toastr.error("重发失败");
									    	}
									    },
									});
								});
							}
					});	
			};
			return oInit;
		};
		
		$("#btn_query").click(function(){
			var staffNumber = $("#staffNumber").val();
			if(staffNumber == '' || staffNumber == null){
        		toastr.error("员工号不能为空!");
        	}else{
				var obj = {
					url : "/noob/checkMachineTurnSingle/checkMachineTurnSinglePageQuery.action",
					silent : true,
					query : {
						staffNumber : $("#staffNumber").val(),
						staffPassword : $("#staffPassword").val(),
						ssmNum : $("#ssmNum").val(),
						telephone : $("#telephone").val(),
						businessRecsiptNo : $("#businessRecsiptNo").val(),
						workOrderTime : $("#workOrderTime").val()
					}
				};
				$('#tb_departments').bootstrapTable('refresh',obj); 
        	}
        	
        	var staffPassword = $("#staffPassword").val();
        	
    		if(staffPassword == '' || staffPassword == "error"  ){
    			toastr.error("查台密码为空,禁用转单与重发操作!");
    			$("#TurnSingle").attr("disabled","disabled");
    			$("#repeat").attr("disabled","disabled");
    		}else{
    			$("#TurnSingle").attr("disabled",false);
    			$("#repeat").attr("disabled",false);
    		}
        }); 
		
		
		$("#staffNumber").blur(function(){
			$.ajax({
				url:"/noob/checkMachineTurnSingle/findStaffNumberByTelephoneQuery.action",
				type:"post",
				data:{staffNumber : $("#staffNumber").val()},
				success:function(response){
					$("#telephone").val(response.telephone);
				}
			});
		});
		
		
		$(".form_datetime").datetimepicker({
		      format: "yyyy-mm-dd",
		      autoclose: true,
		      todayBtn: true,
		      language:'zh-CN',
		      pickerPosition:"bottom-right",
		      minView:2
		});
		
		$(function() {
			$.fn.modal.Constructor.prototype.enforceFocus = function() {};
			//1.初始化Table 
			var oTable = new TableInit();
			oTable.Init();
			//2.初始化Button的点击事件 
			var oButtonInit = new ButtonInit();
			oButtonInit.Init();
			//3.初始化消息提示框
			toastr.options.positionClass = 'toast-top-center';
			toastr.options= { 
					closeButton: false,  //是否显示关闭按钮
					debug: false,   //是否为调试
					progressBar: true,  //是否显示进度条
					positionClass: "toast-top-center",  //在页面中显示的位置
					onclick: null,  //点击事件
					showDuration: "100",  //显示动作时间
					hideDuration: "1000",  //隐藏动作时间
					timeOut: "2000",  //自动关闭超时时间
					extendedTimeOut: "1000",  
					showEasing: "swing",  
					hideEasing: "linear",  
					preventDuplicates: true ,
					preventOpenDuplicates: true, //重复内容的提示框在开启时只出现一个
					showMethod: "fadeIn",  //显示的方式
					hideMethod: "fadeOut" //隐藏的方式
			};
			
		});	
			
		function test() {
			var oldWidth = $('body').outerWidth();
			var marginLeft = (document.documentElement.clientWidth - $(
					".model-dialog").outerWidth()) / 2;
			var marginHeight = (document.documentElement.clientHeight - $(
					".model-dialog").outerHeight()) / 2;
			$('.model-dialog').css('margin-left', marginLeft);
			$('.model-dialog').css('margin-top', marginHeight);
			$('body').css('overflow', 'hidden');
			var newWidth = $('body').outerWidth();
			var scrollbarWidth = newWidth - oldWidth;
			$('body').css('padding-right', scrollbarWidth + 'px');
			$('.model').removeClass('hide');
			$('.model-dialog').removeClass('hide');
		}

		function cancel() {
			$('body').css('overflow', 'auto');
			$('body').css('padding-right', '0px');
			$('.model').addClass('hide');
			$('.model-dialog').addClass('hide');
		}
		
		function check(){
			//校验逻辑
			return false;
		}
		
	</script>

</body>
</html>