<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>人工调度</title>
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
    <!-- 下拉框 -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/select2/select2.css"/>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/select2/select2.full.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/select2/select2.min.js"></script>	
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap-datetimepicker/js/bootstrap-datetimepicker.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap-datetimepicker/js/bootstrap-datetimepicker.zh-CN.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/sweetalert/sweetalert.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/toastr/toastr.js.map"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/toastr/toastr.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/linkage.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/bwizard.min.js"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jsps/delivery/dispatch/artificialDispatch/css/artificialDispatch.css" />
</head>
<body>

    <div class="panel-body" style="padding-bottom: 0px;">
		<div class="panel panel-default">
			<div class="panel-heading">
				<a data-toggle="collapse" data-parent="#accordion"
					href="#collapseOne" > 查询条件 </a>
			</div>
			<div class="panel-collapse collapse on" id="collapseOne">
				<form id="formSearch" class="form-horizontal">
					<div class="form-group" style="margin-top:15px">
						<label class="control-label col-sm-1"
							for="operationOrg">单位</label>
						<div class="col-sm-3">
							<input type="text" class="form-control"
								id="operationOrg">
						</div>
						
						<label class="control-label col-sm-1"
							for="businessRecsiptNo">业务单号</label>
						<div class="col-sm-3">
							<input type="text" class="form-control"
								id="businessRecsiptNo">
						</div>
						<br>
						<br>
						<label class="control-label col-sm-1" for="workOrderType">来源类型</label>
						<div class="col-sm-3">
							<input type="text" class="form-control"
								id="workOrderType">
						</div>
						
						<!-- <label class="control-label col-sm-1" for="lowDate">最小日期</label>
						<div class="col-sm-3">
							<input type="text" class="form-control form_datetime"
							 id="lowDate">
						</div>
						
						<label class="control-label col-sm-1" for="highDate">最大日期</label>
						<div class="col-sm-3">
							<input type="text" class="form-control form_datetime"
							 id="highDate">
						</div> -->
						<div class="col-sm-4" style="text-align:left;">
							<button type="button" style="margin-left:50px" id="btn_query"
								class="btn btn-primary">查询</button>
						</div>
					</div>
				</form>
			</div>
		</div>
		<div id="toolbar" class="btn-group">
		
			<button id="btn_allocation" type="button" class="btn btn-default" data-toggle="modal">
				<span class="glyphicon glyphicon-edit" aria-hidden="true"></span>分配
			</button>
			<button id="btn_retreat" type="button" class="btn btn-default"  data-toggle="modal">
				<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>退回
			</button>			
			
			<button id="btn_delete" type="button" class="btn btn-default" data-toggle="modal">
				<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>销单
			</button>
			
		</div>
		<table id="tb_departments"></table>
        <br>
        <table id="tb_history"></table>
	</div>
    <input type="hidden" id="businessRecsiptIds" value="">
    
    
    <!-- 分配模态框 -->	
	<div class="modal fade" id="myModal" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<div class="panel panel-success">
						<div class="panel-heading">
							<h3 class="panel-title">分配</h3>
						</div>
				<div class="panel-body">
					<div id="wizard" class="bwizard clearfix">
						<button class="btn" id="in" style="background-color:#dff0d8; color:#3c763d;">
						       内部分配
						</button>
						<!-- <button class="btn" id="out" style="background-color:#F0F0F0;">
						       外部分配
						</button> -->
						
						<div class="tab-content">
						
							<!-- 内部分配 -->
							<div id="step1">
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">省</label>
									<div class="col-sm-10">
										<select id="tx_province" name="province" 
										class="js-example-basic-multiple form-control" style="width: 420px;height: 50px">
										</select>
									</div>
								</div>
								<br>
								<br>
								<br>
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">市</label>
									<div class="col-sm-10">
										<select id="tx_city" name="city" 
										class="js-example-basic-multiple form-control" style="width: 420px;height: 50px">
										</select>
									</div>
								</div>
								<br>
								<br>
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">县/区</label>
									<div class="col-sm-10">
										<select id="tx_district" name="district" 
										class="js-example-basic-multiple form-control" style="width: 420px;height: 50px">
										</select>
									</div>
								</div>
								<br>
								<br>
								<div class="form-group">
									<label for="lastname" class="control-label col-sm-2">详细地址</label>
							   <div class="col-sm-10">
								<input type="text" class="form-control" id="detailedAddress" 
								 name="detailedAddress" placeholder="请输入详细地址">
							</div>
								</div>
								<br>
								<br>
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label" for="fetchAddress">取件地址</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" id="fetchAddress"
											 name="fetchAddress" disabled>
									</div>
								</div>
								<br>
								<br>
								<div class="form-group">
								    
									<label for="lastname" class="col-sm-2 control-label" for="sortingCode">分拣编码</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" id="sortingCode"
											 name="sortingCode" disabled>
									</div>
								</div>
								
								<div>&nbsp;</div>
								
								<div class="modal-footer">
									<!-- <button type="button" id="next" class="btn btn-primary">下一步</button> -->
									<button type="button" class="btn btn-default4" data-dismiss="modal" onclick="cancel()">关闭</button>
									<!-- <button type="button" id="after" class="btn btn-primary">上一步</button> -->
								    <button type="button" class="btn btn-primary" id="allocation" data-dismiss="modal" onclick="cancel()">分配</button>
								</div>
							</div>
							
							<!-- 外部分配 -->
							<div id="step2" style="display:none;">
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">所属单位</label>
									<div class="col-sm-10">
										<select id="operationOrgs" name="operationOrgs" class="js-example-basic-multiple form-control">
										</select>
									</div>
								</div>
								
								<div>&nbsp;</div>	
								
								<div class="modal-footer">
									<button type="button" class="btn btn-default4" data-dismiss="modal" onclick="cancel()">关闭</button>
								    <button type="button" class="btn btn-primary" id="allocations" data-dismiss="modal" onclick="cancel()">分配</button>
								</div>
						    </div>
						</div>
					</div>
				</div>
			</div>
			</div>
			</div>
		</div>
	</div>
	
		<!-- 退回模态框（Modal） -->
	<div class="modal fade" id="Model" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<div class="panel panel-success">
						<div class="panel-heading">
							<h3 class="panel-title">退回</h3>
						</div>
						<div class="panel-body">
							<form class="form-horizontal" onsubmit="return check()"
								role="form">
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">所属单位</label>
									<div class="col-sm-10">
										<select id="operationOrgss" name="operationOrgss" class="js-example-basic-multiple form-control">
										   <option value="0"></option>
										</select>
									</div>
								</div>
								
								<div class="form-group">
								    
									<label for="lastname" class="col-sm-2 control-label" for="sortingCode">上级组织</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" id="takeOrgNames"
											 name="takeOrgNames" disabled>
									</div>
									
								</div>
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label" for="retreatReason">退回原因</label>
									<div class="col-sm-10">
										<textarea rows="1" cols="60" id="retreatReason" name="retreatReason"
										style="max-width:425px;min-width:425px;min-height:80px;max-height:120px;"></textarea>
									
									</div>
								</div>
								
								</form>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" id="retreat" data-dismiss="modal">退回</button>
					<button type="button" class="btn btn-default4" data-dismiss="modal">关闭</button>
				</div>
			</div>
		</div>
	</div>
	
	
			<!-- 销单模态框（Modal） -->
	<!-- 销单模态框 -->
		<div class="modal fade" id="Model1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		    <div class="modal-dialog">
		        <div class="modal-content">
		            <div class="modal-header">
		                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>	               
		               <div class="panel panel-success">
			                <div class="panel-heading">
								<h3 class="panel-title">销单原因</h3>
							</div>
						<div class="panel-body">
							<form id="updateForm" class="form-horizontal" role="form">
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">异常原因</label>
									<div class="col-sm-9">
										<select class="selectpicker show-menu-arrow form-control" id="cancelCause">
											<option value="太慢了">太慢了</option>
											<option value="服务态度差">服务态度差</option>
											<option value="同城">同城</option>
											<option value="其他">其他</option>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">备注</label>
									<div class="col-sm-9">
										<textarea id="cancelRemark" class="form-control" style="max-width:395px;min-width:395px;min-height:80px;max-height:120px;"></textarea>
									</div>
								</div>
							</form>
						</div>
					</div>
	            </div>	            
	            <div class="modal-footer">
	            	<button type="button" id="delete" data-dismiss="modal" class="btn btn-primary">销单</button>
	                <button type="button" class="btn btn-default4" data-dismiss="modal">关闭</button>
	            </div>
	        </div>
	    </div>
	</div>
		
	<script type="text/javascript">
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
	  		var TableInit = function() {
			var oTableInit = new Object();
			//初始化Table 
			oTableInit.Init = function() {
				$('#tb_departments').bootstrapTable({
					url : '../../../../../artificialDispatch.action', //请求后台的URL（*） 
					method : 'get', //请求方式（*） 
					toolbar : '#toolbar', //工具按钮用哪个容器 
					striped : true, //是否显示行间隔色 
					cache : false, //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*） 
					pagination : true, //是否显示分页（*） 
					sortable : false, //是否启用排序 
					sortOrder : "asc", //排序方式 
					queryParams : oTableInit.queryParams,//传递参数（*）
					sidePagination : "server", //分页方式：client客户端分页，server服务端分页（*） 
					pageNumber : 1, //初始化加载第一页，默认第一页 
					pageSize : 5, //每页的记录行数（*） 
					pageList : [ 5, 25, 50, 100 ], //可供选择的每页的行数（*） 
					search : false, //是否显示表格搜索，此搜索是客户端搜索，不会进服务端，所以，个人感觉意义不大 
					strictSearch : true,
					showColumns : true, //是否显示所有的列 
					showRefresh : true, //是否显示刷新按钮
					minimumCountColumns : 2, //最少允许的列数
					clickToSelect : true, //是否启用点击选中行 
					uniqueId : "businessRecsiptId", //每一行的唯一标识，一般为主键列 
					showToggle : true, //是否显示详细视图和列表视图的切换按钮 
					cardView : false, //是否显示详细视图
					detailView : false, //是否显示父子表
					columns : [ {
						checkbox : true
					}, {
						field : 'businessRecsiptNo',
						title : '业务通知单号'
					}, {
						field : 'operationOrg',
						title : '操作单位'
					}, {
						field : 'sortingCode',
						title : '分拣编码'
					}, {
						field : 'workOrderTime',
						title : '工单生成时间',
						formatter:function (value){
							return formatDate(value)
						}
					} , {
						field : 'fetchAddress',
						title : '取件地址'
					}, {
						field : 'customerNo',
						title : '客户编号'
					}, {
						field : 'contacts',
						title : '联系人'
					}, {
						field : 'telephone',
						title : '电话'
					}, {
						field : 'numberPackages',
						title : '数量'
					}, {
						field : 'volume',
						title : '体积'
					}, {
						field : 'separateListType',
						title : '分单类型',
						formatter : function(value, row, index) {
							if (row.separateListType == "1") {
								return '人工';
							} else {
								return '自动';
							}
						}
						
					}, {
						field : 'arrivalCity',
						title : '到达城市'
					}, {
						field : 'traceNum',
						title : '追单次数'
					}, {
						field : 'workOrderType',
						title : '来源类型'
					}, {
						field : 'dates',
						title : '日期',
						formatter:function (value){
							return formatDate(value)
						}
					}, {
						field : 'takeOrgName',
						title : '单位'
					}, {
						field : 'operationStaffName',
						title : '受理员'
					}],
					rowStyle : function(row, index) {
						// 这里有5个取值代表5中颜色['active', 'success', 'info', 'warning',
						// 'danger'];
						var strclass = {};
						if (row.separateListType == "1") {
							strclass = {
								css : {
									'background-color' : '#FFCCCC'
								}
							};// 还有一个active
						}
						return strclass
					},
					onDblClickRow: function (row, tr) {
	                    // 进行你的操作，如弹出新窗口
	                   var businessRecsiptId = row.businessRecsiptId;
	                   $("#businessRecsiptIds").val(businessRecsiptId);
	               	   $('#tb_history').bootstrapTable('refresh');
	                }
				});
				 oTableInit.queryParams = function(params) {
					var temp = {
						//这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的 
						limit : params.limit, //页面大小 
						offset : params.offset, //页码 
						operationOrg : $("#operationOrg").val(),
						businessRecsiptNo : $("#businessRecsiptNo").val(),
						/* lowDate : $("#lowDate").val(),
						highDate : $("#highDate").val(), */
						workOrderType : $("#workOrderType").val()
					};
					return temp;
				}; 
			
			};
				oTableInit.Init1 = function() {
					$('#tb_history').bootstrapTable({
						url : '../../../../../dispatchHistoryPageQuery.action', //请求后台的URL（*） 
						method : 'get', //请求方式（*） 
						//toolbar : '#toolbar', //工具按钮用哪个容器 
						striped : true, //是否显示行间隔色 
						cache : false, //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*） 
						pagination : true, //是否显示分页（*） 
						sortable : false, //是否启用排序 
						sortOrder : "asc", //排序方式
						queryParamsType : "undefined",
						sidePagination : "server", //分页方式：client客户端分页，server服务端分页（*） 
						pageNumber : 1, //初始化加载第一页，默认第一页 
						pageSize : 5, //每页的记录行数（*） 
						pageList : [ 5, 25, 50, 100 ], //可供选择的每页的行数（*） 
						search : false, //是否显示表格搜索，此搜索是客户端搜索，不会进服务端，所以，个人感觉意义不大 
						strictSearch : true,
						showColumns : true, //是否显示所有的列 
						showRefresh : true, //是否显示刷新按钮
						minimumCountColumns : 2, //最少允许的列数
						clickToSelect : true, //是否启用点击选中行 
						uniqueId : "dispatchHistoryId", //每一行的唯一标识，一般为主键列 
						showToggle : true, //是否显示详细视图和列表视图的切换按钮 
						cardView : false, //是否显示详细视图
						detailView : false, //是否显示父子表
					    queryParams: function queryParams(params) {   //设置查询参数  
			                var param = {    
			                		limit : params.limit, //页面大小 
									offset : params.offset, //页码 
									businessRecsiptId : $("#businessRecsiptIds").val()
			                };    
			                return param;                   
			            },//传递参数（*）
						columns : [ {
							checkbox : true
						}, {
							field : 'operationStaffName',
							title : '操作人'
						}, {
							field : 'operationOrg',
							title : '操作单位'
						}, {
							field : 'handleTime',
							title : '操作时间',
							formatter:function (value){
								return formatDates(value)
							}
						} , {
							field : 'status',
							title : '状态',
							formatter : function(value, row, index) {
								if (row.status == "0") {
									return '正常调度';
								} else {
									return '退回';
								}
							}

						}]
					}); 
					
				};
			
			return oTableInit;
		};
		
		
		$("#btn_query").click(function(){
			 
			 var obj = {
					 url:"../../../../../artificialDispatch.action",
					 silent:true,
					 query:{
						operationOrg : $("#operationOrg").val(),
						businessRecsiptNo : $("#businessRecsiptNo").val(),
						/* lowDate : $("#lowDate").val(),
						highDate : $("#highDate").val(), */
						workOrderType : $("#workOrderType").val()
					 }
			 };
	   	$('#tb_departments').bootstrapTable('refresh',obj);      	
	   });  

		
		
        
         $("#in").click(function(){
        	 $("#in").css("background-color","#dff0d8");
        	 $("#in").css("color","#3c763d");
        	 $("#out").css("background-color","#F0F0F0");
        	 $("#out").css("color","black");
        	 $("#step1").css("display","block");
        	 $("#step2").css("display","none");
         });
		
         $("#out").click(function(){
        	 $("#in").css("background-color","#F0F0F0");
        	 $("#in").css("color","black");
        	 $("#out").css("background-color","#dff0d8");
        	 $("#out").css("color","#3c763d");
        	 $("#step1").css("display","none");
        	 $("#step2").css("display","block");
         });
		var ButtonInit = function() {
			var oInit = new Object();
			var postdata = {};
			oInit.Init = function() {
				// 添加中省的下拉框
				selectProvince("#tx_province");
				// 添加中市的下拉框
				selectCity("#tx");
				// 添加中区的下拉框
				selectDistrict("#tx");
				
				// 省下拉框改变事件
				$('#tx_province').change(function() {
					$('#tx_city').empty();
					$('#tx_city').change();
				})
				// 市下拉框改变事件
				$('#tx_city').change(function() {
					$('#tx_district').empty();
				})
				
				
				//初始化页面上面的按钮事件 
				$("#btn_allocation").click(function(){
					clean();
						var select = $('#tb_departments').bootstrapTable(
								'getSelections');
						var separateListType = [];
						var businessRecsiptId = [];
						for (var i = 0; i < select.length; i++) {
							businessRecsiptId[i] = select[i]['businessRecsiptId'];
							separateListType[i] = select[i]['separateListType'];
						}
					    if (select.length === 0) {
							toastr.warning('请选择一行进行分配!');
						}else if(select.length>1){
							toastr.warning('一次只能分配一行!');
						}else if(separateListType[0] === 0){
							toastr.warning('该新单是下单成功，无需分配!');
						}else{	
							$("#myModal").modal("show");
						}
						//初始化组织类型下拉框
						$.ajax({
							type:"get",
							async:true,
							url : '../../../../../findAllOrganizations.action',
							success:function(response){
								var html = "";
								for(var i=0;i<response.length;i++) {
									html = html+"<option id='"+response[i].orgId+"'>"+response[i].orgName+"</option>";
								}
								$("#operationOrgs").append(html);
								$(".selectpicker").selectpicker("refresh");
							}
						});
						
					    var orgId="";
						for(var i=0;i<$("#orgNamess").children().length;i++){
							if($("#orgNamess").children()[i].selected){
								orgId = $($("#orgNamess").children()[i]).attr("id");
							}
						} 
						
						$('#fetchAddress').val(select[0].fetchAddress);
						$('#sortingCode').val(select[0].sortingCode);
							
						});
				
		    //内部分配			
			$("#allocation").click(function(){
				 //获取单行数据
	       	    var select = $('#tb_departments').bootstrapTable('getSelections');
	       	    
	       	 var businessRecsiptId = [];
	       	    var businessRecsiptNo = [];
	       	    var customerNo = [];
	       	    var staffName = [];
	       	    var customerName = [];
	       	    var fetchAddress = [];
	       	    var contacts = [];
	       	    var telephone = [];
	       	    var weight = [];
	       	    var volume = [];
	       	    var arrivalCity = [];
	       	    var remarks = [];
 			   //获取单行数据
 				for (var i = 0; i < select.length; i++) {
 					businessRecsiptId[i] = select[i]['businessRecsiptId'];
 					businessRecsiptNo[i] = select[i]['businessRecsiptNo'];
 					customerNo[i] = select[i]['customerNo'];
 					staffName[i] = select[i]['staffName'];
 					customerName[i] = select[i]['customerName'];
 					fetchAddress[i] = select[i]['fetchAddress'];
 					contacts[i] = select[i]['contacts'];
 					telephone[i] = select[i]['telephone'];
 					weight[i] = select[i]['weight'];
 					volume[i] = select[i]['volume'];
 					arrivalCity[i] = select[i]['arrivalCity'];
 					remarks[i] = select[i]['remarks'];
 				}
 			   
 				/* var dispatchId = [];
    			//获取单行数据
    				for (var i = 0; i < select.length; i++) {
    					dispatchId[i] = select[i]['dispatchId'];
    				} */
				
				$.ajax({
					type: "GET", 
					url:'../../../../../distribution.action',
					data :{fetchAddress:$("#fetchAddress").val(),
						   sortingCode:$("#sortingCode").val(),
						   businessRecsiptId:businessRecsiptId[0],
						   //dispatchId:dispatchId[0],
						   businessRecsiptNo:businessRecsiptNo[0],
						   customerNo:customerNo[0],
						   staffName:staffName[0],
						   customerName:customerName[0],
						   fetchAddress:fetchAddress[0],
						   contacts:contacts[0],
						   telephone:telephone[0],
						   weight:weight[0],
						   volume:volume[0],
						   arrivalCity:arrivalCity[0],
						   remarks:remarks[0]},
					success:function(result) {
						if (result == "success") {
							toastr.success('分配成功!');
							toastr.info("匹配到正确分拣编码!");
						} else {
							toastr.error('分配失败!');
							toastr.info("无法匹配到正确分拣编码!");
						}
						$('#tb_departments').bootstrapTable('refresh',{url:'../../../../../artificialDispatch.action'});
					}
				});
				
			});
			
			//外部分配=======================================
			$("#allocations").click(function(){
				//获取单行数据
	       	    var select = $('#tb_departments').bootstrapTable('getSelections');
	       	    
	       	    var businessRecsiptNo = [];
 			   //获取单行数据
 				for (var i = 0; i < select.length; i++) {
 					businessRecsiptNo[i] = select[i]['businessRecsiptNo'];
 				}
 			   
 				/* var dispatchId = [];
    			//获取单行数据
    				for (var i = 0; i < select.length; i++) {
    					dispatchId[i] = select[i]['dispatchId'];
    				} */
				
				$.ajax({
					type: "GET", 
					url:'../../../../../distributions.action',
					data :{unitOfAcquisition:$("#operationOrgs").val(),
						   businessRecsiptNo:businessRecsiptNo[0]},
					success:function(result) {
						if (result == "success") {
							toastr.success('外部分配成功!');
							toastr.info("匹配到合作网络!");
						} else {
							toastr.error('内部分配失败!');
							toastr.info("无法匹配到合作网络!");
						}
						$('#tb_departments').bootstrapTable('refresh',{url:'../../../../../artificialDispatch.action'});
					}
				});
			});
                
			
			//退回按钮
				$("#btn_retreat").click(
						
						function() {
							var select = $('#tb_departments').bootstrapTable(
									'getSelections');
							if (select.length === 0) {
								toastr.warning('请选择一行进行退回!');
							}else if(select.length>1){
								toastr.warning('一次只能退回一行!');
							}else{							  
								 $("#Model").modal("show");
							}
							clean();
							//初始化组织类型下拉框
							$.ajax({
								type:"get",
								async:true,
								url : '../../../../../findAllOrganizations.action',
								success:function(response){
									var html = "请选择所属单位";
									for(var i=0;i<response.length;i++) {
										html = html+"<option id='"+response[i].orgId+"'>"+response[i].orgName+"</option>";
									}
									$("#operationOrgss").append(html);
									$(".selectpicker").selectpicker("refresh");
								}
							});
							
						});
				
			
			//确认退回
				$("#retreat").click(function(){
					 //获取单行数据
		       	    var select = $('#tb_departments').bootstrapTable('getSelections');
		       	    var businessRecsiptId = [];
		       	    var workOrderId = [];
		       	    var workOrderNo = [];
	    			//获取单行数据
	    				for (var i = 0; i < select.length; i++) {
	    					businessRecsiptId[i] = select[i]['businessRecsiptId'];
	    					workOrderId[i] = select[i]['workOrderId'];
	    					workOrderNo[i] = select[i]['workOrderNo'];
	    				}
					
		       	 $.ajax({
						type: "GET", 
						url:'../../../../../retreat.action',
						data :{retreatReason:$("#retreatReason").val(),
							   takeOrgName:$("#takeOrgNames").val(),
							   businessRecsiptId:businessRecsiptId[0],
							   workOrderId:workOrderId[0],
							   workOrderNo:workOrderNo[0]},
						success:function(eventuate) {
							if (eventuate == "success") {
								toastr.success('退回成功!');
							} else {
								toastr.error('退回失败!');
							}
							$('#tb_departments').bootstrapTable('refresh',{url:'../../../../../artificialDispatch.action'});
						}
					});
					 
				});
                
			
			//销单按钮
				$("#btn_delete").click(
						function() {
							var select = $('#tb_departments').bootstrapTable(
									'getSelections');
							if (select.length === 0) {
								toastr.warning('请选择一行进行销单!');
							}else if(select.length>1){
								toastr.warning('一次只能销单一行!');
							}else{							  
								 $("#Model1").modal("show");
							} 
							
							clean();

						});
				
			
			//确认销单
				$("#delete").click(function(){
					var select = $('#tb_departments').bootstrapTable('getSelections');
					$.ajax({
						url:'../../../../../cancelOrderU.action',
						type:'POST',
						data:{
							businessRecsiptId:select[0]['businessRecsiptId'],
							separateListType:select[0]['separateListType'],
							cause:$("#cancelCause").val(),
							remark:$("#cancelRemark").val()
						},
						success:function(data){
							if(data == 'success'){
								toastr.success('销单成功');
							}else if(data == 'take'){
								toastr.error('已取件');
							}else if(data == 'cancal'){
								toastr.error('已取消');
							}else{
								toastr.error('销单失败');
							}
							$('#tb_departments').bootstrapTable('refresh');
						}
					});
					
				});

			};
			return oInit;
		};
		
		//详细地址的失焦事件
		$("#detailedAddress").blur(function(){
			//省
			var province = $("#tx_province").val();
			//市
			var city = $("#tx_city").val();
			//县
			var district = $("#tx_district").val();
			//详细地址
			var detailedAddress = $("#detailedAddress").val();
			//取件地址
			var fetchAddress =  province+" "+city+" "+district+" "+detailedAddress;
			
			
			   $("#fetchAddress").val(fetchAddress);
			   $.ajax({
					url:"../../../../../findSortingCode.action",
					type:"get",
					data:{
						province : province,
						city : city,
						district : district,
						detailedAddress : detailedAddress,
						},
					success:function(result){
						$("#sortingCode").val(result.ripAreaCode);
					}
				});
			
		});
		
		//上级组织的点击事件
		$("#operationOrgss").click(function(){
			
			var orgId="";
			for(var i=0;i<$("#operationOrgss").children().length;i++){
				if($("#operationOrgss").children()[i].selected){
					orgId = $($("#operationOrgss").children()[i]).attr("id");
				}
			} 
			
			   $("#takeOrgNames").val(operationOrgss);
			   $.ajax({
					url:"../../../../../findParentId.action",
					type:"get",
					data:{
						orgId : orgId
						},
					success:function(response){
						$("#takeOrgNames").val(response.orgName);
					}
				});
			
		});
		
		$(function() {
			$.fn.modal.Constructor.prototype.enforceFocus = function() {};
			//1.初始化Table 
			var oTable = new TableInit();
			oTable.Init();
			oTable.Init1();
			//2.初始化Button的点击事件 
			var oButtonInit = new ButtonInit();
			oButtonInit.Init();
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
		
		function formatDates(ns) {
			var now = new Date(ns);
			var year=now.getYear()+1900;
			var month=now.getMonth()+1;
			var date=now.getDate();
			var hour=now.getHours();
			var minute=now.getMinutes();
			var second=now.getSeconds();
			return year+"-"+month+"-"+date+" "+hour+":"+minute;
		}

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
		
		$(".form_datetime").datetimepicker({
		      format: "yyyy-mm-dd",
		      autoclose: true,
		      todayBtn: true,
		      language:'zh-CN',
		      pickerPosition:"bottom-right",
		      minView:2,
		     
		    });

		function cancel() {
			$('body').css('overflow', 'auto');
			$('body').css('padding-right', '0px');
			$('.model').addClass('hide');
			$('.model-dialog').addClass('hide');
		}
		
		function clean() {
			$("#operationOrgss").children("option").remove();
			$("#operationOrgs").children("option").remove();
			$("#detailedAddress").val("");
			$("#tx_province").children("option").remove();
			$("#tx_city").children("option").remove();
			$("#tx_district").children("option").remove();
            $("#sortingCode").val("");
            $("#takeOrgNames").val("");
            $("#cancelRemark").val("");
		}
		
		
	</script>

</body>
</html>