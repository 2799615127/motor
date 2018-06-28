var TableInit = function() {
	var oTableInit = new Object();
	// 初始化Table
	oTableInit.Init = function() {
		$('#tb_departments').bootstrapTable({
			url : '/noob/staff/staffPageQuery.action', // 请求后台的URL（*）
			method : 'get', // 请求方式（*）
			toolbar : '#toolbar', // 工具按钮用哪个容器
			striped : true, // 是否显示行间隔色
			cache : false, // 是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
			pagination : true, // 是否显示分页（*）
			sortable : false, // 是否启用排序
			sortOrder : "asc", // 排序方式
			queryParams : oTableInit.queryParams,// 传递参数（*）
			sidePagination : "server", // 分页方式：client客户端分页，server服务端分页（*）
			pageNumber : 1, // 初始化加载第一页，默认第一页
			pageSize : 6, // 每页的记录行数（*）
			pageList : [ 5, 10, 15, 20 ], // 可供选择的每页的行数（*）
			search : false, // 是否显示表格搜索，此搜索是客户端搜索，不会进服务端，所以，个人感觉意义不大
			strictSearch : true,
			showColumns : true, // 是否显示所有的列
			showRefresh : true, // 是否显示刷新按钮
			minimumCountColumns : 2, // 最少允许的列数
			clickToSelect : true, // 是否启用点击选中行
			uniqueId : "subareaId", // 每一行的唯一标识，一般为主键列
			showToggle : true, // 是否显示详细视图和列表视图的切换按钮
			cardView : false, // 是否显示详细视图
			detailView : false, // 是否显示父子表
			columns : [ {
				checkbox : true
			}/*
				 * , { field : 'staffId', title : '取派员Id' }
				 */, {
				field : 'staffNumber',
				title : '取派员编号'
			}, {
				field : 'staffName',
				title : '取派员名'
			}, {
				field : 'staffPassword',
				title : '查台密码'
			}, {
				field : 'telephone',
				title : '电话'
			}, {
				field : 'pdsign',
				title : 'PD标志',
				formatter : function(value, row, index) {
					if (row.pdsign == '0') {
						return '否';
					} else {
						return '是';
					}
				}
			}, {
				field : 'cancelSign',
				title : '作废标记',
				formatter : function(value, row, index) {
					if (row.cancelSign == '0') {
						return '否';
					} else {
						return '是';
					}
				}
			}, {
				field : 'orgName',
				title : '组织名称'
			}, {
				field : 'standardName',
				title : '取派标准名称'
			}, {
				field : 'timeName',
				title : '收派时间名称'
			}, {
				field : 'subsetName',
				title : '档案类型'
			} ],
			rowStyle: function (row, index) {
                //这里有5个取值代表5中颜色['active', 'success', 'info', 'warning', 'danger'];
                var strclass = {};
                if (row.cancelSign == "1") {
                    strclass ={css:{'background-color':'#FFCCCC'}};//还有一个active
                }
                return strclass 
            }

		});
	};
	// 得到查询的参数
	oTableInit.queryParams = function(params) {
		var temp = {
			// 这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
			pageSize : params.limit,
			start : params.offset,
			staffNumber : $("#txt_search_staffNumber").val(),// 编号
			staffName : $("#txt_search_staffName").val(),// 取派员名
			standardName : $("#txt_search_standardName").val(),// 收派标准
			orgName : $("#txt_search_orgName").val(),// 所属单位
			subsetName : $("#txt_search_subsetName").val()//类型
		};
		return temp;
	};

	return oTableInit;
};

