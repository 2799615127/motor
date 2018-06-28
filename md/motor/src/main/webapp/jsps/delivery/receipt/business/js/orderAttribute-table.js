var TableInitOrderAttr = function() {
	var oTableInitOrderAttr = new Object();
	// 初始化订单属性Table
	oTableInitOrderAttr.Init = function() {
		$('#tb_orderAttributes').bootstrapTable({
			url : '/noob/consult/findOrderAttrQuery.action', // 请求后台的URL（*）
			method : 'get', // 请求方式（*）
			toolbar : '#toolbar_orderAttribute', // 工具按钮用哪个容器
			striped : true, // 是否显示行间隔色
			cache : false, // 是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
			pagination : true, // 是否显示分页（*）
			sortable : false, // 是否启用排序
			sortOrder : "asc", // 排序方式
			queryParams : oTableInitOrderAttr.queryParams,// 传递参数（*）
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
			uniqueId : "", // 每一行的唯一标识，一般为主键列
			showToggle : true, // 是否显示详细视图和列表视图的切换按钮
			cardView : false, // 是否显示详细视图
			detailView : false, // 是否显示父子表
			columns : [ {
				checkbox : true
			}, {
				field : 'businessRecsiptNo',
				title : '通知单号'
			}, {
				field : 'contacts',
				title : '联系人'
			}, {
				field : 'telephone',
				title : '联系电话'
			}, {
				field : 'serveCity',
				title : '收件地址'
				
			}, {
				field : 'workOrder.takeStatus',
				title : '当前状态',
				formatter : function(value, row, index) {
	    			if (value == 1) {
	    				return '新单';
	    			}else if (value == 2){
	    				return '已通知';
	    			}else if (value == 3){
	    				return '已确认';
	    			}else if (value == 4){
	    				return '已取件';
	    			}else if(value == 5){
	    				return '新建';
	    			}else if(value == 6){
	    				return '已取消';
	    			}else if(value == 7){
	    				return '已调度';
	    			}else{
	    				return '未分配';
	    			}
	    		}	
			},{
				field : 'operationStaffName',
				title : '操作人姓名'
			}, {
				field : 'operationOrg',
				title : '操作人单位'
			}, {
				field : 'operationTime',
				title : '操作时间',
				formatter : function(value, row, index) {
					return formatDate(value);
				}
			} ]
		});
	};
	
	
	// 初始化工单咨询Table
	// 得到查询的参数
	oTableInitOrderAttr.queryParams = function(params) {
		var temp = {
			// 这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
			pageSize : params.limit,
			start : params.offset,
		};
		return temp;
	};

	return oTableInitOrderAttr;
};

var ButtonInitOrderAttr = function() {
	var oInit = new Object();
	var postdata = {};
	oInit.Init = function() {
		// 初始化页面上面的按钮事件
		$("#btn_add").click(function() {
			test();
		});
		
		// 修改按钮
		$("#btn_edit").click(function() {
			
		});
		
		//删除按钮
		$("#btn_delete").click(function() {
			
		});
	};
	return oInit;
};


//获取各种下拉列表的数据
function getDataInsert(){
} 

//清除方法
function clean() {
	
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
