<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>取派调度令监控</title>
	
	<!-- Jquery组件引用 -->
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js"></script>

	<!-- bootstrap组件引用 -->
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/js/bootstrap/js/bootstrap.js"></script>
	<link rel="stylesheet" type="text/css"
		href="${pageContext.request.contextPath}/js/bootstrap/css/bootstrap.min.css">
	
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/bootstrap-validator/bootstrapValidator.min.css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap-validator/bootstrapValidator.min.js"></script>
    
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/bootstrap-datetimepicker/css/bootstrap-datetimepicker.css" />
        
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap-datetimepicker/js/bootstrap-datetimepicker.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap-datetimepicker/js/bootstrap-datetimepicker.zh-CN.js"></script>

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
	</style>
    <script type="text/javascript">
	    $(function () {
	
	        //1.初始化Table
	        var oTable = new TableInit();
	        oTable.Init();
	
	        //2.初始化Button的点击事件
	        var oButtonInit = new ButtonInit();
	        oButtonInit.Init();
	        //模糊查询
	        $("#btn_query").click(function(){
				var obj = {
					url : "../../../../dispatchInquiry/dispatchInquiryPageQuery.action",
					silent : true,
					query : {
						operationOrg : $("#operationOrg").val(),
						staffName : $("#staffName").val(),
						lowOperateTime : $("#lowOperateTime").val(),
						highOperateTime : $("#highOperateTime").val()
						
					}
				};
				$('#td_dispatchControl').bootstrapTable('refresh'); 
	        });
	        
	      	//导出
		    $("#btn_out").click(function(){
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
			    		url:"../../../../dispatchInquiry/dispatchInquiryOut/outExcelDispatchInquiry.action",
			    		data:{path:"D:\\yidu\\S3阶段项目资料\\一键上传\\导出.xls"},
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
	        //日期格式
	        $(".form_datetime").datetimepicker({
			      format: "yyyy-mm-dd HH:mm:ss",
			      autoclose: true,
			      todayBtn: true,
			      language:'zh-CN',
			      pickerPosition:"bottom-right",
			      //minView:2
			     
			});
	    });
	    
	    function formatDate(ns) {
			var now = new Date(ns);
			var year=now.getYear()+1900;
			var month=now.getMonth()+1;
			var date=now.getDate();
			var hour=now.getHours();
			var minute=now.getMinutes();
			var second=now.getSeconds();
			return year+"-"+month+"-"+date;
		}
	    
 	    var TableInit = function () {
	        var oTableInit = new Object();
	        //初始化Table
	        oTableInit.Init = function () {
	            $('#td_dispatchControl1').bootstrapTable({
	                url: '',         //请求后台的URL（*）
	                method: 'get',                      //请求方式（*）
	                toolbar: '#toolbar',                //工具按钮用哪个容器
	                striped: true,                      //是否显示行间隔色
	                cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
	                pagination: true,                   //是否显示分页（*）
	                sortable: false,                     //是否启用排序
	                sortOrder: "asc",                   //排序方式
	                queryParams: oTableInit.queryParams,//传递参数（*）
	                sidePagination: "server",           //分页方式：client客户端分页，server服务端分页（*）
	                pageNumber:1,                       //初始化加载第一页，默认第一页
	                pageSize: 10,                       //每页的记录行数（*）
	                pageList: [10, 25, 50, 100],        //可供选择的每页的行数（*）
	                search: true,                       //是否显示表格搜索，此搜索是客户端搜索，不会进服务端，所以，个人感觉意义不大
	                strictSearch: true,
	                showColumns: true,                  //是否显示所有的列
	                showRefresh: true,                  //是否显示刷新按钮
	                minimumCountColumns: 2,             //最少允许的列数
	                clickToSelect: true,                //是否启用点击选中行
	                height: 500,                        //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
	                uniqueId: "ID",                     //每一行的唯一标识，一般为主键列
	                showToggle:true,                    //是否显示详细视图和列表视图的切换按钮
	                cardView: false,                    //是否显示详细视图
	                detailView: true,                   //是否显示父子表
	                columns: [{
	                    checkbox: true
	                }, {
	                    field: 'sequence',
	                    title: '序号'
	                }, {
	                    field: '',
	                    title: '异常'
	                }, {
	                    field: '',
	                    title: '工作单号'
	                }, {
	                    field: '',
	                    title: '派送清单号'
	                },{
	                    field: '',
	                    title: '计划派件人'
	                },{
	                    field: '',
	                    title: '实际派件人'
	                },{
	                    field: '',
	                    title: '派件地址'
	                },{
	                    field: '',
	                    title: '送达时间'
	                },{
	                    field: '',
	                    title: '派送出库时间'
	                },{
	                    field: '',
	                    title: '派送时间'
	                },{
	                    field: '',
	                    title: '签收录入时间'
	                },{
	                    field: '',
	                    title: '核销时间'
	                },{
	                    field: '',
	                    title: '原单核销时间'
	                },{
	                    field: '',
	                    title: '是否原单'
	                },{
	                    field: '',
	                    title: '入库时间'
	                },{
	                    field: '',
	                    title: '异常项目'
	                },{
	                    field: '',
	                    title: '到付款'
	                },{
	                    field: '',
	                    title: '代收款'
	                },{
	                    field: '',
	                    title: '实收款'
	                },]
	            });
	            
	            $('#td_dispatchControl').bootstrapTable({
	                url: '../../../../dispatchInquiry/dispatchInquiryPageQuery.action',         //请求后台的URL（*）
	                method: 'get',                      //请求方式（*）
	                toolbar: '#toolbar',                //工具按钮用哪个容器
	                striped: true,                      //是否显示行间隔色
	                cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
	                pagination: true,                   //是否显示分页（*）
	                sortable: false,                     //是否启用排序
	                sortOrder: "asc",                   //排序方式
	                queryParamsType : "undefined",
	    			queryParams : function queryParams(params) { // 设置查询参数
	    				var param = {
	    					pageNumber : params.pageNumber,
	    					pageSize : params.pageSize,
	    					operationOrg : $("#txt_operationOrg").val(),
	    					staffName : $("#txt_staffName").val(),
	    					lowOperateTime : $("#txt_lowOperateTime").val(),
	    					highOperateTime : $("#txt_highOperateTime").val()
	    				};
	    				return param;
	    			},// 传递参数（*）
	                sidePagination: "server",           //分页方式：client客户端分页，server服务端分页（*）
	                pageNumber:1,                       //初始化加载第一页，默认第一页
	                pageSize: 5,                       //每页的记录行数（*）
	                pageList: [5, 10, 15, 100],        //可供选择的每页的行数（*）
	                search: true,                       //是否显示表格搜索，此搜索是客户端搜索，不会进服务端，所以，个人感觉意义不大
	                strictSearch: true,
	                showColumns: true,                  //是否显示所有的列
	                showRefresh: true,                  //是否显示刷新按钮
	                minimumCountColumns: 2,             //最少允许的列数
	                clickToSelect: true,                //是否启用点击选中行
	                //uniqueId: "ID",                     //每一行的唯一标识，一般为主键列
	                showToggle:true,                    //是否显示详细视图和列表视图的切换按钮
	                cardView: false,                    //是否显示详细视图
	                detailView: false,                   //是否显示父子表
	                columns: [{
	                    checkbox: true
	                }, {
	                    field: 'sequence',
	                    title: '序号'
	                }, {
	                    field: 'isAbnormal',
	                    title: '异常'
	                }, {
	                    field: 'businessRecsiptNo',
	                    title: '业务通知单号'
	                }, {
	                    field: 'workOrderNo',
	                    title: '工单号'
	                },{
	                    field: 'addressee',
	                    title: '取件人'
	                },{
	                    field: 'staffName',
	                    title: '取派人'
	                },{
	                    field: 'fetchAddress',
	                    title: '取件地址'
	                },{
	                    field: 'operationOrg',
	                    title: '受理单位'
	                },{
	                    field: 'operationTime',
	                    title: '受理时间'
	                },{
	                    field: 'operationTime',
	                    title: '下单成功时间'
	                },{
	                    field: 'confirmationTime',
	                    title: '确认时间'
	                },{
	                    field: 'takeTime',
	                    title: '取件时间'
	                },{
	                    field: 'appointmentDispatchTime',
	                    title: '入库时间'
	                },{
	                    field: 'estimatedFreight',
	                    title: '运费'
	                },{
	                    field: 'safeMoney',
	                    title: '保险费'
	                },{
	                    field: 'bagging',
	                    title: '包装费'
	                },{
	                    field: 'makeCollections',
	                    title: '实收款'
	                }, ]
	            });
	        };

	        return oTableInit;
	    };
	
	    var ButtonInit = function () {
	        var oInit = new Object();
	        var postdata = {};
	
	        oInit.Init = function () {
	            //初始化页面上面的按钮事件
	            
	        };
	
	        return oInit;
	    };
	    
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
					<div class="form-group" style="margin-top: 15px">
						<!-- 受理单位 -->
						<label class="control-label col-sm-1"
							for="txt_operationOrg">受理单位</label>
						<div class="col-sm-1">
							<input type="text" class="form-control" id="txt_operationOrg" />
							<!-- <input type="checkbox" class="" id="" />含下级 -->
						</div>
						
						<!-- 取派人 -->
						<label class="control-label col-sm-1" for="txt_staffName">取派人</label>
						<div class="col-sm-1">
							<input type="text" class="form-control"
								id="txt_staffName" name="txt_staffName">
						</div>
						<!-- 起始日期 -->
						<label class="control-label col-sm-1" for="txt_lowOperateTime">起始日期</label>
						<div class="col-sm-2">
							<input type="text" class="form-control form_datetime" id="txt_lowOperateTime">
						</div>
						<!-- 终止日期 -->
						<label class="control-label col-sm-1" for="txt_highOperateTime">终止日期</label>
						<div class="col-sm-2">
							<input type="text" class="form-control form_datetime" id="txt_highOperateTime">
							<!-- <input type="checkbox" class="" id="" />异常 -->
						</div>
						<div class="col-sm-2" style="text-align: left;">
							<button type="button" style="margin-left: 50px" id="btn_query"
								class="btn btn-primary">查询</button>
						</div>
					</div>
				</form>
			</div>
		</div>       

        <div id="toolbar" class="btn-group">
            <button id="btn_out" type="button" class="btn btn-default">
                <span class="glyphicon glyphicon-log-out" aria-hidden="true"></span>导出
            </button>
            
        </div>
        <table id="td_dispatchControl"></table>
        <!-- <table id="td_dispatchControl1"></table> -->
    </div>

</body>
</html>