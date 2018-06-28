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
<title>日志</title>


<script src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js"></script>

<!-- bootstrap组件引用 -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/bootstrap/js/bootstrap.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/js/bootstrap/css/bootstrap.min.css" />

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/js/bootstrap-datetimepicker/css/bootstrap-datetimepicker.css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/bootstrap-datetimepicker/js/bootstrap-datetimepicker.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/bootstrap-datetimepicker/js/bootstrap-datetimepicker.zh-CN.js"></script>

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/js/toastr/toastr.css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/toastr/toastr.min.js"></script>

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/js/sweetalert/sweetalert.css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/sweetalert/sweetalert.min.js"></script>


<!-- bootstrap table组件以及中文包的引用 -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/bootstrap-table/bootstrap-table.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/js/bootstrap-table/bootstrap-table.css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>

<script src="${pageContext.request.contextPath}/js/ocupload/jquery.ocupload-1.1.2.js"></script>

<script type="text/javascript" src="${pageContext.request.contextPath}/jsps/delivery/receipt/business/js/dateFormat.js"></script>

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
<!-- 	<div class="list-group-item active">日志列表</div> -->
	<div class="panel-body" style="padding-bottom: 0px;">
		<div class="panel panel-default">
			<div class="panel-heading">
				<a data-toggle="collapse" data-parent="#accordion"
					href="#collapseOne" > 查询条件 </a>
			</div>
			<div class="panel-collapse collapse in" id="collapseOne">
				<form id="formSearch" class="form-horizontal">
					<div class="form-group" style="margin-top: 15px">
						<label class="control-label col-sm-1" for="txt_search_userName">用戶名</label>
						<div class="col-sm-3">
							<input type="text" class="form-control" id="txt_search_userName">
						</div>
						<label class="control-label col-sm-1"
							for="txt_search_resourceName">资源名</label>
						<div class="col-sm-3">
							<input type="text" class="form-control"
								id="txt_search_resourceName">
						</div>
						<br />
						<br /> 
						<label class="control-label col-sm-1" for="lowOperateTime">时间前</label>
						<div class="col-sm-3">
							<input type="text" class="form-control form_datetime"
							 id="lowOperateTime">
						</div>
						
						<label class="control-label col-sm-1" for="highOperateTime">时间后</label>
						<div class="col-sm-3">
							<input type="text" class="form-control form_datetime"
							 id="highOperateTime">
						</div>

						<div class="col-sm-4" style="text-align: left;">
							<button type="button" style="margin-left: 50px" id="btn_query"
								class="btn btn-primary">查询</button>
						</div>
					</div>
				</form>
			</div>
		</div>

		<div id="toolbar" class="btn-group">
			<shiro:hasPermission name="删除日志">
			<button id="btn_delete" type="button" class="btn btn-default">
				<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>删除
			</button>
			</shiro:hasPermission>
			<shiro:hasPermission name="导出日志">
			<button id="btn_leading-out" type="button" class="btn btn-default">
				<span class="glyphicon glyphicon-log-out" aria-hidden="true"></span>导出
			</button>
			</shiro:hasPermission>
			<shiro:hasPermission name="导入日志">
			<button id="btn_leading-in" type="button" class="btn btn-default">
				<span class="glyphicon glyphicon-print" aria-hidden="true"></span>导入
			</button>
			</shiro:hasPermission>
		</div>
		<table id="tb_departments"></table>
	</div>

	<div class="model hide"></div>

	<script type="text/javascript">
		var TableInit = function() {
			var oTableInit = new Object();
			//初始化Table 
			oTableInit.Init = function() {
				$('#tb_departments').bootstrapTable({
					url : '../../../log/logPageQuery.action', //请求后台的URL（*） 
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
					pageList : [10,15,25,50], //可供选择的每页的行数（*） 
					search : false, //是否显示表格搜索，此搜索是客户端搜索，不会进服务端，所以，个人感觉意义不大 
					strictSearch : true,
					showColumns : true, //是否显示所有的列 
					showRefresh : true, //是否显示刷新按钮
					minimumCountColumns : 2, //最少允许的列数
					clickToSelect : true, //是否启用点击选中行 
					height : 550, //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度 
					uniqueId : "logId", //每一行的唯一标识，一般为主键列 
					showToggle : true, //是否显示详细视图和列表视图的切换按钮 
					cardView : false, //是否显示详细视图
					detailView : false, //是否显示父子表
					columns : [ {
						checkbox : true
					}, {
						field : 'logId',
						title : '日志编号'
					}, {
						field : 'userName',
						title : '用户名'
					}, {
						field : 'operateTime',
						title : '操作时间',
						formatter:function(value){
							return formatDate(value);
						}
					}, {
						field : 'resourceName',
						title : '资源名'
					}, {
						field : 'result',
						title : '结果'
					} ]
				});
			}; //得到查询的参数
			
			
			oTableInit.queryParams = function(params) {
				var temp = {
					//这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的 
					limit : params.limit, //页面大小 
					offset : params.offset, //页码 
					resourceName : $("#txt_search_resourceName").val(),
					userName : $("#txt_search_userName").val(),
					lowOperateTime : $("#lowOperateTime").val(),
		            highOperateTime : $("#highOperateTime").val(),
				};
				return temp;
			};

			return oTableInit;
		};

		
		var ButtonInit = function() {
			var oInit = new Object();
			var postdata = {};
			oInit.Init = function() {
				$("#btn_delete").click(
						function() {
							var select = $('#tb_departments').bootstrapTable(
									'getSelections');
							if (select.length === 0) {
								toastr.warning("请至少选择一行进行删除!");
							} else {
								swal({  
									title: "操作提示",   //弹出框的title  
									text: "确定删除吗？",  //弹出框里面的提示文本  
									type: "warning",    //弹出框类型  
									showCancelButton: true, //是否显示取消按钮  
									confirmButtonColor: "#DD6B55",//确定按钮颜色  
									cancelButtonText: "取消",//取消按钮文本  
									confirmButtonText: "是的，确定删除！",//确定按钮上面的文档  
									closeOnConfirm: true  
								}, function () {
									var arrs = [];
									for (var i = 0; i < select.length; i++) {
										arrs[i] = select[i]['logId'];
									}

									$.ajax({
										url: "../../../log/deleteLogU.action",
									    type: "post",
									    data:{ logIds : arrs},
									    success:function(data){
									    	if(data == "success"){
									    		toastr.success("删除成功");
									    	}else{
									    		toastr.error("删除失败");
									    	}
									    	$('#tb_departments').bootstrapTable('refresh',{url:'../../log/logPageQuery.action'}); 
									    },
									});
								
									$('#tb_departments').bootstrapTable('remove', {
										field : 'logId',
										values : arrs
									});
									
								});
							}
					});	
					//调用OCUpload插件的方法
					$("#btn_leading-in").upload({
				        action: "../../../log/uploadExcel.action", //表单提交的地址
				        name:"myFile",
				        onComplete:function (data) { //提交表单之后
				           if(data == "success"){
				        	    toastr.success("导入成功"); //提示框，Excel导入成功
				            }else{
				            	toastr.error("导入失败");  //提示框，Excel导入失败
				            }
				        },
				        onSelect: function() {//当用户选择了一个文件后触发事件
				            //当选择了文件后，关闭自动提交
				            this.autoSubmit=false;
				            //校验上传的文件名是否满足后缀为.xls或.xlsx
				            var regex =/^.*\.(?:xls|xlsx)$/i;
				            if(regex.test($("[name = '"+this.name()+"']").val())){
				                //通过校验
				                this.submit();
				            }else{
				                //未通过
				                toastr.error("文件格式不正确");  //错误提示框，文件格式不正确，必须以.xls或.xlsx结尾
				            }
				        }
				    });
					 //导出
				    $("#btn_leading-out").click(function(){
				    	swal({  
							title: "操作提示",   //弹出框的title  
							text: "确定导出吗？",  //弹出框里面的提示文本  
							showCancelButton: true, //是否显示取消按钮  
							confirmButtonColor: "#DD6B55",//确定按钮颜色  
							cancelButtonText: "关闭",//取消按钮文本  
							confirmButtonText: "是的，确定导出！",//确定按钮上面的文档  
							closeOnConfirm: true  
						},function(){
							$.ajax({
					    		type:"get",
					    		url:"../../../log/outExcel.action",
					    		data:{path:"E:\\导出日志.xlsx"},
					    		success:function(result){
									if(result == "success"){
										toastr.success('导出成功!');
									}else{
										toastr.error('导出失败!');
									}
								}
					    	});
						});
				    });
			};
			return oInit;
		};
		
		$("#btn_query").click(function(){
			var obj = {
					url : "../../../log/logPageQuery.action",
					silent : true,
					query : {
						resourceName : $("#txt_search_resourceName").val(),
						userName : $("#txt_search_userName").val(),
						lowOperateTime : $("#lowOperateTime").val(),
			            highOperateTime : $("#highOperateTime").val(),
					}
			};
        	$('#tb_departments').bootstrapTable('refresh',obj);      	
        }); 
		
		
		$(".form_datetime").datetimepicker({
		      format: "yyyy-mm-dd",
		      autoclose: true,
		      todayBtn: true,
		      language:'zh-CN',
		      pickerPosition:"bottom-right",
		      minView:2,
		});
		
		
		$(function() {
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