		/**
		 * 工具栏上按钮的初始化方法
		 */
		var ButtonInit = function() {
			var oInit = new Object();
			var postdata = {};
			oInit.Init = function() {
				//初始化页面上面的添加按钮事件 
				$("#btn_add").click(function() {
					emptyMsg("addResourceName");
					test();
					$("#addModel").modal({show:true});
				});
				//初始化页面上面的修改按钮事件 
				$("#btn_edit").click(function() {
					emptyMsg("updateResourceNameMsg");
					var select = $("#treegrid").jqxTreeGrid('getSelection');
					if(select.length != 1) {
						toastr.warning('只能选择一行进行编辑');
					}else{
						$("#updateModel").modal({show:true});
						
						$("#updateResourceId").val(select[0].resourceId);
						$("#updateResourceName").val(select[0].resourceName);
						$("#updateLocation").val(select[0].location);
						$("#updateKeyword").val(select[0].keyword);
						$("#updateCode").val(select[0].code);
						$("#updateDescription").val(select[0].description);
						
						$.ajax({
			            	url:"../../../../sys/findSubsetByArchivesNameQuery.action",
			            	type:"post",
			            	data:{"archivesName":"资源类型"},
			            	success:function(response){
			            		var html = "";
								for(var i=0;i<response.length;i++) {
									if(select[0].resourceTypeName==response[i].subsetName){
										html = html+"<option selected style='color:red;' id='"+response[i].subsetId+"'>"+response[i].subsetName+"</option>";
									}else{
										html = html+"<option id='"+response[i].subsetId+"'>"+response[i].subsetName+"</option>";
									}
								}
								$("#updateResourceTypeName").append(html);
								$(".selectpicker" ).selectpicker("refresh");
			            	}
			            });
						
						$.ajax({
							url:"../../../../findAllResource.action",
							type:"post",
			            	success:function(response){
			            		var html = "";
								for(var i=0;i<response.length;i++) {
									if(select[0].parentName==response[i].resourceName){
										html = html+"<option selected style='color:red;' id='"+response[i].resourceId+"'>"+response[i].resourceName+"</option>";
									}else if(select[0].resourceName!=response[i].resourceName){
										html = html+"<option id='"+response[i].resourceId+"'>"+response[i].resourceName+"</option>";
									}
								}
								$("#updateParentName").append(html);
								$(".selectpicker" ).selectpicker("refresh");
			            	}
						});
					}
				});
				//初始化页面上面的删除按钮事件 
				$("#btn_delete").click(function() {
					var select = $("#treegrid").jqxTreeGrid('getSelection');
					if (select.length == 0) {
						toastr.warning('请至少选择一行进行删除');
					} else {
						var arrs = [];
						for (var i = 0; i < select.length; i++) {
							arrs[i] = select[i]["resourceId"];
						}
						$.ajax({
							url:"../../../../sys/deleteResourceU.action",
							type:"post",
							traditional:true,
							data:{"resourceIds":arrs},
							success:function(response){
								if("true"==response){
									toastr.success('删除成功');
									jqxtreegridInit("../../../../findAllResource.action");
								}else{
									toastr.error('删除失败');
								}
							}
						});
					}
				});
			};
			return oInit;
		};
	
		/**
		 * 初始化模态框中的输入框以及下拉框
		 */
		function clean() {
			$("#resourceTypeName").children("option").remove();
			$("#addParentName").children("option").remove();
			$("#addResourceName").val("");
			$("#addParentName").val("");
			$("#addKeyword").val("");
			$("#addCode").val("");
			$("#addDescription").val("");
			
			$("#updateResourceTypeName").children("option").remove();
			$("#updateParentName").children("option").remove();
		}
		
		/**
		 * 给添加模态框中的下拉框赋值
		 */
		function test() {
			$.ajax({
            	url:"../../../../sys/findSubsetByArchivesNameQuery.action",
            	type:"post",
            	data:{"archivesName":"资源类型"},
            	success:function(response){
            		var html = "";
					for(var i=0;i<response.length;i++) {
						html = html+"<option id='"+response[i].subsetId+"'>"+response[i].subsetName+"</option>";
					}
					$("#resourceTypeName").append(html);
					$(".selectpicker" ).selectpicker("refresh");
            	}
            });
			
			$.ajax({
				url:"../../../../findAllResource.action",
				type:"post",
            	success:function(response){
            		var html = "";
					for(var i=0;i<response.length;i++) {
						html = html+"<option id='"+response[i].resourceId+"'>"+response[i].resourceName+"</option>";
					}
					$("#addParentName").append(html);
					$(".selectpicker" ).selectpicker("refresh");
            	}
			});
		}
		
		/**
		 * 初始化树形表格
		 */
		function jqxtreegridInit(url){
			var resourceName = $("#queryResourceName").val();
			var parentResourceName = $("#queryParentResourceName").val();
			var resourceTypeId = "";
			for(var i=0;i<$("#queryResourceTypeName").children().length;i++){
				if($("#queryResourceTypeName").children()[i].selected && $($("#queryResourceTypeName").children()[i]).attr("id")!="0"){
					resourceTypeId = $($("#queryResourceTypeName").children()[i]).attr("id");// 收集选中项
				}
			}
			if(resourceName=="" && parentResourceName=="" && resourceTypeId==""){
				url = "../../../../findAllResource.action";
			}
			var source = {
			    dataType: "json",
			    data:{"resourceName":resourceName,"parentName":parentResourceName,"resourceType":resourceTypeId},
			    dataFields: [
			        { name: 'resourceId', type: 'string' },
			        { name: 'resourceName', type: 'string' },
			        { name: 'resourceTypeName', type: 'string' },
			        { name: 'keyword', type: 'string' },
			        { name: 'location', type: 'string' },
			        { name: 'code', type: 'string' },
			        { name: 'description', type: 'string' },
			        { name: 'parentId', type: 'string' },
			        { name: 'parentName', type: 'string' },
			        { name: 'childResList', type: 'array' }
			    ],
			    hierarchy:{
			    	root:"childResList"
			    },
			    id: 'resourceId',
			    url:url
			    //url:'../../../../sys/resourcePageQuery.action'
			};
			var dataAdapter = new $.jqx.dataAdapter(source);
			
			$("#treegrid").jqxTreeGrid({
			   	width:  $("#treegrid").width(),
			   	pageSize: 15,
			   	pageSizeOptions: ['15', '20', '30'],
			   	pageable:true,
			   	pagerPosition:'bottom',
			    source: dataAdapter,
			    sortable: true,
			    columns: [
			      { text: '资源Id', dataField: 'resourceId'},
			      { text: '资源名', dataField: 'resourceName'},
			      { text: '父资源名', dataField: 'parentName'},
			      { text: '资源类型', dataField: 'resourceTypeName'},
			      { text: '关键字', dataField: 'keyword'},
			      { text: '路径', dataField: 'location'},
			      { text: '描述', dataField: 'description'}
			    ]
			});

			$('#treegrid').on('rowExpand',function(event){
				var args = event.args;
		        var row = args.row;
		        var key = args.key;
		    	console.info(row);
		    	console.info(key);
			});
		}
		
		/**
		 * 树形表格的模糊查询的方法
		 */
		function vaguePageQuery(){
			$("#btn_query").click(function(){
				var url = "../../../../findResourceQuery.action";
				jqxtreegridInit(url);
			});
		}
		
		/**
		 * 根据传入的输入框的Id，给输入框添加焦点事件，给出符合条件的提示
		 * @param inputId 输入框的Id
		 */
		function emptyMsg(inputId) {
			$("#"+inputId).focus(function(){
				$("#"+inputId+"Msg").css({"display":"none"});
			});
			
			$("#"+inputId).blur(function(){
				if($("#"+inputId).val()==""){
					$("#"+inputId+"Msg").css({"display":"block"});
				}
			});
		}
		
		/**
		 * 主方法
		 */
		$(function(){
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
			
			//2.初始化Button的点击事件 
			var oButtonInit = new ButtonInit();
			oButtonInit.Init();
			
			//初始化树形表格
			var url = "../../../../findAllResource.action";
			jqxtreegridInit(url);
			
            //初始化资源类型下拉框
            $.ajax({
            	url:"../../../../sys/findSubsetByArchivesNameQuery.action",
            	type:"post",
            	data:{"archivesName":"资源类型"},
            	success:function(response){
            		var html = "";
					for(var i=0;i<response.length;i++) {
						html = html+"<option id='"+response[i].subsetId+"'>"+response[i].subsetName+"</option>";
					}
					$("#queryResourceTypeName").append(html);
					$(".selectpicker" ).selectpicker("refresh");
            	}
            });
            
            //模糊查询的方法
            vaguePageQuery();
            
            //添加资源的方法
            $("#addResource").click(function(){
            	var flag = true;
				var resourceName = $("#addResourceName").val();
				var resourceTypeId = "";
				for(var i=0;i<$("#resourceTypeName").children().length;i++){
					if($("#resourceTypeName").children()[i].selected){
						resourceTypeId = $($("#resourceTypeName").children()[i]).attr("id");// 收集选中项
					}
				}
				var parentId = "";
				for(var i=0;i<$("#addParentName").children().length;i++){
					if($("#addParentName").children()[i].selected){
						parentId = $($("#addParentName").children()[i]).attr("id");// 收集选中项
					}
				}
				var location = $("#addLocation").val();
				var keyword = $("#addKeyword").val();
				var code = $("#addCode").val();
				var description = $("#addDescription").val();
				if(resourceName==""){
					$("#addResourceNameMsg").css({"display":"block"});
					flag=false;
				}
				
				$.ajax({
					url:"../../../../sys/findResourceByNameAndResourceTypeQuery.action",
					type:"post",
					async:false,
					data:{"resourceName":resourceName,"resourceType":resourceTypeId},
					success:function(response){
						if("true"==response){
							$("#resourceNameRepeat").css({"display":"none"});
						}else{
							flag = false;
							$("#resourceNameRepeat").css({"display":"block"});
						}
					}
				});
				if(flag){
					//异步同步数据库
					$.ajax({
						url:"../../../../sys/addResourceU.action",
						type:"post",
						data:{"resourceName":resourceName,"resourceType":resourceTypeId,
							"parentId":parentId,"location":location,"code":code,
							"keyword":keyword,"description":description},
						async:false,
						success:function(response){
							if("true"==response){
								toastr.success('添加成功');
								jqxtreegridInit("../../../../findAllResource.action");
							}else{
								toastr.error('添加失败');
							}
							clean();
						}
					});
					$('#addModel').modal('hide');
				}
            });
            //修改资源的方法
            $("#updateResource").click(function(){
            	var flag = true;
            	var resourceId = $("#updateResourceId").val();
            	var resourceName = $("#updateResourceName").val();
				var resourceTypeId = "";
				for(var i=0;i<$("#updateResourceTypeName").children().length;i++){
					if($("#updateResourceTypeName").children()[i].selected){
						resourceTypeId = $($("#updateResourceTypeName").children()[i]).attr("id");// 收集选中项
					}
				}
				var parentId = "";
				for(var i=0;i<$("#updateParentName").children().length;i++){
					if($("#updateParentName").children()[i].selected){
						parentId = $($("#updateParentName").children()[i]).attr("id");// 收集选中项
					}
				}
				var location = $("#updateLocation").val();
				var keyword = $("#updateKeyword").val();
				var code = $("#updateCode").val();
				var description = $("#updateDescription").val();
				
				if(resourceName==""){
					$("#updateResourceNameMsg").css({"display":"block"});
					flag=false;
				}
            	
				$.ajax({
					url:"../../../../sys/findResourceByNameAndResourceTypeQuery.action",
					type:"post",
					async:false,
					data:{"resourceName":resourceName,"resourceType":resourceTypeId},
					success:function(response){
						if("true"==response){
							$("#updateResourceNameRepeat").css({"display":"none"});
						}else{
							flag = false;
							$("#updateResourceNameRepeat").css({"display":"block"});
						}
					}
				});
				if(flag){
					$.ajax({
						url:"../../../../sys/updateResourceU.action",
						type:"post",
						data:{"resourceId":resourceId,"resourceName":resourceName,"resourceType":resourceTypeId,
							"parentId":parentId,"location":location,"code":code,
							"keyword":keyword,"description":description},
						async:false,
						success:function(response){
							if("true"==response){
								toastr.success('修改成功');
								jqxtreegridInit("../../../../findAllResource.action");
							}else{
								toastr.error('修改失败');
							}
							clean();
							$("#updateModel").modal("hide");
						}
					});
				}
            });
		});