$(function() {
		//1.初始化Table 
		var oTable = new TableInit();
		
		oTable.Init();
		
		//2.初始化Button的点击事件 
		var oButtonInit = new ButtonInit();
		oButtonInit.Init();
		
		
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
		
		$("#sub").click(function(){
			var obj = {name:$('#name').val(),functionarys:$('#functionarys>option:selected').val()};
			$('#tb_departments').bootstrapTable('insertRow', {index:0,row:obj});
			cancel();
			if(check()){
				$.ajax({
					url:"addRipArea.action",
					data:obj, 
					success:function(result) {
						if (result == "success") {
							toastr.success('添加成功');
							
							$('#tb_departments').bootstrapTable("refresh");  
						} else {
							toastr.error('添加失败');
						}
					}
				});
				
				$("#sub").attr("data-dismiss","modal");
				
				
			}else{
				toastr.error('添加失败');
			}
			
		});
		
		$("#update_sub").click(function(){
			var select = $('#tb_departments').bootstrapTable('getSelections');
			
			var obj={code:$('#update_code').val(),name:$('#update_name').val(),functionarys:$('#update_functionarys>option:selected').val(),ripAreaId:select[0].ripAreaId}
		$.ajax({
			url:"updateRipArea.action",
			data:obj,
			success:function(result){
			if(result=="success"){
				toastr.success('修改成功');
				$('#tb_departments').bootstrapTable("refresh"); 
			}else{
				toastr.error('修改失败');
			}
			}
		});
			
		});
		
	});
	
	
		var TableInit = function() {
			var oTableInit = new Object();
			//初始化Table 
			oTableInit.Init = function() {
				$('#tb_departments').bootstrapTable({
					url : 'ripArea/pageQuery.action', //请求后台的URL（*） 
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
					pageSize : 10, //每页的记录行数（*） 
					pageList : [ 10, 25, 50, 100 ], //可供选择的每页的行数（*） 
					search : true, //是否显示表格搜索，此搜索是客户端搜索，不会进服务端，所以，个人感觉意义不大 
					strictSearch : true,
					showColumns : true, //是否显示所有的列 
					showRefresh : true, //是否显示刷新按钮
					minimumCountColumns : 2, //最少允许的列数
					clickToSelect : true, //是否启用点击选中行 
					uniqueId : "ripAreaId", //每一行的唯一标识，一般为主键列 
					showToggle : true, //是否显示详细视图和列表视图的切换按钮 
					cardView : false, //是否显示详细视图
					detailView : false, //是否显示父子表
					columns : [ {
						checkbox : true
					}, {
						field : 'ripAreaId',
						title : '定区Id'
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
				});
			}; //得到查询的参数
			oTableInit.queryParams = function(params) {
				var temp = {
					//这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的 
					limit : params.limit, //页面大小 
					offset : params.offset, //页码 
					ripAreaName : $("#txt_search_departmentname").val(),
					ripAreaFunctionary : $("#txt_search_statu").val()
				};
				return temp;
			};
			
			$("#btn_query").click(function(){
				
				$('#tb_departments').bootstrapTable("refresh",{
					url:"ripArea/pageQuery.action",
					queryParams : oTableInit.queryParams
				});
			});
			
			return oTableInit;
		};

		var ButtonInit = function() {
		
			var oInit = new Object();
			
			var postdata = {};
			oInit.Init = function() {
				
				//初始化页面上面的按钮事件 
				$("#btn_add").click(function() {
					test();
				});

				$("#btn_edit").click(function() {
					var select = $('#tb_departments').bootstrapTable(
						'getSelections');
					if (select.length === 0) {
						toastr.warning("请选择一行") ;
					} else if(select.length>1){
						toastr.warning("只能选择一行") ;
					}else{
						
						var updateFunctionary = select[0]["userName"];
						
						$("#updateModel").modal("show");
						$("#update_code").val(select[0]["ripAreaCode"]);
						$("#update_name").val(select[0]["ripAreaName"]);
						
						$.ajax({
							url:"userList.action",
							type:"get",
							dataType:"json",
							data:"data",
							success:function(data){
								$.each(data.rows,function(i){
									if(updateFunctionary==data.rows[i].userName){
										$('#update_functionarys').append("<option value=" + data.rows[i].userId + " selected>" + data.rows[i].userName + "</option>");
									}else{
										$('#update_functionarys').append("<option value=" + data.rows[i].userId + ">" + data.rows[i].userName + "</option>");
									}
								});
								$('#update_functionarys').selectpicker('refresh');
							},
							error:function(data){
								toastr.error("没有数据");
							}
						});
						clean();
					}
				});
				
				$("#btn_delete").click(function() {
					
					var select = $('#tb_departments').bootstrapTable(
						'getSelections');
					if (select.length == 0) {
						toastr.warning("请选择一行") ;
					}else{
						swal({  
							title: "操作提示",   //弹出框的title  
							text: "确定删除吗？",  //弹出框里面的提示文本  
							type: "warning",    //弹出框类型  
							showCancelButton: true, //是否显示取消按钮  
							confirmButtonColor: "#DD6B55",//确定按钮颜色  
							cancelButtonText: "取消",//取消按钮文本  
							confirmButtonText: "是的，确定删除！",//确定按钮上面的文档  
							closeOnConfirm: true  
						}, function () {
							var arrs = [];
							for (var i = 0; i < select.length; i++) {
								arrs[i] = select[i]['ripAreaId'];
							}
							$.ajax({
								url:"ripArea/deleteRipArea.action",
								type:"post",
								traditional:true,
								data:{"ripAreaIds":arrs},
								success:function(response){
									if("success"==response){
										toastr.success('删除成功');
									}else{
										toastr.error('删除失败');
									}
									$('#tb_departments').bootstrapTable("refresh");      	
								}
							});
						});
					}
				}); 
			};
			return oInit;
		}
	
		function test() {
		
			$("#name").val("");
			
			$.ajax({
				url:"userList.action",
				type:"get",
				dataType:"json",
				data:"data",
				success:function(data){
					$.each(data.rows,function(i){
						$('#functionarys.selectpicker').append("<option value=" + data.rows[i].userId + ">" + data.rows[i].userName + "</option>");
					});
					$('#functionarys').selectpicker('refresh');
				},
				error:function(data){
					alert("没有数据"+data);
				}
			
			});
			
			
			
			clean();
		}

		function cancel() {
			$('body').css('overflow', 'auto');
			$('body').css('padding-right', '0px');
			$('.model').addClass('hide');
			$('.model-dialog').addClass('hide');
		}
		
		function check(){
			if($("#name").val()==''){
				$("#name").attr("placeholder","定区名称必填");
				return false;
			}
			return true;
		}
		function clean() {
			$("#functionarys").children("option").remove();
			$("#update_functionarys").children("option").remove();
		}
		