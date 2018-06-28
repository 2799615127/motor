<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro"%>
<%
	String userName = request.getParameter("userName");
	request.getSession().setAttribute("userName", userName);
%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>table</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

 
<style type="text/css">
body {
	margin: 0;
	padding: 0
}

.background {
	margin-left: 100px;
}

p {
	height: 40px;
	line-height: 40px;
}

.open-model {
	text-align: center;
}

.open-model input {
	padding: 10px 20px;
	font-size: 24px;
	line-height: 24px;
	border: 0px;
	background: #F53639;
	color: #FFF;
	cursor: pointer;
}

.open-model input:hover {
	background: #F3726D;
}

.open-model input:focus {
	border: 0px;
	outline-width: 0px;
}

.model {
	opacity: 0.75;
	background: #666;
	position: fixed;
	left: 0;
	right: 0;
	top: 0;
	bottom: 0;
	z-index: 1000;
}

.model-dialog {
	width: 600px;
	height: 400px;
	background: white;
	position: absolute;
	z-index: 1001;
	left: 0;
	top: 0;
}

.hide {
	display: none;
}
.col-sm-2{
	width:25%;
}
.col-sm-3{
	width:15%;
}
.col-sm-4{
	width:30%;
}
.txt_select_add{
	width:440px;
}
.prompt{
	color:#ff6700;
}

</style>

<!-- Jquery组件引用 -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js"></script>
	
	<!-- bootstrap组件引用 -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap/js/bootstrap.js"></script>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/bootstrap/css/bootstrap.min.css">
	
	<!-- bootstrap table组件以及中文包的引用 -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/bootstrap-table/bootstrap-table.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap-table/bootstrap-table.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>
	<!-- toastr 组件引用 -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/toastr/toastr.min.css "/>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/toastr/toastr.min.js"></script>
	<!-- sweelatert 组件引用 -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/sweetalert/sweetalert.css"/>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/sweetalert/sweetalert.min.js"></script>
	<!-- select2 组件引用 -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/select2/select2.css"/>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/select2/select2.full.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/select2/select2.min.js"></script>
	<!-- ocupload 组件引用 -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/ocupload/jquery.ocupload-1.1.2.js"></script>
	<!-- 三级联动组件引用 -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/citys/jquery.citys.js"></script>
	<!-- Validator组件引用 -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/bootstrap-validator/bootstrapValidator.min.css"/>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap-validator/bootstrapValidator.min.js"></script>
	<!-- 三级联动 -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/linkage.js"></script>
</head>
 
