		var comparisonTable = new Object();
  		comparisonTable.queryParams = function(params) {
		 		var temp = {
		 			//这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的 
		 			pageSize : params.limit, //页面大小 
		 			start : params.offset, //页码 
		 			sStorageDeliveryNum : $("#storageDeliveryNums").val()
		 		};
		 		return temp;
		}; 
		
		var beComparisonTable = new Object();
  		beComparisonTable.queryParams = function(params) {
		 		var temp = {
		 			//这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的 
		 			pageSize : params.limit, //页面大小 
		 			start : params.offset, //页码 
		 			sStorageDeliveryNumSon : $("#storageDeliveryNumSon").val()
		 		};
		 		return temp;
		}; 

		var chooseTable = new Object();
		chooseTable.queryParams = function(params) {
	 		var temp = {
	 			//这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的 
	 			pageSize : params.limit, //页面大小 
	 			start : params.offset, //页码 
	 			sStorageDeliveryNumSon : $("#storageDeliveryNumSon").val()
	 		};
	 		return temp;
		}; 
				
		var storageConnectTable = new Object();
		storageConnectTable.queryParams = function(params) {
	 		var temp = {
	 			//这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的 
	 			pageSize : params.limit, //页面大小 
	 			start : params.offset, //页码 
	 			startComeGoodsTime : $("#txt_search_startComeGoodsTime").val(),
	 			endComeGoodsTime : $("#txt_search_endComeGoodsTime").val(),
	 			comeGoodsPerson : $("#txt_search_comeGoodsPerson").val(),
	 			comeGoodsUnit : $("#txt_search_comeGoodsUnit").val(),
	 			sendGoodsPerson : $("#txt_search_sendGoodsPerson").val(),
	 			sendGoodsUnit : $("#txt_search_sendGoodsUnit").val()
	 		};
	 		return temp;
		};

		var storageConnectSonTable = new Object();
		storageConnectSonTable.queryParams = function(params) {
	 		var temp = {
	 			//这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的 
	 			pageSize : params.limit, //页面大小 
	 			start : params.offset, //页码 
	 			status : $("#txt_search_status").val(),
	 			storageConnectNumSon : $("#txt_search_storageConnectNumSon").val(),
	 			packageNumber : $("#txt_search_packageNumber").val()
	 		};
	 		return temp;
		};
		
		storageConnectSonTable.queryParamsById = function(params) {
	 		var temp = {
	 			//这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的 
	 			pageSize : params.limit, //页面大小 
	 			start : params.offset, //页码 
	 		};
	 		return temp;
		};

  		$(function(){
  			$(".selectpicker").selectpicker("refresh");
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
  			//初始化Table 
  			comparisonTable.Init = function() {
  				$('#comparisonTable').bootstrapTable({
  					url : '/noob/binStorage/binStorageSonByNumPageQuery.action', //请求后台的URL（*） 
  					method : 'get', //请求方式（*） 
  					striped : true, //是否显示行间隔色 
  					cache : false, //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*） 
  					pagination : true, //是否显示分页（*） 
  					sortable : false, //是否启用排序 
  					sortOrder : "asc", //排序方式
  					queryParams : comparisonTable.queryParams,//传递参数（*） 
  					sidePagination : "server", //分页方式：client客户端分页，server服务端分页（*） 
  					pageNumber : 1, //初始化加载第一页，默认第一页 
  					pageSize : 10, //每页的记录行数（*） 
  					pageList : [ 10, 25, 50, 100 ], //可供选择的每页的行数（*） 
  					strictSearch : true,
  					maintainSelected:true,//翻页复选框状态不会改变
  					clickToSelect:true,
  					showColumns : false, //是否显示所有的列 
  					showRefresh : false, //是否显示刷新按钮
  					minimumCountColumns : 2, //最少允许的列数
  					clickToSelect : true, //是否启用点击选中行 
  					showToggle : false, //是否显示详细视图和列表视图的切换按钮 
  					cardView : false, //是否显示详细视图
  					detailView : false, //是否显示父子表
  					rowStyle: function (row, index) {
  		                var strclass = {};
  		              	if(row.serverFlag=="false"){
							strclass = {css:{'background-color':'#FFCCCC'}};
						}
  		                return strclass 
  		            },columns : [ {
  						checkbox : true,
  						formatter:stateUserFormatter
  					},{
  						field : 'sStatus',
  						title : '状态'
  					}, {
  						field : 'storageDeliveryNum',
  						title : '交接单号'
  					},{
  						field : 'storageDeliveryNumSon',
  						title : '单号'
  					}]
  				});
  			}; //得到查询的参数
  			comparisonTable.Init();
  			 			
  			//初始化Table 
  			beComparisonTable.Init = function() {
  				$('#beComparisonTable').bootstrapTable({
  					url : '/noob/binStorage/binStorageSonByTermPageQuery.action', //请求后台的URL（*） 
  					method : 'get', //请求方式（*） 
  					striped : true, //是否显示行间隔色 
  					cache : false, //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*） 
  					pagination : true, //是否显示分页（*） 
  					sortable : false, //是否启用排序 
  					sortOrder : "asc", //排序方式
  					queryParams : beComparisonTable.queryParams,//传递参数（*） 
  					sidePagination : "server", //分页方式：client客户端分页，server服务端分页（*） 
  					pageNumber : 1, //初始化加载第一页，默认第一页 
  					pageSize : 10, //每页的记录行数（*） 
  					pageList : [ 10, 25, 50, 100 ], //可供选择的每页的行数（*） 
  					strictSearch : true,
  					maintainSelected:true,//翻页复选框状态不会改变
  					clickToSelect:true,
  					showColumns : false, //是否显示所有的列 
  					showRefresh : false, //是否显示刷新按钮
  					minimumCountColumns : 2, //最少允许的列数
  					clickToSelect : true, //是否启用点击选中行 
  					showToggle : false, //是否显示详细视图和列表视图的切换按钮 
  					cardView : false, //是否显示详细视图
  					detailView : false, //是否显示父子表
  					rowStyle: function (row, index) {
  		                var strclass = {};
  		              	if(row.clientFlag=="false"){
							strclass = {css:{'background-color':'yellow'}};
						}
  		                return strclass 
  		            },columns : [ {
  						checkbox : true,
  						formatter:stateUserFormatter
  					},{
  						field : 'storageDeliveryNum',
  						title : '关联交接单号'
  					}, {
  						field : 'storageDeliveryNumSon',
  						title : '单号'
  					}, {
  						field : 'packageNumber',
  						title : '合包号'
  					}, {
  						field : 'weight',
  						title : '重量'
  					}]
  				});
  			}; //得到查询的参数
  			beComparisonTable.Init();
  			//初始化Table 
  			storageConnectTable.Init = function() {
  				$('#storageConnectTable').bootstrapTable({
  					url : '/noob/binStorage/storageConnectQuery.action', //请求后台的URL（*） 
  					method : 'get', //请求方式（*） 
  					striped : true, //是否显示行间隔色 
  					cache : false, //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*） 
  					pagination : true, //是否显示分页（*） 
  					sortable : false, //是否启用排序 
  					sortOrder : "asc", //排序方式
  					queryParams : storageConnectTable.queryParams,//传递参数（*） 
  					sidePagination : "server", //分页方式：client客户端分页，server服务端分页（*） 
  					pageNumber : 1, //初始化加载第一页，默认第一页 
  					pageSize : 5, //每页的记录行数（*） 
  					pageList : [ 5, 10, 25, 50 ], //可供选择的每页的行数（*） 
  					strictSearch : true,
  					maintainSelected:true,//翻页复选框状态不会改变
  					clickToSelect:true,
  					showColumns : false, //是否显示所有的列 
  					showRefresh : false, //是否显示刷新按钮
  					minimumCountColumns : 2, //最少允许的列数
  					clickToSelect : true, //是否启用点击选中行 
  					showToggle : false, //是否显示详细视图和列表视图的切换按钮 
  					cardView : false, //是否显示详细视图
  					detailView : false, //是否显示父子表
  					columns : [ {
  						field : 'storageConnectNum',
  						title : '入库交接单号'
  					}, {
  						field : 'comeGoodsPerson',
  						title : '接货人'
  					}, {
  						field : 'comeGoodsUnit',
  						title : '接收单位'
  					}, {
  						field : 'sendGoodsPerson',
  						title : '发货人'
  					}, {
  						field : 'sendGoodsUnit',
  						title : '发出单位'
  					}, {
  						field : 'comeGoodsTime',
  						title : '接单时间'
  					}],
  					onDblClickRow:function(row,$element){
  						$('#storageConnectSonTable').bootstrapTable("refresh",{
  						    url:"/noob/binStorage/storageConnectSonQueryById.action"+
  						    "?storageConnectId="+row.storageConnectId,
  						    queryParams:storageConnectSonTable.queryParamsById
  						});
  					}
  				});
  			}; //得到查询的参数
  			storageConnectTable.Init();
  			//初始化Table 
  			storageConnectSonTable.Init = function() {
  				$('#storageConnectSonTable').bootstrapTable({
  					url : '/noob/binStorage/storageConnectSonQuery.action', //请求后台的URL（*） 
  					method : 'get', //请求方式（*） 
  					striped : true, //是否显示行间隔色 
  					cache : false, //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*） 
  					pagination : true, //是否显示分页（*） 
  					sortable : false, //是否启用排序 
  					sortOrder : "asc", //排序方式
  					queryParams : storageConnectSonTable.queryParams,//传递参数（*） 
  					sidePagination : "server", //分页方式：client客户端分页，server服务端分页（*） 
  					pageNumber : 1, //初始化加载第一页，默认第一页 
  					pageSize : 5, //每页的记录行数（*） 
  					pageList : [ 5, 10, 25, 50 ], //可供选择的每页的行数（*） 
  					strictSearch : true,
  					maintainSelected:true,//翻页复选框状态不会改变
  					clickToSelect:true,
  					showColumns : false, //是否显示所有的列 
  					showRefresh : false, //是否显示刷新按钮
  					minimumCountColumns : 2, //最少允许的列数
  					clickToSelect : true, //是否启用点击选中行 
  					showToggle : false, //是否显示详细视图和列表视图的切换按钮 
  					cardView : false, //是否显示详细视图
  					detailView : false, //是否显示父子表
  					columns : [ {
  						field : 'storageConnectNumSon',
  						title : '单号'
  					}, {
  						field : 'packageNumber',
  						title : '合包号'
  					}, {
  						field : 'weight',
  						title : '重量'
  					}, {
  						field : 'storageDeliveryNum',
  						title : '关联出库交接单'
  					}, {
  						field : 'status',
  						title : '状态',
  						formatter : function(value, row, index) {
							if (row.status == '1') {
								return '中转入库';
							} else if(row.status == '2'){
								return '二次入库';
							} else if(row.status == '3'){
								return '初始入库';
							} else if(row.status == '4'){
								return '有货无单';
							}
						}
  					}]
  				});
  			}; //得到查询的参数
  			storageConnectSonTable.Init();
  			//初始化Table 
  			chooseTable.Init = function() {
  				$('#chooseTable').bootstrapTable({
  					url : null, //请求后台的URL（*） 
  					method : 'get', //请求方式（*） 
  					striped : true, //是否显示行间隔色 
  					cache : false, //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*） 
  					pagination : true, //是否显示分页（*） 
  					sortable : false, //是否启用排序 
  					sortOrder : "asc", //排序方式
  					queryParams : chooseTable.queryParams,//传递参数（*） 
  					sidePagination : "server", //分页方式：client客户端分页，server服务端分页（*） 
  					pageNumber : 1, //初始化加载第一页，默认第一页 
  					pageSize : 5, //每页的记录行数（*） 
  					pageList : [ 5, 10, 25, 50 ], //可供选择的每页的行数（*） 
  					strictSearch : true,
  					maintainSelected:true,//翻页复选框状态不会改变
  					clickToSelect:true,
  					showColumns : false, //是否显示所有的列 
  					showRefresh : false, //是否显示刷新按钮
  					minimumCountColumns : 2, //最少允许的列数
  					clickToSelect : true, //是否启用点击选中行 
  					showToggle : false, //是否显示详细视图和列表视图的切换按钮 
  					cardView : false, //是否显示详细视图
  					detailView : false, //是否显示父子表
  					columns : [ {
  						checkbox : true,
  						formatter:stateUserFormatter
  					},{
  						field : 'storageDeliveryNum',
  						title : '交接单号'
  					}, {
  						field : 'sDeliveryReceitpType',
  						title : '类别'
  					}]
  				});
  			}; //得到查询的参数
  			chooseTable.Init();
  			
  			function stateUserFormatter(value,row,index){
  				/* for(var i=0;i<onCheckUserIds.length;i++){
  					if(row.userId==onCheckUserIds[i]){
  						return {
  							checked:true
  						};
  					}
  				} */
  				return value;
  			}
  			
  			$("#storageDelivery_addBtn").click(function(){
  				if($("#storageDeliveryNums_text").val().trim()==''){
  					toastr.warning("不能为空");
  				}else if($("#storageDeliveryNums_text").val().trim().length!=13){
  					toastr.warning("出库交接单号长度需为13位");
  				}else{
  					$("#storageDeliveryNums").val($("#storageDeliveryNums").val()+
  	  						$("#storageDeliveryNums_text").val()+',');	
  	  				$('#comparisonTable').bootstrapTable("refresh",{
  				       	url:"/noob/binStorage/binStorageSonByNumPageQuery.action",
  				       	queryParams:comparisonTable.queryParams
  				    });
  				}
  				
  			});
  			
  			$("#storageDeliveryNumSon_addBtn").click(function(){
  				if($("#storageDeliveryNumSon_text").val().trim()==''){
  					toastr.warning("不能为空");
  				}else if($("#storageDeliveryNumSon_text").val().trim().length!=13){
  					toastr.warning("工作单号长度需为13位");
  				}else{
  					$("#storageDeliveryNumSon").val($("#storageDeliveryNumSon").val()+
  	  						$("#storageDeliveryNumSon_text").val()+',');	
  	  				$('#beComparisonTable').bootstrapTable("refresh",{
  				       	url:"/noob/binStorage/binStorageSonByTermPageQuery.action",
  				       	queryParams:beComparisonTable.queryParams
  				    });
  				}
  				
  			});
  			
			$("#storageDelivery_removeBtn").click(function(){
				var  storageDeliveryNums = $('#comparisonTable').bootstrapTable('getSelections');
  				
  				if(storageDeliveryNums.length<=0){
  					toastr.warning("请至少选择一行");
  				}else{
  					for(var i=0;i<storageDeliveryNums.length;i++){	  						
  	  					$("#storageDeliveryNums").val($("#storageDeliveryNums").
  	  									val().replace(storageDeliveryNums[i].
  	  									storageDeliveryNum+",",""));
  	  				}
  	  				
  		  			$('#comparisonTable').bootstrapTable("refresh",{
  					    url:"/noob/binStorage/binStorageSonByNumPageQuery.action",
  					    queryParams:comparisonTable.queryParams
  					});
  				}
			});
			$("#storageDeliveryNumSon_removeBtn").click(function(){
				var  storageDeliveryNumSons = $('#beComparisonTable').bootstrapTable('getSelections');
  				
  				if(storageDeliveryNumSons.length<=0){
  					toastr.warning("请至少选择一行");
  				}else{
  					for(var i=0;i<storageDeliveryNumSons.length;i++){	  						
  	  					$("#storageDeliveryNumSon").val($("#storageDeliveryNumSon").
  	  									val().replace(storageDeliveryNumSons[i].
  	  										storageDeliveryNumSon.substr(0,13)+",",""));
  	  				}
  					$('#beComparisonTable').bootstrapTable("refresh",{
  				       	url:"/noob/binStorage/binStorageSonByTermPageQuery.action",
  				       	queryParams:beComparisonTable.queryParams
  				    });
  				}
			});
					
  			$("#choose_query_btn").click(function(){
  				if($("#storageDeliveryNumSon").val().length<13){
  					toastr.warning("请添加工作单");
  				}else{
  					$('#chooseTable').bootstrapTable("refresh",{
  	  				     url:"/noob/binStorage/binStorageByTermPageQuery.action",
  	  				     queryParams:chooseTable.queryParams
  	  				});

  		  			$("#contrastModal").modal("show");
  				}
  	  			
  								
  			});
  			
  			$("#btn_Obtain_details").click(function(){
  				var  storageDeliveryNums = $('#chooseTable').bootstrapTable('getSelections');
  				
  				if(storageDeliveryNums.length<=0){
  					toastr.warning("请至少选择一行");
  				}else{
  					for(var i=0;i<storageDeliveryNums.length;i++){
  	  					$("#storageDeliveryNums").val($("#storageDeliveryNums").val()+
  	  					storageDeliveryNums[i].storageDeliveryNum+',');	
  	  				}
  	  				
  		  			$('#comparisonTable').bootstrapTable("refresh",{
  					    url:"/noob/binStorage/binStorageSonByNumPageQuery.action",
  					    queryParams:comparisonTable.queryParams
  					});
  		  			$('#contrastModal').modal('hide');
  				}
  				
  			});
  			
			$('#txt_search_startComeGoodsTime').datetimepicker({
				 language: 'zh-CN',
		         autoclose: true,
		         todayHighlight: true
			});
  		
			$('#txt_search_endComeGoodsTime').datetimepicker({
				 language: 'zh-CN',
		         autoclose: true,
		         todayHighlight: true
			});
			
			$("#btn_storageConnect_query").click(function(){
				$('#storageConnectTable').bootstrapTable("refresh",{
					    url:"/noob/binStorage/storageConnectQuery.action",
					    queryParams:storageConnectTable.queryParams
				});
			});
			
			$("#btn_storageConnectSon_query").click(function(){
				$('#storageConnectSonTable').bootstrapTable("refresh",{
				    url:"/noob/binStorage/storageConnectSonQuery.action",
				    queryParams:storageConnectSonTable.queryParams
				});
			});
			
			$("#cleanAllDataBtn").click(function(){
				swal({  
					title: "操作提示",   //弹出框的title  
					text: "确认清空吗？",  //弹出框里面的提示文本  
					type: "warning",    //弹出框类型  
					showCancelButton: true, //是否显示取消按钮  
					confirmButtonColor: "#DD6B55",//确定按钮颜色  
					cancelButtonText: "取消",//取消按钮文本  
					confirmButtonText: "确定",//确定按钮上面的文档  
					closeOnConfirm: true  
				},function(){
					$("#storageDeliveryNums").val("");	
					$("#storageDeliveryNumSon").val("#,");
					$('#comparisonTable').bootstrapTable("refresh",{
						    url:"/noob/binStorage/binStorageSonByNumPageQuery.action",
						    queryParams:comparisonTable.queryParams
					});
					
					$('#beComparisonTable').bootstrapTable("refresh",{
					     url:"/noob/binStorage/binStorageSonByTermPageQuery.action",
					     queryParams:beComparisonTable.queryParams
					});
				});
			});
			
			$("#insert_data_btn").click(function(){
				swal({  
					title: "操作提示",   //弹出框的title  
					text: "确定后数据将导入,确认导入吗？",  //弹出框里面的提示文本  
					type: "warning",    //弹出框类型  
					showCancelButton: true, //是否显示取消按钮  
					confirmButtonColor: "#DD6B55",//确定按钮颜色  
					cancelButtonText: "取消",//取消按钮文本  
					confirmButtonText: "确定",//确定按钮上面的文档  
					closeOnConfirm: true  
				},function(){
					var deliveryData = $("#storageDeliveryNumSon").val();
					var insertData = $("#insert_data_text").val();
					if(isChecked = $("#add_checkbox").prop("checked")==false){
						deliveryData = "#,"+insertData;	  				
					}else{
						deliveryData = deliveryData + insertData;
					} 
					$("#storageDeliveryNumSon").val(deliveryData);
					$('#beComparisonTable').bootstrapTable("refresh",{
				       	url:"/noob/binStorage/binStorageSonByTermPageQuery.action",
				       	queryParams:beComparisonTable.queryParams
					});
				});
				
			});
			
			$("#start_Btn").click(function(){
				swal({  
					title: "操作提示",   //弹出框的title  
					text: "确定后将开始单货对比,确认开始对比吗？",  //弹出框里面的提示文本  
					type: "warning",    //弹出框类型  
					showCancelButton: true, //是否显示取消按钮  
					confirmButtonColor: "#DD6B55",//确定按钮颜色  
					cancelButtonText: "取消",//取消按钮文本  
					confirmButtonText: "确定",//确定按钮上面的文档  
					closeOnConfirm: true  
				},function(){
					$('#comparisonTable').bootstrapTable("refresh",{
					    url:"/noob/binStorage/serverDataContrast.action"+
					    "?sStorageDeliveryNumSon="+$("#storageDeliveryNumSon").
					    		val().replace("#,",""),
					    queryParams:comparisonTable.queryParams
					}); 
					$('#beComparisonTable').bootstrapTable("refresh",{
					     url:"/noob/binStorage/clientDataContrast.action"+
					     "?sStorageDeliveryNum="+$("#storageDeliveryNums").val(),
					     queryParams:beComparisonTable.queryParams
					});
					toastr.success("对比完成");
				});
			});
			$("#save_btn").click(function(){
				swal({  
					title: "操作提示",   //弹出框的title  
					text: "数据将保存至系统确定保存吗？",  //弹出框里面的提示文本  
					type: "warning",    //弹出框类型  
					showCancelButton: true, //是否显示取消按钮  
					confirmButtonColor: "#DD6B55",//确定按钮颜色  
					cancelButtonText: "取消",//取消按钮文本  
					confirmButtonText: "确定",//确定按钮上面的文档  
					closeOnConfirm: true  
				},function(){
					$.ajax({
						url:"/noob/binStorage/saveStorage.action"
						+"?sStorageDeliveryNumSon="+$("#storageDeliveryNumSon").
			    		val().replace("#,","")
						+"&sStorageDeliveryNum="+$("#storageDeliveryNums").val(),
						async:false,
						success:function(response){
							if(response=="true"){
								toastr.success("保存成功");
							}else{
								toastr.error("保存失败");
							}
						}
					});
				});
				
			});
			
			$("#storageConnect_btn").click(function(){
				$('#storageConnectTable').bootstrapTable("refresh",{
				    url:"/noob/binStorage/storageConnectQuery.action",
				    queryParams:storageConnectTable.queryParams
				});
		
		
				$('#storageConnectSonTable').bootstrapTable("refresh",{
				    url:"/noob/binStorage/storageConnectSonQuery.action",
				    queryParams:storageConnectSonTable.queryParams
				});;
			});
			
			$("#get_data_btn").click(function(){
				toastr.success("数据接收成功");
			});
  		});