var ButtonInit = function() {
	var oInit = new Object();
	var postdata = {};
	oInit.Init = function() {
		// 初始化页面上面的按钮事件
		$("#btn_add").click(function() {
			test();
		});
		
		// 修改按钮
		$("#btn_edit").click(function() {
			$(".prompt").text("");
			clean();
			var select = $('#tb_departments').bootstrapTable('getSelections');
			if (select.length === 0) {
				toastr.warning('请至少选择一行进行修改!');
			} else if (select.length > 1) {
				toastr.info('只能选择一行进行修改!');
			} else {
				var selectSubsetName = select[0]["subsetName"];
				var selectOrgName = select[0]["orgName"];
				var selectStandardName = select[0]["standardName"];
				var selectTimeName = select[0]["timeName"];
				$("#updateStaffId").val(select[0]["staffId"]);
				$("#updateStaffName").val(select[0]["staffName"]);
				$("#updateStaffPassword").val(select[0]["staffPassword"]);
				$("#updateTelephone").val(select[0]["telephone"]);
				$("#PDSignU").val(select[0]["pdsign"]);
				$("#cancelSignU").val(select[0]["cancelSign"]);
				//档案类型
				$.ajax({
					url:"/noob/staff/findAllSubsetNameAndIdQuery.action",
					type:"post",
					data:{"archivesName":"取派员类型"},
					async:true,
					success:function(response){
						var html = "";
						for(var i=0;i<response.length;i++) {
							if(selectSubsetName==response[i].subsetName){
								html = html+"<option selected style='color:#ff6700;' id='"+response[i].subsetId+"'>"+response[i].subsetName+"</option>";
							}else{
								html = html+"<option id='"+response[i].subsetId+"'>"+response[i].subsetName+"</option>";
							}
						}
						$("#subsetNameU").append(html);
						$(".selectpicker").selectpicker("refresh");
					}
				});
				
				//单位名称
				$.ajax({
					url:"/noob/staff/findAllOrgNameAndIdQuery.action",
					type:"post",
					async:true,
					success:function(response){
						var html = "";
						for(var i=0;i<response.length;i++) {
							if(selectOrgName==response[i].orgName){
								html = html+"<option selected style='color:#ff6700;' id='"+response[i].orgId+"'>"+response[i].orgName+"</option>";
							}else{
								html = html+"<option id='"+response[i].orgId+"'>"+response[i].orgName+"</option>";
							}
						}
						$("#orgNameU").append(html);
						$(".selectpicker" ).selectpicker("refresh");
					}
				});
				
				//收派标准名称
				$.ajax({
					url:"/noob/staff/findAllStandardNameAndIdQuery.action",
					type:"post",
					async:true,
					success:function(response){
						var html = "";
						for(var i=0;i<response.length;i++) {
							if(selectStandardName==response[i].standardName){
								html = html+"<option selected style='color:#ff6700;' id='"+response[i].standardId+"'>"+response[i].standardName+"</option>";
							}else{
								html = html+"<option id='"+response[i].standardId+"'>"+response[i].standardName+"</option>";
							}
						}
						$("#standardNameU").append(html);
						$(".selectpicker" ).selectpicker("refresh");
					}
				});
				
				//收派时间名称
				$.ajax({
					url:"/noob/staff/findAllTimeNameAndIdQuery.action",
					type:"post",
					async:true,
					success:function(response){
						var html = "";
						for(var i=0;i<response.length;i++) {
							if(selectTimeName==response[i].timeName){
								html = html+"<option selected style='color:#ff6700;' id='"+response[i].timeId+"'>"+response[i].timeName+"</option>";
							}else{
								html = html+"<option id='"+response[i].timeId+"'>"+response[i].timeName+"</option>";
							}
						}
						$("#timeNameU").append(html);
						$(".selectpicker" ).selectpicker("refresh");
					}
				});
				$("#myModalUpdate").modal("show");
				$("#updateStaffFrom").data('bootstrapValidator').destroy();
				$('#updateStaffFrom').data('bootstrapValidator', null);
				validatorU();
			}
		});
		
		//删除按钮
		$("#btn_delete").click(function() {
			var select = $('#tb_departments').bootstrapTable('getSelections');
			if (select.length === 0) {
				toastr.warning('请至少选择一行进行作废!');
			} else {
				swal({
					title : "操作提示", // 弹出框的title
					text : "确定作废吗？", // 弹出框里面的提示文本
					type : "warning", // 弹出框类型
					showCancelButton : true, // 是否显示取消按钮
					confirmButtonColor : "#DD6B55",// 确定按钮颜色
					cancelButtonText : "取消",// 取消按钮文本
					confirmButtonText : "是的，确定作废！",// 确定按钮上面的文档
					closeOnConfirm : true
				}, function() {
					var arrs = [];
					for (var i = 0; i < select.length; i++) {
						/*var array = select[i]['cancelSign'];
						if (array == "1") {
							toastr.warning('该记录已作废不能再次作废!');
						} else {*/
							arrs[i] = select[i]['staffId'];
						//}
					}

					$.ajax({
						type : "GET",
						url : '/noob/staff/deleteLotStaffU.action',
						data : {
							staffIds : arrs
						},
						success : function(result) {
							if (result == "success") {
								toastr.success('作废成功!');
							} else {
								toastr.error('作废失败!');
							}
							$('#tb_departments').bootstrapTable("refresh", {
								url : '/noob/staff/staffPageQuery.action'
							});
						}
					});
				});
			}
		});
	};
	return oInit;
};

