$(function(){
	function queryParams(params) {
		var temp={
				//这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的 
				limit : params.limit, //页面大小 
				offset : params.offset, //页码 
				ripAreaName : $("#txt_search_departmentname").val(),
				ripAreaFunctionary : $("#txt_search_statu").val(),
				ripAreaId:'',
				findXIAN:$("#findXIAN").val()
				
		}
		return temp;
	}
	
	$("#subAreaManage").click(function(){
		var oSubAreaInit = new subAInit();
		
		oSubAreaInit.Init();
		
		
		
		$("#tb_departments_subArea").bootstrapTable({
			url : 'ripArea/pageQuery.action', //请求后台的URL（*） 
			method : 'get', //请求方式（*） 
			striped : true, //是否显示行间隔色 
			cache : false, //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*） 
			pagination : true, //是否显示分页（*） 
			sortable : false, //是否启用排序 
			sortOrder : "asc", //排序方式
			queryParams : queryParams,//传递参数（*） 
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
					url:'ripArea/findSubAreaByRipAreaIdQuery.action',
					query :{
						ripAreaId : ripAreaId
					}
				}
				$("#tb_subArea").bootstrapTable('refresh',opt);
			}
		});
		
		$("#subAreaManager_tb").bootstrapTable({
			url : 'ripArea/subareaAscRipAreaIdPageQuery.action', //请求后台的URL（*） 
			method : 'get', //请求方式（*） 
			striped : false, //是否显示行间隔色 
			cache : false, //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*） 
			pagination : true, //是否显示分页（*） 
			sortable : false, //是否启用排序 
			sortOrder : "asc", //排序方式
			queryParams : queryParams,//传递参数（*） 
			sidePagination : "server", //分页方式：client客户端分页，server服务端分页（*） 
			pageNumber : 1, //初始化加载第一页，默认第一页 
			pageSize : 10, //每页的记录行数（*） 
			pageList : [ 10, 25, 50, 100], //可供选择的每页的行数（*） 
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
	                var sele = $('#tb_departments_subArea').bootstrapTable('getSelections');
	                if(sele.length>0){
	                if (row.ripAreaId == sele[0].ripAreaId) {
	                    strclass = 'info';//还有一个active
	                }
	                else {
	                    return {};
	                }
	                }
	                return { classes: strclass }
	            },
			columns : [ {
				field : 'checked',                 
	            checkbox : true,
	            formatter : stateFormatter
			}, {
				field : 'province',
				title : '省'
			}, {
				field : 'city',
				title : '市'
			},  {
				field : 'district',
				title : '县'
			},{
				field : 'keyword',
				title : '关键字'
			} ]
		});
		
		var oSubAreaIds = []
		
		function stateFormatter(value, row, index) {
			var select = $('#tb_departments_subArea').bootstrapTable('getSelections');
		    if(select.length>0){
			if (row.ripAreaId == select[0].ripAreaId){
		    	oSubAreaIds.push(row.subareaId);
		    	return {
		            checked : true//设置选中   
		        };
		    }
		    }
		    return value;
		}
	
		
		$("#btn_manager").click(function(){
			var select = $('#tb_departments_subArea').bootstrapTable('getSelections');
		
			if(select.length==0){
				toastr.success('请选择一行进行管理');
			}else{
				var ripAreaId = select[0].ripAreaId;
				var ripAreaCode = select[0].ripAreaCode;              
				$("#subAreaManagerModel").modal("show");
				var opt ={
						url:'ripArea/subareaAscRipAreaIdPageQuery.action',
						query :{
							ripAreaId : ripAreaId
						}
				} ;
				
				$('#subAreaManager_tb').bootstrapTable("refresh",opt);
				
				$("#find_subarea").click(function(){
					
					var opt ={
							url:'ripArea/subareaAscRipAreaIdPageQuery.action',
							query :{
								ripAreaId : ripAreaId,
								
							}
					} ;
					
					$('#subAreaManager_tb').bootstrapTable("refresh",opt);
				});
				
				$("#hold_sub").click(function(){
					var select = $('#subAreaManager_tb').bootstrapTable('getSelections');
					var subAreaIds = [];
					var subAreaProvinces = [];
					var subAreaCitys = [];
					var subAreaDistricts =[];
					
					for(var i=0;i<select.length;i++){
						subAreaIds.push(select[i].subareaId);
						subAreaProvinces.push(select[i].province);
						subAreaCitys.push(select[i].city);
						subAreaDistricts.push(select[i].district);
						
						if(select[i].ripAreaId==ripAreaId){
							for(var j=0;j<oSubAreaIds.length;j++){
								if(oSubAreaIds[j]==select[i].subareaId){
									oSubAreaIds.splice(j,1);
								}
							}
						}
					}
					$.ajax({
						url:"ripArea/saveManagerForSubAreaU.action",
						type:"post",
						traditional:true,
						data:{
							"subAreaIds":subAreaIds,
							"subAreaProvinces":subAreaProvinces,
							"subAreaCitys":subAreaCitys,
							"subAreaDistricts":subAreaDistricts,
							"ripAreaId":ripAreaId,
							"ripAreaCode":ripAreaCode,
							"oSubAreaIds":oSubAreaIds
							
						},
						success:function(response){
							subAreaIds.splice(0,subAreaIds.length);
							oSubAreaIds.splice(0,oSubAreaIds.length);
							if("success"==response){
								toastr.success('成功');
							}else if("warning"==response){
								toastr.warning('管理出现错误，请重新为你的分区指定定区');
							}else{
								toastr.error("未知错误");
							}
							$('#subAreaManager_tb').bootstrapTable("refresh");      	
							
							var opt ={
									url:'ripArea/findSubAreaByRipAreaIdQuery.action',
									query :{
										ripAreaId : ripAreaId
									}
							} ;
							
							$("#tb_subArea").bootstrapTable("refresh",opt);
							$("#tb_departments_subArea").bootstrapTable('refresh',queryParams);
							$("tb_departments").bootstrapTable('refresh',queryParams);
						}
					});
				});
			};
		});
	});
	
	
	var subAInit = function() {
		var oInit = new Object();
		
		oInit.Init = function() {
			$("#tb_subArea").bootstrapTable({
				url : 'ripArea/findSubAreaByRipAreaIdQuery.action', //请求后台的URL（*） 
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
				uniqueId : "province", //每一行的唯一标识，一般为主键列 
				showToggle : false, //是否显示详细视图和列表视图的切换按钮 
				cardView : false, //是否显示详细视图
				detailView : false, //是否显示父子表
				formatNoMatches: function () {  //没有匹配的结果  
				    return '请选择一行';  
				  },
				columns : [  {
					field : 'province',
					title : '省'
				}, {
					field : 'city',
					title : '市'
				},  {
					field : 'district',
					title : '县'
				},{
					field : 'keyword',
					title : '关键字'
				}],
			});
		};
		return oInit;
	}
	
});