<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page isELIgnored="false"%>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro"%>
<%
	String userName = request.getParameter("userName");
	request.getSession().setAttribute("userName", userName);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>组织管理</title>
<!-- Jquery组件引用 -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js"></script>

<!-- bootstrap组件引用 -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/bootstrap/js/bootstrap.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/js/bootstrap/css/bootstrap.min.css">

<!-- bootstrap table组件以及中文包的引用 -->
<%-- <script type="text/javascript"
	src="${pageContext.request.contextPath}/js/bootstrap-table/bootstrap-table.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/js/bootstrap-table/bootstrap-table.css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script> --%>

<!-- 提示框Js文件和Css的引用 -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/toastr/toastr.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/js/toastr/toastr.min.css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/sweetalert/sweetalert.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/js/sweetalert/sweetalert.css" />

<!-- 页面下拉框Js文件和Css的引用 -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/bootstrap-select/js/bootstrap-select.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/js/bootstrap-select/css/bootstrap-select.min.css" />

<!-- 树形表格 -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/js/bootstrap-jqxtreegrid/css/jqxbase.css"
	type="text/css" />

<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/bootstrap-jqxtreegrid/js/jqxcore.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/bootstrap-jqxtreegrid/js/jqxdata.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/bootstrap-jqxtreegrid/js/jqxbuttons.js"></script>

<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/bootstrap-jqxtreegrid/js/jqxscrollbar.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/bootstrap-jqxtreegrid/js/jqxdatatable.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/bootstrap-jqxtreegrid/js/jqxtreegrid.js"></script>
<!-- 校验 -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/bootstrap-validator/bootstrapValidator.min.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/js/bootstrap-validator/bootstrapValidator.min.css"
	type="text/css" />