$(function() {
	// 初始化提示框的位置
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

	// 1.初始化Table
	var oTable = new TableInit();
	oTable.Init();
	// 2.初始化Button的点击事件
	var oButtonInit = new ButtonInit();
	oButtonInit.Init();
	// 点击查询按钮触发点击事件
	$('#btn_query').click(function() {
		$('#tb_departments').bootstrapTable("refresh", {
			url : '/noob/staff/staffPageVariousConditionQuery.action',
			queryParams : oTable.queryParams
		});
	});
	
	//下拉列表获取数据
	$("#btn_insert").click(function() {
		clean(); 
		getDataInsert();
		$(".prompt").text("");
		$("#updateStaffButton").prop('disabled', false);
		
		$("#addStaffFrom").data('bootstrapValidator').destroy();
		$('#addStaffFrom').data('bootstrapValidator', null);
		validator();
	});
	
	//添加职员
	$("#addStaffButton").click(function(){
		validator();
		//类型Id
		var subsetId = "";
		for(var i=0;i<$("#subsetName").children().length;i++){
			if($("#subsetName").children()[i].selected){
				subsetId = $($("#subsetName").children()[i]).attr("id");
			}
		}
		
		//组织结构Id
		var orgId = "";
		for(var i=0;i<$("#orgName").children().length;i++){
			if($("#orgName").children()[i].selected){
				orgId = $($("#orgName").children()[i]).attr("id");
			}
		}
		
		//收派标准Id
		var standardId = "";
		for(var i=0;i<$("#standardName").children().length;i++){
			if($("#standardName").children()[i].selected){
				standardId = $($("#standardName").children()[i]).attr("id");
			}
		}
		
		//收派时间Id
		var timeId = "";
		for(var i=0;i<$("#timeName").children().length;i++){
			if($("#timeName").children()[i].selected){
				timeId = $($("#timeName").children()[i]).attr("id");
			}
		}
		//判断是否为空才能添加
		if(subsetId ==""  || subsetId ==null){
			toastr.error('类型不能为空!');
		}if(orgId =="" || orgId ==null){
			toastr.error('组织结构不能为空!');
		} if(standardId =="" || standardId ==null){
			toastr.error('收派标准不能为空!');
		} if(timeId =="" || timeId ==null){
			toastr.error('收派时间不能为空!');
		}else{
			//添加
			$.ajax({
				type:"post",
				async:true,
				url : '/noob/staff/addStaffU.action',
				data : {		
					staffNumber: $('#staffNumber').val(),
					staffName: $('#staffName').val(),
					staffPassword: $('#staffPassword').val(),
					telephone: $('#telephone').val(),
					PDSign: $('#PDSign').val(),
					cancelSign: $('#cancelSign').val(),
					orgId: orgId,
					standardId: standardId,
					timeId: timeId,
					subsetId: subsetId,
					orgName: $('#orgName').val(),
					standardName: $('#standardName').val(),
					timeName: $('#timeName').val(),
					subsetName: $('#subsetName').val()	
				},
				success : function(result) {
					if(result == "info"){
						toastr.info('该取派员编号已存在!');
					}else if (result == "noname") {
						toastr.info('不能添加相同名字的职员!');
					} else if(result == "nophone"){
						toastr.info('电话不能重复!');
					}else if (result == "success") {
						toastr.success('添加成功!');
					} else{
						toastr.error('添加失败!');
					}
					$('#tb_departments').bootstrapTable("refresh", {
						url : '/noob/staff/staffPageQuery.action'
					});
				}
			});
			$("#myModal").modal('hide');
		}
	});
	
	//修改确认提交按钮
	$("#updateStaffButton").click(function(){
		var uPwd = $("#updateStaffPassword").val();
		//格式是否合法
		var emailReg = /^1(3|4|5|7|8)\d{9}$/;
		if(uPwd.length < 6 || uPwd.length > 12){
			validatorU();
		}else if(!emailReg.test($("#updateTelephone").val())){
			validatorU();
		}else{
			$.ajax({
				type : "POST",
				async: true,
				url : '/noob/staff/updateStaffU.action',
				data : {
					staffId : $("#updateStaffId").val(),
					staffPassword : $("#updateStaffPassword").val(),
					telephone : $("#updateTelephone").val(),
					PDSign : $("#PDSignU").val(),
					cancelSign : $("#cancelSignU").val(),
					subsetName: $("#subsetNameU").val(),
					orgName : $("#orgNameU").val(),
					standardName : $("#standardNameU").val(),
					timeName : $("#timeNameU").val()
				},
				success : function(result) {
					if (result == "success") {
						toastr.success('修改成功!');
					} else {
						toastr.error('修改失败!');
					}
					$('#tb_departments').bootstrapTable("refresh", {
						url : '/noob/staff/staffPageQuery.action'
					});
				}
			});
			$("#myModalUpdate").modal('hide');
		}
	});
	//开启校验
	validator();
	validatorU();
});

