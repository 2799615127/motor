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
	src="${ pageContext.request.contextPath }/jsps/delivery/returncargo/createRetrunGoods/js/returnGoods.js"></script>
	
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
	            	    url: '/noob/returnGoods/findAllApplyQuery.action',//请求后台的URL（*）
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
						pageSize : 3, //每页的记录行数（*） 
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
	                    width: '100px'
	                },
	                {
	                    field: 'implementState',
	                    align: 'center',
	                    width: '100px',
	                    title: '执行状态',
	                    formatter : function(value, row, index) {
	    					if (row.implementState == '1') {
	    						return '未返货';
	    					}
	    					if (row.implementState == '3') {
	    						return '已返货';
	    					}
	    				}
	                }, 
	                {
	                    field: 'productName',
	                    align: 'center',
	                    width: '100px',
	                    title: '品名'
	                }, 
	                {
	                    field: 'important',
	                    align: 'center',
	                    width: '100px',
	                    title: '重要提示'	
	                }, 
	                {
	                    field: 'factQuantity',
	                    align: 'center',
	                    width: '100px',
	                    title: '实际件数'
	                }, 
	                {
	                    field: 'size',
	                    align: 'center',
	                    width: '100px',
	                    title: '体积'
	                },
	                {
	                    field: 'whither',
	                    align: 'center',
	                    width: '100px',
	                    title: '到达地'
	                }, 
	                {
	                    field: 'subsetName',
	                    align: 'center',
	                    width: '100px',
	                    title: '产品类型'
	                }, 
	                {
	                    field: 'addressee',
	                    align: 'center',
	                    width: '100px',
	                    title: '委托人'
	                },
	                {
	                    field: 'addresseeUnit',
	                    align: 'center',
	                    width: '100px',
	                    title: '委托单位'
	                },
	                {
	                    field: 'cuNo',
	                    align: 'center',
	                    width: '100px',
	                    title: '客户编号'
	                },
	                {
	                    field: 'agencyFund',
	                    align: 'center',
	                    width: '100px',
	                    title: '代收款'
	                    	
	                },
	                {
	                    field: 'operationStaffName',
	                    align: 'center',
	                    width: '100px',
	                    title: '受理人'
	                },
	                {
	                    field: 'operationTimeStr',
	                    align: 'center',
	                    width: '100px',
	                    title: '受理时间'
	                },
	                {
	                    field: 'operationOrg',
	                    align: 'center',
	                    width: '100px',
	                    title: '受理单位'
	                },
	                {
	                    field: 'entryTimeStr',
	                    align: 'center',
	                    width: '100px',
	                    title: '异常录入时间'
	                },
	                {
	                    field: 'billingHuman',
	                    align: 'center',
	                    width: '100px',
	                    title: '返货确认人',
	                    visible:false,
	                },
	                {
	                    field: 'billingTimeStr',
	                    align: 'center',
	                    title: '返单时间',
	                    width: '100px',
	                    visible:false,
	                },
	                ],
	            });
	           
	            
	        
	        };
	        
	        //得到查询的参数
	        oTableInit.queryParams = function (params) {
	        	
	        	 if($("#txt_search_status").val()==2){
	        		   $("#tb_departments").bootstrapTable('hideColumn', 'billingHuman');
	     	     	   $("#tb_departments").bootstrapTable('hideColumn', 'billingTimeStr');
	        	 }else{
	        		   $("#tb_departments").bootstrapTable('showColumn', 'billingHuman');
	     	     	   $("#tb_departments").bootstrapTable('showColumn', 'billingTimeStr');
	        	 }
	        	
	      
	            var temp = {  
	            		//这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的 
	        			limit : params.limit, //开始记录数
						offset : params.offset, //页面大小取多少条 数据
						
						//简单查询条件
						jobListNo:$("#txt_search_jobListNo").val().trim(),//工作单号
						billingTimeStr:$("#txt_search_startTime").val().trim(),//开单时间	
			            iWidthhState:$("#txt_search_status").val().trim(),//状态
			            operationOrg:$("#txt_search_businessRecsiptUnit").val().trim(),//受理单位
			            entryTimeStr:$("#txt_search_exceptionTime").val().trim(),//异常时间
			            returnUnit:$("#txt_search_returnGoodsUnit").val().trim(),//返货单位
			            a:$("#txt_search_includeLower").val().trim(),//含下级  
			            factQuantity:$("#txt-find-factQuantity").val().trim(),//件数
			            factQuantityEnd:$("#txt-find-factQuantityEnd").val().trim(),
			            factWeight:$("#txt-find-factWeight").val().trim(),//重量
			            factWeightEnd:$("#txt-find-factWeightEnd").val().trim(),
			            bagging:$("#txt-find-bagging").val().trim(),//包装费
			            baggingEnd:$("#txt-find-baggingEnd").val().trim(),
			            cameCollect:$("#txt-find-cameCollect").val().trim(),//到付款
			            cameCollectEnd:$("#txt-find-cameCollectEnd").val().trim(),
			            agencyFund:$("#txt-find-agencyFund").val().trim(),//代收款
			            agencyFundEnd:$("#txt-find-agencyFundEnd").val().trim(),
	            
	            };
	            return temp;
	        }; 
	        
	           return oTableInit;
	      };
	        
	       
    </script>
