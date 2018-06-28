$(function() {
	$.fn.modal.Constructor.prototype.enforceFocus = function() {
	};
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
	
	//设置时间
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

	// 2.初始化Button的点击事件
	var oButtonInit = new ButtonInit();
	oButtonInit.Init();
	
	//计算包装费
    $("#btn_query_Q").click(function(){
    	var jobListNo = $("#display_JLNo").val();
    	var packaingProject = $("#txt_pack").val();
    	var size = $("#size").val();
    	var chargedWeight = $("#chargedWeight").val();
    	if(jobListNo==""||jobListNo==null){
 		   toastr.warning('请选择单号');
 	    }else if(size==""||size==null){
			toastr.error('体积不能为空');
    	}else if(chargedWeight==""||chargedWeight==null){
			toastr.error('计费重量为空');
    	}else{
    		$.ajax({
    			url:"/noob/pack/findPackaingProjectAndSize.action",
    			type:"post",
    			data:{"jobListNo":jobListNo,
    				"packaingProject":packaingProject,
    				"specifications":size
    				},
    			async:false,//同步请求
    			success:function(response){
    				$("#bagging").val(response.serviceCharge+response.materialCost);
    				$("#storageTime").val(formatDate(new Date()));
    				toastr.success('包装费为'+$("#bagging").val()+'元');
    			}
    		});
    	}
	});
	
	//修改
    $("#btn_keep").click(function(){
    	var jobListNo = $("#display_JLNo").val();
    	var factQuantity = $("#factQuantity").val();
    	var factWeight = $("#factWeight").val();
		var chargedWeight = $("#chargedWeight").val();
		var size = $("#size").val();
		var bagging = $("#bagging").val();
		var storageTime = $("#storageTime").val()+"";
			$.ajax({
				url:"/noob/pack/updatePackInfo.action",
				type:"GET",
				data:{"jobListNo":jobListNo,
					"factQuantity":factQuantity,
					"factWeight":factWeight,
					"chargedWeight":chargedWeight,
					"size":size,
					"bagging":bagging,
					"storageTimes":storageTime
					},
				async:false,//同步请求
				success:function(response){
					if("true"==response){
						toastr.success('订单成功入库');
					}else{
						toastr.error('订单未成功入库');
					}
				}
			});
	});
});


var ButtonInit = function() {
	var oInit = new Object();
	var postdata = {};

	oInit.Init = function() {
		//查询工作单号
		$("#display_JLNo").select2({
			ajax : {
				language : "zh-CN", //设置 提示语言
				url : "/noob/pack/basicJobListQuery.action",
				data : function(params) {
					var query = {
						jobListNo : params.term,
					}
					return query;
				},

				processResults : function(data) {
					return {
						results : data
					};
				},
				cache : true
			},
			placeholder : '请输入单号',
			escapeMarkup : function(markup) {
				return markup;
			}, // let our custom formatter work
			minimumInputLength : 0,
			templateResult : function formatRepo(repo) {
				return repo.text;
			},
			templateSelection : function formatRepoSelection(repo) {
				return repo.text;
			}
		});
		
		//根据工作单号去查询信息
		$("#display_JLNo").bind("change", function() {
			$.ajax({
				url : "/noob/pack/findPackagingIE.action",
				type : "GET",
				data : {
					jobListNo : $("#display_JLNo").val()
				},
				success : function(response) {
					if(response.storageTime=="" || response.storageTime==null ){
						$("#factWeight").val(response.factWeight);
						$("#userName").val(response.userName);
						$("#chargedWeight").val(response.chargedWeight);
						$("#size").val(response.size);
						$("#getProductManName").val(response.getProductManName);
						$("#txt_userName").val(response.userName);
						$("#factQuantity").val(response.factQuantity);
						$("#btn_keep").attr("disabled",false);
					}else{
						$("#btn_keep").attr("disabled",true);
						toastr.error('该订单已入库');
					}
				}
			});
		})
	};
	return oInit;
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


var TableInit = function () {
    var oTableInit = new Object();
    //初始化Table
    oTableInit.Init = function () {
        $('#tb_departments_PIQ').bootstrapTable({
            url: '/noob/pack/findPackInfo.action', //请求后台的URL（*）
            method: 'get',                      //请求方式（*）
            toolbar: '#toolbar',                //工具按钮用哪个容器
            striped: true,                      //是否显示行间隔色
            cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
            pagination: false,                   //是否显示分页（*）
            sortable: false,                     //是否启用排序
            sortOrder: "asc",                   //排序方式
            queryParams: oTableInit.queryParams,//传递参数（*）
            sidePagination: "server",           //分页方式：client客户端分页，server服务端分页（*）
            strictSearch: false,
            showColumns: true,                  //是否显示所有的列
            showRefresh: true,                  //是否显示刷新按钮
            minimumCountColumns: 2,             //最少允许的列数
            clickToSelect: true,                //是否启用点击选中行
            uniqueId: "infoId",                     //每一行的唯一标识，一般为主键列
            showToggle:true,                    //是否显示详细视图和列表视图的切换按钮
            cardView: false,                    //是否显示详细视图
            detailView: false,                   //是否显示父子表
            columns: [{
            	field: 'company',
                title: '单位'
            }, {
                field: 'packaingProject',
                title: '包装项目'
            }, {
                field: 'specifications',
                title: '规格'
            }, {
                field: 'grade',
                title: '等级'
            }, {
                field: 'serviceCharge',
                title: '服务费'
            }, {
                field: 'number',
                title: '数量'
            }, {
                field: 'materialCost',
                title: '材料费'
            }, ]
        });
    };
    return oTableInit;
};