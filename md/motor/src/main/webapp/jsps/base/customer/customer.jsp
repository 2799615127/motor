<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro"%>
<%
	String userName = request.getParameter("userName");
	request.getSession().setAttribute("userName", userName);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>客户管理</title>
     <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js"></script>
	
	<!-- bootstrap组件引用 -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap/js/bootstrap.js"></script>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/bootstrap/css/bootstrap.min.css">
	
	<!-- bootstrap table组件以及中文包的引用 -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap-table/bootstrap-table.js"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/bootstrap-table/bootstrap-table.css" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>
	
	<!-- 下拉框 -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/select2/select2.css"/>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/select2/select2.full.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/select2/select2.min.js"></script>	
	
	<!-- toastr组件引用 -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/toastr/toastr.min.js"></script>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/toastr/toastr.min.css">
	
	<!-- sweetalert组件引用 -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/sweetalert/sweetalert.min.js"></script>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/sweetalert/sweetalert.css">
	
	<!-- bootstrapValidator组件引用 -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap-validator/bootstrapValidator.min.js"></script>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/bootstrap-validator/bootstrapValidator.min.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/linkage.js"></script>
	
		
    <script type="text/javascript">
	    $(function () {
	    	$.fn.modal.Constructor.prototype.enforceFocus = function() {};
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
	        
	        //模糊查询按钮 
	        $("#btn_query").click(function(){
				$('#tb_departments').bootstrapTable("refresh",{
		        	url:"/noob/customer/customerPageQuery.action",
		        	queryParams:oTable.queryParams
		        }); 
			});
	        
	        
	        //添加 
	        $("#add-Customer").click(function(){
	        	
				var customerName = $("#customerName").val();
				var contacts = $("#contacts").val();
				var telephone = $("#telephone").val();
				var description = $("#description").val();
				var province = $("#txt_add_province").val();
				var city = $("#txt_add_city").val();
				var district = $("#txt_add_district").val();
				var street = $("#street").val();
				if(customerName==""||customerName==null){
					toastr.error('添加失败');
				}else if(contacts==""||contacts==null){
					toastr.error('添加失败');
				}else if(telephone==""||telephone==null){
					toastr.error('添加失败');
				}else if(province==""||province==null){
					toastr.error('添加失败');
				}else if(city==""||city==null){
					toastr.error('添加失败');
				}else if(district==""||district==null){
					toastr.error('添加失败');
				}else if(street==""||street==null){
					toastr.error('添加失败');
				}else if(description==""||description==null){
					toastr.error('添加失败');
				}else{
				//异步同步数据库
				$.ajax({
					url:"/noob/customer/addRoleU.action",
					type:"post",
					data:{"customerName":customerName,"contacts":contacts,
						"telephone":telephone,"address":province+" "+city+" "+district+street,
						"description":description},
					async:false, //同步请求
					success:function(response){
						if("true"==response){
							toastr.success('添加成功');
						}else{
							toastr.error('添加失败');
						}
						$('#tb_departments').bootstrapTable('refresh', {
							url:"/noob/customer/customerPageQuery.action"
						});
					}
				});
				}
			});
	        
	        //修改
	        $("#update-Customer").click(function(){
	        	var customerId = $("#updateCustomerId").val();
	        	var customerNo = $("#updateCustomerNo").val();
				var customerName = $("#updateCustomerName").val();
				var contacts = $("#updateContacts").val();
				var telephone = $("#updateTelephone").val();
				var description = $("#updateDescription").val();
				var address = $("#updateAddress").val();
				$.ajax({
					url:"/noob/customer/findSubsetByCustomerNameQuery.action",
					type:"post",
					data:{"customerId":customerId,
						"customerNo":customerNo,
						"customerName":customerName,
						"contacts":contacts,
						"telephone":telephone,
						"address":address,
						"description":description},
					async:false,//同步请求
					success:function(response){
						if("true"==response){
							toastr.success('修改成功');
						}else{
							toastr.error('修改失败');
						}
						$('#tb_departments').bootstrapTable("refresh",{
							url:"/noob/customer/customerPageQuery.action"
						}); 
					}
				});
			});
	        	validator();
	    });
	    
	    var TableInit = function () {
	        var oTableInit = new Object();
	        //初始化Table
	        oTableInit.Init = function () {
	            $('#tb_departments').bootstrapTable({
	                url: '/noob/customer/customerPageQuery.action', //请求后台的URL（*）
	                method: 'get',                      //请求方式（*）
	                toolbar: '#toolbar',                //工具按钮用哪个容器
	                striped: true,                      //是否显示行间隔色
	                cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
	                pagination: true,                   //是否显示分页（*）
	                sortable: false,                     //是否启用排序
	                sortOrder: "asc",                   //排序方式
	                queryParams: oTableInit.queryParams,//传递参数（*）
	                sidePagination: "server",           //分页方式：client客户端分页，server服务端分页（*）
	                pageNumber:1,                       //初始化加载第一页，默认第一页
	                pageSize: 5,                       //每页的记录行数（*）
	                pageList: [5, 25, 50, 100],        //可供选择的每页的行数（*）
	                strictSearch: true,
	                showColumns: true,                  //是否显示所有的列
	                showRefresh: true,                  //是否显示刷新按钮
	                minimumCountColumns: 2,             //最少允许的列数
	                clickToSelect: true,                //是否启用点击选中行
	                uniqueId: "customerId",                     //每一行的唯一标识，一般为主键列
	                showToggle:true,                    //是否显示详细视图和列表视图的切换按钮
	                cardView: false,                    //是否显示详细视图
	                detailView: false,                   //是否显示父子表
	                columns: [{
	                    checkbox: true
	                }, {
	                	field: 'customerNo',
		                title: '客户编号'
		            }, {
	                    field: 'customerName',
	                    title: '客户名'
	                }, {
	                    field: 'contacts',
	                    title: '联系人'
	                }, {
	                    field: 'telephone',
	                    title: '联系电话'
	                }, {
	                    field: 'address',
	                    title: '地址'
	                }, {
	                    field: 'description',
	                    title: '描述'
	                }, ]
	            });
	        };
	
	        //得到查询的参数
	        oTableInit.queryParams = function (params) {
	            var temp = {   //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
	                pageSize: params.limit,   //页面大小
	                pageNumber: params.offset,  //页码
	                customerName: $("#txt_search_departmentname").val(),
	                contacts: $("#txt_search_contacts").val(),
	                address: $("#txt_search_statu").val()
	            };  
	            return temp;
	        };
	        return oTableInit;
	    };
	
		
	    var ButtonInit = function () {
	        var oInit = new Object();
	        var postdata = {};
			
	        oInit.Init = function () {
	        	// 添加中省的下拉框
	    		selectProvince("#txt_add_province");
	    		// 添加中市的下拉框
	    		selectCity("#txt_add");
	    		// 添加中区的下拉框
	    		selectDistrict("#txt_add");
	    		
	    		// 省下拉框改变事件
	    		$('#txt_add_province').change(function() {
	    			$('#txt_add_city').empty();
	    			$('#txt_add_city').change();
	    		})
	    		// 市下拉框改变事件
	    		$('#txt_add_city').change(function() {
	    			$('#txt_add_district').empty();
	    		})
	    		
	    		
	    		// 添加中省的下拉框
	    		selectProvince("#txt_update_province");
	    		// 添加中市的下拉框
	    		selectCity("#txt_update");
	    		// 添加中区的下拉框
	    		selectDistrict("#txt_update");
	    		
	    		// 省下拉框改变事件
	    		$('#txt_update_province').change(function() {
	    			$('#txt_update_city').empty();
	    			$('#txt_update_city').change();
	    		})
	    		// 市下拉框改变事件
	    		$('#txt_update_city').change(function() {
	    			$('#txt_update_district').empty();
	    		})
	    		
	    		
	    		
	        	//初始化页面上面的添加按钮事件
	        	$("#btn_add").click(function() {
	        	 	$(".prompt").text("");
					clean();
	        		test();
	        		$("#addCheck").data('bootstrapValidator').destroy();
	        		$('#addCheck').data('bootstrapValidator', null);
	        		validator();
				});
				
	        	//初始化页面上面的修改按钮事件
				$("#btn_edit").click(function(){
					$(".prompt").text("");
					updateCustomer();
				});
				
	        	
	        	
				//初始化页面上面的删除按钮事件
				$("#btn_delete").click(function() {
					var select = $('#tb_departments').bootstrapTable(
						'getSelections');
					if (select.length === 0) {
						toastr.warning('请选择一行进行删除');
					} else {
						
						swal({  
							title: "操作提示",   //弹出框的title  
							text: "确定删除吗？",  //弹出框里面的提示文本  
							type: "warning",    //弹出框类型  
							showCancelButton: true, //是否显示取消按钮  
							confirmButtonColor: "#DD6B55",//确定按钮颜色  
							cancelButtonText: "取消",//取消按钮文本  
							confirmButtonText: "是的，确定删除！",//确定按钮上面的文档  
							closeOnConfirm: true  //关闭确认
						}, function (){
							var arrs = [];
							for (var i = 0; i < select.length; i++) {
								arrs[i] = select[i]['customerId'];
							}
							$.ajax({
								url:"/noob/customer/deleteRoleU.action",
								type:"post",
								traditional:true,//设置traditional为true阻止深度序列化
								data:{"customerIds":arrs},
								success:function(response){
									if("true"==response){
										toastr.success('删除成功');
									}else{
										toastr.error('删除失败');
									}
									$('#tb_departments').bootstrapTable('refresh', {
		    							url:"/noob/customer/customerPageQuery.action"
		    						});
								}
							});
						});
					}
				});
	        };
	        return oInit;
	        
	    };
	    
	    //修改客户的提示框 
	    function updateCustomer() {
			var select = $('#tb_departments').bootstrapTable(
				'getSelections');
			if(select.length < 1) {
				toastr.warning('请选择一行进行编辑');
			}else if(select.length > 1){
				toastr.warning('只能选择一行进行编辑');
			}else{
				$("#updateCustomerId").val(select[0]["customerId"]);
				$("#updateCustomerNo").val(select[0]["customerNo"]);
				$("#updateCustomerName").val(select[0]["customerName"]);
				$("#updateContacts").val(select[0]["contacts"]);
				$("#updateTelephone").val(select[0]["telephone"]);
				$("#updateAddress").val(select[0]["address"]);
				$("#updateDescription").val(select[0]["description"]);
				$("#myUpdateModal").modal("show");
			}
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
	    
	    function clean(){
	    	$('#customerName').val("");
	    	$('#contacts').val("");
	    	$('#telephone').val("");
	    	$('#txt_add_province').text("");
	    	$('#txt_add_city').text("");
	    	$('#txt_add_district').text("");
	    	$('#street').val("");
	    	$('#description').val("");
	    }
	    //-------------------------------------------------
	    //校验客户名
		function checkCustomerName(obj){
			var emailReg = /^[\u4E00-\u9FA5]{2,4}$/;
			if (obj.value.length == 0) {
				$("#add-Customer").prop('disabled', true);
			}else if (!emailReg.test(obj.value)) {
				//获得姓名框后的提示框对象
				$("#"+obj.id + "_prompt").text("");
				$("#add-Customer").prop('disabled', true);
			}else{
				$("#"+obj.id + "_prompt").text("");
			};
		};
			
			    
		//修改联系人校验
		function checkUpdateContacts(obj) {
			var emailReg = /^[\u4E00-\u9FA5]{2,4}$/
			//校验是否为空
			if (obj.value.length == 0) {
				$("#"+obj.id + "_prompt").text("联系人不能为空");
				$("#update-Customer").prop('disabled', true);
			}else if (!emailReg.test(obj.value)) {
				//获得姓名框后的提示框对象
				$("#"+obj.id + "_prompt").text("请输入正确的联系人");
				$("#update-Customer").prop('disabled', true);
			}else{
				$("#update-Customer").prop('disabled', false);
			};
		}; 
		
		 //修改的校验地址
		function checkUpdateAddress(obj) {
			var emailReg = /^[\u4E00-\u9FA5]{1,50}$/
			//校验是否为空
			if (obj.value.length == 0) {
				$("#"+obj.id + "_prompt").text("地址不能为空");
				$("#update-Customer").prop('disabled', true);
			}else if (!emailReg.test(obj.value)) {
				//获得姓名框后的提示框对象
				$("#"+obj.id + "_prompt").text("请输入正确的地址");
				$("#update-Customer").prop('disabled', true);
			}else{
				$("#update-Customer").prop('disabled', false);
			};
		}; 
		
		//修改的校验描述
		function checkUpdateDescription(obj) {
			//校验是否为空
			if (obj.value.length == 0) {
				$("#"+obj.id + "_prompt").text("描述不能为空");
				$("#update-Customer").prop('disabled', true);
			}else if (!emailReg.test(obj.value)) {
				//获得姓名框后的提示框对象
				$("#"+obj.id + "_prompt");
				$("#update-Customer").prop('disabled', true);
			}else{
				$("#update-Customer").prop('disabled', false);
			};
		};
	
		function validator(){
			$('#addCheck').bootstrapValidator({
				message: 'This value is not valid',
				feedbackIcons:{
				valid: 'glyphicon glyphicon-ok',
				invalid: 'glyphicon glyphicon-remove',
				validating: 'glyphicon glyphicon-refresh'
			},
		    fields: {
		    	addCustomerName: {
		             message: '客户名验证失败~',
		             validators: {
		             notEmpty: {
		                 message: '客户名不能为空~',
		             },
		             regexp: {
		                 regexp: /^[\u4E00-\u9FA5]{2,4}$/,
		                 message: '请输入正确的客户名~'
		                }
		              }
		            },
		            addContacts: {
		                 validators: {
		                     notEmpty: {
		                         message: '联系人不能为空~'
		                     },
		                     regexp: {
				                 regexp: /^[\u4E00-\u9FA5]{2,4}$/,
				                 message: '请输入正确的联系人~'
				             }
		                 }
		             },
		             addTelephone: {
		                 validators: {
		                     notEmpty: {
		                         message: '电话不能为空~'
		                     },
		                     regexp: {
		                         regexp: /^1(3|4|5|7|8)\d{9}$/,
		                         message: '电话号码格式不正确~'
		                     }
		                 }
		             },
		             addProvince: {
		                 validators: {
		                     notEmpty: {
		                         message: '省份不能为空~'
		                     }
		                 }
		             },
		             addCity: {
		                 validators: {
		                     notEmpty: {
		                         message: '市区不能为空~'
		                     }
		                 }
		             },
		             addDistrict: {
		                 validators: {
		                     notEmpty: {
		                         message: '县/区不能为空~'
		                     }
		                 }
		             },
		             addStreet: {
		                 validators: {
		                	 notEmpty: {
		                         message: '街道不能为空~'
		                     },
		                     stringLength: {
		                         min: 1,
		                         max: 50,
		                         message: '街道长度必须在1到50位之间!'
		                     }
		                 }
		             },
		             addDescription: {
		                 validators: {
		                	 notEmpty: {
		                         message: '描述不能为空~'
		                     },
		                     stringLength: {
		                         min: 1,
		                         max: 50,
		                         message: '描述长度必须在1到50位之间!'
		                     },
		                     regexp: {
				                 regexp: /^[\u4E00-\u9FA5]{1,50}$/,
				                 message: '描述只能为中文!'
				             }
		                 }
		             },
		         }
		     });
		};


		function test1(){
			checkCustomerName(customerName);
			checkContacts(contacts);
			checkPhone(telephone);
			checkAddress(address);
			checkDescription(description);
		};
	
		//清除提示
		function cancelPrompt(obj) {
			$("#"+obj.id + "_prompt").text("");
		};
    </script>
    
   <style type="text/css">
   		.prompt{
   			color: #ff6700;
   		}
   </style>
</head>
<body>
	<div class="panel-body" style="padding-bottom:0px;">
        <div class="panel panel-default">
            <div class="panel-heading">
            	<a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
					查询条件
                </a>
            </div>
            <div class="panel-collapse collapse on" id="collapseOne">
                <form id="formSearch" class="form-horizontal">
                    <div class="form-group" style="margin-top:15px">
                        <label class="control-label col-sm-1" for="txt_search_departmentname">客户名</label>
                        <div class="col-sm-2">
                            <input type="text" class="form-control" id="txt_search_departmentname" name="customerName">
                        </div>
                        <label class="control-label col-sm-1" for="txt_search_contacts">联系人</label>
                        <div class="col-sm-2">
                            <input type="text" class="form-control" id="txt_search_contacts" name="contacts">
                        </div>
                        <label class="control-label col-sm-1" for="txt_search_statu">地址</label>
                        <div class="col-sm-2">
                            <input type="text" class="form-control" id="txt_search_statu" name="address">
                        </div>
                        <div class="col-sm-3" style="text-align:left;">
                            <button type="button"  id="btn_query" class="btn btn-primary">查询</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>       
		
		 <!-- 按钮触发模态框 -->
        <div class="btn-group">
        	<shiro:hasPermission name="新增客户">
			<button id="btn_add" type="button" class="btn btn-default1" data-toggle="modal" data-target="#myAddModal">
				<span class="glyphicon glyphicon-plus" aria-hidden="true" ></span>新增
			</button>
			</shiro:hasPermission>
			<shiro:hasPermission name="修改客户">
            <button id="btn_edit" type="button" class="btn btn-default" data-toggle="modal">
                <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>修改
            </button>
            </shiro:hasPermission>
            <shiro:hasPermission name="删除客户">
            <button id="btn_delete" type="button" class="btn btn-default">
                <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>删除
            </button>
            </shiro:hasPermission>
        </div>
        <table id="tb_departments"></table>
    </div>
    
    <!-- 添加模态框（myAddModal） -->
	<div class="modal fade" id="myAddModal" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	    <div class="modal-dialog">
	        <div class="modal-content">
	            <div class="modal-header">
	               <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>	               
	               <div class="panel panel-success">
		                <div class="panel-heading">
							<h3 class="panel-title">添加</h3>
						</div>
						<div class="panel-body">
							<form class="form-horizontal" onsubmit="return check()" role="form" id="addCheck">
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">客户名</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" id="customerName" name="addCustomerName"
											placeholder="请输入客户名" >
										<span id="customerName_prompt"  class="prompt"></span>
									</div>
								</div>
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">联系人</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" id="contacts" name="addContacts"
											placeholder="请输入联系人">
										<span id="contacts_prompt" class="prompt"></span>
									</div>
								</div>
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">联系电话</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" id="telephone" name="addTelephone"
											placeholder="请输入联系电话">
										<span id="telephone_prompt" class="prompt"></span>
									</div>
								</div>
								
								
								
								<div class="form-group">
									<label for="firstname" class="col-sm-2 control-label">省</label>
									<div class="col-sm-10">
										<select id="txt_add_province" class="txt_search_province js-example-basic-multiple form-control" name="addProvince" style="width:442px">
										</select>
									</div>
								</div>
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">市</label>
									<div class="col-sm-10">
										<select id="txt_add_city" class="txt_search_city js-example-basic-multiple form-control" name="addCity" style="width:442px">
										</select>
									</div>
								</div>
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">县/区</label>
									<div class="col-sm-10">
										<select id="txt_add_district" class="txt_search_district js-data-example-ajax form-control" name="addDistrict" style="width:442px">
										</select>
									</div>
								</div>
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">街道</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" id="street" name="addStreet"
											placeholder="请输入所在详细地址">
										<span id="street_prompt" class="prompt"></span>
									</div>
								</div>
								
								
								
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">描述</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" id="description" name="addDescription"
											placeholder="请输入描述">
										<span id="description_prompt" class="prompt"></span>
									</div>
								</div>
								<div class="form-group">
									<div class="text-center">
										<input onclick="test1();" id="add-Customer" data-dismiss="modal"  type="submit" class="btn btn-primary" value="提交"/>
										<input type="button" class="btn btn-info" data-dismiss="modal" value="取消"/>
									</div>
								</div>
							</form>
						</div>
					</div>
	            </div>	            
	        </div>
	    </div>
	</div>
	
	<!-- 修改模态框(myUpdateModal) -->
	<div class="modal fade" id="myUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	    <div class="modal-dialog">
	        <div class="modal-content">
	            <div class="modal-header">
	               <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>	               
	               <div class="panel panel-success">
		                <div class="panel-heading">
							<h3 class="panel-title">修改</h3>
						</div>
						<div class="panel-body">
							<form class="form-horizontal" onsubmit="return check()" role="form">
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">客户ID</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" id="updateCustomerId"
											 disabled="disabled">
									</div>
								</div>
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">客户编号</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" id="updateCustomerNo"
											 disabled="disabled">
									</div>
								</div>
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">客户名</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" id="updateCustomerName"
											disabled="disabled">
									</div>
								</div>
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">联系人</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" onblur="checkUpdateContacts(this)" onfocus="cancelPrompt(this)"
											 id="updateContacts">
										<span id="updateContacts_prompt" class="prompt"></span>
									</div>
								</div>
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">联系电话</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" id="updateTelephone"
											disabled="disabled">
									</div>
								</div>
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">地址</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" onblur="checkUpdateAddress(this)" onfocus="cancelPrompt(this)"
											id="updateAddress">
										<span id="updateAddress_prompt" class="prompt"></span>
									</div>
								</div>
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">描述</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" onblur="checkUpdateDescription(this)" onfocus="cancelPrompt(this)"
											id="updateDescription">
										<span id="updateDescription_prompt" class="prompt"></span>
									</div>
								</div>
								
								<div class="form-group">
									<div class="text-center">
										<input type="button" id="update-Customer" data-dismiss="modal" class="btn btn-primary" value="确认修改"/>
										<input type="button" class="btn btn-info" data-dismiss="modal" value="取消修改"/>
									</div>
								</div>
							</form>
						</div>
					</div>
	            </div>	            
	        </div>
	    </div>
	</div>
</body>
</html>