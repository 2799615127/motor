var TableInit = function() {
	var oTableInit = new Object();
	// 初始化Table
	oTableInit.Init = function() {
		$('#tb_departments').bootstrapTable({
			url : '/noob/applyReturn/applyPageQuery.action', // 请求后台的URL（*）
			method : 'get', // 请求方式（*）
			toolbar : '#toolbar', // 工具按钮用哪个容器
			striped : true, // 是否显示行间隔色
			cache : false, // 是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
			pagination : true, // 是否显示分页（*）
			queryParamsType : "undefined",
			queryParams : function queryParams(params) { // 设置查询参数
				var applyType = "";
				for(var i = 0; i < $("#searchApplyType").children().length; i++) {
					if ($("#searchApplyType").children()[i].selected) {
						applyType = $($("#searchApplyType").children()[i]).attr("id");
					} 
				}
				var param = {
					start : params.pageNumber,
					pageSize : params.pageSize,
					entryPerson : $("#txt_entryPerson").val(),// 录入人
					firstEntryTime : $("#firstEntryTime").val(),// 录入时间
					lastEntryTime : $("#lastEntryTime").val(),
					entryUnit : $("#entryUnit").val(),// 录入单位
					applyType : applyType,
					receivingUnit : $("#receivingUnit").val(),
					
				};
				return param;
			},// 传递参数（*）
			sidePagination : "server", // 分页方式：client客户端分页，server服务端分页（*）
			pageNumber : 1, // 初始化加载第一页，默认第一页
			pageSize : 5, // 每页的记录行数（*）
			pageList : [ 5, 10, 15, 20 ], // 可供选择的每页的行数（*）
			search : true, // 是否显示表格搜索，此搜索是客户端搜索，不会进服务端，所以，个人感觉意义不大
			strictSearch : true,
			showColumns : true, // 是否显示所有的列
			showRefresh : true, // 是否显示刷新按钮
			clickToSelect : true, // 是否启用点击选中行
			uniqueId : "applyId", // 每一行的唯一标识，一般为主键列
			showToggle : true, // 是否显示详细视图和列表视图的切换按钮
			cardView : false, // 是否显示详细视图
			detailView : false, // 是否显示父子表
			columns : [ {
				checkbox : true
			}, {
				field : 'worksheetsId',
				title : '工作单号'
			}, {
				field : 'entryUnit',
				title : '录入单位'
			}, {
				field : 'subsetName',
				title : '返货类型 '
			}, {
				field : 'remarks',
				title : '申请备注'
			}, {
				field : 'receivingUnit',
				title : '接收单位'
			},{
				field : 'returnUnit',
				title : '返货单位'
			}, {
				field : 'entryTime',
				title : '录入时间'
			}, {
				field : 'handleState',
				title : '处理状态',
				formatter : function(value, row, index) {
					if (row.handleState == '1') {
						return '未确认';
					}
					if (row.handleState == '2') {
						return '同意返货';
					}
					if (row.handleState == '3') {
						return '拒绝';
					}
					if (row.handleState == '4') {
						return '同意转发';
					}

				}
			},{
				field : 'implementState',
				title : '返货状态',
				formatter : function(value, row, index) {
					if (row.implementState == '1') {
						return '未执行';
					}
					if (row.implementState == '2') {
						return '已转发';
					}
					if (row.implementState == '3') {
						return '已返货';
					}
				}
			},{
				field : 'cancel',
				title : '作废标记',
				formatter : function(value, row, index) {
					if (row.cancel == '0') {
						return '激活';
					} else {
						return '作废';
					}
				}
			} ],

			rowStyle : function rowStyle(row, index) {
				// 这里有5个取值代表5中颜色['active', 'success', 'info', 'warning',
				// 'danger'];
				var strclass = {};
				if (row.cancel == '1') {
					strclass = {
						css : {
							'background-color' : '#778899'
						}
					};// 还有一个active
				}
				return strclass;
			}
		});
	};
	return oTableInit;

};
var ButtonInit = function() {
	var oInit = new Object();
	var postdata = {};
	oInit.Init = function() {
		
		$.ajax({
			url : "/noob/applyReturn/subsetPageQuery.action",
			type : "post",
			async : true,
			success : function(response) {
				var html = "";
				for (var i = 0; i < response.length; i++) {
					html = html + "<option  id='"+response[i].subsetId+"'>"
							+ response[i].subsetName + "</option>";
				}
				$("#addApplyType").append(html);
				$("#searchApplyType").append(html);
				$(".selectpicker").selectpicker("refresh");
			}
		});
		
		$.ajax({
			url : "/noob/applyReturn/workOrderPageQuery.action",
			type : "post",
			async : true,
			success : function(response) {
				var html = "";
				for (var i = 0; i < response.length; i++) {
					html = html + "<option  id='"+response[i].jobListId+"'>"
					+ response[i].jobListNo + "</option>";
				}
				$("#worksheetsId").append(html);
				$(".selectpicker").selectpicker("refresh");
			}
		});
		

		
		
		
		//新增的点击事件
		$("#btn_add").click(function() {
			clean();
			$("#addApplyForm").data('bootstrapValidator').destroy();
			$('#addApplyForm').data('bootstrapValidator', null);
			addValidator();
			$("#addModal").modal("show");
			
		})
		
		$("#btn_edit").click(function() {
			editClean();
			var select = $('#tb_departments').bootstrapTable('getSelections');	
		
			if (select.length === 0) {
				toastr.warning('请选择一行修改');
			} else if (select.length > 1) {
				toastr.warning('不能同时修改多行');
			} else {
				select_subsetName = select[0]['subsetName'];
				var handleState = select[0]['handleState'];
				select_returnUnit = select[0]['returnUnit'];
				var cancel = select[0]['cancel'];
				if (handleState != '1') {
					toastr.warning('只能修改未确认的返货单')
				}else if(cancel!='0'){
					toastr.warning('不能处理已作废的返货申请');
				} else {
					$.ajax({
						url : "/noob/applyReturn/subsetPageQuery.action",
						type : "post",
						async : true,
						success : function(response) {
							var html = "";
							for (var i = 0; i < response.length; i++) {
								if (select_subsetName == response[i].subsetName) {
									html = html
											+ "<option selected style='color:#ff6700;' id='"+response[i].subsetId+"'>"
											+ response[i].subsetName
											+ "</option>";
								} else {
									html = html + "<option  id='"+response[i].subsetId+"'>"
										+ response[i].subsetName + "</option>";
							
								}
							}
							$("#editApplyType").append(html);
							$(".selectpicker").selectpicker("refresh");
						}
					});
					
					$.ajax({
						url : "/noob/applyReturn/orgPageQuery.action",
						type : "post",
						async : true,
						success : function(response) {
							var html = "";
							for (var i = 0; i < response.length; i++) {
								if (select_returnUnit == response[i].orgName) {
									html = html
									+ "<option selected style='color:#ff6700;'>"
									+ response[i].orgName
									+ "</option>";
								}else{
								html = html + "<option>"
										+ response[i].orgName + "</option>";
							
								}
							}
							$("#editReturnUnit").append(html);
							$(".selectpicker").selectpicker("refresh");
						}
					});
					
					
					$("#editApplyId").val(select[0]["applyId"]);
					$("#editRemarks").val(select[0]["remarks"]);
					$("#editLoseNumber").val(select[0]["loseNumber"]);
					$("#editModal").modal("show");			
				}

			}

		});
	};
	return oInit;
};

