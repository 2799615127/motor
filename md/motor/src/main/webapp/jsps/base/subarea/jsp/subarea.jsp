<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro"%>
<%
	String userName = request.getParameter("userName");
	request.getSession().setAttribute("userName", userName);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理分区</title>
	<!-- Jquery组件引用 -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js"></script>
	
	<!-- bootstrap组件引用 -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap/js/bootstrap.min.js"></script>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/bootstrap/css/bootstrap.min.css">
	
	<!-- bootstrap table组件以及中文包的引用 -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap-table/bootstrap-table.min.js"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/bootstrap-table/bootstrap-table.min.css" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>
	<!-- 提示框 -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/toastr/toastr.min.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/toastr/toastr.min.js"></script>
    <!-- 下拉框 -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/select2/select2.css"/>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/select2/select2.full.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/select2/select2.min.js"></script>	
	<!-- sweetalert 组件引用 -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/sweetalert/sweetalert.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/sweetalert/sweetalert.min.js"></script>
    <!-- ocupload -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/ocupload/jquery.ocupload-1.1.2.js"></script>
 	
	<!-- 引入自己内部js -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/linkage.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/jsps/base/subarea/js/subarea.js"></script>
	
	<style type="text/css">
		.col-sm-9 .form-control{
			width:400px;
		}
		
		#formSearch .col-sm-3{
			padding-bottom: 10px;
		}
		
		form span{
			color: red;
		}
		
	</style>
    <script type="text/javascript">
	    $(function () {
	    	$.fn.modal.Constructor.prototype.enforceFocus = function() {};
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

	    	
	    	toastr.options.positionClass = 'toast-top-center';
	        //1.初始化Table
	        var oTable = new TableInit();
	        oTable.Init();
	        //2.初始化Button的点击事件
	        var oButtonInit = new ButtonInit();
	        oButtonInit.Init();
	        
	        validator();
	        validatorUpdate();
	    });
	   
    </script>
