			/**
			 * 当页面一加载就执行的主方法
			 */
			$(function() {
				//初始化组织类型下拉框
				$.ajax({
					url:"../../../../sys/findSubsetByArchivesNameQuery.action",
					type:"post",
					data:{"archivesName":"组织类型"},
					async:true,
					success:function(response){
						var html = "";
						for(var i=0;i<response.length;i++) {
							html = html+"<option id='"+response[i].subsetId+"'>"+response[i].subsetName+"</option>";
						}
						$("#queryOrgTypeName").append(html);
						$(".selectpicker" ).selectpicker("refresh");
					}
				});
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
			        	url:"../../../../sys/rolePageQuery.action",
			        	queryParams:oTable.queryParams
			        }); 
				});
				
				//添加角色的方法
				$("#addRole").click(function(){
					//校验的变量
					var flag = true;
					var roleName = $("#addRoleName").val();
					var orgTypeId = "";
					for(var i=0;i<$("#orgTypeName").children().length;i++){
						if($("#orgTypeName").children()[i].selected){
							orgTypeId = $($("#orgTypeName").children()[i]).attr("id");// 收集选中项
						}
					}
					var keyword = $("#keyword").val();
					var description = $("#description").val();
					//非空校验，给出提示，改变变量
					if(roleName=="" || keyword==""){
						if(roleName==""){
							$("#addRoleNameMsg").css({"display":"block"});
						}
						if(keyword==""){
							$("#keywordMsg").css({"display":"block"});
						}
						flag=false;
					}
					//查询该组织类型下角色名是否重复
					$.ajax({
						url:"../../../../sys/findRoleByNameAndOrgTypeQuery.action",
						type:"post",
						async:false,
						data:{"roleName":roleName,"orgType":orgTypeId},
						success:function(response){
							//true代表不重复
							if("true"==response){
								$("#roleNameRepeat").css({"display":"none"});
							}else{
								flag = false;
								$("#roleNameRepeat").css({"display":"block"});
							}
						}
					});
					//判断校验的变量
					if(flag){
						//异步同步数据库
						$.ajax({
							url:"../../../../sys/addRoleU.action",
							type:"post",
							data:{"roleName":roleName,"orgType":orgTypeId,
								"keyword":keyword,"description":description},
							async:false,
							success:function(response){
								if("true"==response){
									toastr.success('添加成功');
									$('#tb_departments').bootstrapTable("refresh",{
										url:"../../../../sys/rolePageQuery.action"
									}); 
								}else{
									toastr.error('添加失败');
								}
								clean();
							}
						});
						$('#addModel').modal('hide');
					}
				});
				//修改角色的方法
				$("#updateRole").click(function(){
					var flag = true;
					var orgTypeId = "";
					for(var i=0;i<$("#updateOrgTypeName").children().length;i++){
						if($("#updateOrgTypeName").children()[i].selected){
							orgTypeId = $($("#updateOrgTypeName").children()[i]).attr("id");// 收集选中项
						}
					}
					if($("#updateRoleName").val()=="" || $("#updateKeyword").val()==""){
						flag = false;
						if($("#updateRoleName").val()==""){
							$("#updateRoleNameMsg").css({"display":"block"});
						}
						if($("#updateKeyword").val()==""){
							$("#updateKeywordMsg").css({"display":"block"});
						}
					}
					
					$.ajax({
						url:"../../../../sys/findRoleByNameAndOrgTypeQuery.action",
						type:"post",
						data:{"roleName":$("#updateRoleName").val(),
							"orgType":orgTypeId},
						async:false,
						success:function(response){
							if("true"==response){
								$("#updateRoleNameRepeat").css({"display":"none"});
							}else{
								flag = false;
								$("#updateRoleNameRepeat").css({"display":"block"});
							}
						}
					});
					
					if(flag){
						$.ajax({
							url:"../../../../sys/updateRoleU.action",
							type:"post",
							data:{"roleId":$("#updateRoleId").val(),
								"roleName":$("#updateRoleName").val(),
								"orgType":orgTypeId,
								"keyword":$("#updateKeyword").val(),
								"description":$("#updateDescription").val()},
							async:false,
							success:function(response){
								if("true"==response){
									toastr.success('修改成功');
								}else{
									toastr.error('修改失败');
								}
								$('#tb_departments').bootstrapTable("refresh",{
									url:"../../../../sys/rolePageQuery.action"
								}); 
								clean();
							}
						});
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
						url : '../../../../sys/rolePageQuery.action', //请求后台的URL（*） 
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
						uniqueId : "roleId", //每一行的唯一标识，一般为主键列 
						showToggle : true, //是否显示详细视图和列表视图的切换按钮 
						cardView : false, //是否显示详细视图
						detailView : false, //是否显示父子表
						columns : [ {
							checkbox : true
						}, {
							field : 'roleId',
							title : '角色Id'
						}, {
							field : 'roleName',
							title : '角色名'
						}, {
							field : 'orgTypeName',
							title : '所属组织类型'
						}, {
							field : 'keyword',
							title : '关键字'
						}, {
							field : 'description',
							title : '描述'
						} ]
					});
				}; //得到查询的参数
				//表格需要带去后台的参数
				oTableInit.queryParams = function(params) {
					var orgTypeId = "";
					for(var i=0;i<$("#queryOrgTypeName").children().length;i++){
						if($("#queryOrgTypeName").children()[i].selected && $($("#queryOrgTypeName").children()[i]).attr("id")!="0"){
							orgTypeId = $($("#queryOrgTypeName").children()[i]).attr("id");// 收集选中项
						}
					}
					var temp = {
						//这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的 
						limit : params.limit, //页面大小 
						offset : params.offset, //页码 
						username : $("#username").val(),
						roleName : $("#roleName").val(),
						orgType:orgTypeId
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
						addRole();
					});
					//初始化页面上面的修改按钮事件 
					$("#btn_edit").click(function() {
						clean();
						updateRole();
					});
					//初始化页面上面的删除按钮事件 
					$("#btn_delete").click(function() {
						var select = $('#tb_departments').bootstrapTable(
								'getSelections');
						if (select.length === 0) {
							toastr.warning('请至少选择一行进行删除');
						} else {
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
									arrs[i] = select[i]['roleId'];
								}
								$.ajax({
									url:"../../../../sys/deleteRoleU.action",
									type:"post",
									traditional:true,
									data:{"roleIds":arrs},
									success:function(response){
										if("true"==response){
											toastr.success('删除成功');
										}else{
											toastr.error('删除失败');
										}
										$('#tb_departments').bootstrapTable("refresh",{
											url:"../../../../sys/rolePageQuery.action"
										});      	
									}
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
				$("#orgTypeName").children("option").remove();
				$("#updateOrgTypeName").children("option").remove();
				$("#addRoleName").val("");
				$("#keyword").val("");
				$("#description").val("");
				
				$("#updateRoleName").val("");
				$("#updateKeyword").val("");
				$("#updateDescription").val("");
			}
			
			/**
			 * 初始化修改角色的模态框的方法
			 */
			function updateRole() {
				emptyMsg("updateRoleName");
				emptyMsg("updateKeyword");
				var select = $('#tb_departments').bootstrapTable(
					'getSelections');
				if(select.length < 1) {
					toastr.warning('请选择一行进行编辑');
				}else if(select.length > 1){
					toastr.warning('只能选择一行进行编辑');
				}else{
					$('#updateModel').modal({backdrop:true,show:true});
					var selectOrgTypeName = select[0]["orgTypeName"];
					$("#updateRoleId").val(select[0]["roleId"]);
					$("#updateRoleName").val(select[0]["roleName"]);
					$("#updateKeyword").val(select[0]["keyword"]);
					$("#updateDescription").val(select[0]["description"]);
					$.ajax({
						url:"../../../../sys/findSubsetByArchivesNameQuery.action",
						type:"post",
						data:{"archivesName":"组织类型"},
						async:true,
						success:function(response){
							var html = "";
							for(var i=0;i<response.length;i++) {
								if(selectOrgTypeName==response[i].subsetName){
									html = html+"<option selected style='color:red;' id='"+response[i].subsetId+"'>"+response[i].subsetName+"</option>";
								}else{
									html = html+"<option id='"+response[i].subsetId+"'>"+response[i].subsetName+"</option>";
								}
							}
							$("#updateOrgTypeName").append(html);
							$(".selectpicker" ).selectpicker("refresh");
						}
					});
					$("#updateModel").modal("show");
				}
			}
			
			/**
			 * 初始化添加模态框的方法
			 */
			function addRole() {
				//初始化提示信息
				emptyMsg("addRoleName");
				emptyMsg("keyword");
				
				$.ajax({
					url:"../../../../sys/findSubsetByArchivesNameQuery.action",
					type:"post",
					data:{"archivesName":"组织类型"},
					async:true,
					success:function(response){
						var html = "";
						for(var i=0;i<response.length;i++) {
							if(i==0){
								html = "<option selected id='"+response[i].subsetId+"'>"+response[i].subsetName+"</option>";
							}else{
								html = html+"<option id='"+response[i].subsetId+"'>"+response[i].subsetName+"</option>";
							}
						}
						$("#orgTypeName").append(html);
						$(".selectpicker" ).selectpicker("refresh");
					}
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
