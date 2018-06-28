			/**
			 * 当页面一加载就执行的主方法
			 */
			$(function() {
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
				//1.初始化Table 
				var oTable = new TableInit();
				oTable.Init();
				//2.初始化Button的点击事件 
				var oButtonInit = new ButtonInit();
				oButtonInit.Init();
				//模糊查询的方法
				$("#query-btn").click(function(){
					//刷新数据表格
					$('#tb_departments').bootstrapTable("refresh",{
			        	url:"/noob/disseminate/findAllDisseminate.action",
			        	queryParams:oTable.queryParams
			        }); 
				});
				
				//宣传任务模糊查询日期框
				$('#txt_search_DateOfIssue').datetimepicker({
					 minView: "month",
					 language: 'zh-CN',
			         autoclose: true,
			         todayHighlight: true
				});
				
				//宣传任务模糊查询日期框
				$('#txt_search_DateOfloseEfficacy').datetimepicker({
					 minView: "month",
					 language: 'zh-CN',
			         autoclose: true,
			         todayHighlight: true
				});
				
				//宣传任务增加日期框
				$('#txt_add_DateOfIssue').datetimepicker({
					 minView: "month",
					 language: 'zh-CN',
			         autoclose: true,
			         todayHighlight: true
				});
				
				//宣传任务增加日期框
				$('#txt_add_DateOfloseEfficacy').datetimepicker({
					 minView: "month",
					 language: 'zh-CN',
			         autoclose: true,
			         todayHighlight: true
				});
				
				//宣传任务修改日期框
				$('#txt_update_DateOfIssue').datetimepicker({
					 minView: "month",
					 language: 'zh-CN',
			         autoclose: true,
			         todayHighlight: true
				});
				
				//宣传任务修改日期框
				$('#txt_update_DateOfloseEfficacy').datetimepicker({
					 minView: "month",
					 language: 'zh-CN',
			         autoclose: true,
			         todayHighlight: true
				});
				
				//添加的宣传任务的方法
				$("#addDisseminate").click(function(){
					//校验的变量
					var flag = true;
					//拿到模态框的值
					var disseminateAbstract = $("#txt_add_disseminateAbstract").val();
					var dateOfIssue = $("#txt_add_DateOfIssue").val();
					var dateOfloseEfficacy = $("#txt_add_DateOfloseEfficacy").val();
					var disseminateContent = $("#txt_add_disseminateContent").val();
					//非空验证
					if($.trim(disseminateAbstract)==''){
						flag = false;
						toastr.warning('宣传概要不能为空');
					}
					
					if($.trim(dateOfIssue)==''){
						flag = false;
						toastr.warning('请选择发布时间');
					}
					
					if($.trim(dateOfloseEfficacy)==''){
						flag = false;
						toastr.warning('请选择失效时间');
					}
					
					if($.trim(disseminateContent)==''){
						flag = false;
						toastr.warning('宣传内容不能为空');
					}
					//判断校验的变量
					if(flag){
						//异步同步数据库
						$.ajax({
							url:"/noob/disseminate/addDisseminate.action",
							type:"post",
							data:{"disseminateAbstract":disseminateAbstract,
								"dateOfIssue":dateOfIssue,
								"dateOfloseEfficacy":dateOfloseEfficacy,
								"disseminateContent":disseminateContent,
								"status":$("#txt_add_status").val()},
							async:false,
							success:function(response){
								if("true"==response){
									toastr.success('添加成功');
								}else{
									toastr.error('添加失败');
								}
								clean();
							}
						});
						//刷新表格
						$('#tb_departments').bootstrapTable("refresh",{
							url:"/noob/disseminate/findAllDisseminate.action?status=0"
						}); 
						//隐藏模态框
						$('#addModel').modal('hide');
					}
				});
				//修改角色的方法
				$("#updateDisseminate").click(function(){
					//控制变量
					var flag = true;
					//拿到模态框的值
					var disseminateAbstract = $("#txt_update_disseminateAbstract").val();
					var dateOfIssue = $("#txt_update_DateOfIssue").val();
					var dateOfloseEfficacy = $("#txt_update_DateOfloseEfficacy").val();
					var disseminateContent = $("#txt_update_disseminateContent").val();
					//非空验证
					if($.trim(disseminateAbstract)==''){
						flag = false;
						toastr.warning('宣传概要不能为空');
					}
					
					if($.trim(dateOfIssue)==''){
						flag = false;
						toastr.warning('请选择发布时间');
					}
					
					if($.trim(dateOfloseEfficacy)==''){
						flag = false;
						toastr.warning('请选择失效时间');
					}
					
					if($.trim(disseminateContent)==''){
						flag = false;
						toastr.warning('宣传内容不能为空');
					}
					//判断校验的变量
					if(flag){
						//修改宣传任务的异步请求
						$.ajax({
							url:"/noob/disseminate/updateDisseminate.action",
							type:"post",
							data:{"disseminateAbstract":disseminateAbstract,
								"dateOfIssue":dateOfIssue,
								"dateOfloseEfficacy":dateOfloseEfficacy,
								"disseminateContent":disseminateContent,
								"status":$("#txt_update_status").val(),
								"disseminateId":$("#txt_update_disseminateId").val()},
							success:function(response){
								if("true"==response){
									toastr.success('修改成功');
								}else{
									toastr.error('修改失败');
								}
								
							}
						});
						//刷新表格
						$('#tb_departments').bootstrapTable("refresh",{
							url:"/noob/disseminate/findAllDisseminate.action?status=0"
						}); 
						//隐藏模态框
						$('#updateModel').modal("hide");
					}
				});
				
			});
			
			/**
			 * 初始化表格的方法
			 */
			var TableInit = function() {
				var oTableInit = new Object();
				//初始化Table 
				oTableInit.Init = function() {
					$('#tb_departments').bootstrapTable({
						url : '/noob/disseminate/findAllDisseminate.action', //请求后台的URL（*） 
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
						strictSearch : true,
						maintainSelected:true,//翻页复选框状态不会改变
						showColumns : true, //是否显示所有的列 
						showRefresh : true, //是否显示刷新按钮
						minimumCountColumns : 2, //最少允许的列数
						clickToSelect : true, //是否启用点击选中行 
						uniqueId : "disseminateId", //每一行的唯一标识，一般为主键列 
						showToggle : true, //是否显示详细视图和列表视图的切换按钮 
						cardView : false, //是否显示详细视图
						detailView : false, //是否显示父子表
						columns : [ {
							checkbox : true
						}, {
							field : 'disseminateAbstract',
							title : '宣传概要'
						}, {
							field : 'dateOfIssue',
							title : '发布时间'
						}, {
							field : 'dateOfloseEfficacy',
							title : '失效时间'
						}, {
							field : 'dateOfUpdate',
							title : '更新时间'
						}, {
							field : 'orgName',
							title : '更新单位'
						}, {
							field : 'userName',
							title : '更新人'
						} , {
							field : 'status',
							title : '状态',
							formatter : function(value, row, index) {
								if (row.status == '0') {
									return '有效';
								} else {
									return '作废';
								}
							}	
						} , {
							field : 'disseminateContent',
							title : '宣传内容'
						}  ]
					});
				}; //得到查询的参数
				//表格需要带去后台的参数
				oTableInit.queryParams = function(params) {
					var temp = {
						//这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的 
						pageSize : params.limit, //页面大小 
						start : params.offset, //开始数 
						dateOfIssue : $("#txt_search_DateOfIssue").val(),//发布时间
						dateOfloseEfficacy : $("#txt_search_DateOfloseEfficacy").val(),//失效时间
						status : $("#txt_search_status").val(),//状态
						disseminateAbstract : $("#txt_search_disseminateAbstract").val(),//宣传概要
					};
					return temp;
				};
				return oTableInit;
			};
	
			/**
			 * 按钮的初始化方法
			 */
			var ButtonInit = function() {
				var oInit = new Object();
				var postdata = {};
				oInit.Init = function() {
					//初始化页面上面的添加按钮事件 
					$("#btn_add").click(function() {
						clean();
						$('#addModel').modal({backdrop:true,show:true});
						$(".selectpicker" ).selectpicker("refresh");
					});
					//初始化页面上面的修改按钮事件 
					$("#btn_edit").click(function() {
						updateRole();
					});
					//初始化页面上面的删除按钮事件 
					$("#btn_delete").click(function() {
						//拿到选择的行
						var select = $('#tb_departments').bootstrapTable(
								'getSelections');
						//判断选择的行数
						if (select.length === 0) {
							toastr.warning('请至少选择一行进行作废');
						} else {//确认框
							swal({//初始化确认框  
								title: "操作提示",   //弹出框的title  
								text: "确定作废吗？",  //弹出框里面的提示文本  
								type: "warning",    //弹出框类型  
								showCancelButton: true, //是否显示取消按钮  
								confirmButtonColor: "#DD6B55",//确定按钮颜色  
								cancelButtonText: "取消",//取消按钮文本  
								confirmButtonText: "确定",//确定按钮上面的文档  
								closeOnConfirm: true  
							}, function () {//确定后的函数
								//定义一个数组
								var arrs = [];
								//利用循环将选择行的宣传任务Id赋值给数组
								for (var i = 0; i < select.length; i++) {
									arrs[i] = select[i]['disseminateId'];
								}
								//批量删除的异步请求
								$.ajax({
									url:"/noob/disseminate/nullifyDisseminate.action",
									type:"post",
									traditional:true,
									data:{"disseminateIds":arrs},
									success:function(response){
										if("true"==response){
											toastr.success('作废成功');
										}else{
											toastr.error('作废失败');
										}     	
									}
								});
								//刷新表格
								$('#tb_departments').bootstrapTable("refresh",{
									url:"/noob/disseminate/findAllDisseminate.action?status=0"
								}); 
							}
						)};
					});
				};
				return oInit;
			};
			
			/**
			 * 清除模态框中下拉框以及输入框的值
			 */
			function clean() {
				$("#txt_add_disseminateAbstract").val("");
				$("#txt_add_DateOfIssue").val("");
				$("#txt_add_DateOfloseEfficacy").val("");
				
				$("#txt_add_status").val("");
				$("#txt_add_disseminateContent").val("");
			}
			
			/**
			 * 初始化修改宣传任务的模态框的方法
			 */
			function updateRole() {
				//初始化下拉框默认选择属性
				$("#effective").removeAttr("selected");
				$("#nullify").removeAttr("selected");
				//拿到选择的行
				var select = $('#tb_departments').bootstrapTable(
					'getSelections');
				//判断选择的行数
				if(select.length < 1) {
					toastr.warning('请选择一行进行编辑');
				}else if(select.length > 1){
					toastr.warning('只能选择一行进行编辑');
				}else{
					$('#updateModel').modal({backdrop:true,show:true});
					//拿到选择行的值并赋值给模态框
					var selectStatus = select[0]["status"];
					$("#txt_update_disseminateAbstract").val(select[0]["disseminateAbstract"]);
					$("#txt_update_DateOfIssue").val(select[0]["dateOfIssue"]);
					$("#txt_update_DateOfloseEfficacy").val(select[0]["dateOfloseEfficacy"]);
					$("#txt_update_disseminateContent").val(select[0]["disseminateContent"]);
					$("#txt_update_disseminateId").val(select[0]["disseminateId"]);
					//判断编辑内容的状态并赋值给模态框
					if(selectStatus=="0"){
						$("#effective").attr("selected","selected");
					}else{
						$("#nullify").attr("selected","selected");
					}
					//刷新下拉框
					$(".selectpicker" ).selectpicker("refresh");
					//显示模态框
					$("#updateModel").modal("show");
				}
			}
			
			
			
			
