<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<script
	src="${ pageContext.request.contextPath }/js/jquery-3.1.1.min.js"
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

<link
	href="${ pageContext.request.contextPath }/css/bootsrap-checkbox/bootstrap-checkbox.css"
	rel="stylesheet" />
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
	src="${ pageContext.request.contextPath }/jsps/base/baseFiles/js/subSetFile.js"></script>
<script
	src="${ pageContext.request.contextPath }/jsps/base/baseFiles/js/baseFile.js"></script>
<!-- 提示框Js文件和Css的引用 -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/toastr/toastr.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/js/toastr/toastr.min.css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/sweetalert/sweetalert.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/js/sweetalert/sweetalert.css" />


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

.pagination-info{
  display: none;
}
.col-sm-2.control-label{
text-align:center;
}
</style>
<script type="text/javascript">
      $(function(){
    	  
    	  var oTable = new TableInit();

          oTable.Init();
          
          oTable.InitSubTable();
          
        //初始化操作消息提示框
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
      
	    var TableInit = function () {
	    	 var oTableInit = new Object();
	    	 
	        //初始化Table
	        oTableInit.Init = function () {
	            $('#tb_departments').bootstrapTable({
	            	    url: '../../../../files/findAllBaseFilesByPageQuery.action',//请求后台的URL（*）
	            	    method : 'get', //请求方式（*） 
						toolbar : '#toolbars', //工具按钮用哪个容器 
						striped : true, //是否显示行间隔色 
						cache : false, //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*） 
						pagination : true, //是否显示分页（*） 
						sortable : true, //是否启用排序 
						sortOrder : "asc", //排序方式
						queryParamsType : "undefined",
						sidePagination : "server", //分页方式：client客户端分页，server服务端分页（*） 
						pageNumber :1, //初始化加载第一页，默认第一页 
						pageSize :10, //每页的记录行数（*） 
						paginationLoop:true,
						pageList :[5,10,20,50], //可供选择的每页的行数（*） 
						strictSearch : true,
						showColumns : true, //是否显示所有的列 
						showRefresh : true, //是否显示刷新按钮
						minimumCountColumns : 2, //最少允许的列数
						clickToSelect : true, //是否启用点击选中行 
						uniqueId : "archivesId", //每一行的唯一标识，一般为主键列 
						showToggle : true, //是否显示详细视图和列表视图的切换按钮 
						cardView : false, //是否显示详细视图
						detailView : false, //是否显示父子表
						maintainSelected:true,
					    queryParams: function queryParams(params) {   //设置查询参数  
				                var param = {    
				                   pageNumber: params.pageNumber,    
				                   pageSize: params.pageSize,  
				                   archivesName :  $("#txt_search_departmentnames").val(),
				                   check: $("#check1").val()
				                };    
				                return param;                   
				            },//传递参数（*）
	                columns: [{
	                    checkbox: true
	                }, 
	                {
	                    field: 'archivesName',
	                    align: 'center',
	                    title: '基础档案名称',
	                    width:"150px"
	                },
	                {
	                    field: 'description',
	                    align: 'center',
	                    title: '描述',
	                    width: "170px"
	                }, ],
	                
	                onDblClickRow: function (row, tr) {
	                    // 进行你的操作，如弹出新窗口
	                   var archivesId = row.archivesId;
	                   $("#archivesIdS").val(archivesId);
	               	   $('#table-footer').bootstrapTable('refresh');
	                }
	            });
	        };
	        
	        //得到查询的参数
	       /*  oTableInit.queryParams = function (params) {
	            var temp = {   //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
	            	pageNumber: params.pageNumber,   //页面大小
	            	pageSize: params.pageSize,  //页码
	            	archivesName : $("#txt_search_departmentnames").val(),
	            	check: $("#check1").val(),
	            	subsetName:$('#subsetNameSl').val()
	            };
	            return temp;
	        }; */
	            
	            //子集表格
	         oTableInit.InitSubTable = function() {
	               $("#table-footer").bootstrapTable({
	            	      url: '../../../../files/findAllSubsetByPageQuery.action',         //请求后台的URL（*）
		            	  method : 'get', //请求方式（*） 
							toolbar : '#toolbar', //工具按钮用哪个容器 
							striped : true, //是否显示行间隔色 
							cache : false, //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*） 
							pagination : true, //是否显示分页（*） 
							sortable : true, //是否启用排序 
							sortOrder : "asc", //排序方式
							queryParamsType : "undefined",
							maintainSelected:true,
				            queryParams: function queryParams(params) {   //设置查询参数  
				                var param = {    
				                   pageNumber: params.pageNumber,    
				                   pageSize: params.pageSize, 
				                   subsetName :$('#subsetNameSl').val(),
				                   archivesId: $("#archivesIdS").val(),
				                   
				                };    
				                return param;                   
				            },//传递参数（*） 
							sidePagination : "server", //分页方式：client客户端分页，server服务端分页（*） 
							pageNumber :1, //初始化加载第一页，默认第一页 
							pageSize :10, //每页的记录行数（*） 
							pageList :[5,10,20,50], //可供选择的每页的行数（*） 
							strictSearch : true,
							showColumns : true, //是否显示所有的列 
							showRefresh : true, //是否显示刷新按钮
							minimumCountColumns : 2, //最少允许的列数
							clickToSelect : true, //是否启用点击选中行 
							uniqueId : "subsetId", //每一行的唯一标识，一般为主键列 
							showToggle : true, //是否显示详细视图和列表视图的切换按钮 
							cardView : false, //是否显示详细视图
							detailView : false, //是否显示父子表
							
		                
		                columns: [{
		                    checkbox: true
		                },
		                {
		                    field: 'subsetName',
		                    align: 'center',
		                    title: '辅助档案名称',
		                    width: '240px'
		                },
		                {
		                    field: 'archivesName',
		                    align: 'center',
		                    title: '上级名称'
		                },
		                {
		                    field: 'description',
		                    align: 'center',
		                    title: '描述'
		                },
		                {
		                    field: 'mnemoniCode',
		                    align: 'center',
		                    title: '助记码'
		                },]
	            });
	            }
	        
	           return oTableInit;
	        };
	        
	       
    </script>
</head>
<body>

	<!-- 基础档案表条件查询区 -->
	<div class="panel-body" style="padding-bottom: 0px;">
		<div class="panel panel-default">
			<div class="panel-heading">查询条件</div>
			<div class="panel-body" style="padding-bottom: 0px">
				<div class="form-group" style="margin-top: 15px">
					<label class="control-label col-sm-1"
						for="txt_search_departmentname"
						style="width: 12.33333333%; margin-top:6px;text-align:center;">基础档案名称</label>
					<div class="col-sm-3">
						<input type="text" class="form-control"
							id="txt_search_departmentnames" name="archivesName"
							style="margin-bottom: 10px" onchange="a()">
					</div>

					<label class="control-label col-sm-1" for="txt_search_statu"
						style="width: 12.33333333%; text-align: center; margin-top: 6px;">是否分级</label>

					<div class="col-sm-3" style="padding-left:0px">
						<div class="radio" style="margin-top: 5px;">
							<input type="radio" checked="checked"  name="check" id="check1" value=""> <label>
								是 </label> &nbsp; &nbsp; &nbsp; &nbsp; <input type="radio" name="check"
								id="check2" value=""> <label> 否 </label>
						</div>
					</div>

					<div class="col-sm-4"
						style="text-align: right; width: 24.33333333%;">
						<button type="button" style="margin-left: 50px" id="btn_query"
							class="btn btn-primary">查询</button>
					</div>
				</div>
			</div>
			<div class="panel-body" style="padding-top: 0px">
				<div class="form-group" style="margin-top: 15px">
					<label class="control-label col-sm-1"
						for="txt_search_departmentname"
						style="width: 12.33333333%; margin-top:6px;text-align:center;">辅助档案名称</label>
					<div class="col-sm-3">
						<input type="text" class="form-control" id="subsetNameSl"
							style="margin-bottom: 10px">
					</div>

					<div class="col-sm-4"
						style="text-align: right; width: 24.33333333%;">
						<button type="button" style="margin-left:570px" id="btn_querysf"
							class="btn btn-primary">查询</button>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 左右表格 -->
	<div style="float: left;width:400px;margin:0px 0px 0px 14px;height:570px">
		<table id="tb_departments" style="table-layout:fixed;"></table>
	</div>

	<div style="float:right;height:570px;width:640px;margin:0px 14px 0px 0px">
		<table id="table-footer" style="table-layout:fixed;"></table>
	</div>

	<!--基础档案 按钮区-->
	<div id="toolbars" class="btn-group">
		<shiro:hasPermission name="新增基本档案">
		<button id="ad_btn" type="button" class="btn btn-default">
			<span class="glyphicon glyphicon-plus"></span>新增
		</button>
		</shiro:hasPermission>
		<shiro:hasPermission name="修改基本档案">
		<button id="btn_edit" type="button" class="btn btn-default">
			<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>修改
		</button>
		</shiro:hasPermission>
		<shiro:hasPermission name="删除基本档案">
		<button id="btn_delete" type="button" class="btn btn-default">
			<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>删除
		</button>
		</shiro:hasPermission>
	</div>

	<!-- 底部表格 按钮区-->
	<div id="toolbar" class="btn-group">
		<shiro:hasPermission name="新增辅助档案">
		<button id="ad_btn_f" type="button" class="btn btn-default">
			<span class="glyphicon glyphicon-plus"></span>新增
		</button>
		</shiro:hasPermission>
		<shiro:hasPermission name="修改辅助档案">
		<button id="btn_edit_f" type="button" class="btn btn-default">
			<span class="glyphicon glyphicon-pencil"></span>修改
		</button>
		</shiro:hasPermission>
		<shiro:hasPermission name="删除辅助档案">
		<button id="btn_delete_f" type="button" class="btn btn-default">
			<span class="glyphicon glyphicon-remove"></span>删除
		</button>
		</shiro:hasPermission>
	</div>

	<!-- 隐藏域 -->
	<input type="hidden" id="archivesIdS" value="">

	<!-- 添加模态框（Modal） -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog" style="width:720px;">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-
						hidden="true">&times;</button>
					<div class="panel panel-success">
						<div class="panel-heading">
							<h3 class="panel-title">添加</h3>
						</div>
						<div class="panel-body">
							<form class="form-horizontal" onsubmit="return check()"
								role="form">
								<div class="form-group">
									<label for="firstname" class="col-sm-2 control-label">基础档案名称</label>
									<div class="col-sm-10">
                                      <input type="text" class="form-control" id="archivesNameAdd" onchange="basevalidateA()">
									</div>
								</div>
								
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">描述</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" id="description">
									</div>
								</div>
								
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">	是否分级</label>
									<div class="col-sm-10" style="padding-left:0px;">
					                     <div class="radio">
										      &nbsp; &nbsp; &nbsp; <input type="radio" id="yes" name="a"
												checked="checked" value="true"><label>是 </label> &nbsp;
											   &nbsp; &nbsp; &nbsp; <input id="no" type="radio" name="a"><label>
												否 </label>
										</div>
									</div>
								</div>
								
							</form>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" id="baseAddBtn">提交</button>
					<button type="button" class="btn btn-default4" data-dismiss="modal">关闭</button>
				</div>
			</div>
		</div>
	</div>
	
	<!--修改模态框 -->
	<div class="modal fade" id="myModal2" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog" style="width:720px;">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-
						hidden="true">&times;</button>
					<div class="panel panel-success">
						<div class="panel-heading">
							<h3 class="panel-title">修改</h3>
						</div>
						<div class="panel-body">
							<form class="form-horizontal" onsubmit="return check()"
								role="form">
								<div class="form-group">
									<label for="firstname" class="col-sm-2 control-label">基础档案名称</label>
									<div class="col-sm-10">
                                         <input type="text" class="form-control" id="archivesNameEdit"onchange="basevalidateU()">
									</div>
								</div>
								
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">描述</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" id="descriptionEdit">
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" id="archives_editBtn">提交</button>
					<button type="button" class="btn btn-default4" data-dismiss="modal">关闭</button>
				</div>
			</div>
		</div>
	</div>
	
	<!--底部添加模态框 -->
	<div class="modal fade" id="myModal-footer" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true"> 
		<div class="modal-dialog" style="width:720px;">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-
						hidden="true">&times;</button>
					<div class="panel panel-success">
						<div class="panel-heading">
							<h3 class="panel-title">添加</h3>
						</div>
						<div class="panel-body">
							<form class="form-horizontal" onsubmit="return check()"
								role="form">
								<div class="form-group">
									<label for="firstname" class="col-sm-2 control-label">辅助档案名称</label>
									<div class="col-sm-10">
                                        <input type="text" class="form-control"id="subSet_add_subsetName" onchange="subsetValidateA()">
									</div>
								</div>
								
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">选择父级类型</label>
									<div class="col-sm-10">
										<select id="subSet_add_archivesId"class="selectpicker show-menu-arrow form-control"data-hide-disabled="true" data-size="5"></select>
									</div>
								</div>
								
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">助记码</label>
									<div class="col-sm-10">
										<input type="text" class="form-control"id="subSet_add_mnemoniCode">
									</div>
								</div>
								
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">描述</label>
									<div class="col-sm-10">
										<input type="text" class="form-control"id="subSet_add_description">
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" id="subSetAdd">提交</button>
					<button type="button" class="btn btn-default4" data-dismiss="modal">关闭</button>
				</div>
			</div>
		</div>
	</div>
     
     <!--底部修改模态框 -->
	<div class="modal fade" id="myModal-footer2" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog" style="width:720px;">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-
						hidden="true">&times;</button>
					<div class="panel panel-success">
						<div class="panel-heading">
							<h3 class="panel-title">修改</h3>
						</div>
						<div class="panel-body">
							<form class="form-horizontal" onsubmit="return check()"
								role="form">
								<div class="form-group">
									<label for="firstname" class="col-sm-2 control-label">辅助档案名称</label>
									<div class="col-sm-10">
                                       <input type="text" class="form-control" id="subsetNameUp"onchange="subsetValidateU()">
									</div>
								</div>
								
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">助记码</label>
									<div class="col-sm-10">
									   <input type="text" class="form-control" id="mnemoniCodeUp">
									</div>
								</div>
								
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">描述</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" id="subsetRemarksUp">
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" id="subset_editBtn">提交</button>
					<button type="button" class="btn btn-default4" data-dismiss="modal">关闭</button>
				</div>
			</div>
		</div>
	</div>	
	
</body>
</html>