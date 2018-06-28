<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width" />

<meta http-equiv="Cache-Control" content="max-age=0" />
<meta http-equiv="Cache-control" content="no-cache" />

<title>Insert title here</title>
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
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/bootstrap-select/js/bootstrap-select.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/js/bootstrap-select/css/bootstrap-select.min.css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/toastr/toastr.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/js/toastr/toastr.min.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/sweetalert/sweetalert.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/js/sweetalert/sweetalert.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/bootstrap-datetimepicker/js/bootstrap-datetimepicker.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/bootstrap-datetimepicker/js/bootstrap-datetimepicker.zh-CN.js"></script>	
    <link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/js/bootstrap-datetimepicker/css/bootstrap-datetimepicker.css" />
</head>
<body>
	<div class="panel-body" style="padding-bottom: 0px;">
		<div class="panel panel-default">
			<div class="panel-heading">查询条件</div>
			<div class="panel-body" style="margin-top: 4px; margin-bottom: 4px;">
				<form id="formSearch" class="form-horizontal">
					<div class="form-group" style="margin-top: 15px">
						<label class="control-label col-sm-2"
							for="txt_search_departmentname" style="margin-top: 15px">工作单号</label>
						<div class="col-sm-2" style="margin-top: 15px">
							<input type="text" class="form-control" id="jobListId">
						</div>
						<label class="control-label col-sm-2" for="txt_search_statu"
							style="margin-top: 15px">状态</label>
						<div class="col-sm-2" style="margin-top: 15px">
							<select id="cancelSign" class="form-control"
								onchange="selectOnchang(this)">
								<option value="1">否</option>
								<option value="0">是</option>
								<option value="">全部</option>
							</select>
						</div>
						<label class="control-label col-sm-2"
							for="txt_search_departmentname" style="margin-top: 15px">委托人</label>
						<div class="col-sm-2" style="margin-top: 15px">
							<input type="text" class="form-control" id="getProductManName">
						</div>
						<label class="control-label col-sm-2"
							for="txt_search_departmentname" style="margin-top: 15px">收货地址</label>
						<div class="col-sm-2" style="margin-top: 15px">
							<input type="text" class="form-control" id="addresseeAddress">
						</div>
						<label class="control-label col-sm-2"
							for="txt_search_departmentname" style="margin-top: 15px">开单时间</label>
						<div class="col-sm-2" style="margin-top: 15px">
							<input type="text"
								type="text" class="form-control form_datetime"
								id="billingTime" />
						</div>
						<label class="control-label col-sm-2"
							for="txt_search_departmentname" style="margin-top: 15px">受理单位</label>
						<div class="col-sm-2" style="margin-top: 15px">
							<input type="text" class="form-control" id="unitOfAcquisition">
						</div>
						<label class="control-label col-sm-2"
							for="txt_search_departmentname" style="margin-top: 15px">含下级</label>
						<div class="col-sm-2" style="margin-top: 15px">
							<input type="text" class="form-control" id="lowerLevel">
						</div>
						<label class="control-label col-sm-2"
							for="txt_search_departmentname" style="margin-top: 15px">派送单位</label>
						<div class="col-sm-2" style="margin-top: 15px">
							<input type="text" class="form-control" id="unitOfAcquisitions">
						</div>
						<label class="control-label col-sm-2"
							for="txt_search_departmentname" style="margin-top: 15px">交接时间</label>
						<div class="col-sm-2" style="margin-top: 15px">
							<input type="text"
								type="text" class="form-control form_datetime"
								id="appointmentDispatchTime" />
						</div>
						<div class="col-sm-12" style="text-align: right; border: 1px">
							<button id="btn_query" type="button" style="margin-top: 15px"
								id="btn_query" class="btn btn-primary">查询</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<div>
	    <button button id="statisticalData" type="button" class="btn btn-default1"
				data-toggle="modal" data-target="#myModal">
	          <span aria-hidden="true">统计数据</span>
	    </button>
	<div id="statisticalDatas"  style="display:none">
		<div>
			<input disabled="disabled" id="totalVotes" class="col-sm-2" style="margin-top: 10px"></input>
			<input disabled="disabled" id="inOrderToDeliver" class="col-sm-2" style="margin-top: 10px"></input>
			<input disabled="disabled" id="notDelivered" class="col-sm-2" style="margin-top: 10px"></input>
			<input disabled="disabled" id="delayRate" class="col-sm-2" style="margin-top: 10px"></input>
		</div>
	</div>
	</div>
	<div>
	    <hr/>
		<div id="toolbar" class="btn-group">
			<button id="renovate" type="button" class="btn btn-default1"
				data-toggle="modal" data-target="#myModal">
				<span aria-hidden="true"></span>返回
			</button>
			<button id="stamp" type="button" class="btn btn-default1"
			data-toggle="modal" data-target="#myModal">
			   <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>打印
			</button>
		</div>
		<table id="tb_departments"></table>
	</div>