</head>
<body>
	<div class="panel-body" style="padding-bottom:0px;">
        <div class="panel panel-default">
            <div class="panel-heading">
	            <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
						查询条件
	            </a>
            </div>
            
			<div class="panel-collapse collapse on" id="collapseOne">
                <form id="formSearch" class="form-horizontal">
                    <div class="form-group" style="margin-top:15px">
                        <label class="control-label col-sm-1" for="txt_search_province">省</label>
                        <div class="col-sm-3">
                        	<input type="text" id="txt_search_province" class="form-control">
                        </div>
                        <label class="control-label col-sm-1" for="txt_search_city">市</label>
                        <div class="col-sm-3">
                        	<input type="text" id="txt_search_city" class="txt_search_city form-control">
                        </div>
                        <label class="control-label col-sm-1" for="txt_search_district">县</label>
                        <div class="col-sm-3">
                        	<input type="text" id="txt_search_district" class="txt_search_district form-control">
                        </div>
                        <label class="control-label col-sm-1" for="txt_search_ripAreaCode">定区编码</label>
                        <div class="col-sm-3">
                            <input type="text" class="form-control" id="txt_search_ripAreaCode">
                        </div>
                        <label class="control-label col-sm-1" for="txt_search_keyword">关键字</label>
                        <div class="col-sm-3">
                            <input type="text" class="form-control" id="txt_search_keyword">
                        </div>
                        <div class="col-sm-3" style="text-align:center;">
                            <button type="button" style="padding:0,20px" id="btn_query" class="btn btn-primary">查询</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>       

        <div id="toolbar" class="btn-group">
            <!-- 按钮触发模态框 -->
            <shiro:hasPermission name="新增分区">
			<button type="button" id="btnAdd" class="btn btn-default" data-toggle="modal" data-target="#myModalAdd">
				<span class="glyphicon glyphicon-plus" aria-hidden="true" ></span>新增
			</button>
			</shiro:hasPermission>
			<shiro:hasPermission name="修改分区">
            <button id="btn_edit" type="button" class="btn btn-default" data-toggle="modal">
                <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>修改
            </button>
            </shiro:hasPermission>
            <shiro:hasPermission name="删除分区">
            <button id="btn_delete" type="button" class="btn btn-default">
                <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>删除
            </button>
            </shiro:hasPermission>
            <shiro:hasPermission name="导入分区">
            <button id="btn_leading-in" type="button" class="btn btn-default">
                <span class="glyphicon glyphicon-log-in" aria-hidden="true"></span>导入
            </button>
            </shiro:hasPermission>
            <shiro:hasPermission name="导出分区">
            <button id="btn_leading-out" type="button" class="btn btn-default">
                <span class="glyphicon glyphicon-log-out" aria-hidden="true"></span>导出
            </button>
            </shiro:hasPermission>
            <!-- <input type="" value="d"/> -->
        </div>
        
        <table id="tb_departments"></table>
    </div>
    
    <!-- 模态框添加(Modal) -->
	<div class="modal fade" id="myModalAdd" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	    <div class="modal-dialog">
	        <div class="modal-content">
	            <div class="modal-header">
	                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>	               
	               <div class="panel panel-success">
		                <div class="panel-heading">
							<h3 class="panel-title">添加</h3>
						</div>
						<div class="panel-body">
							<form id="addForm" class="form-horizontal" role="form">
								<div class="form-group">
									<label for="firstname" class="col-sm-2 control-label">省</label>
									<div class="col-sm-9">
										<select id="txt_add_province" class="txt_search_province js-example-basic-multiple form-control" name="addProvince">
										   
										</select>
									</div>
								</div>
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">市</label>
									<div class="col-sm-9">
										<select id="txt_add_city" class="txt_search_city js-example-basic-multiple form-control" name="addCity">
										  	
										</select>
									</div>
								</div>
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">县/区</label>
									<div class="col-sm-9">
										<select id="txt_add_district" class="txt_search_district js-data-example-ajax form-control" name="addDistrict">
										  	
										</select>
									</div>
								</div>
								
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">关键字</label>
									<div class="col-sm-9">
										<input type="text" name="addKeyword" class="form-control" id="addKeyword"
											title="请输入关键字" placeholder="请输入关键字">
										<span id="addKeyword-span"></span>
									</div>
								</div>
								
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">开始号</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" id="addStartNum"
											onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"
											title="请输入开始号" placeholder="请输入开始号">
											<span id="addStartNum-span"></span>
									</div>
								</div>
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">结束号</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" id="addEndNum"
											onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"
											title="请输入结束号" placeholder="请输入结束号">
											<span id="addEndNum-span"></span>
									</div>
								</div>
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">单双号</label>
									<div class="col-sm-9">
										<select class="form-control" name="addOddEvenNum" id="addOddEvenNum">
											<option value="0" selected="selected">单</option>
											<option value="1">双</option>
										</select>
									</div>
									<span id="addOddEvenNum-span"></span>
								</div>
							</form>
						</div>
					</div>
	            </div>	            
	            <div class="modal-footer">
	            	<button type="button" id="addSub" class="btn btn-primary">添加</button>
	                <button type="button" class="btn btn-default4" data-dismiss="modal">关闭</button>
	            </div>
			 </div>
			</div>
		</div>
   
	   <div class="modal fade" id="myMoalUpdate" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		    <div class="modal-dialog">
		        <div class="modal-content">
		            <div class="modal-header">
		                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>	               
		               <div class="panel panel-success">
			                <div class="panel-heading">
								<h3 class="panel-title">修改</h3>
							</div>
						<div class="panel-body">
							<form id="updateForm" class="form-horizontal" role="form">
								<div class="form-group">
									<label for="firstname" class="col-sm-2 control-label">省</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" id="txt_update_province"
											placeholder="请输入县/区" disabled="disabled">
									</div>
								</div>
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">市</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" id="txt_update_city"
											placeholder="请输入市" disabled="disabled">
									</div>
								</div>
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">县/区</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" id="txt_update_district"
											placeholder="请输入县/区" disabled="disabled">
									</div>
								</div>
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">关键字</label>
									<div class="col-sm-9">
										<input type="text" name="updateKeyword" class="form-control" id="updateKeyword"
											title="请输入关键字" placeholder="请输入关键字">
											<span></span>
									</div>
								</div>
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">起始号</label>
									<div class="col-sm-9">
										<input type="text" name="updateStartNum" class="form-control" id="updateStartNum"
											onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"
											title="请输入起始号" placeholder="请输入起始号">
											<span></span>
									</div>
								</div>
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">终止号</label>
									<div class="col-sm-9">
										<input type="text" name="updateEndNum" class="form-control" id="updateEndNum"
											onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"
											title="请输入终止号" placeholder="请输入终止号">
											<span></span>
									</div>
								</div>
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">单双号</label>
									<div class="col-sm-9">
										<select class="form-control" name="updateOddEvenNum" id="updateOddEvenNum">
											<option value="0" selected="selected">单</option>
											<option value="1">双</option>
										</select>
									</div>
								</div>
							</form>
						</div>
					</div>
	            </div>	            
	            <div class="modal-footer">
	            	<button type="button" id="updateSub" class="btn btn-primary">修改</button>
	                <button type="button" class="btn btn-default4" data-dismiss="modal">关闭</button>
	            </div>
	        </div>
	    </div>
	</div>
</body>
</html>