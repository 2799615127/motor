$(function(){
	
	var oSubStaffIds = [];
	
	$("#workerManage").click(function(){
		var oWorkerInitInit = new workerInit();

		
		oWorkerInitInit.Init();
	});
	
	$("#btn_manager_worker").off("click").on("click",function(){});
	
	$("#btn_manager_worker").click(function(){

		var select = $('#tb_departments_worker').bootstrapTable('getSelections');
		
		if(select.length==0){
			toastr.success('请选择一行进行管理');
		}else{
			var ripAreaId = select[0].ripAreaId;
			
			$("#workerManagerModel").modal("show");
			
			var oStaffs = $('#workerManager_tb').bootstrapTable("getData");
			
			$.ajax({
				url:'ripArea/findWorkerAscByRipAreaIdQuery.action',
				type:"post",
				traditional:true,
				data:{ripAreaId : ripAreaId},
				success:function(response){
						for(var i=0;i<oStaffs.length;i++){
							for(var j=0;j<response.length;j++){
								if(oStaffs[i].staffId==response[j].staff.staffId){
									oSubStaffIds.push(response[j].staff.staffId);
								}
							}
					}
						$('#workerManager_tb').bootstrapTable("refresh");
				
				}
			});
			
		
			$("#hold_sub_worker").off("click").on("click",function(){});
			
			
			$("#hold_sub_worker").one("click",function(){

				var select = $('#workerManager_tb').bootstrapTable('getSelections');
				var staffIds = [];
				
				for(var i=0;i<select.length;i++){
					staffIds.push(select[i].staffId);
				}
				$.ajax({
					url:"ripArea/saveManagerForStaffU.action",
					type:"post",
					traditional:true,
					data:{
						"ripAreaId":ripAreaId,
						"staffIds":staffIds
					},
					success:function(response){
						staffIds.splice(0,staffIds.length);
						if("success"==response){
							toastr.success('成功');
							var opt ={
									url:'ripArea/findWorkerByRipAreaIdQuery.action',
									query :{
										ripAreaId : ripAreaId
									}
							} ;
							$("#tb_worker").bootstrapTable("refresh",opt);
						}else{
							toastr.error('失败');
						}
					}
				});
			});
		};
		
		$('#workerManager_tb').bootstrapTable("refresh");
		oSubStaffIds.splice(0,oSubStaffIds.length);
	
	});
	
	var workerInit = function() {
		var oInit = new Object();
		
		oInit.Init = function() {
			$("#tb_worker").bootstrapTable({
				url : 'ripArea/findWorkerByRipAreaIdQuery.action', //请求后台的URL（*） 
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
				uniqueId : "staffNumber", //每一行的唯一标识，一般为主键列 
				showToggle : false, //是否显示详细视图和列表视图的切换按钮 
				cardView : false, //是否显示详细视图
				detailView : false, //是否显示父子表
				formatNoMatches: function () {  //没有匹配的结果  
				    return '请选择一行';  
				  },
				columns : [{
					field : 'staffNumber',
					title : '取派员编号'
				}, {
					field : 'staffName',
					title : '取派员名'
				},  {
					field : 'telephone',
					title : '电话号码'
				},{
					field : 'cancelSign',
					title : '作废标记'
				}],
			});
			
			$("#tb_departments_worker").bootstrapTable({
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
						url:'ripArea/findWorkerByRipAreaIdQuery.action',
						query :{
							ripAreaId : ripAreaId
						}
					}
					$("#tb_worker").bootstrapTable('refresh',opt);

				}
			});
			
			$("#workerManager_tb").bootstrapTable({
				url : 'ripArea/findAllStaff.action', //请求后台的URL（*） 
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
		       
		                if (row.cancelSign == "1") {
		                    strclass = 'danger';//还有一个active
		                }
		                else {
		                    return {};
		                }
		                
		                return { classes: strclass }
		            },
				columns : [ {
					field : 'checked',
		            checkbox : true,
		            formatter : stateWorkerFormatter
				}, {
					field : 'staffNumber',
					title : '职员编号'
				}, {
					field : 'staffName',
					title : '职员名称'
				},  {
					field : 'telephone',
					title : '电话号码'
				},{
					field : 'cancelSign',
					title : '作废标准'
				} ],
			});
		};
		return oInit;
	}
	
	function stateWorkerFormatter(value, row, index) {
		var select = $('#tb_departments_worker').bootstrapTable('getSelections');
	    if(select.length>0){
	    for(var i=0;i<oSubStaffIds.length;i++){
	    	if (row.staffId == oSubStaffIds[i]){
		    	return {
		            checked : true//设置选中   
		        };
		    }
	    }

	  }
	    return value;
	}
	
});