</body>
<script type="text/javascript">
$(".form_datetime").datetimepicker({
    format: "yyyy-mm-dd hh:ii:ss",
    autoclose: true,
    todayBtn: true,
    language:'zh-CN',
    pickerPosition:"bottom-right"
  });

$(function() {
	toastr.options = {
		closeButton : false, //是否显示关闭按钮
		debug : false, //是否为调试
		progressBar : true, //是否显示进度条
		positionClass : "toast-top-center", //在页面中显示的位置
		onclick : null, //点击事件
		showDuration : "100", //显示动作时间
		hideDuration : "1000", //隐藏动作时间
		timeOut : "2000", //自动关闭超时时间
		extendedTimeOut : "1000",
		showEasing : "swing",
		hideEasing : "linear",
		preventDuplicates : true,
		preventOpenDuplicates : true, //重复内容的提示框在开启时只出现一个
		showMethod : "fadeIn", //显示的方式
		hideMethod : "fadeOut" //隐藏的方式
	};
})
     $(function () {
          //1.初始化Table
          var oTable = new TableInit();
          oTable.Init();

        //2.初始化Button的点击事件
        var oButtonInit = new ButtonInit();
        oButtonInit.Init();

    });
     
     var TableInit = function () {
         var oTableInit = new Object();
         //初始化Table
         oTableInit.Init = function () {
         	//easyui的表格
             $('#tb_departments').bootstrapTable({
                 url:'/noob/DispatchedQueryController/DispatchedQueryPageQery.action',         //请求后台的URL（*）
                 method: 'get',                      //请求方式（*）
                 toolbar: '#toolbar',                //工具按钮用哪个容器
                 striped: true,                      //是否显示行间隔色
                 cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
                 pagination: true,                   //是否显示分页（*）
                 sortable: false,                     //是否启用排序
                 sortOrder: "asc",                   //排序方式
                 queryParamsType : "undefined",
                 queryParams: oTableInit.queryParams,//传递参数（*）
                 sidePagination: "server",           //分页方式：client客户端分页，server服务端分页（*）
                 pageNumber:1,                       //初始化加载第一页，默认第一页
                 pageSize: 5,                       //每页的记录行数（*）
                 pageList: [10, 20, 30, 50],        //可供选择的每页的行数（*）
                 search: true,                       //是否显示表格搜索，此搜索是客户端搜索，不会进服务端，所以，个人感觉意义不大
                 strictSearch: true,
                 showColumns: true,                  //是否显示所有的列
                 showRefresh: true,                  //是否显示刷新按钮
                 minimumCountColumns: 2,             //最少允许的列数
                 clickToSelect: true,                //是否启用点击选中行
                 uniqueId: "province",                     //每一行的唯一标识，一般为主键列
                 showToggle:true,                    //是否显示详细视图和列表视图的切换按钮
                 cardView: false,                    //是否显示详细视图
                 detailView: false,                   //是否显示父子表
                 queryParams: function queryParams(params) {   //设置查询参数  
                 	var param = {    
                 			pageNumber: params.pageNumber,    
             	            pageSize: params.pageSize   //页码
             	            
 	                };    
 	                return param;                   
 	            },//传递参数（*）
                 columns: [{
                     checkbox: true
                 },{
                     field: 'jobListId',
                     title: '工作单号'
                 }, {
                     field: 'appointmentDispatchTime',
                     title: '交接时间'
                 }, {
                     field: 'signInType',
                     title: '签收',
                     formatter : function(value,
								row, index) {
							if (row.signInType == '0') {
								return '是';
							} else {
								return '否';
							}
						}
                 },{
                     field: 'addressee',
                     title: '签收人'
                 },{
                     field: 'signInTime',
                     title: '签收时间'
                 },{
                     field: 'unitOfAcquisition',
                     title: '派送单位'
                 },{
                     field: 'unitOfAcquisition',
                     title: '受理单位'
                 },{
                     field: 'product',
                     title: '产品类型'
                 },{
                     field: 'strServiceTimeLimit',
                     title: '产品时限',
                 },{
                     field: 'methodOfSettlingAccounts',
                     title: '结算方式'
                 },{
                     field: 'nameOfAPart',
                     title: '品名'
                 },{
                     field: 'factQuantity',
                     title: '件数'
                 },{
                     field: 'size',
                     title: '体积'
                 },{
                     field: 'addresseeAddress',
                     title: '到达地'
                 },{
                     field: 'strServiceTimeLimit',
                     title: '希望送达时间'
                 },{
                     field: 'archivesId',
                     title: '配载要求'
                 },], 	          
             });
         };
         oTableInit.queryParams = function (params) {
             var temp = {   //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
             	pageNumber: params.pageNumber,    
 	            pageSize: params.pageSize  //页码
             };
             return temp;
         }; 
         return oTableInit;
     };
     
     var ButtonInit = function() {
 		var oInit = new Object();
 		var postdata = {};

 		oInit.Init = function() {
 			$("#btn_query").click(function(){
 				var obj={
 						url:"/noob/DispatchedQueryController/DispatchedQueryPageQery.action",
 						silent:true,
 						query:{
 							jobListId:$("#jobListId").val(),
							cancelSign:$("#cancelSign").val(),
							getProductManName:$("#getProductManName").val(),
							addresseeAddress:$("#addresseeAddress").val(),
							billingTime:$("#billingTime").val(),
							unitOfAcquisition:$("#unitOfAcquisition").val(),
							lowerLevel:$("#lowerLevel").val(),
							unitOfAcquisitions:$("#unitOfAcquisitions").val(),
							appointmentDispatchTime:$("#appointmentDispatchTime").val(),
							renovate:""
 						}
 				};
			$('#tb_departments').bootstrapTable(
					'refresh', obj);
 			});
 			$("#renovate").click(function(){
 				 var obj={
							url:"/noob/DispatchedQueryController/DispatchedQueryPageQery.action",
							silent : true,
							query : {
								renovate:"renovate"
							}
					};
					$('#tb_departments').bootstrapTable(
							'refresh', obj);
 			});
 	    
 		   $("#statisticalData").click(function(){
 			  if($("#statisticalDatas").hasClass("show")){
 				 $("#statisticalDatas").hide().removeClass("show");
 			  }else{
 				 $.ajax({
 					type : "GET",
 					url : '/noob/DispatchedQueryController/statisticalDataPageQuery.action',
 					data : {
 					},success : function(result) {
 						$("#totalVotes").val("总票数:"+result.totalVotes);
 						$("#inOrderToDeliver").val("以派送:"+result.inOrderToDeliver);
 						$("#notDelivered").val("未派送:"+result.notDelivered);
 						$("#delayRate").val("晚点率:"+result.delayRate);
 						$("#statisticalDatas").show().addClass("show");
 					}
 				});
 			  }
 			  
 		   });
 		   $("#stamp").click(function(){
 			   alert("1");
 			  var select = $('#tb_departments')
				.bootstrapTable('getSelections');
 			 var arrs = [];
			  for (var i = 0; i < select.length; i++) {
			      arrs[i] = select[i]['jobListId'];
			  }
 			   if(select.length==0){
 				  toastr.warning("请至少选择一行");
 			   }else{
 				  $.ajax({
 				     type:"GET",  
 				     url:'/noob/DispatchedQueryController/AppointJobListIdsQuery.action',
 				     date:{
 				    	 jobListIds:arrs
 				     },success:function(result){
				    	 $(location).attr('href',result);
				     }
 				  });
 			   }
 		   });
 		 
 		};
 		return oInit;
 	};
    </script>
</html>