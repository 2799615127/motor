var TableInit = function() {
	var oTableInit = new Object();
	// 初始化Table
	oTableInit.Init = function() {
		$('#tb_departments')
				.bootstrapTable(
						{
							url : '/noob/applyReturn/applyPageQuery.action', // 请求后台的URL（*）
							method : 'get', // 请求方式（*）
							toolbar : '#toolbar', // 工具按钮用哪个容器
							striped : true, // 是否显示行间隔色
							cache : false, // 是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
							pagination : true, // 是否显示分页（*）
							sortable : true, // 是否启用排序
							sortOrder : "asc", // 排序方式
							queryParamsType : "undefined",
							queryParams : function queryParams(params) { // 设置查询参数
								var applyType = "";
								for (var i = 0; i < $("#searchApplyType")
										.children().length; i++) {
									if ($("#searchApplyType").children()[i].selected) {
										applyType = $(
												$("#searchApplyType")
														.children()[i]).attr(
												"id");
									}
								}
								var param = {
									start : params.pageNumber,
									pageSize : params.pageSize,
									entryPerson : $("#txt_entryPerson").val(),// 录入人
									firstEntryTime : $("#firstEntryTime").val(),// 录入时间
									lastEntryTime : $("#lastEntryTime").val(),
									entryUnit : $("#entryUnit").val(),// 录入单位
									receivingUnit : $("#receivingUnit").val(),// 接收单位
									implementState : $("#implementState").val(),// 返货执行状态
									handleState : $("#handleState").val(),// 处理状态
									applyType : applyType,
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
							minimumCountColumns : 2, // 最少允许的列数
							clickToSelect : true, // 是否启用点击选中行
							uniqueId : "applyId", // 每一行的唯一标识，一般为主键列
							showToggle : true, // 是否显示详细视图和列表视图的切换按钮
							cardView : false, // 是否显示详细视图
							detailView : false, // 是否显示父子表
							columns : [ {
								checkbox : true
							}, {
								field : 'applyId',
								title : '申请单号'
							}, {
								field : 'worksheetsId',
								title : '工作单号'
							}, {
								field : 'subsetName',
								title : '返货类型'
							}, {
								field : 'receivingUnit',
								title : '接收单位'
							}, {
								field : 'entryTime',
								title : '录入时间'
							}, {
								field : 'entryUnit',
								title : '录入单位'
							}, {
								field : 'entryPerson',
								title : '录入人'
							}, {
								field : 'cancel',
								title : '作废标记',
								formatter : function(value, row, index) {
									if (row.cancel == '0') {
										return '激活';
									} else {
										return '作废';
									}
								}
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
							}, {
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
							} ],

							rowStyle : function rowStyle(row, index) {
								// 这里有5个取值代表5中颜色['active', 'success', 'info',
								// 'warning',
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
// 当下拉框被选择到拒绝时显示隐藏的拒绝类型div
window.onload = function() {
	var obj_select = document.getElementById("editHandleState");
	var obj_div = document.getElementById("test");
	obj_select.onchange = function() {
		obj_div.style.display = this.value == 3 ? "block" : "none";
	}
}

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
					html = html + "<option  id='" + response[i].subsetId + "'>"
							+ response[i].subsetName + "</option>";
				}
				$("#searchApplyType").append(html);
				$(".selectpicker").selectpicker("refresh");
			}
		});
		// 拒绝类型的下拉框
		$.ajax({ 
			url : "/noob/applyReturn/refusePageQuery.action",
			type : "post",
			async : true,
			success : function(response) {
				var html = "";
				for (var i = 0; i < response.length; i++) {
					html = html + "<option  id='" + response[i].subsetId + "'>"
							+ response[i].subsetName + "</option>";
				}
				$("#editRefuseType").append(html);
				$(".selectpicker").selectpicker("refresh");
			}
		});
		// 卡片点击事件
		$("#btn_card")
				.click(
						function() {

							var select = $('#tb_departments').bootstrapTable(
									'getSelections');
							if (select.length === 0) {
								toastr.warning('请选择一行查看');
							} else if (select.length > 1) {
								toastr.warning('不能同时查看多行');
							} else {
								var applyId = select[0]["applyId"];
								var handleStateP = select[0]["handleState"];
								$
										.ajax({
											url : "/noob/applyReturn/applyPageQuery.action",
											type : "post",
											data : {
												applyId : applyId,
												handleState : handleStateP,
											},
											success : function(response) {

												var handleState = "";
												if (response.rows[0].handleState == '1') {
													handleState = '未确认';
													$("#cRefuseType").hide();
												}
												if (response.rows[0].handleState == '2') {
													handleState = '同意返货';
													$("#cRefuseType").hide();
												}
												if (response.rows[0].handleState == '3') {
													handleState = '拒绝';
													$("#cRefuseType").show();
												}
												if (response.rows[0].handleState == '4') {
													handleState = '同意转发';
													$("#cRefuseType").hide();
												}

												$("#cardApplyId")
														.val(
																response.rows[0].applyId);
												$("#cardApplyType")
														.val(
																response.rows[0].subsetName);
												$("#cardHandleState").val(
														handleState);
												$("#cardRemarks")
														.val(
																response.rows[0].remarks);
												$("#cardRefuseType")
														.val(
																response.rows[0].refuseName);
												$("#cardHandleOpinion")
														.val(
																response.rows[0].handleOpinion);
												$("#cardEntryTime")
														.val(
																response.rows[0].entryTime);
												$("#cardEntryPerson")
														.val(
																response.rows[0].entryPerson);
												$("#cardEntryUnit")
														.val(
																response.rows[0].entryUnit);
												$("#cardConfirmationPerson")
														.val(
																response.rows[0].confirmationPerson);
												$("#cardConfirmationUnit")
														.val(
																response.rows[0].confirmationUnit);
												$("#cardConfirmationTime")
														.val(
																response.rows[0].confirmationTime);
												$("#cardModal").modal("show");
												if (response.rows[0].handleState == 1) {
													$("#confirmation").hide();
												} else {
													$("#confirmation").show();
												}

											}
										});

							}
						});

		$("#btn_edit")
				.click(
						function() {
							clean();
							
							var select = $('#tb_departments').bootstrapTable(
									'getSelections');
							select_subsetName = select[0]['subsetName'];
							if (select.length === 0) {
								toastr.warning('请选择一行进行处理');
							} else if (select.length > 1) {
								toastr.warning('不能同时处理多行');
							} else {
								$
										.ajax({
											url : "/noob/applyReturn/subsetPageQuery.action",
											type : "post",
											async : true,
											success : function(response) {
												var html = "";
												for (var i = 0; i < response.length; i++) {
													if (select_subsetName == response[i].subsetName) {
														html = html
																+ "<option selected style='color:#ff6700;' id='"
																+ response[i].subsetId
																+ "'>"
																+ response[i].subsetName
																+ "</option>";
													} else {
														html = html
																+ "<option  id='"
																+ response[i].subsetId
																+ "'>"
																+ response[i].subsetName
																+ "</option>";

													}
												}
												$("#editApplyType")
														.append(html);
												$(".selectpicker")
														.selectpicker("refresh");
											}
										});
								var handleState = select[0]['handleState'];
								var cancel = select[0]['cancel'];
								if (handleState != '1') {
									toastr.warning('只能处理未确认的返货申请');
								} else if (cancel != '0') {
									toastr.warning('不能处理已作废的返货申请');
								} else {
									$("#editApplyId").val(select[0]["applyId"]);
									$("#editHandleState").val("1");
									document.getElementById('test').style.display = 'none'
									$("#editModal").modal("show");
									$("#editApplyForm").data('bootstrapValidator').destroy();
									$('#editApplyForm').data('bootstrapValidator', null);
									validator();									
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
	// 日期框的方法
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

	// 处理的提交按钮
	$("#editApply").click(function() {

		var applyId = $("#editApplyId").val();
		var applyType = "";
		for (var i = 0; i < $("#editApplyType").children().length; i++) {
			if ($("#editApplyType").children()[i].selected) {
				applyType = $($("#editApplyType").children()[i]).attr("id");
			}
		}
		var handleState = $("#editHandleState").val();
		var handleOpinion = $("#editHandleOpinion").val();
		var refuseType = "";
		for (var i = 0; i < $("#editRefuseType").children().length; i++) {
			if ($("#editRefuseType").children()[i].selected) {
				refuseType = $($("#editRefuseType").children()[i]).attr("id");
			}
		}
		if (handleOpinion == '') {
		} else if (handleState == 1) {
			toastr.warning('未处理不可提交');
		} else {
			$("#editModal").modal('hide');
			$.ajax({
				type : "post",
				url : '/noob/applyReturn/updateApplyU.action',
				data : {
					applyId : applyId,
					applyType : applyType,
					handleState : handleState,
					refuseType : refuseType,
					handleOpinion : handleOpinion,
				},
				success : function(result) {
					if (result == "success") {
						toastr.success('处理成功!');
						$('#tb_departments').bootstrapTable('refresh');
					} else {
						toastr.error('处理失败!');
						$('#tb_departments').bootstrapTable('refresh');
					}

				}
			});
		}
	});
	validator();
});

// 清除方法
function clean() {

	$('#editHandleOpinion').val("");
	$("#editApplyType").children("option").remove();
}
//校验方法
function validator(){
	$('#editApplyForm').bootstrapValidator({
		message: 'This value is not valid',
		feedbackIcons:{
		valid: 'glyphicon glyphicon-ok',
		invalid: 'glyphicon glyphicon-remove',
		validating: 'glyphicon glyphicon-refresh'
	},
    fields: {
    	editHandleOpinion: {
             message: '处理意见验证失败!',
             validators: {
             notEmpty: {
                 message: '处理意见不能为空!',
             	},
             
             }
            },         
             
         }
     });
}