<style type="text/css">
style type ="text /css">body {
	font-size: 24px;
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
</style>
<script type="text/javascript">
	function jqxtreegridInit() {
		var orgName = $("#txt_search_departmentname").val();
		var type = "";
		for(var i = 0; i < $("#txt_search_type").children().length; i++) {
			if ($("#txt_search_type").children()[i].selected) {
				type = $($("#txt_search_type").children()[i]).attr("id");
			}
		}
		
		var empId ="";
		for(var i = 0; i < $("#txt_search_empId").children().length; i++) {
			if ($("#txt_search_empId").children()[i].selected) {
				empId = $($("#txt_search_empId").children()[i]).attr("id");
			}
		}
		

		var source = {
			dataType : "json",
			data : {
				orgName : orgName,
				type : type,
				empId : empId,
			},
			dataFields : [ {
				name : 'orgId',
				type : 'string'
			}, {
				name : 'orgName',
				type : 'string'
			}, {
				name : 'subsetName',
				type : 'string'
			}, {
				name : 'location',
				type : 'string'
			}, {
				name : 'description',
				type : 'string'
			}, {
				name : 'parentId',
				type : 'string'
			}, {
				name : 'staffName',
				type : 'staffName'
			}, ],
			hierarchy : {
				keyDataField : {
					name : 'orgId'
				},
				parentDataField : {
					name : 'parentId'
				}
			},
			id : 'orgId',
			url : '/noob/organization/orgPageQuery.action'
		};
		var dataAdapter = new $.jqx.dataAdapter(source);

		$("#treegrid").jqxTreeGrid({
			width : $("#treegrid").width(),
			pageSize : 100,

			pageable : false,//是否分页
			pagerPosition : 'bottom',
			source : dataAdapter,
			sortable : true,
			columns : [ {
				text : '组织Id',
				dataField : 'orgId',
				width : "auto",
			}, {
				text : '组织名',
				dataField : 'orgName',
				width : "auto"
			}, {
				text : '基本类型',
				dataField : 'subsetName',
				width : "auto"
			}, {
				text : '所在地',
				dataField : 'location',
				width : "auto"
			}, {
				text : '上级组织',
				dataField : 'parentId',
				width : "auto"
			}, {
				text : '描述',
				dataField : 'description',
				width : "auto"
			}, {
				text : '负责人',
				dataField : 'staffName',
				width : "auto",
			},

			]
		});
	}

	var ButtonInit = function() {
		var oInit = new Object();
		var postdata = {};
		oInit.Init = function() {
			//初始化页面上面的按钮事件 
			//添加按钮
			$.ajax({
				url : "/noob/organization/staffPageQuery.action",
				type : "post",
				async : true,
				success : function(response) {
					var html = "";
					for (var i = 0; i < response.length; i++) {
						html = html + "<option id='"+response[i].staffId+"'>"
								+ response[i].staffName + "</option>";
					}
					$("#txt_search_empId").append(html);
					$(".selectpicker").selectpicker("refresh");
				}
			});
			$.ajax({
				url : "/noob/organization/subsetPageQuery.action",
				type : "post",
				async : true,
				success : function(response) {
					var html = "";
					for (var i = 0; i < response.length; i++) {
						html = html + "<option id='"+response[i].subsetId+"'>"
								+ response[i].subsetName + "</option>";
					}
					$("#txt_search_type").append(html);
					$(".selectpicker").selectpicker("refresh");
				}
			});

			$("#btn_add").click(function() {
				test();
				clean();
				$("#addOrgForm").data('bootstrapValidator').destroy();
				$('#addOrgForm').data('bootstrapValidator', null);
				addValidator();
			});
			//修改按钮
			$("#btn_edit").click(function() {
								var select = $('#treegrid').jqxTreeGrid(
										'getSelection');
								if (select.length === 0) {
									toastr.warning("请至少选择一行进行修改");
								} else if (select.length > 1) {
									toastr.info('只能选择一行进行修改');
								} else {
									//获取select dom对象
									var allPSelect = document
											.getElementById("parentId");
									//获取select下拉框下所有的选项
									var optionPArr = allPSelect
											.getElementsByTagName("option");

									var pLen = optionPArr.length;
									for (var i = 0; i < pLen; i++) {
										//将其对应序号的option删除
										allPSelect.remove(optionPArr[i]);
									}

									var allTSelect = document
											.getElementById("type");
									//获取select下拉框下所有的选项
									var optionTArr = allTSelect
											.getElementsByTagName("option");
									var tLen = optionTArr.length;
									for (var i = 0; i < tLen; i++) {
										//将其对应序号的option删除
										allTSelect.remove(optionTArr[i]);
									}
									var allEmpSelect = document
											.getElementById("empId");
									//获取select下拉框下所有的选项
									var optionEmpArr = allEmpSelect
											.getElementsByTagName("option");
									var empLen = optionEmpArr.length;
									for (var i = 0; i < empLen; i++) {
										//将其对应序号的option删除
										allEmpSelect.remove(optionEmpArr[i]);
									}

									var orgId = select[0]['orgId'];
									var selectParentId = select[0]["parentId"];
									//弹出模态框
									$("#editModal").modal("show");
									//获取选中的值赋值到输入框中
									$('#orgName').val(select[0]['orgName']);

									$('#location').val(select[0]['location']);
									$('#description').val(
											select[0]['description']);

									selected_option = select[0]['parentId'];
									select_empId = select[0]['staffName'];
									select_type = select[0]['subsetName'];
									
									//初始化组织类型下拉框
									$
											.ajax({
												url : "/noob/organization/orgPageQuery.action",
												type : "post",
												async : true,
												success : function(response) {
													var html = "<option value='0'>总公司管理</option>";
													for (var i = 0; i < response.length; i++) {
														if (selectParentId == null) {
															html = html
																	+ "<option  id='"+response[i].orgId+"' disabled='false'>"
																	+ response[i].orgName
																	+ "</option>";
														} else if (selectParentId == response[i].orgId) {
															html = html
																	+ "<option selected style='color:#ff6700;' id='"+response[i].orgId+"'>"
																	+ response[i].orgName
																	+ "</option>";
														} else if (orgId == response[i].orgId) {
															html = html
																	+ "<option  id='"+response[i].orgId+"' disabled='false'>"
																	+ response[i].orgName
																	+ "</option>";
														} else {
															html = html
																	+ "<option  id='"+response[i].orgId+"'>"
																	+ response[i].orgName
																	+ "</option>";
														}
													}
													$("#parentId").append(html);
													$(".selectpicker")
															.selectpicker(
																	"refresh");
												}
											});
									//初始化负责人下拉框
									$
											.ajax({
												url : "/noob/organization/staffPageQuery.action",
												type : "post",
												async : true,
												success : function(response) {
													var html = "";
													for (var i = 0; i < response.length; i++) {
														if (select_empId == response[i].staffName) {
															html = html
																	+ "<option selected style='color:#ff6700;' id='"+response[i].staffId+"'>"
																	+ response[i].staffName
																	+ "</option>";
														} else {
															html = html
																	+ "<option id='"+response[i].staffId+"'>"
																	+ response[i].staffName
																	+ "</option>";
														}
													}
													$("#empId").append(html);
													$(".selectpicker")
															.selectpicker(
																	"refresh");
												}
											});
									$
											.ajax({
												url : "/noob/organization/subsetPageQuery.action",
												type : "post",
												async : true,
												success : function(response) {
													var html = "";
													for (var i = 0; i < response.length; i++) {
														
														if (select_type == response[i].subsetName) {
															html = html
																	+ "<option selected style='color:#ff6700;' id='"+response[i].subsetId+"'>"
																	+ response[i].subsetName
																	+ "</option>";
														} else {
															html = html
																	+ "<option id='"+response[i].subsetId+"'>"
																	+ response[i].subsetName
																	+ "</option>";
														}
													}
													$("#type").append(html);
													$(".selectpicker")
															.selectpicker(
																	"refresh");
												}
											});
									$("#editOrgForm").data('bootstrapValidator').destroy();
									$('#editOrgForm').data('bootstrapValidator', null);
									editValidator();
								}

							});
			//删除按钮
			$("#btn_delete")
					.click(
							function() {
								//判断是否选中一行

								var select = $('#treegrid').jqxTreeGrid(
										'getSelection');

								if (select.length == 0) {
									toastr.warning('请至少选择一行进行删除');
								} else {
									var orgIds=[];
									for (var i = 0; i < select.length; i++) {
										orgIds[i] = select[i]['orgId'];
									}
									$
											.ajax({
												type : "post",
												url : '/noob/organization/orgPageQuery.action',
												data : {
													orgIds : orgIds
												},
												success : function(result) {
													if (result == "") {
														swal(
																{
																	title : "操作提示", //弹出框的title  
																	text : "确定删除吗？", //弹出框里面的提示文本  
																	type : "warning", //弹出框类型  
																	showCancelButton : true, //是否显示取消按钮  
																	confirmButtonColor : "#DD6B55",//确定按钮颜色  
																	cancelButtonText : "取消",//取消按钮文本  
																	confirmButtonText : "是的，确定删除！",//确定按钮上面的文档  
																	closeOnConfirm : true
																},
																function() {
																	var arrs = [];
																	for (var i = 0; i < select.length; i++) {
																		arrs[i] = select[i]['orgId'];
																	}
																	$
																			.ajax({
																				type : "post",
																				url : '/noob/organization/orgDeleteU.action',
																				data : {
																					orgIds : arrs
																				},
																				success : function(
																						result) {
																					if (result == "success") {

																						toastr
																								.success('删除成功!');
																						jqxtreegridInit();
																					} else {
																						toastr
																								.error('删除失败!');
																					}

																				}

																			});

																});
													} else {
														toastr
																.error('该组织有子组织不可以删除!');
													}

												}

											});
								}

							});

		};
		return oInit;
	};

	$(function() {
		
		//1.初始化Table

		/* var oTable = new TableInit();
		oTable.Init(); */

		jqxtreegridInit();

		//2.初始化Button的点击事件 
		var oButtonInit = new ButtonInit();
		oButtonInit.Init();
		//初始化操作消息提示框
		toastr.options = {
			closeButton : false, //是否显示关闭按钮
			debug : false, //是否为调试
			progressBar : true, //是否显示进度条
			positionClass : "toast-top-center", //在页面中显示的位置
			onclick : null, //点击事件
			showDuration : "100", //显示动作时间
			hideDuration : "1000", //隐藏动作时间
			timeOut : "2000", //自动关闭超时时间
			extendedTimeOut : "1000",
			showEasing : "swing",
			hideEasing : "linear",
			preventDuplicates : true,
			preventOpenDuplicates : true, //重复内容的提示框在开启时只出现一个
			showMethod : "fadeIn", //显示的方式
			hideMethod : "fadeOut" //隐藏的方式
		};

		//条件查询
		$("#btn_query").click(function() {
			jqxtreegridInit();
		});
		//修改的提交按钮
		$("#editSub").click(function() {
			editValidator();
			var select = $('#treegrid').jqxTreeGrid('getSelection');
			var orgId = select[0]['orgId'];
			var orgName = $('#orgName').val();
			var parentId = "";
			for (var i = 0; i < $("#parentId").children().length; i++) {
				if ($("#parentId").children()[i].selected) {
					parentId = $($("#parentId").children()[i]).attr("id");
				}
			}
			var type = ""; 
			for (var i = 0; i < $("#type").children().length; i++) {
				if ($("#type").children()[i].selected) {
					type = $($("#type").children()[i]).attr("id");
				}
			}
			var empId ="";
			for (var i = 0; i < $("#empId").children().length; i++) {
				if ($("#empId").children()[i].selected) {
					empId = $($("#empId").children()[i]).attr("id");
				}
			}
			var cancel = $('#cancel').val();
			var description = $('#description').val();
			var location = $('#location').val();
			if (orgName != "" && location != "" && description !=""){
				$("#editModal").modal('hide');
				$.ajax({
					type : "post",
					url : '/noob/organization/updateOrgU.action',
					data : {
						orgId : orgId,
						orgName : orgName,
						parentId : parentId,
						location : location,
						description : description,
						cancel : cancel,
						empId : empId,
						type : type
					},
					success : function(result) {
						if (result == "success") {
							toastr.success('修改成功!');
						} else {
							toastr.error('修改失败!');
						}
						jqxtreegridInit();
					}
					
				});
			}
			
		});
		editValidator();
		//添加的提交按钮
		$("#addSub").click(function() {
			addValidator();
			//组织结构Id
			var parentId = "";
			for (var i = 0; i < $("#addParentId").children().length; i++) {
				if ($("#addParentId").children()[i].selected) {
					parentId = $($("#addParentId").children()[i]).attr("id");
				}
			}

			var orgName = $('#addOrgName').val();
			var location = $('#addLocation').val();
			var empId ="";
			for (var i = 0; i < $("#addEmpId").children().length; i++) {
				if ($("#addEmpId").children()[i].selected) {
					empId = $($("#addEmpId").children()[i]).attr("id");
				}
			}
			var type = "";
			for (var i = 0; i < $("#addType").children().length; i++) {
				if ($("#addType").children()[i].selected) {
					type = $($("#addType").children()[i]).attr("id");
				}
			}
			var cancel = $('#addCancel').val();
			var description = $('#addDescription').val();
			if ( orgName != "" && location != ""&& description!="")  {
				$("#addModal").modal('hide');
				$.ajax({
					type : "post",
					url : '/noob/organization/addOrgU.action',
					data : {
						orgName : orgName,
						location : location,
						parentId : parentId,
						description : description,
						empId : empId,
						type : type,
						cancel : cancel
					},
					success : function(result) {
						if (result == "success") {
							toastr.success('添加成功!');
							jqxtreegridInit();
						} else {
							toastr.error('添加失败!');
						}
					}

				});
			}

		});
		addValidator();
	});

	function test() {
		//获取select dom对象
		var allPSelect = document.getElementById("addParentId");
		//获取select下拉框下所有的选项
		var optionPArr = allPSelect.getElementsByTagName("option");

		var pLen = optionPArr.length;
		for (var i = 0; i < pLen; i++) {
			//将其对应序号的option删除
			allPSelect.remove(optionPArr[i]);
		}

		var allTSelect = document.getElementById("addType");
		//获取select下拉框下所有的选项
		var optionTArr = allTSelect.getElementsByTagName("option");
		var tLen = optionTArr.length;
		for (var i = 0; i < tLen; i++) {
			//将其对应序号的option删除
			allTSelect.remove(optionTArr[i]);
		}
		var allEmpSelect = document.getElementById("addEmpId");
		//获取select下拉框下所有的选项
		var optionEmpArr = allEmpSelect.getElementsByTagName("option");
		var empLen = optionEmpArr.length;
		for (var i = 0; i < empLen; i++) {
			//将其对应序号的option删除
			allEmpSelect.remove(optionEmpArr[i]);
		}

		//初始化组织类型下拉框
		$.ajax({
			url : "/noob/organization/orgPageQuery.action",
			type : "post",
			async : true,
			success : function(response) {
				var html = "<option value='0'>总公司管理</option>";
				for (var i = 0; i < response.length; i++) {
					html = html + "<option id='"+response[i].orgId+"'>"
							+ response[i].orgName + "</option>";
				}
				$("#addParentId").append(html);
				$(".selectpicker").selectpicker("refresh");
			}
		});
		$.ajax({
			url : "/noob/organization/subsetPageQuery.action",
			type : "post",
			async : true,
			success : function(response) {
				var html = "";
				for (var i = 0; i < response.length; i++) {
					html = html + "<option id='"+response[i].subsetId+"'>"
							+ response[i].subsetName + "</option>";
				}
				$("#addType").append(html);
				$(".selectpicker").selectpicker("refresh");
			}
		});
		$.ajax({
			url : "/noob/organization/staffPageQuery.action",
			type : "post",
			async : true,
			success : function(response) {
				var html = "";
				for (var i = 0; i < response.length; i++) {
					html = html + "<option id='"+response[i].staffId+"'>"
							+ response[i].staffName + "</option>";
				}
				$("#addEmpId").append(html);
				$(".selectpicker").selectpicker("refresh");
			}
		});
	}

	function cancel() {
		$('body').css('overflow', 'auto');
		$('body').css('padding-right', '0px');
		$('.model').addClass('hide');
		$('.model-dialog').addClass('hide');
	}
	

	function clean(){
		$("#addOrgName").val("");
		$("#addLocation").val("");
		$("#addDescription").val("");
	}
	function show() {

		if (seek.style.display == "none"){
			
			seek.style.display = "block";
		}else{
			seek.style.display = "none";
		}

	}
	function addValidator(){
		$('#addOrgForm').bootstrapValidator({
			message: 'This value is not valid',
			feedbackIcons:{
			valid: 'glyphicon glyphicon-ok',
			invalid: 'glyphicon glyphicon-remove',
			validating: 'glyphicon glyphicon-refresh'
		},
	    fields: {
	    	addOrgName: {
	             message: '组织名验证失败!',
	             validators: {
	             notEmpty: {
	                 message: '组织名不能为空!',
	             },
	             /* stringLength: {
	                 min: 2,
	                 max: 4,
	                 message: '职员名长度必须在2到4位之间!'
	             }, */
	             regexp: {
	                 regexp: /^[\u4E00-\u9FA5]{1,9}$/,
	                 message: '组织名只能为中文!'
	                }
	              }
	            },
	            addLocation: {
	                 validators: {
	                     notEmpty: {
	                         message: '所在地不能为空!'
	                     },
	                     /* stringLength: {
	                         min: 6,
	                         max: 12,
	                         message: '所在地长度必须在6到12位之间!'
	                     } */
	                 }
	             },
	             addDescription: {
	                 validators: {
	                     notEmpty: {
	                         message: '描述不能为空!'
	                     },
	                 }
	             }
	         }
	     });
	}
	
	function editValidator(){
		$('#editOrgForm').bootstrapValidator({
			message: 'This value is not valid',
			feedbackIcons:{
			valid: 'glyphicon glyphicon-ok',
			invalid: 'glyphicon glyphicon-remove',
			validating: 'glyphicon glyphicon-refresh'
		},
	    fields: {
	    	orgName: {
	             message: '组织名验证失败!',
	             validators: {
	             notEmpty: {
	                 message: '组织名不能为空!',
	             },
	             /* stringLength: {
	                 min: 2,
	                 max: 4,
	                 message: '职员名长度必须在2到4位之间!'
	             }, */
	             regexp: {
	                 regexp: /^[\u4E00-\u9FA5]{1,9}$/,
	                 message: '组织名只能为中文!'
	                }
	              }
	            },
	            location: {
	                 validators: {
	                     notEmpty: {
	                         message: '所在地不能为空!'
	                     },
	                     /* stringLength: {
	                         min: 6,
	                         max: 12,
	                         message: '所在地长度必须在6到12位之间!'
	                     } */
	                 }
	             },
	             description: {
	                 validators: {
	                     notEmpty: {
	                         message: '描述不能为空!'
	                     },
	                 }
	             }
	         }
	     });
	}
</script>
</head>
<body>
	<div class="panel-body" style="padding-bottom: 0px;">
		<div class="panel panel-default">
			<input type=button onclick="show()" value=条件查询
				class="btn btn-default"/>
			<form id="formSearch" class="form-horizontal">
				<div id="seek" class="form-group" style="display: none">
					<label class="control-label col-sm-1"
						for="txt_search_departmentname">组织名称</label>
					<div class="col-sm-2">
						<input type="text" class="form-control"
							id="txt_search_departmentname">
					</div>
					<label class="control-label col-sm-1" for="txt_search_type">组织类型</label>
					<div class="col-sm-3">
						<select class="selectpicker show-menu-arrow" id="txt_search_type">
							<option value="">无</option>
						</select>
					</div>
					<label class="control-label col-sm-1" for="txt_search_empId">负责人</label>
					<div class="col-sm-2">
						<select class="selectpicker show-menu-arrow" id="txt_search_empId">
							<option value="">无</option>
						</select>
					</div>
					<div class="col-sm-1" style="text-align: left;">
						<button type="button" style="margin-left: 50px" id="btn_query"
							class="btn btn-primary">查询</button>
					</div>
				</div>
			</form>
		</div>
	</div>
	<div id="toolbar" class="btn-group">
		<!-- 按钮触发模态框 -->
		<shiro:hasPermission name="新增组织">
		<button id="btn_add" type="button" class="btn btn-default"
			data-toggle="modal" data-target="#addModal">
			<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增
		</button>
		</shiro:hasPermission>
		<shiro:hasPermission name="修改组织">
		<button id="btn_edit" type="button" class="btn btn-default"
			data-toggle="modal">
			<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>修改
		</button>
		</shiro:hasPermission>
		<shiro:hasPermission name="删除组织">
		<button id="btn_delete" type="button" class="btn btn-default">
			<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>删除
		</button>
		</shiro:hasPermission>
	</div>
	<!-- <table id="tb_departments"></table> -->
	<div id="treegrid"></div>

	<!-- 添加模态框（Modal） -->
	<div class="modal fade" id="addModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<div class="panel panel-success">
						<div class="panel-heading">
							<h3 class="panel-title">增加组织</h3>
						</div>
						<div class="panel-body">
							<form class="form-horizontal" onsubmit="return check()"
								role="form" id="addOrgForm">
								<div class="form-group">
									<label for="firstname" class="col-sm-2 control-label">组织名</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" id="addOrgName"
											placeholder="请输入组织名" name="addOrgName">
									</div>
								</div>
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">上级组织</label>
									<div class="col-sm-10">
										<select class="selectpicker show-menu-arrow"
											data-width="455px" data-size="5" id="addParentId">
											<option value="0">总公司管理</option>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">所在地</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" id="addLocation"
											placeholder="请输入所在地" name="addLocation">
									</div>
								</div>

								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">组织类型</label>
									<div class="col-sm-10">
										<select class="selectpicker show-menu-arrow"
											data-width="455px" data-size="5" id="addType">

										</select>
									</div>
								</div>
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">作废标记</label>
									<div class="col-sm-10">
										<select class="selectpicker show-menu-arrow"
											data-width="455px" data-size="5" id="addCancel">
											<option value="1">作废</option>
											<option value="0" selected="selected">激活</option>
										</select>
									</div>
								</div>

								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">负责人</label>
									<div class="col-sm-10">
										<select class="selectpicker show-menu-arrow"
											data-width="455px" data-size="5" id="addEmpId">

										</select>
									</div>
								</div>
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">描述</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" id="addDescription"
											placeholder="请输入描述" name="addDescription"/>
									</div>
								</div>
								<div class="modal-footer">
									<button type="submit" class="btn btn-primary" id="addSub">确认添加</button>
									<button type="button" class="btn btn-default4" data-dismiss="modal">关闭</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<div class="modal fade" id="editModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<div class="panel panel-success">
						<div class="panel-heading">
							<h3 class="panel-title">修改组织</h3>
						</div>
						<div class="panel-body">
							<form class="form-horizontal" onsubmit="return check()"
								role="form" id="editOrgForm">
								<div class="form-group">
									<label for="firstname" class="col-sm-2 control-label">组织名</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" id="orgName"
											name="orgName">
									</div>
								</div>
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">上级组织</label>
									<div class="col-sm-10">
										<select class="selectpicker show-menu-arrow"
											data-width="455px" data-size="5" id="parentId">

										</select>
									</div>
								</div>
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">所在地</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" id="location"
											placeholder="请输入所在地" name="location">
									</div>
								</div>

								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">组织类型</label>
									<div class="col-sm-10">
										<select class="selectpicker show-menu-arrow"
											data-width="455px" data-size="5" id="type">

										</select>
									</div>
								</div>
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">作废标记</label>
									<div class="col-sm-10">
										<select class="selectpicker show-menu-arrow"
											data-width="455px" data-size="5" id="cancel">
											<option value="1">作废</option>
											<option value="0" selected="selected">激活</option>

										</select>
									</div>
								</div>

								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">负责人</label>
									<div class="col-sm-10">
										<select class="selectpicker show-menu-arrow"
											data-width="455px" data-size="5" id="empId">

										</select>
									</div>
								</div>
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">描述</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" id="description"
											placeholder="请输入描述" name="description">
									</div>
								</div>
								<div class="modal-footer">
									<button type="submit" class="btn btn-primary" id="editSub">确认修改</button>
									<button type="button" class="btn btn-default4" data-dismiss="modal">关闭</button>
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