//获取各种下拉列表的数据
function getDataInsert(){
	//类型
	$.ajax({
		type:"post",
		async:false,
		data:{"archivesName":"取派员类型"},
		url : '/noob/staff/findAllSubsetNameAndIdQuery.action',
		success:function(response){
			var html = "<option>请选择类型</option>";
			for(var i=0;i<response.length;i++) {
				html = html+"<option id='"+response[i].subsetId+"'>"+response[i].subsetName+"</option>";
			}
			$("#subsetName").append(html);
			$(".selectpicker").selectpicker("refresh");
		}
	});
	//单位名称
	$.ajax({
		type:"post",
		async:false,
		url : '/noob/staff/findAllOrgNameAndIdQuery.action',
		success:function(response){
			var html = "<option>请选择单位名称</option>";
			for(var i=0;i<response.length;i++) {
				html = html+"<option id='"+response[i].orgId+"'>"+response[i].orgName+"</option>";
			}
			$("#orgName").append(html);
			$(".selectpicker").selectpicker("refresh");
		}
	});
	//收派标准
	$.ajax({
		type:"post",
		async:false,
		url : '/noob/staff/findAllStandardNameAndIdQuery.action',
		success:function(response){
			var html = "<option>请选择收派标准</option>";
			for(var i=0;i<response.length;i++) {
				html = html+"<option id='"+response[i].standardId+"'>"+response[i].standardName+"</option>";
			}
			$("#standardName").append(html);
			$(".selectpicker").selectpicker("refresh");
		}
	});
	//收派时间
	$.ajax({
		type:"post",
		async:false,
		url : '/noob/staff/findAllTimeNameAndIdQuery.action',
		success:function(response){
			var html = "<option>请选择收派时间</option>";
			for(var i=0;i<response.length;i++) {
				html = html+"<option id='"+response[i].timeId+"'>"+response[i].timeName+"</option>";
			}
			$("#timeName").append(html);
			$(".selectpicker").selectpicker("refresh");
		}
	});
} 

//清除方法
function clean() {
	$("#subsetName").children("option").remove();
	$("#orgName").children("option").remove();
	$("#standardName").children("option").remove();
	$("#timeName").children("option").remove();
	
	$('#staffNumber').val("");
	$('#staffName').val("");
	$("#staffPassword").val("");
	$('#telephone').val("");
	$('#PDSign').val("<option>请选择PD标志</option>");
	$('#cancelSign').val("<option>请选择作废标记</option>");
	
	$("#subsetNameU").children("option").remove();
	$("#orgNameU").children("option").remove();
	$("#standardNameU").children("option").remove();
	$("#timeNameU").children("option").remove();
	
}

