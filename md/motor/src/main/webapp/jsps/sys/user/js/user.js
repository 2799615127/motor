$(function(){
	var TableInit = function() {
		var oTableInit = new Object();
		//初始化Table 
		oTableInit.Init = function() {
			$('#tb_departments').bootstrapTable({
				url : '../../../../userList.action', //请求后台的URL（*） 
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
				height : 350, //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度 
				uniqueId : "userId", //每一行的唯一标识，一般为主键列 
				showToggle : true, //是否显示详细视图和列表视图的切换按钮 
				cardView : false, //是否显示详细视图
				detailView : false, //是否显示父子表
			    columns : [ {
					checkbox : true
				}, {
					field : 'userName',
					title : '用户名'
				}, {
					field : 'salary',
					title : '工资'
				}, {
					field : 'birthday',
					title : '出生日期'
				}, {
					field : 'gender',
					title : '性别'
				}, {
					field : 'orgName',
					title : '组织名'
				}, {
					field : 'telephone',
					title : '电话'
				}, {
					field : 'status',
					title : '是否禁用',
					formatter : function(value, row, index) {
						if (row.status == '0') {
							return '否';
						} else {
							return '是';
						}
					}
				}],
				rowStyle : function(row, index) {
					// 这里有5个取值代表5中颜色['active', 'success', 'info', 'warning',
					// 'danger'];
					var strclass = {};
					if (row.status == "1") {
						strclass = {
							css : {
								'background-color' : '#FFCCCC'
							}
						};// 还有一个active
					}
					return strclass
				}
				
			});
		}; //得到查询的参数

		 oTableInit.queryParams = function(params) {
			var temp = {
				//这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的 
				limit : params.limit, //页面大小 
				offset : params.offset, //页码 
				userName : $("#userName").val(),
				gender:$("#gender").val(),
	            lowBirthday:$("#lowBirthday").val(),
	            highBirthday:$("#highBirthday").val(),
			};
			return temp;
		}; 

		return oTableInit;
	};
	
	
	$("#btn_query").click(function(){
		 
		 var obj = {
				 url:"../../../../userList.action",
				 silent:true,
				 query:{
					 userName : $("#userName").val(),
					 gender:$("#gender").val(),
		             lowBirthday:$("#lowBirthday").val(),
		             highBirthday:$("#highBirthday").val(),
				 }
		 };
   	$('#tb_departments').bootstrapTable('refresh',obj);      	
   });  

	var ButtonInit = function() {
		var oInit = new Object();
		var postdata = {};
		oInit.Init = function() {
			//初始化页面上面的按钮事件 
			$("#btn_add").click(function() {
				clean();
				test();
				 
					//初始化组织类型下拉框
					$.ajax({
						type:"post",
						async:true,
						url : '../../../../findAllOrganization.action',
						success:function(response){
							var html = "";
							for(var i=0;i<response.length;i++) {
								html = html+"<option id='"+response[i].orgId+"'>"+response[i].orgName+"</option>";
							}
							$("#orgNames").append(html);
							$(".selectpicker").selectpicker("refresh");
						}
					});
					 
				});
			
			$("#add").click(function(){
			
				$.ajax({
					type:"GET",
					url:'../../../../findUserByUserName.action',
					data:{userName:$("#userNames").val()},
					async:false,
					success:function(result){
						if(result=="success"){
							var orgId="";
							for(var i=0;i<$("#orgNames").children().length;i++){
								if($("#orgNames").children()[i].selected){
									orgId = $($("#orgNames").children()[i]).attr("id");
								}
							}
							
							$.ajax({
								type: "GET", 
								url:'../../../../addUser.action',
								data :{userId:$('#userId').val(),userName:$('#userNames').val(),
									   password:$('#password').val(),salary:$('#salary').val(),
									   birthday:$('#birthday').val(),gender:$('#genders').val(),
									   orgId:orgId,telephone:$('#telephone').val(),
									   status:$('#status').val()},					   
								success:function(result) {				
									if (result == "success") {						
										toastr.success('添加成功!');
									} else {
										toastr.error('添加失败!');
									}
									
									$('#tb_departments').bootstrapTable('refresh',{url:'../../../../userList.action'}); 
								}
									   
							});
							$("#myModal").modal("hide");

						}else{
							$("#userNamess").css("display","block");
						}
					}
				});
				 

			});			

			$("#btn_edit").click(
					
					function() {
						var select = $('#tb_departments').bootstrapTable(
								'getSelections');
						var status = []; 
						var userId =[];
						for (var i = 0; i < select.length; i++) {
							userId[i] = select[i]['userId'];
							status[i] = select[i]['status'];
						}
						if (select.length === 0) {
							toastr.warning('请选择一行进行修改!');
						}else if(select.length>1){
							toastr.warning('一次只能修改一行!');
						}else if(status[0] === 1){
							toastr.warning('该用户已被禁用');
						}else{							  
							 $("#Model").modal("show");
						}
						
						$(".prompt").text("");
					});
							
			$("#update").click(function(){
				 //获取单行数据
	       	    var select = $('#tb_departments').bootstrapTable('getSelections');
	       		
	       	    var userId = [];
    			//获取单行数据
    				for (var i = 0; i < select.length; i++) {
    					userId[i] = select[i]['userId'];
    				}
	    			
				
				swal({  
					title: "操作提示",   //弹出框的title  
					text: "确定修改吗？",  //弹出框里面的提示文本  
					type: "warning",    //弹出框类型  
					showCancelButton: true, //是否显示取消按钮  
					confirmButtonColor: "#DD6B55",//确定按钮颜色  
					cancelButtonText: "取消",//取消按钮文本  
					confirmButtonText: "是的，确定修改！",//确定按钮上面的文档  
					closeOnConfirm: true  
				}, function () {
					
					$.ajax({
						type: "GET", 
						url:'../../../../updatePwd.action',
						data :{newPassword:$("#newPassword").val(),oldPassword:$("#oldPassword").val(),userId:userId[0]},
						success:function(result) {
							if (result == "success") {
								toastr.success('修改成功!');
							} else {
								toastr.error('修改失败!');
							}
							$('#tb_departments').bootstrapTable('refresh',{url:'../../../../userList.action'});
						}
					});
					
				}); 
				
			});

			$("#btn_delete").click(
					function() {
						var select = $('#tb_departments').bootstrapTable(
								'getSelections');
						var status = []; 
						var userId =[];
						for (var i = 0; i < select.length; i++) {
							userId[i] = select[i]['userId'];
							status[i] = select[i]['status'];
						}
						if (select.length === 0) {
							toastr.warning('请至少选择一行进行冻结!');
						}else if(status[0] === 1){
							toastr.warning('该用户已被禁用');
						}else {
							swal({  
								title: "操作提示",   //弹出框的title  
								text: "确定冻结吗？",  //弹出框里面的提示文本  
								type: "warning",    //弹出框类型  
								showCancelButton: true, //是否显示取消按钮  
								confirmButtonColor: "#DD6B55",//确定按钮颜色  
								cancelButtonText: "取消",//取消按钮文本  
								confirmButtonText: "是的，确定冻结！",//确定按钮上面的文档  
								closeOnConfirm: true  
							}, function () { 
								
								var arrs = [];
								for (var i = 0; i < select.length; i++) {
									arrs[i] = select[i]['userId'];
								}
								
								$.ajax({
									type: "GET", 
									url:'../../../../deleteUserByUserId.action',
									data : {userIds:arrs},
									success:function(result) {
										if (result == "success") {
											toastr.success('冻结成功!');
										} else {
											toastr.error('冻结失败!');
										}
										$('#tb_departments').bootstrapTable('refresh',{url:'../../../../userList.action'}); 
									}
								});

								$('#tb_departments').bootstrapTable('remove', {
									field : 'userId',
									values : arrs
								});
								
							});
					
						}

					});
			
			$("#btn_recover").click(
					function() {
						var select = $('#tb_departments').bootstrapTable(
								'getSelections');
						var status = []; 
						var userId =[];
						for (var i = 0; i < select.length; i++) {
							userId[i] = select[i]['userId'];
							status[i] = select[i]['status'];
						}
						if (select.length === 0) {
							toastr.warning('请至少选择一行进行还原!');
						}else if(status[0] === 0){
							toastr.warning('该用户已在使用中');
						}else{
							swal({  
								title: "操作提示",   //弹出框的title  
								text: "确定还原吗？",  //弹出框里面的提示文本  
								type: "warning",    //弹出框类型  
								showCancelButton: true, //是否显示取消按钮  
								confirmButtonColor: "#DD6B55",//确定按钮颜色  
								cancelButtonText: "取消",//取消按钮文本  
								confirmButtonText: "是的，确定还原！",//确定按钮上面的文档  
								closeOnConfirm: true  
							}, function () { 
								
								var arrs = [];
								for (var i = 0; i < select.length; i++) {
									arrs[i] = select[i]['userId'];
								}
								
								$.ajax({
									type: "GET", 
									url:'../../../../regainUserByUserId.action',
									data : {userIds:arrs},
									success:function(result) {
										if (result == "success") {
											toastr.success('还原成功!');
										} else {
											toastr.error('还原失败!');
										}
										$('#tb_departments').bootstrapTable('refresh',{url:'../../../../userList.action'}); 
									}
								});
								
							});
					
						}

					});

		};
		return oInit;
	};
	

	 
	
	
	
	
	$(".form_datetime").datetimepicker({
	      format: "yyyy-mm-dd",
	      autoclose: true,
	      todayBtn: true,
	      language:'zh-CN',
	      pickerPosition:"bottom-right",
	      minView:2,
	     
	    });

	$(function() {
		//1.初始化Table 
		var oTable = new TableInit();
		oTable.Init();
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

	function cancel() {
		$('body').css('overflow', 'auto');
		$('body').css('padding-right', '0px');
		$('.model').addClass('hide');
		$('.model-dialog').addClass('hide');
	}
	
	function clean() {
		$('#userNames').val("");
		$('#password').val("");
		$('#salary').val("");
		$('#birthday').val("");
		$('#telephone').val("");
		$(".prompt").text("");
		$("#orgNames").children("option").remove();

	}
	
	
	//校验用户姓名 
	function checkUsername(obj) {
		//格式是否合法
		//var emailReg = /^[\u4E00-\u9FA5]{2,4}$/;
		//校验是否为空
		if (obj.value.length == 0) {
			$("#"+obj.id  + "_prompt").text("输入的用户名不能为空!!!");
			$("#add").prop('disabled', true);
		}else{
			$("#add").prop('disabled', false);
		};
	};
	
	//校验出生日期 
	function checkBirthday(obj) {
		//格式是否合法
		//var emailReg = /^[\u4E00-\u9FA5]{2,4}$/;
		//校验是否为空
		if (obj.value.length == 0) {
			$("#"+obj.id  + "_prompt").text("出生日期不能为空!!!");
			$("#add").prop('disabled', true);
		}else{
			$("#add").prop('disabled', false);
		};
	};
 
	//校验密码 
	function checkPassword(obj) {
		//校验是否为空
		if (obj.value.length == 0) {
			$("#"+obj.id + "_prompt").text("输入的密码不能为空!!!");
			$("#add").prop('disabled', true);
		}else if ((obj.value.length) < 6 || (obj.value.length) >12) {
			//获得密码框后的提示框对象
			$("#"+obj.id + "_prompt").text("输入的密码只能在6~12位之间!!!");
			$("#add").prop('disabled', true);
		}else{
			$("#add").prop('disabled', false);
		};
		
	};
	
	//校验旧密码
	function checkOldPassword(obj) {
		//校验是否为空
		if (obj.value.length == 0) {
			$("#"+obj.id + "_prompt").text("输入的旧密码不能为空!!!");
			$("#update").prop('disabled', true);
		}else if ((obj.value.length) < 6 || (obj.value.length) > 12) {
			//获得密码框后的提示框对象
			$("#"+obj.id + "_prompt").text("输入的密码只能在6~12位之间!!!");
			$("#update").prop('disabled', true);
		}else{
			$("#update").prop('disabled', false);
		};
		
	};
	
	//校验新密码
	function checkNewPassword(obj) {
		//校验是否为空
		if (obj.value.length == 0) {
			$("#"+obj.id + "_prompt").text("输入的新密码不能为空!!!");
			$("#update").prop('disabled', true);
		}else if ((obj.value.length) < 6 || (obj.value.length) > 12) {
			//获得密码框后的提示框对象
			$("#"+obj.id + "_prompt").text("输入的密码只能在6~12位之间!!!");
			$("#update").prop('disabled', true);
		}else{
			$("#update").prop('disabled', false); 
		};
		
	};
	
	//校验工资
	function checkSalary(obj) {
		//校验是否为空
		if (obj.value.length == 0) {
			$("#"+obj.id + "_prompt").text("输入的工资不能为空!!!");
			$("#add").prop('disabled', true);
		}else if (obj.value < 0 ) {
			//获得工资框后的提示框对象
			$("#"+obj.id + "_prompt").text("输入的工资不能小于0!!!");
			$("#add").prop('disabled', true);
		}else{
			$("#add").prop('disabled', false);
		};
		
	};
	
	
	//校验手机号码
	 function checkTelephone(obj) {
		var telephoneReg = /^1(3|4|5|7|8)\d{9}$/;
		//校验是否为空
		if (obj.value.length == 0) {
			$("#"+obj.id + "_prompt").text("输入的手机号码不能为空!!!");
			$("#add").prop('disabled', true);
		}else if (!telephoneReg.test(obj.value)) {
			//获得电话号码框后的提示框对象
			$("#"+obj.id + "_prompt").text("输入的手机号码格式不正确!!!");
			$("#add").prop('disabled', true);
		}else{
			$("#add").prop('disabled', false);
		};
		
	};
	
	//清除提示
	function cancelPromptR(obj) {
		$("#"+obj.id + "_prompt").text("");
	};
});