var TableInitDetailData = function() {
	var oTableInitDetailData= new Object();
	// 初始化盘库单主表明细数据Table
	oTableInitDetailData.Init = function() {
		$('#tb_detailData').bootstrapTable({
			url : '/noob/warehouse/trayWorkPageQuery.action', // 请求后台的URL（*）
			method : 'get', // 请求方式（*）
			toolbar : '#toolbar_detailData', // 工具按钮用哪个容器
			striped : true, // 是否显示行间隔色
			cache : false, // 是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
			pagination : true, // 是否显示分页（*）
			sortable : false, // 是否启用排序
			sortOrder : "asc", // 排序方式
			queryParams : oTableInitDetailData.queryParams,// 传递参数（*）
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
			uniqueId : "jobListNo", // 每一行的唯一标识，一般为主键列
			showToggle : true, // 是否显示详细视图和列表视图的切换按钮
			cardView : false, // 是否显示详细视图
			detailView : false, // 是否显示父子表
			columns : [ {
				checkbox : true
			}, {
				field : 'storageConnectNumSon',
				title : '单号'
			}, {
				field : 'jobListNo',
				title : '工作单号'
			}, {
				field : 'sourcingNo',
				title : '合包号'
			}, {
				field : 'numberPackages',
				title : '件数'
			}, {
				field : 'volume',
				title : '体积'
			}, {
				field : 'weight',
				title : '重量'
			}, {
				field : 'type',
				title : '类型'
			}, {
				field : 'arrivalCity',
				title : '到达地'
			}, {
				field : 'warehouses',
				title : '入库人'
			}, {
				field : 'laidUpTime',
				title : '入库时间',
				formatter:function(value){
					return formatDate(value);
				}
			} ],
			rowStyle: function (row, index) {
                //这里有5个取值代表5中颜色['active', 'success', 'info', 'warning', 'danger'];
                var strclass = {};
                if (row.struts == "0") {
                    strclass ={css:{'background-color':'#FFCCCC'}};//还有一个active
                }
                return strclass 
            }
		});
	};
	
	
	// 初始化工单咨询Table
	// 得到查询的参数
	oTableInitDetailData.queryParams = function(params) {
		var temp = {
			// 这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
			pageSize : params.limit,
			start : params.offset,
		};
		return temp;
	};

	return oTableInitDetailData;
};

var ButtonInitDetailData = function() {
	var oInits = new Object();
	var postdatas = {};
	oInits.Init = function() {
		
	};
	return oInits;
};
	
function cleanAddress() {
	$("#detailedAddress").val("");
	$("#txt_add_province").children("option").remove();
	$("#txt_add_city").children("option").remove();
	$("#txt_add_district").children("option").remove();
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

//时间的转换
function formatDate(ns) {
	var now = new Date(ns);
	var year=now.getYear()+1900;
	
	var month=now.getMonth()+1;
	if(month<10){
		month = "0"+month;
	}
	var date=now.getDate();
	if(date<10){
		date = "0"+date;
	}
	var hour=now.getHours();
	if(hour<10){
		hour = "0"+hour;
	}
	var minute=now.getMinutes();
	if(minute<10){
		minute = "0"+minute;
	}
	var second=now.getSeconds();
	if(second<10){
		second = "0"+second;
	}
	return year+"-"+month+"-"+date+" "+hour+":"+minute+":"+second;

}