</head>
<body>

	<!-- 返单表条件查询区 -->
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
						<input type="text" class="form-control"id="txt_search_jobListNo" name="archivesName" style="margin-bottom: 10px">
					</div>

					<label class="control-label col-sm-1" for="txt_search_statu"
						style="width: 12.33333333%; text-align: center; margin-top: 6px;">开单时间</label>
					<div class="col-sm-3">
						<input type="text" class="form-control" id="txt_search_startTime" data-date-format="yyyy-mm-dd hh:ii:ss">
					</div>
					
					<label class="control-label col-sm-1" for="txt_search_statu"
						style="width: 12.33333333%; text-align: center; margin-top: 6px;">状态</label>
					<div class="col-sm-2">
						<select id="txt_search_status"class="selectpicker show-menu-arrow form-control"data-hide-disabled="true" data-size="5">
						   <option value="2">待返货</option>
						   <option value="3">已返货</option>
						</select>
					</div>

				</div>
			</div>
			
			<div class="panel-body" style="padding-top: 0px">
				<div class="form-group" style="margin-top: 15px">
					<label class="control-label col-sm-1"
						for="txt_search_departmentname"
						style="width: 12.33333333%; margin-top: 6px;">受理单位</label>
					<div class="col-sm-2">
						<input type="text" class="form-control" id="txt_search_businessRecsiptUnit"
							style="margin-bottom: 10px">
					</div>
					
					<label class="control-label col-sm-1" for="txt_search_statu"
						style="width: 12.33333333%; text-align: center; margin-top: 6px;">异常时间</label>
					<div class="col-sm-3">
					    <input type="text" class="form-control" id="txt_search_exceptionTime" name="exceptionTime"  data-date-format="yyyy-mm-dd hh:ii:ss">
					</div>
					
				</div>
			</div>
			
			<div class="panel-body" style="padding-top:0px">
				<div class="form-group">
					<label class="control-label col-sm-1"
						for="txt_search_departmentname"
						style="width: 12.33333333%; margin-top: 6px;">返货单位</label>
					<div class="col-sm-2">
						<input type="text" class="form-control" id="txt_search_returnGoodsUnit"
							style="margin-bottom: 10px">
					</div>
					
					<label class="control-label col-sm-1" for="txt_search_statu"
						style="width: 12.33333333%; text-align: center; margin-top: 6px;">含下级&nbsp;&nbsp;</label>
				     <div class="col-sm-2">
						<input type="checkbox" id="txt_search_includeLower">
					</div>
				     
				    <div class="col-sm-2" style="text-align: right;margin-left:214px;">
					   <button type="button" id="Btn_simpleSerch"class="btn btn-primary">查询</button>
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
		<button id="btn_ReturnGoods" type="button" class="btn btn-default">
			<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>生成返单
		</button>
		<button id="btn_edit" type="button" class="btn btn-default">
			<span class="glyphicon glyphicon-retweet" aria-hidden="true"></span>&nbsp;转移
		</button>
		<button id="btn_delete" type="button" class="btn btn-default">
			<span class="glyphicon glyphicon-trash"></span>作废
		</button>
		<button id="btn_seniorSerch" type="button" class="btn btn-default">
			<span class="glyphicon glyphicon-search" aria-hidden="true"></span>高级查询
		</button>
		<button id="btn_complicate" type="button" class="btn btn-default">
			<span class="glyphicon glyphicon-search" aria-hidden="true"></span>追踪查询
		</button>
		<button id="btn_stamp" type="button" class="btn btn-default">
			<span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span>打印
		</button>
	</div>
	
	<!--打印列表模态框 -->
	<div class="modal fade" id="myModal_stamp" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog" style="width:auto;">
			<div class="modal-content">
				<div class="modal-header">
					<table class="table table-hover" style="font-size:13px">
				   <caption >打印工单信息</caption>
				   <thead>
				      <tr>
				         <th>返货状态</th>
				         <th>工作单号</th>
				         <th>品名</th>
				         <th>处理结果</th>
				         <th>件数</th>
				         <th>体积</th>
				         <th>到达地</th>
				         <th>产品类型</th>
				         <th>委托人</th>
				         <th>委托单位</th>
				         <th>代收款</th>
				         <th>客户编号</th>
				         <th>受理人</th>
				         <th>受理时间</th>
				         <th>受理单位</th>
				      </tr>
				   </thead>
				   <tbody id="tbody">
				     
				   </tbody>
				   </table>
				</div>
			</div>
		</div>
	</div>

	<!-- 高级查询模态框 -->
	<div class="modal fade" id="myModal_seniorSerch" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog" style="width:720px;">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-
						hidden="true">&times;</button>
					<div class="panel panel-success">
						<div class="panel-heading">
							<h3 class="panel-title">高级查询</h3>
						</div>
						<div class="panel-body">
								<form class="form-horizontal" onsubmit="return check()" >
								
								<div class="form-group" style="margin-left:35px;">
									<label for="lastname" class="col-sm-2 control-label">件数</label>
									<div class="col-sm-4">
										<input type="text" class="form-control" id="txt-find-factQuantity">
									</div>
									<label for="lastname" class="col-sm-1 control-label" style="text-align:center;">—</label>
									<div class="col-sm-4">
										<input type="text" class="form-control" id="txt-find-factQuantityEnd">
									</div>
								</div>
								
								<div class="form-group"  style="margin-left:35px;">
									<label for="lastname" class="col-sm-2 control-label">重量</label>
									<div class="col-sm-4">
										<input type="text" class="form-control" id="txt-find-factWeight">
									</div>
									<label for="lastname" class="col-sm-1 control-label" style="text-align:center;">—</label>
									<div class="col-sm-4">
										<input type="text" class="form-control" id="txt-find-factWeightEnd">
									</div>
								</div>
								
								<div class="form-group"  style="margin-left:35px;">
									<label for="lastname" class="col-sm-2 control-label">包装费</label>
									<div class="col-sm-4">
										<input type="text" class="form-control" id="txt-find-bagging">
									</div>
									<label for="lastname" class="col-sm-1 control-label" style="text-align:center;">—</label>
								    <div class="col-sm-4">
										<input type="text" class="form-control" id="txt-find-baggingEnd">
									</div>
								</div>
								
								<div class="form-group"  style="margin-left:35px;">
									<label for="lastname" class="col-sm-2 control-label">到付款</label>
									<div class="col-sm-4">
										<input type="text" class="form-control" id="txt-find-cameCollect">
									</div>
									<label for="lastname" class="col-sm-1 control-label" style="text-align:center;">—</label>
									<div class="col-sm-4">
										<input type="text" class="form-control" id="txt-find-cameCollectEnd">
									</div>
								</div>
								
								<div class="form-group"  style="margin-left:35px;">
									<label for="lastname" class="col-sm-2 control-label">代收款</label>
									<div class="col-sm-4">
										<input type="text" class="form-control" id="txt-find-agencyFund">
									</div>
									<label for="lastname" class="col-sm-1 control-label" style="text-align:center;">—</label>
								    	<div class="col-sm-4">
										<input type="text" class="form-control" id="txt-find-agencyFundEnd">
									</div>
								</div>
								</form>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" id="btn-seniorSerch-submit">查询</button>
					<button type="button" class="btn btn-default4" id="btn-seniorSerch-clear">重置</button>
					<button type="button" class="btn btn-default4" data-dismiss="modal">关闭</button>
				</div>
			</div>
		</div>
	</div>
	
	<!--生成返单-->
	<div class="modal fade" id="myModal_ReturnGoods" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog" style="width:900px;">
			<div class="modal-content">
			<form class="form-horizontal" id="addReturn_formss" onsubmit="return check()" role="form">	
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-
						hidden="true">&times;</button>
					
					<div class="panel panel-success">
						<div class="panel-heading">
							<h3 class="panel-title">生成返单</h3>
						</div>
					
						<div class="panel-body">
							<div class="form-group" style="margin-left:5px;">
								<label for="firstname" class="col-sm-2 control-label">工作单号</label>
								<div class="col-sm-3">
                                     <input type="text" class="form-control" id="txt-create-jobListNo" disabled="" onchange="basevalidateU()">
								</div>
								
								<label for="lastname" class="col-sm-2 control-label">产品</label>
								<div class="col-sm-3">
									<select id="txt-create-product"class="selectpicker show-menu-arrow form-control"data-hide-disabled="true" data-size="5"></select>
								</div>
								
								<label for="lastname" class="col-sm-2 control-label">实际件数</label>
								<div class="col-sm-2">
									<input type="text" class="form-control" id="txt-create-factQuantity" name="txtCreateFactQuantity">
								</div>
							</div>
								
							<div class="form-group" style="margin-left:5px;">
							    <label for="lastname" class="col-sm-2 control-label">品名</label>
								<div class="col-sm-3">
									<input type="text" class="form-control" id="txt-create-productName" disabled="">
								</div>
							    
								<label for="lastname" class="col-sm-2 control-label">结算方式</label>
								<div class="col-sm-3">
									<select id="txt-create-settlingAccounts"class="selectpicker show-menu-arrow form-control"data-hide-disabled="true" data-size="5">
									</select>
								</div>
								
								<label for="lastname" class="col-sm-2 control-label">原包装</label>
								<div class="col-sm-2">
								   <select id="txt-create-originalPackage"class="selectpicker show-menu-arrow form-control"data-hide-disabled="true" data-size="5">
								   </select>
								</div>
							</div>
							
							<div class="form-group" style="margin-left:5px;">
							    <label for="lastname" class="col-sm-2 control-label">到达地</label>
								<div class="col-sm-3">
									<input type="text" class="form-control" id="txt-create-whither" disabled="">
								</div>
								
								<label for="lastname" class="col-sm-2 control-label">实际重量</label>
								<div class="col-sm-3">
									<input type="text" class="form-control" id="txt-create-factWeight" name = "txtCreateFactWeight">
								</div>
							    
							    <label for="lastname" class="col-sm-2 control-label">体积</label>
								<div class="col-sm-2">
									<input type="text" class="form-control" id="txt-create-size" name="txtCreateSize">
								</div>
							</div>
							
							<div class="form-group" style="margin-left:5px;">
								<label for="lastname" class="col-sm-2 control-label">委托人</label>
								<div class="col-sm-3">
									<input type="text" class="form-control" id="txt-create-addressee" name = "txtCreateAddressee">
								</div>
								<label for="lastname" class="col-sm-2 control-label">配置要求</label>
								<div class="col-sm-3">
									 <select id="txt-create-mannedRequire"class="selectpicker show-menu-arrow form-control"data-hide-disabled="true" data-size="5">
									 </select>
								</div>
								<label for="lastname" class="col-sm-2 control-label">保险类型</label>
								<div class="col-sm-2">
								   <select id="txt-create-safeType"class="selectpicker show-menu-arrow form-control"data-hide-disabled="true" data-size="5"></select>
								</div>
							</div>
							
							
							<div class="form-group" style="margin-left:5px;">
							    <label for="lastname" class="col-sm-2 control-label">声明价值</label>
								<div class="col-sm-3">
									<input type="text" class="form-control" id="txt-create-declaredValue">
								</div>
								<label for="lastname" class="col-sm-2 control-label">保险费</label>
								<div class="col-sm-3">
									<input type="text" class="form-control" id="txt-create-safeMoney" name = "txtCreateSafeMoney">
								</div>
								<label for="lastname" class="col-sm-2 control-label">重要提示</label>
								<div class="col-sm-2">
									<input type="text" class="form-control" id="txt-create-important">
								</div>
							</div>
							
							
							<div class="form-group" style="margin-left:5px;">
							    <label for="lastname" class="col-sm-2 control-label">包装要求</label>
								<div class="col-sm-3">
							    <input type="text" class="form-control" id="txt-create-packingRequirement" name="txtCreatePackingRequirement">
								</div>
								<label for="lastname" class="col-sm-2 control-label">到付款</label>
								<div class="col-sm-3">
									<input type="text" class="form-control" id="txt-create-cameCollect" value="0" disabled="" >
								</div>
								<label for="lastname" class="col-sm-2 control-label">代收款</label>
								<div class="col-sm-2">
									<input type="text" class="form-control" id="txt-create-agencyFund" value="0" disabled="" >
								</div>
							</div>
							
							<div class="form-group" style="margin-left:5px;">
								<label for="lastname" class="col-sm-2 control-label">开单时间</label>
								<div class="col-sm-3">
									<input type="text" class="form-control" id="txt-create-billingTime" name="txtCreateBillingTime" data-date-format="yyyy-mm-dd hh:ii:ss">
								</div>
								<label for="lastname" class="col-sm-2 control-label">已打印</label>
								<div class="col-sm-3">
									<input type="text" class="form-control" id="txt-create-endMimeograph"value="否" disabled="">
								</div>
								<label for="lastname" class="col-sm-2 control-label">客户单号</label>
								<div class="col-sm-2">
									<input type="text" class="form-control" id="txt-create-cuNo" disabled="">
								</div>
							</div>
							
							<div class="form-group" style="margin-left:5px;">
								<label for="lastname" class="col-sm-2 control-label">开单人</label>
								<div class="col-sm-3">
									<input type="text" class="form-control" id="txt-create-billingHuman" disabled="">
								</div>
								<label for="lastname" class="col-sm-2 control-label">操作单位</label>
								<div class="col-sm-3">
									<input type="text" class="form-control" id="txt-create-operateUnit" disabled="">
								</div>
									<label for="lastname" class="col-sm-2 control-label" style="padding-left:0px;padding-right:0px;">计费重量(kg)</label>
								<div class="col-sm-2">
									<input type="text" class="form-control" id="txt-create-chargedWeight" name="txtCreateChargedWeight">
								</div>
							</div>
							
							<div class="form-group" style="padding-bottom:15px;margin-left:5px;">
								<label for="lastname" class="col-sm-2 control-label">取件单位</label>
								<div class="col-sm-3">
									<input type="text" class="form-control" id="txt-create-unitOfAcquisition" name="txtCreateUnitOfAcquisition">
								</div>
							</div>
							
							<div class="form-group" style="margin-left:5px;margin-right:5px;border-top:1px solid #D6E9C6;">
							    <label for="lastname" class="col-sm-2 control-label" style="width:100%;text-align:center;margin-top:0px;font-size:16px;">发货信息</label>
							</div>
							
							<div class="form-group" style="margin-left:5px;">
							    <label for="lastname" class="col-sm-2 control-label">发货邮编</label>
								<div class="col-sm-3">
									<input type="text" class="form-control" id="txt-create-recipientZipCode" name="txtCreateRecipientZipCode">
								</div>
								<label for="lastname" class="col-sm-2 control-label">发货单位</label>
								<div class="col-sm-3">
									<input type="text" class="form-control" id="txt-create-addresseeUnit" name="txtCreateAddresseeUnit">
								</div>
								<label for="lastname" class="col-sm-2 control-label">发货传真</label>
								<div class="col-sm-2">
									<input type="text" class="form-control" id="txt-create-addresseeFax">
								</div>
							</div>
							
							<div class="form-group" style="margin-left:5px;">
								<label for="lastname" class="col-sm-2 control-label">省</label>
								<div class="col-sm-2" >
									<select  id="txt_send_province" class="txt_search_province js-example-basic-multiple form-control" name="addProvince" style="width:183px"></select>
								</div>
								<label for="lastname" class="col-sm-2 control-label" style="margin-left:72px">市</label>
								<div class="col-sm-2" >
								     <select id="txt_send_city" class="txt_search_city js-example-basic-multiple form-control" name="addCity" style="width:183px"></select>
								</div>
								<label for="lastname" class="col-sm-2 control-label" style="margin-left:70px">县/区</label>
								<div class="col-sm-2" >
								    <select id="txt_send_district" class="txt_search_district js-data-example-ajax form-control" name="addDistrict" style="width:111px"></select>
								</div>
							</div>
							
							<div class="form-group" style="padding-bottom:15px;margin-left:5px;">
							    <label for="lastname" class="col-sm-2 control-label">街道</label>
								<div class="col-sm-3" >
							         <input type="text" class="form-control" id="txt_send_treet" onchange="treetChangeSend()">
								</div>
								<label for="lastname" class="col-sm-2 control-label">发货电话</label>
								<div class="col-sm-3">
									<input type="text" class="form-control" id="txt-create-addresseePhone" name ="txtCreateAddresseePhone">
								</div>
								<label for="lastname" class="col-sm-2 control-label">发货手机</label>
								<div class="col-sm-2">
									<input type="text" class="form-control" id="txt-create-addresseeCellPhone" name ="txtCreateAddresseeCellPhone">
								</div>
							</div>
							
							<div class="form-group" style="margin-left:5px;">
								<label for="lastname" class="col-sm-2 control-label">发货地址</label>
								<div class="col-sm-3" style="width:736px;">
									<input type="text" class="form-control" id="txt-create-addresseeAddress" name="txtCreateAddresseeAddress">
								</div>
							</div>
							
							<div class="form-group" style="margin-left:5px;margin-right:5px;">
							    <label for="lastname" class="col-sm-2 control-label" style="width:100%;text-align:center;margin-top:0px;font-size:16px;border-top:1px solid #D6E9C6;">收货信息</label>
							</div>
							
							<div class="form-group" style="margin-left:5px;">
								<label for="lastname" class="col-sm-2 control-label">收货人</label>
								<div class="col-sm-3">
									<input type="text" class="form-control" id="txt-create-sender" name ="txtCreateSender">
								</div>
							    <label for="lastname" class="col-sm-2 control-label">收货单位</label>
								<div class="col-sm-3">
									<input type="text" class="form-control" id="txt-create-senderUnit" name="txtCreateSenderUnit">
								</div>
									<label for="lastname" class="col-sm-2 control-label">收货传真</label>
								<div class="col-sm-2">
									<input type="text" class="form-control" id="txt-create-senderFax">	
								</div>
							</div>
							
							<div class="form-group" style="margin-left:5px;">
								<label for="lastname" class="col-sm-2 control-label">省</label>
								<div class="col-sm-2" >
									<select  id="txt_add_province" class="txt_search_province js-example-basic-multiple form-control" name="addProvince" style="width:183px">
									
									</select>
								</div>
								<label for="lastname" class="col-sm-2 control-label" style="margin-left:72px">市</label>
								<div class="col-sm-2" >
								     <select id="txt_add_city" class="txt_search_city js-example-basic-multiple form-control" name="addCity" style="width:183px"></select>
								</div>
								<label for="lastname" class="col-sm-2 control-label" style="margin-left:70px">县/区</label>
								<div class="col-sm-2" >
								    <select id="txt_add_district" class="txt_search_district js-data-example-ajax form-control" name="addDistrict" style="width:111px"></select>
								</div>
							</div>
							
							<div class="form-group" style="margin-left:5px;">
								<label for="lastname" class="col-sm-2 control-label">街道</label>
								<div class="col-sm-3" >
							    <input type="text" class="form-control" id="txt_add_treet" onchange="treetChange()">
								</div>
								<label for="lastname" class="col-sm-2 control-label">收货电话</label>
								<div class="col-sm-3">
									<input type="text" class="form-control" id="txt-create-senderPhone" name="txtCreateSenderPhone">
								</div>
								<label for="lastname" class="col-sm-2 control-label">收货手机</label>
								<div class="col-sm-2">
									<input type="text" class="form-control" id="txt-create-senderCellPhone" name="txtCreateSenderCellPhone">
								</div>
							</div>
							
							<div class="form-group" style="margin-left:5px;">
								<label for="lastname" class="col-sm-2 control-label">收货地址</label>
								<div class="col-sm-9" style="width:736px;">
									<input type="text" class="form-control" id="txt-create-senderAddress" name ="txtCreateSenderAddress" onchange="senderAddressChange()">
								</div>
							</div>
							
							
							<div class="form-group" style="margin-left:5px;">
								<label for="lastname" class="col-sm-2 control-label" style="padding-left:7px;padding-right:7px;">到达地编码</label>
								<div class="col-sm-3">
									<input type="text" class="form-control" id="txt-create-arriveLocalityCode" disabled="">
								</div>
							</div>
						
					</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-primary" id="btn_submit_returnGoods">提交</button>
					<button type="button" class="btn btn-default4" data-dismiss="modal">关闭</button>
				</div>
				
				</form>
			</div>
		</div>
	</div>
	
	<!--追踪查询模态框 -->
	<div class="modal fade" id="myModal_complicate" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true"> 
		<div class="modal-dialog" style="width:720px;">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-
						hidden="true">&times;</button>
					<div class="panel panel-success">
						<div class="panel-heading">
							<h3 class="panel-title">追踪查询</h3>
						</div>
						<div class="panel-body">
							<form class="form-horizontal" onsubmit="return check()"
								role="form">
								<div class="form-group">
									<label for="firstname" class="col-sm-2 control-label">工作单号</label>
									<div class="col-sm-10">
                                        <input type="text" class="form-control"id="txt_complicate_search_jobListNo">
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" id="btn_submit_complicate">查询</button>
					<button type="button" class="btn btn-default4" data-dismiss="modal">关闭</button>
				</div>
			</div>
		</div>
	</div>
    
    <!--追踪查询结果模态框-->
 	<div class="modal fade" id="myModal_complicate_out" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog" style="width:720px;">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-
						hidden="true">&times;</button>
					<div class="panel panel-success">
						<div class="panel-heading">
							<h3 class="panel-title">查询结果</h3>
						</div>
						<div class="panel-body">
							<form class="form-horizontal" onsubmit="return check()"
								role="form">
								<div class="form-group">
									<label for="firstname" class="col-sm-2 control-label">项目</label>
									<div class="col-sm-10">
                                       <input type="text" class="form-control" id="subsetNameUp"onchange="subsetValidateU()">
									</div>
								</div>
								
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">司机</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" id="mnemoniCodeUp">
									</div>
								</div>
								
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">时间</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" id="subsetRemarksUp">
									</div>
								</div>
								
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">操作单位</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" id="subsetRemarksUp">
									</div>
								</div>
								
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">件数</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" id="subsetRemarksUp">
									</div>
								</div>
								
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">操作人</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" id="subsetRemarksUp">
									</div>
								</div>
								
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">类型</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" id="subsetRemarksUp">
									</div>
								</div>
								
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">合包号</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" id="subsetRemarksUp">
									</div>
								</div>
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">返货标志</label>
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
    
    <!--转移模态框 -->
	<div class="modal fade" id="myModal_edit" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true"> 
		<div class="modal-dialog" style="width:720px;">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-
						hidden="true">&times;</button>
					<div class="panel panel-success">
						<div class="panel-heading">
							<h3 class="panel-title">转移</h3>
						</div>
						<div class="panel-body">
							<form class="form-horizontal" onsubmit="return check()"
								role="form">
								<div class="form-group" style="margin-left:5px;">
									<label for="firstname" class="col-sm-2 control-label">返货单位</label>
									<div class="col-sm-10">
	  								 <select id="txt_edit_returnUnit"class="selectpicker show-menu-arrow form-control"data-hide-disabled="true" data-size="5"></select>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" id="btn_submit_edit">转移</button>
					<button type="button" class="btn btn-default4" data-dismiss="modal">关闭</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>