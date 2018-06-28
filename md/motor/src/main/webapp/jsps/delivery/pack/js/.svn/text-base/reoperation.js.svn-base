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


	$('.form_datetime').datetimepicker({
		weekStart: 0, //一周从哪一天开始
		todayBtn:  1, //
		autoclose: 1,
		todayHighlight: 1,
		startView: 2,
		forceParse: 0,
		autoclose : true,
		todayBtn : true,
		language : 'zh-CN',
		endDate : new Date(),
		maxDate : new Date(),
		showMeridian: 1
	});
	//1.初始化Table
	var oTable = new TableInit();
	oTable.Init();

	//模糊查询按钮 
	$("#btn_query").click(function(){
		$('#tb_departments').bootstrapTable("refresh",{
			url:"/noob/pack/packPageQuery.action",
			queryParams:oTable.queryParams
		}); 
	});
});


var TableInit = function () {
	var oTableInit = new Object();
	//初始化Table
	oTableInit.Init = function () {
		$('#tb_departments').bootstrapTable({
			url: '/noob/pack/packPageQuery.action', //请求后台的URL（*）
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
				field: 'nuclearWeightUnit',
				title: '核重单位'
			}, {
				field: 'packagesNum',
				title: '件数'
			}, {
				field: 'whither',
				title: '到达地'
			}, {
				field: 'factWeight',
				title: '原重量'
			}, {
				field: 'gewichtsdifferenz',
				title: '重量差'
			}, {
				field: 'nucleatedHeavy',
				title: '确认重量'
			}, {
				field: 'operateTime',
				title: '称重日期',
				formatter:function(value){
					return formatDate(value);
				}
			}, ]
		});
	};

	//得到查询的参数
	oTableInit.queryParams = function (params) {
		var temp = {   //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
				pageSize: params.limit,   //页面大小
				pageNumber: params.offset,  //页码
				nuclearWeightUnit: $("#nuclearWeightUnit").val(),
				startTime: $("#startTime").val(),
				endTime: $("#endTime").val(),
				maxWeight: $("#maxWeight").val(),
				minWeight: $("#minWeight").val(),
				jobListNo: $("#jobListNo").val()
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