//模态框居中方法
function test() {
	var oldWidth = $('body').outerWidth();
	var marginLeft = (document.documentElement.clientWidth - $(".model-dialog")
			.outerWidth()) / 2;
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

//-------------------------------------------------------------
//校验职员查台密码
function checkStaffPasswordU(obj) {
	//校验是否为空
	if (obj.value.length == 0) {
		$("#"+obj.id + "_prompt").text("");
		$("#updateStaffButton").prop('disabled', true);
	}else if (obj.value.length < 6 || obj.value.length > 12) {
		//获得姓名框后的提示框对象
		$("#"+obj.id + "_prompt").text("");
		$("#updateStaffButton").prop('disabled', true);
	}else{
		$("#"+obj.id + "_prompt").text("");
	};
	
};

//校验手机号 
function checkPhoneU(obj) {
	//格式是否合法
	var emailReg = /^1(3|4|5|7|8)\d{9}$/;
	
	//校验是否为空
	if (obj.value.length == 0) {
		$("#"+obj.id + "_prompt").text("");
		$("#updateStaffButton").prop('disabled', true);
	}else if (!emailReg.test(obj.value)) {
		//获得姓名框后的提示框对象
		$("#"+obj.id + "_prompt").text("");
		$("#updateStaffButton").prop('disabled', true);
	}else{
		$("#"+obj.id + "_prompt").text("");
	};
};
//清除提示
function cancelPrompt(obj) {
	$("#"+obj.id + "_prompt").text("");
};

//修改按钮再次验证
function verificationU(){
	checkStaffPasswordU(updateStaffPassword);
	checkPhoneU(updateTelephone);
};
// 添加校验
function validator() {
	$('#addStaffFrom').bootstrapValidator({
		message : 'This value is not valid',
		feedbackIcons : {
			valid : 'glyphicon glyphicon-ok',
			invalid : 'glyphicon glyphicon-remove',
			validating : 'glyphicon glyphicon-refresh'
		},
		fields : {
			staffNumber : {
				validators : {
					notEmpty : {
						message : '取派员编号不能为空!',
					},
					regexp : {
						regexp : /^[A-Z]{1}\d{5}$/,
						message : '取派员编号格式不正确例如:A00001!'
					}
				}
			},
			staffName : {
				validators : {
					notEmpty : {
						message : '职员名不能为空!',
					},
					stringLength : {
						min : 2,
						max : 4,
						message : '职员名长度必须在2到4位之间!'
					},
					regexp : {
						regexp : /^[\u4E00-\u9FA5]{2,4}$/,
						message : '职员名只能为中文例如:张三!'
					}
				}
			},
			staffPassword : {
				validators : {
					notEmpty : {
						message : '查台密码不能为空!'
					},
					stringLength : {
						min : 6,
						max : 12,
						message : '查台密码长度必须在6到12位之间!'
					}
				}
			},
			telephone : {
				validators : {
					notEmpty : {
						message : '电话不能为空!'
					},
					regexp : {
						regexp : /^1(3|4|5|7|8)\d{9}$/,
						message : '电话号码格式不正确!'
					}
				}
			},
		}
	});
};
// 修改校验
function validatorU() {
	$('#updateStaffFrom').bootstrapValidator({
		message : 'This value is not valid',
		feedbackIcons : {
			valid : 'glyphicon glyphicon-ok',
			invalid : 'glyphicon glyphicon-remove',
			validating : 'glyphicon glyphicon-refresh'
		},
		fields : {
			updateStaffPassword : {
				validators : {
					notEmpty : {
						message : '查台密码不能为空!'
					},
					stringLength : {
						min : 6,
						max : 12,
						message : '查台密码长度必须在6到12位之间!'
					}
				}
			},
			updateTelephone : {
				validators : {
					notEmpty : {
						message : '电话不能为空!'
					},
					regexp : {
						regexp : /^1(3|4|5|7|8)\d{9}$/,
						message : '电话号码格式不正确!'
					}
				}
			}
		}
	});
}