$(function() {
	// 1.初始化Table
	var oTable = new TableInit();
	oTable.Init();

	// 2.初始化Button的点击事件
	var oButtonInit = new ButtonInit();
	oButtonInit.Init();

	// 初始化操作消息提示框
	toastr.options = {
		closeButton : false, // 是否显示关闭按钮
		debug : false, // 是否为调试
		progressBar : true, // 是否显示进度条
		positionClass : "toast-top-center", // 在页面中显示的位置
		onclick : null, // 点击事件
		showDuration : "100", // 显示动作时间
		hideDuration : "1000", // 隐藏动作时间
		timeOut : "2000", // 自动关闭超时时间
		extendedTimeOut : "1000",
		showEasing : "swing",
		hideEasing : "linear",
		preventDuplicates : true,
		preventOpenDuplicates : true, // 重复内容的提示框在开启时只出现一个
		showMethod : "fadeIn", // 显示的方式
		hideMethod : "fadeOut" // 隐藏的方式
	};

	$(".form_datetime").datetimepicker({
		format : "yyyy-mm-dd",
		autoclose : true,
		todayBtn : true,
		language : 'zh-CN',
		pickerPosition : "bottom-right",
		minView : 2,

	});

	// 条件查询
	$("#query-btn").click(function() {
		$('#tb_departments').bootstrapTable("refresh", {
			url : '/noob/applyReturn/applyPageQuery.action',
			queryParams : oTable.queryParams
		});
	});

	$("#addApply").click(function() {
		
		var remarks = $('#addRemarks').val();
		var applyType = "";
		for(var i = 0; i < $("#addApplyType").children().length; i++) {
			if ($("#addApplyType").children()[i].selected) {
				applyType = $($("#addApplyType").children()[i]).attr("id");
			}
		}
		var worksheetsId = "";
		for(var i = 0; i < $("#worksheetsId").children().length; i++) {
			if ($("#worksheetsId").children()[i].selected) {
				worksheetsId = $($("#worksheetsId").children()[i]).attr("id");
			}
		}
		var loseNumber = $("#addLoseNumber").val();		
		if (loseNumber!='' && remarks!='') {
			$.ajax({
				url : "/noob/applyReturn/workOrderPageQuery.action",
				type : "post",
				data : {
					jobListId : worksheetsId,
				},
				success : function(response) {
					if (response[0].takeStatus=='4') {
						toastr.warning('货物已签收不可以申请返货!');
					}else if(response[0].takeStatus=='5'){
						toastr.warning('已销单不可以再申请返货!');
					}else{
						$.ajax({
							url : "/noob/applyReturn/findWorkQuery.action",
							type : "post",
							data : {
								worksheetsId : worksheetsId,
							},
							success : function(response) {
								if (response=='') {
									$("#addModal").modal('hide');
									$.ajax({
										type : "post",
										url : '/noob/applyReturn/addApplyU.action',
										data : {
											remarks : remarks,	
											applyType : applyType,
											worksheetsId : worksheetsId,
											loseNumber : loseNumber		
										},
										success : function(result) {
											
											if (result == "success") {
												toastr.success('添加成功!');
												$('#tb_departments').bootstrapTable('refresh');

											} else {
												toastr.error('添加失败!');
												$('#tb_departments').bootstrapTable('refresh');
											}
										}
									});
								}else{
									toastr.error('该工作单已生成返单!');
								}
							}
						});

					}
				}
			});
		}else{
			toastr.error('信息填写不完整!');
		}
	});
	addValidator();
	
	$("#editApply").click(function() {
		$("#editModal").modal('hide');
		var applyId = $('#editApplyId').val();
		var applyType = "";
		for(var i = 0; i < $("#editApplyType").children().length; i++) {
			if ($("#editApplyType").children()[i].selected) {
				applyType = $($("#editApplyType").children()[i]).attr("id");
			}
		}
		var remarks = $('#editRemarks').val();
		var loseNumber = $('#editLoseNumber').val();
		var returnUnit =$('#editReturnUnit').val();
		$.ajax({
			type : "post",
			url : '/noob/applyReturn/updateApplyU.action',
			data : {
				applyId : applyId,
				applyType : applyType,
				remarks	: remarks,
				loseNumber	: loseNumber,
				returnUnit	: returnUnit,
			},
			success : function(result) {
				if (result == "success") {

					toastr.success('修改成功!');
					$('#tb_departments').bootstrapTable('refresh');
				} else {
					toastr.error('修改失败!');
					$('#tb_departments').bootstrapTable('refresh');
				}

			}
		});
	});
	$("#btn_recover").click(function() {
		// 判断是否选中一行
		var select = $('#tb_departments').bootstrapTable('getSelections');

		if (select.length == 0) {
			toastr.warning('请至少选择一行进行还原');
		} else{
			
				var arrs = [];
				for (var i = 0; i < select.length; i++) {
					arrs[i] = select[i]['applyId'];
				}
				$.ajax({
					type : "post",
					url : '/noob/applyReturn/deleteApplyU.action',
					data : {
						applyIds : arrs,
						cancel :0,
					},
					success : function(result) {
						if (result == "success") {

							toastr.success('还原成功!');
							$('#tb_departments').bootstrapTable('refresh');
						} else {
							toastr.error('还原失败!');
							$('#tb_departments').bootstrapTable('refresh');
						}

					}
				});
			
		}
	});
	
	$("#btn_delete").click(function() {
		// 判断是否选中一行
		var select = $('#tb_departments').bootstrapTable('getSelections');
		var result =false;
		for (var i = 0; i < select.length; i++) {
			if(select[i]['implementState']!=1){
				result = true;
				break;
			}
		}
		
		if (select.length == 0) {
			toastr.warning('请至少选择一行进行删除');
		} else if(result){
			toastr.warning('已执行的无法删除');
		}else{
			swal({
				title : "操作提示", // 弹出框的title
				text : "确定删除吗？", // 弹出框里面的提示文本
				type : "warning", // 弹出框类型
				showCancelButton : true, // 是否显示取消按钮
				confirmButtonColor : "#DD6B55",// 确定按钮颜色
				cancelButtonText : "取消",// 取消按钮文本
				confirmButtonText : "是的，确定删除！",// 确定按钮上面的文档
				closeOnConfirm : true
			},

			function() {
				var arrs = [];
				for (var i = 0; i < select.length; i++) {
					arrs[i] = select[i]['applyId'];
				}
				$.ajax({
					type : "post",
					url : '/noob/applyReturn/deleteApplyU.action',
					data : {
						applyIds : arrs,
						cancel :1,
					},
					success : function(result) {
						if (result == "success") {

							toastr.success('删除成功!');
							$('#tb_departments').bootstrapTable('refresh');
						} else {
							toastr.error('删除失败!');
							$('#tb_departments').bootstrapTable('refresh');
						}

					}
				});
			});

		}
	});

});
//清除方法
function clean() {


	
	$('#addRemarks').val("");

	$('#addLoseNumber').val("");
}
function editClean() {

	$("#editApplyType").children("option").remove();
	$("#editReturnUnit").children("option").remove();
}
//校验方法
function addValidator(){
	$('#addApplyForm').bootstrapValidator({
		message: 'This value is not valid',
		feedbackIcons:{
		valid: 'glyphicon glyphicon-ok',
		invalid: 'glyphicon glyphicon-remove',
		validating: 'glyphicon glyphicon-refresh'
	},
    fields: {
    	addLoseNumber: {
             message: '破损件数验证失败!',
             validators: {
             notEmpty: {
                 message: '破损件数不能为空!',
             },
             regexp: {
                 regexp:/^([0-9.]+)$/,
                 message: '破损件数只能为数字!',
                }
              }
            },
            addRemarks: {
                 validators: {
                     notEmpty: {
                         message: '备注不能为空!',
                     },
                     /* stringLength: {
                         min: 6,
                         max: 12,
                         message: '所在地长度必须在6到12位之间!'
                     } */
                 }
             },
             
         }
     });
}
