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

	//2.初始化Button的点击事件
	var oButtonInit = new ButtonInit();
	oButtonInit.Init();
	
	//模糊查询按钮 
	$("#btn_query_Q").click(function(){
		$('#tb_departments_PIQ').bootstrapTable("refresh",{
			url:"/noob/pack/packPageWholeQuery.action",
			silent: true,
			query:{
				productName: $("#productName").val(),
				startTime: $("#startTime").val(),
				endTime: $("#endTime").val(),
				packers: $("#packers").val(),
				select : $("#txt_man").val(),
				man : $("#txt_Name").val(),
				nuclearWeightUnit: $("#PIQ_nuclearWeightUnit").val()
			}
		});
	});
});     


var ButtonInit = function () {
	var oInit = new Object();
	var postdata = {};

	oInit.Init = function () {
		//查询工作单号
		$("#PIQ_nuclearWeightUnit").select2({
			ajax: {
				language: "zh-CN", //设置 提示语言
				url: "/noob/pack/findOrgNameByOrg.action",
				data: function (params) {
					var query = {
							orgName: params.term,
					}
					return query;
				},

				processResults: function (data) {
					return {
						results: data
					};
				},
				cache: true
			},
			placeholder: '选择包装单位',
			escapeMarkup: function (markup) { return markup; }, // let our custom formatter work
			minimumInputLength: 0,
			templateResult: function formatRepo(repo){
				return repo.text;  
			}, 
			templateSelection:function formatRepoSelection(repo){
				return repo.text;
			}
		});
	};
	return oInit;
};


var TableInit = function () {
	var oTableInit = new Object();
	//初始化Table
	oTableInit.Init = function () {
		$('#tb_departments_PIQ').bootstrapTable({
			url: '/noob/pack/packPageWholeQuery.action', //请求后台的URL（*）
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
			uniqueId: "packId",                     //每一行的唯一标识，一般为主键列
			showToggle:true,                    //是否显示详细视图和列表视图的切换按钮
			cardView: false,                    //是否显示详细视图
			detailView: false,                   //是否显示父子表
			columns: [{
				checkbox: true
			}, {
				field: 'jobListNo',
				title: '工作单号'
			}, {
				field: 'productName',
				title: '品名'
			}, {
				field: 'product',
				title: '发货方式'
			}, {
				field: 'nuclearWeightUnit',
				title: '包装单位'
			}, {
				field: 'getProductManName',
				title: '入库人'
			}, {
				field: 'storageTime',
				title: '入库时间',
				formatter:function(value){
					return formatDate(value);
				}
			}, {
				field: 'userName',
				title: '包装员'
			}, {
				field: 'billingOperationUnit',
				title: '委托单位'
			}, {
				field: 'packagesNum',
				title: '件数'
			}, {
				field: 'factWeight',
				title: '重量'
			}, {
				field: 'chargedWeight',
				title: '计费重量'
			}, {
				field: 'size',
				title: '体积'
			}, ]
		});
	};

	//得到查询的参数
	oTableInit.queryParams = function (params) {
		var temp = {   //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
				pageSize: params.limit,   //页面大小
				pageNumber: params.offset,  //页码
				productName: $("#productName").val(),
				startTime: $("#startTime").val(),
				endTime: $("#endTime").val(),
				packers: $("#packers").val(),
				warhousing: $("#warhousing").val(),
				nuclearWeightUnit: $("#PIQ_nuclearWeightUnit").val()
		};  
		return temp;
	};
	return oTableInit;
};

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
