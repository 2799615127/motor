var TableInit = function() {
	var oTableInit = new Object();
	// 初始化Table
	oTableInit.Init = function() {
		$('#tb_departments').bootstrapTable({
			url : '/noob/signVerification/findWorkQuery.action', // 请求后台的URL（*）
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
			uniqueId : "jobListId", // 每一行的唯一标识，一般为主键列
			showToggle : true, // 是否显示详细视图和列表视图的切换按钮
			cardView : false, // 是否显示详细视图
			detailView : false, // 是否显示父子表
			columns : [ {
				checkbox : true
			}, {
				field : 'jobListNo',
				title : '工作单号'
			}, {
				field : 'entryUnit',
				title : '委托单位'
			}, {
				field : 'subsetName',
				title : '发单时间 '
			}, {
				field : 'remarks',
				title : '签收时间'
			}, {
				field : 'receivingUnit',
				title : '返单号'
			},{
				field : 'returnUnit',
				title : '返单类型'
			}, {
				field : 'entryTime',
				title : '返单要求'
			}, {
				field : 'entryTime',
				title : '受理单位'
			}, {
				field : 'entryTime',
				title : '发单单位'
			}, {
				field : 'entryTime',
				title : '发单人'
			}, {
				field : 'entryTime',
				title : '发单时间'
			}, {
				field : 'entryTime',
				title : '接收单位'
			}, {
				field : 'entryTime',
				title : '接收人'
			}, {
				field : 'entryTime',
				title : '接收时间'
			}, {
				field : 'entryTime',
				title : '是否补录'
			}, {
				field : 'handleState',
				title : '接收状态',
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
$(function() {
	// 1.初始化Table
	var oTable = new TableInit();
	oTable.Init();
	
});