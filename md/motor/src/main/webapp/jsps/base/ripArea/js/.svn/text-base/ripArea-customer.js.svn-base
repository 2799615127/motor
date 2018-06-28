$(function(){
	
	var oSubCustomerIds = [];
	
	$("#clientManage").click(function(){
		var oCustomerInitInit = new customerInit();

		
		oCustomerInitInit.Init();
	});
	
	$("#btn_manager_customer").off("click").on("click",function(){});
	
	$("#btn_manager_customer").click(function(){

		var select = $('#tb_departments_customer').bootstrapTable('getSelections');
		
		if(select.length==0){
			toastr.success('请选择一行进行管理');
		}else{
			var ripAreaId = select[0].ripAreaId;
			
			$("#customerManagerModel").modal("show");
			
			var oCustomerIds = $('#customerManager_tb').bootstrapTable("getData");
			$.ajax({
				url:'ripArea/findCustomerAscByRipAreaIdQuery.action',
				type:"post",
				traditional:true,
				data:{ripAreaId : ripAreaId},
				success:function(response){
						for(var i=0;i<oCustomerIds.length;i++){
							for(var j=0;j<response.length;j++){
								if(oCustomerIds[i].customerId==response[j].customer.customerId){
									oSubCustomerIds.push(response[j].customer.customerId);
								}
							}
					}
						$('#customerManager_tb').bootstrapTable("refresh");
				
				}
			});
			
		
			$("#hold_sub_customer").off("click").on("click",function(){});
			
			
			$("#hold_sub_customer").one("click",function(){

				var select = $('#customerManager_tb').bootstrapTable('getSelections');
				var customerIds = [];
				
				for(var i=0;i<select.length;i++){
					customerIds.push(select[i].customerId);
				}
				$.ajax({
					url:"ripArea/saveManagerForCustomerU.action",
					type:"post",
					traditional:true,
					data:{
						"ripAreaId":ripAreaId,
						"customerIds":customerIds
					},
					success:function(response){
						customerIds.splice(0,customerIds.length);
						if("success"==response){
							toastr.success('成功');
							var opt ={
									url:'ripArea/findCustomerByRipAreaIdQuery.action',
									query :{
										ripAreaId : ripAreaId
									}
							} ;
							$("#tb_customer").bootstrapTable("refresh",opt);
						}else{
							toastr.error('失败');
						}
					}
				});
			});
		};
		
		$('#customerManager_tb').bootstrapTable("refresh");
		oSubCustomerIds.splice(0,oSubCustomerIds.length);
	
	});
	
	var customerInit = function() {
		var oInit = new Object();
		
		oInit.Init = function() {
			$("#tb_customer").bootstrapTable({
				url : 'ripArea/findCustomerByRipAreaIdQuery.action', //请求后台的URL（*） 
				method : 'get', //请求方式（*） 
				striped : true, //是否显示行间隔色 
				cache : false, //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*） 
				pagination : true, //是否显示分页（*） 
				sortable : false, //是否启用排序 
				sortOrder : "asc", //排序方式
				queryParams : function queryParams(params) {
					var temp={
							//这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的 
							limit : params.limit, //页面大小 
							offset : params.offset, //页码 
							ripAreaName : $("#txt_search_departmentname").val(),
							ripAreaFunctionary : $("#txt_search_statu").val(),
					}
					return temp;
				},//传递参数（*） 
				sidePagination : "server", //分页方式：client客户端分页，server服务端分页（*） 
				pageNumber : 1, //初始化加载第一页，默认第一页 
				pageSize : 10, //每页的记录行数（*） 
				pageList : [ 10, 25, 50, 100 ], //可供选择的每页的行数（*） 
				search : false, //是否显示表格搜索，此搜索是客户端搜索，不会进服务端，所以，个人感觉意义不大 
				strictSearch : false,
				showColumns : false, //是否显示所有的列 
				showRefresh : false, //是否显示刷新按钮
				minimumCountColumns : 5, //最少允许的列数
				clickToSelect : true, //是否启用点击选中行 
				height : 600, //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度 
				uniqueId : "customerName", //每一行的唯一标识，一般为主键列 
				showToggle : false, //是否显示详细视图和列表视图的切换按钮 
				cardView : false, //是否显示详细视图
				detailView : false, //是否显示父子表
				formatNoMatches: function () {  //没有匹配的结果  
				    return '请选择一行';  
				  },
				columns : [  {
					field : 'customerName',
					title : '客户姓名'
				}, {
					field : 'contacts',
					title : '联系人'
				},  {
					field : 'telephone',
					title : '电话号码'
				},{
					field : 'address',
					title : '地址'
				}],
			});
			
			$("#tb_departments_customer").bootstrapTable({
				url : 'ripArea/pageQuery.action', //请求后台的URL（*） 
				method : 'get', //请求方式（*） 
				striped : true, //是否显示行间隔色 
				cache : false, //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*） 
				pagination : true, //是否显示分页（*） 
				sortable : false, //是否启用排序 
				sortOrder : "asc", //排序方式
				queryParams : function queryParams(params) {
					var temp={
							//这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的 
							limit : params.limit, //页面大小 
							offset : params.offset, //页码 
							ripAreaName : $("#txt_search_departmentname").val(),
							ripAreaFunctionary : $("#txt_search_statu").val()
					}
					return temp;
				},//传递参数（*） 
				sidePagination : "server", //分页方式：client客户端分页，server服务端分页（*） 
				pageNumber : 1, //初始化加载第一页，默认第一页 
				pageSize : 10, //每页的记录行数（*） 
				pageList : [ 10, 25, 50, 100 ], //可供选择的每页的行数（*） 
				search : false, //是否显示表格搜索，此搜索是客户端搜索，不会进服务端，所以，个人感觉意义不大 
				strictSearch : true,
				showColumns : false, //是否显示所有的列 
				showRefresh : false, //是否显示刷新按钮
				minimumCountColumns : 2, //最少允许的列数
				clickToSelect : true, //是否启用点击选中行 
				height : 600, //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度 
				uniqueId : "ripAreaCode", //每一行的唯一标识，一般为主键列 
				showToggle : false, //是否显示详细视图和列表视图的切换按钮 
				cardView : false, //是否显示详细视图
				detailView : false, //是否显示父子表
				 singleSelect: true,//复选框只能选择一条记录
				columns : [ {
					checkbox : true
				}, {
					field : 'ripAreaCode',
					title : '定区编码'
				}, {
					field : 'ripAreaName',
					title : '定区名称'
				},  {
					field : 'userName',
					title : '定区负责人'
				} ],
				onClickRow: function (row) {
				
					var ripAreaId = row.ripAreaId;
					
					var opt ={
						url:'ripArea/findCustomerByRipAreaIdQuery.action',
						query :{
							ripAreaId : ripAreaId
						}
					}
					$("#tb_customer").bootstrapTable('refresh',opt);

				}
			});
			
			$("#customerManager_tb").bootstrapTable({
				url : 'ripArea/findAllCustomer.action', //请求后台的URL（*） 
				method : 'get', //请求方式（*） 
				striped : false, //是否显示行间隔色 
				cache : false, //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*） 
				pagination : true, //是否显示分页（*） 
				sortable : false, //是否启用排序 
				sortOrder : "asc", //排序方式
				queryParams : function queryParams(params) {
					var temp={
							//这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的 
							limit : params.limit, //页面大小 
							offset : params.offset, //页码 
							ripAreaName : $("#txt_search_departmentname").val(),
							ripAreaFunctionary : $("#txt_search_statu").val(),
							ripAreaId:''
					}
					return temp;
				},//传递参数（*） 
				sidePagination : "server", //分页方式：client客户端分页，server服务端分页（*） 
				pageNumber : 1, //初始化加载第一页，默认第一页 
				pageSize : 10, //每页的记录行数（*） 
				pageList : [ 10, 25, 50, 100 ], //可供选择的每页的行数（*） 
				search : false, //是否显示表格搜索，此搜索是客户端搜索，不会进服务端，所以，个人感觉意义不大 
				strictSearch : true,
				showColumns : false, //是否显示所有的列 
				showRefresh : false, //是否显示刷新按钮
				minimumCountColumns : 2, //最少允许的列数
				clickToSelect : true, //是否启用点击选中行 
				height : 500, //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度 
				uniqueId : "province", //每一行的唯一标识，一般为主键列 
				showToggle : false, //是否显示详细视图和列表视图的切换按钮 
				cardView : false, //是否显示详细视图
				detailView : false, //是否显示父子表

				 rowStyle: function (row, index) {
		                //这里有5个取值代表5中颜色['active', 'success', 'info', 'warning', 'danger'];
		                var strclass = "";
		       
		                if ("1" == "1") {
		                   // strclass = 'danger';//还有一个active
		                }
		                else {
		                    return {};
		                }
		                
		                return { classes: strclass }
		            },
				columns : [ {
					field : 'checked',
		            checkbox : true,
		            formatter : stateCustomerFormatter
				},  {
					field : 'customerName',
					title : '客户姓名'
				}, {
					field : 'contacts',
					title : '联系人'
				},  {
					field : 'telephone',
					title : '电话号码'
				},{
					field : 'address',
					title : '地址'
				} ],
			});
		};
		return oInit;
	}
	
	function stateCustomerFormatter(value, row, index) {
		var select = $('#tb_departments_customer').bootstrapTable('getSelections');
	    if(select.length>0){
	    	for(var i=0;i<oSubCustomerIds.length;i++){
	    	if (row.customerId == oSubCustomerIds[i]){
		    	return {
		            checked : true//设置选中   
		        };
		    }
	    }

	  }
	    return value;
	}
	
});