<body>

	<script type="text/javascript">
	 toastr.options.positionClass = 'toast-top-center';
	 
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
		
		var TableInit = function() {
			var oTableInit = new Object();
			//初始化Table 
			oTableInit.Init = function() {
				$('#tb_departments').bootstrapTable({
					url : '/noob/region/regionPageQuery.action', //请求后台的URL（*） 
					method : 'get', //请求方式（*） 
					toolbar : '#toolbar', //工具按钮用哪个容器 
					striped : true, //是否显示行间隔色 
					cache : false, //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*） 
					pagination : true, //是否显示分页（*） 
					sortable : true, //是否启用排序 
					sortOrder : "asc", //排序方式
					queryParams : oTableInit.queryParams,
					sidePagination : "server", //分页方式：client客户端分页，server服务端分页（*） 
					pageNumber : 1, //初始化加载第一页，默认第一页 
					pageSize : 5, //每页的记录行数（*） 
					pageList : [ 5, 10, 50,100 ], //可供选择的每页的行数（*） 	
					search : false, //是否显示表格搜索，此搜索是客户端搜索，不会进服务端，所以，个人感觉意义不大 
					strictSearch : true,
					showColumns : true, //是否显示所有的列 
					showRefresh : true, //是否显示刷新按钮
					minimumCountColumns :5, //最少允许的列数
					clickToSelect : true, //是否启用点击选中行 
					height : 350, //表格高度
					uniqueId : "regionId", //每一行的唯一标识，一般为主键列 
					showToggle : true, //是否显示详细视图和列表视图的切换按钮 
					cardView : false, //是否显示详细视图
					detailView : false, //是否显示父子表
				    
					columns : [ {
						checkbox : true
					}, {
						field : 'province',
						title : '省'
					}, {
						field : 'city',
						title : '市'
					}, {
						field : 'district',
						title : '区(县)'
					}, {
						field : 'postcode',
						title : '邮编'
					}, {
						field : 'shortcode',
						title : '简码'
					}, {
						field : 'citycode',
						title : '城市编码'
					}, {
						field : 'status',
						title : '是否可操作',
						formatter:function(value,row,index){
							if(row.status == '1'){
								return '是';
							}else{
								return '否';
							}
						}
					}],
					rowStyle :function(row,index){
						var strclass ={};
						if(row.status=='0'){
							strclass ={
								css :{
									'background-color' :'#FFCCCC'
								}
							};
						}
						return strclass;
					}
				});
			}; 
			//得到查询的参数
			oTableInit.queryParams = function(params) {
				var temp = {
					//这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的 
					limit : params.limit, //页面大小 
					offset : params.offset, //页码 
					departmentname : $("#txt_search_departmentname").val(),
					statu : $("#txt_search_statu").val(),
					county : $("#txt_search_county").val(),
					province:$("#txt_search_province").val(),
					city:$("#txt_search_city").val(),
					district:$("#txt_search_district").val(),
					shortcode:$("#txt_search_shortcode").val(),
					citycode:$("#txt_search_citycode").val()
				};
				return temp;
			};

			return oTableInit;
		};

		var ButtonInit = function() {
			$.fn.modal.Constructor.prototype.enforceFocus = function() {};
			var oInit = new Object();
			var postdata = {};
			oInit.Init = function() {
				//初始化页面上面的按钮事件 
				$("#btn_add").click(function() {
					test();
				});
				//模糊查询
				$("#btn_query").click(function(){
					//获得数据
					//var obj = $("#txt_search_province").val();
					var obj={
						url:"/noob/region/regionPageQuery.action",
						silent:true,
						query:{
							province:$("#txt_search_province").val(),
							city:$("#txt_search_city").val(),
							district:$("#txt_search_district").val(),
							shortcode:$("#txt_search_shortcode").val(),
							citycode:$("#txt_search_citycode").val(),
						}
					};
					$('#tb_departments').bootstrapTable('refresh', obj);
				});
				
				$('#txt_add_province').change(function() {
					$('#txt_add_city').empty();
					$('#txt_add_city').change();
				})
				
				$('#txt_add_city').change(function() {
					$('#txt_add_district').empty();
				})
				
				//获得省的文本
				selectProvince("#txt_add_province");
				//获取市的文本
				selectCity("#txt_add");
				//获得县的文本
				selectDistrict("#txt_add");
				//添加
				$("#btn_sub").click(function() {
					//调用模态框
					$("#addModel").modal("show");
					var select = $('#tb_departments').bootstrapTable('getSelections');
					//调用清空前一次内容
					clean();
					
					$("#addRegionForm").data('bootstrapValidator').destroy();
					$('#addRegionForm').data('bootstrapValidator', null);
					validatorAdd();
				});
				//确认添加
				$("#addBtn").click(function() {
					validatorAdd();
						var province = $('#txt_add_province').val();
						var city = $('#txt_add_city').val();
						var district = $('#txt_add_district').val();
						var postcode= $('#txt_add_postcode').val();
						var shortcode = $('#txt_add_shortcode').val();
						var citycode= $('#txt_add_citycode').val();
						if(province ==""||province==null){
							toastr.error('省不能为空!');
						}else if(city==""||city==null){
							toastr.error('市不能为空!');
						}else if(district==""||district==null){
							toastr.error('县不能为空!');
						}else if(postcode==""||postcode==null){
							toastr.error('邮编不能为空!');
						}else if(shortcode==""||shortcode==null){
							toastr.error('简码不能为空!');
						}else if(citycode==""||citycode==null){
							toastr.error('城市编码不能为空!');
						}else{ 
						$.ajax({
							type:"get",
							url:'/noob/region/addRegionU.action',
							data:{province:province,city:city,district:district,postcode:postcode,shortcode:shortcode,citycode:citycode},
							success:function(result){
								if(result == "success"){
									toastr.success('添加成功!');
								}else{
									toastr.error('添加失败!');
								}
								$('#tb_departments').bootstrapTable('refresh',{url:"/noob/region/regionPageQuery.action"});
							}
						});
						$("#addModel").modal("hide");
					}	
				});
				//修改
				$("#btn_edit").click(function() {
					var select = $('#tb_departments').bootstrapTable('getSelections');
					$(".prompt").text("");
					if (select.length === 0) {
						toastr.warning('请至少选择一行进行修改!');
					} else if(select.length >1){
						toastr.warning('一次只能选择一行进行修改!');
					} else {
						$("#updateModel").modal("show");
					}
					//通过文本框获得值
					$('#txt_search_regionId').val(select[0].regionId);
					$('#txt_search_province1').val(select[0].province);
					$('#txt_search_city1').val(select[0].city);
					$('#txt_search_district1').val(select[0].district);
					$('#txt_search_postcode1').val(select[0].postcode);						
					$('#txt_search_shortcode1').val(select[0].shortcode);
					$('#txt_search_citycode1').val(select[0].citycode);
				});
				//确认修改 
				$("#update").click(function(){
					
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
						var regionId = $('#txt_search_regionId').val();
						var postcode = $('#txt_search_postcode1').val();
						var shortcode = $('#txt_search_shortcode1').val();
						var citycode = $('#txt_search_citycode1').val();
						$.ajax({
							type:"get",
							url:'/noob/region/updateRegionU.action',
							data:{regionId:regionId,postcode : postcode,shortcode:shortcode,citycode:citycode},
							success:function(result){
								if(result == "success"){
									toastr.success('修改成功!');
								}else{
									toastr.error('修改失败!');
								}
								$('#tb_departments').bootstrapTable('refresh',{url:"/noob/region/regionPageQuery.action"});
							}
						});
						
					});
					
				});
				//调用OCUpload插件导入数据的方法
			    $("#btn_enter").upload({
			        action:"/noob/upload/excel.action", //表单提交的地址
			        name:"myFile",
			        onComplete:function (data) { //提交表单之后
			           if(data == "0"){
			                alert('success'); //提示框，Excel导入成功
			            }else{
			                alert('fail'); //提示框，Excel导入失败
			            }
			        },
			        onSelect: function() {//当用户选择了一个文件后触发事件
			            //当选择了文件后，关闭自动提交
			            this.autoSubmit=false;
			            //校验上传的文件名是否满足后缀为.xls或.xlsx
			            var regex =/^.*\.(?:xls|xlsx)$/i;
			            //this.filename()返回当前选择的文件名称 (ps：我使用这个方法没好使，自己写了一个获取文件的名的方法) $("[name = '"+this.name()+"']").val())
			            //alert(this.filename());
			            if(regex.test($("[name = '"+this.name()+"']").val())){
			            	//通过校验
			                this.submit();
			            }else{
			                //未通过
			                alertt('fail'); //错误提示框，文件格式不正确，必须以.xls或.xlsx结尾
			            } 
			        }  
			        
			    });
			    //导出
			    $("#btn_educe").click(function(){
			    	swal({  
						title: "操作提示",   //弹出框的title  
						text: "确定导出吗？",  //弹出框里面的提示文本  
						showCancelButton: true, //是否显示取消按钮  
						confirmButtonColor: "#DD6B55",//确定按钮颜色  
						cancelButtonText: "关闭",//取消按钮文本  
						confirmButtonText: "是的，确定导出！",//确定按钮上面的文档  
						closeOnConfirm: true  
					},function(){
						$.ajax({
				    		type:"get",
				    		url:"/noob/out/outExcel.action",
				    		data:{path:"E:\\yidujiaoyu\\一键上传资料\\数据导出.xls"},
				    		success:function(result){
								if(result == "success"){
									toastr.success('导出成功!');
								}else{
									toastr.error('导出失败!');
								}
							}
				    	});
					});
			    });
			    
				//删除
				 $("#btn_delete").click(function() {
							var select = $('#tb_departments').bootstrapTable('getSelections');
							var status = [];
							var regionId = [];
							for(var i=0;i<select.length;i++){
								regionId[i] = select[i]['regionId'];
								status[i] = select[i]['status'];
							}
							if (select.length === 0) {
								toastr.warning('请至少选择一行进行操作!');
							}else if(status[0]==='0'){
								toastr.warning("该区域不可操作");
							} else {
								swal({  
									title: "操作提示",   //弹出框的title  
									text: "确定取消吗？",  //弹出框里面的提示文本  
									type: "warning",    //弹出框类型  
									showCancelButton: true, //是否显示取消按钮  
									confirmButtonColor: "#DD6B55",//确定按钮颜色  
									cancelButtonText: "关闭",//取消按钮文本  
									confirmButtonText: "是的，确定取消！",//确定按钮上面的文档  
									closeOnConfirm: true  
								}, function () {
									var arrs = [];
									for (var i = 0; i < select.length; i++) {
										arrs[i] = select[i]['regionId'];
								    }
									$("#tb_departments").bootstrapTable('remove',{
										field: 'regionId',
										values : arrs 
									});
									
									$.ajax({
										type:"get",
										url:'/noob/region/deleteRegionU.action',
										data:{regionIds : arrs},
										success:function(result){
											if(result == "success"){
												toastr.success('取消成功!');
											}else{
												toastr.error('取消失败!');
											}
											$('#tb_departments').bootstrapTable('refresh');
										}
									});
								});
							}
						}); 
				};
			return oInit;
		};
		
		
		$(function() {
			//1.初始化Table 
			var oTable = new TableInit();
			oTable.Init();
			//2.初始化Button的点击事件 
			var oButtonInit = new ButtonInit();
			oButtonInit.Init();
			validatorAdd();
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
		//清空上一次的内容
		function clean(){
			$("#txt_add_province").children("option").remove();
			$('#txt_add_city').children("option").remove();
			$('#txt_add_district').children("option").remove();
			$('#txt_add_postcode').val("");
			$('#txt_add_shortcode').val("");
			$('#txt_add_citycode').val("");
			$(".prompt").text("");
		}
		
		//校验文本框的信息
		function validatorAdd(){
			$('#addRegionForm').bootstrapValidator({
				message: 'This value is not valid',
				feedbackIcons:{
				valid: 'glyphicon glyphicon-ok',
				invalid: 'glyphicon glyphicon-remove',
				validating: 'glyphicon glyphicon-refresh'
			},
			    fields: {
			    	txt_add_province: {
			            validators: {
			               notEmpty: {
			                 message: '省不能为空!',
			               }
			            }
			        },
			        txt_add_city: {
			            validators: {
			               notEmpty: {
			                 message: '市不能为空!',
			               }
			            }
			        },
			        txt_add_district: {
			            validators: {
			               notEmpty: {
			                 message: '区(县)不能为空!',
			               }
			            }
			        },
			        txt_add_postcode: {
			            validators: {
			               notEmpty: {
			                  message: '邮编不能为空!'
			               },
			               regexp: {
			                  regexp: /^\d{6}$/,
			                  message: '邮编格式不正确!'
			               }
			             }
			        },
			        txt_add_shortcode: {
			            validators: {
			               notEmpty: {
			                 message: '简码不能为空!',
			               },
			               regexp:{
			            	   regexp:/^[A-Z]+$/,
			            	   message:'请正确输入简码!'
			               }
			            }
			        },
			        txt_add_citycode: {
			            validators: {
			               notEmpty: {
			                 message: '城市编码不能为空!',
			               },
			               regexp:{
			            	   regexp:/^[a-z]+$/,
			            	   message:'请正确输入城市编码!'
			               }
			            }
			        },
			    }
		    });
	    }
		
	</script>
	
	
	<div class="panel-body" style="padding-bottom:0px;">
		<div class="panel panel-default">
			<div class="panel-heading" >
				<a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">查询条件</a>
			</div>
			<div class="panel-collapse collapse on" id="collapseOne" >
				<form id="formSearch" class="form-horizontal">
					<div class="form-group" style="margin-top:15px">
						<label class="control-label col-sm-1"
							for="txt_search_departmentname" >省</label>
						<div class="col-sm-2">
							<input id="txt_search_province" class="txt_select_province js-example-basic-multiple js-states form-control" />
						</div>
						<label class="control-label col-sm-1" for="txt_search_statu">市</label>
						<div class="col-sm-2">
							<input id="txt_search_city" class="txt_select_city js-example-basic-multiple js-states form-control" />
						</div>
						<label class="control-label col-sm-1" for="txt_search_county">区(县)</label>
						<div class="col-sm-2">
							<input id="txt_search_district" class="txt_select_district js-example-basic-multiple js-states form-control" />
						</div>
						<label class="control-label col-sm-1" for="txt_search_shortcode">简码</label>
						<div class="col-sm-2">
							<input id="txt_search_shortcode" class="txt_select_shortcode js-example-basic-multiple js-states form-control" />
						</div>
						<br/>
						<br/>
						<label class="control-label col-sm-1" for="txt_search_citycode">城市编码</label>
						<div class="col-sm-2">
							<input id="txt_search_citycode" class="txt_select_citycode js-example-basic-multiple js-states form-control" />
						</div>
						<div class="col-sm-3" style="text-align:left;">
							<button type="button" style="margin-left:50px" id="btn_query"
								class="btn btn-primary" >查询</button>
						</div>
					</div>
				</form>
			</div>
		</div>
		<div id="toolbar" class="btn-group">
			<!-- 按钮触发模态框 -->
			<shiro:hasPermission name="导出区域">
			<button id="btn_educe" type="button" class="btn btn-default">
				<span class="glyphicon glyphicon-log-out" aria-hidden="true"></span>导出
			</button>
			</shiro:hasPermission>
			<shiro:hasPermission name="新增区域">
			<button id="btn_sub" type="button" class="btn btn-default" data-toggle="modal" >
				<span class="glyphicon glyphicon-plus" aria-hidden="true" ></span>新增
			</button>
			</shiro:hasPermission>
			<shiro:hasPermission name="修改区域">
			<button id="btn_edit" type="button" class="btn btn-default" data-toggle="modal" >
				<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>修改
			</button>
			</shiro:hasPermission>
			<shiro:hasPermission name="操作区域">
			<button id="btn_delete" type="button" class="btn btn-default">
				<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>操作
			</button>
			</shiro:hasPermission>
			<shiro:hasPermission name="导入区域">
			<button id="btn_enter" type="button" class="btn btn-default" >
				<span class="glyphicon glyphicon-log-in" aria-hidden="true" ></span>导入
			</button>
			</shiro:hasPermission>
		</div>
	</div>
	
	<table id="tb_departments"></table>

	<div class="model hide"></div>
	<!-- 模态框（Modal） -->
	<div class="modal fade" id="addModel" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
	    <div class="modal-dialog">
	        <div class="modal-content">
	            <div class="modal-header">
	                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>	               
	               <div class="panel panel-success">
		                <div class="panel-heading">
							<h3 class="panel-title">添加</h3>
						</div>
					<div class="panel-body">
						<form class="form-horizontal" onsubmit="return check()" role="form" id="addRegionForm" >
							<div class="form-group">
								<label for="firstname" class="col-sm-2 control-label">省</label>
								<div class="col-sm-10" >
									<select id="txt_add_province" class="txt_select_add" name="txt_add_province">
            				   		</select>
            				   		<span id="txt_add_province_prompt" class="prompt"></span>
								</div>
							</div>
							<div class="form-group">
								<label for="lastname" class="col-sm-2 control-label">市</label>
								<div class="col-sm-10">
									<select id="txt_add_city" class="txt_select_add" name="txt_add_city">
            				   		</select> 
            				   		<span id="txt_add_citycode_prompt" class="prompt"></span>
								</div>
							</div>
							<div class="form-group">
								<label for="lastname" class="col-sm-2 control-label">区(县)</label>
								<div class="col-sm-10">
									<select id="txt_add_district" class="txt_select_add" name="txt_add_district">
            				   		</select>
            				   		<span id="txt_add_district_prompt" class="prompt"></span>
								</div>
							</div>
							<div class="form-group">
								<label for="lastname" class="col-sm-2 control-label">邮编</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="txt_add_postcode"
										placeholder="请输入邮编" name="txt_add_postcode" >
								</div>
							</div> 
							<div class="form-group">
								<label for="lastname" class="col-sm-2 control-label">简码</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="txt_add_shortcode"
										placeholder="请输入简码" name="txt_add_shortcode" >
								</div>
							</div> 
							<div class="form-group">
								<label for="lastname" class="col-sm-2 control-label">城市编码</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="txt_add_citycode"
										placeholder="请输入邮编" name="txt_add_citycode" >
								</div>
							</div> 
							 <div class="modal-footer"><!--  -->
	            				<button  type="submit" class="btn btn-primary" id="addBtn" >提交更改</button>
	               				 <button type="button" class="btn btn-default4" data-dismiss="modal">关闭</button>
	           				 </div>
						 </form>
					  </div>
				   </div>
	            </div>
	        </div>
	    </div>
	</div>
	
	<div class="modal fade" id="updateModel" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
								<label for="firstname" class="col-sm-2 control-label">区域Id</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="txt_search_regionId"
										placeholder="Id" disabled>
								</div>
							</div>
							<div class="form-group">
								<label for="firstname" class="col-sm-2 control-label">省</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="txt_search_province1"
										placeholder="请输入省份" disabled>
								</div>
							</div>
							<div class="form-group">
								<label for="lastname" class="col-sm-2 control-label">市</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="txt_search_city1"
										placeholder="请输入城市" disabled>
								</div>
							</div>
							<div class="form-group">
								<label for="lastname" class="col-sm-2 control-label">区(县)</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="txt_search_district1"
										placeholder="请输入区(县)" disabled	>
								</div>
							</div>
							<div class="form-group">
								<label for="lastname" class="col-sm-2 control-label">邮编</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="txt_search_postcode1"
										placeholder="请输入邮编">
									<span id="txt_search_postcode1_prompt" class="prompt"></span>
								</div>
							</div>
							<div class="form-group">
								<label for="lastname" class="col-sm-2 control-label">简码</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="txt_search_shortcode1"
										placeholder="请输入简码">
									<span id="txt_search_shortcode1_prompt" class="prompt"></span>
								</div>
							</div>
							<div class="form-group">
								<label for="lastname" class="col-sm-2 control-label">城市编码</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="txt_search_citycode1"
										placeholder="请输入城市编码">
									<span id="txt_search_citycode1_prompt" class="prompt"></span>
								</div>
							</div>
						 </form>
					  </div>
				   </div>
	            </div>
	            <div class="modal-footer">
	            	<button type="button" class="btn btn-primary" id="update" data-dismiss="modal">确认修改</button>
	                <button type="button" class="btn btn-default4" data-dismiss="modal">关闭</button>
	            </div>
	        </div>
	    </div>
	</div>

</body>
</html>
