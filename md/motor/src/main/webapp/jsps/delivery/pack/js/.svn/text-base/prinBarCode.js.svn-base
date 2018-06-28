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

	// 2.初始化Button的点击事件
	var oButtonInit = new ButtonInit();
	oButtonInit.Init();
	
	
	$("#btn_stamp").click(function () { 
  	  	//取得选中行的数据
		var jobListNo = $("#display_JLNo").val();
	    var packagesNum = $("#txt_packagesNum").val();
	    var sortingCode = $("#txt_sortingCode").val();
	    var senderAddress = $("#txt_senderAddress").val();
	    var product = $("#txt_product").val();
	    var whither = $("#txt_whither").val();
	    var returnProductSign = $("#txt_returnProductSign").val();
	    var operateTime = $("#txt_operateTime").val();
	    //发送异步请求将数据绑定到域，在打印页面取得
	    if(jobListNo==""||jobListNo==null){
		   toastr.warning('请选择单号再进行打印');
	    }else{
	    	$.ajax({				
	    		type:"post",
	    		url:"/noob/pack/prinBarCode.action",
	    		data:{"jobListNo":jobListNo,
	    			"packagesNum":packagesNum,
	    			"sortingCode":sortingCode,
	    			"senderAddress":senderAddress,
	    			"product":product,
	    			"whither":whither,
	    			"returnProductSign":returnProductSign,
	    			"operateTime":operateTime
	    		},
	    		success: function(result){
	    			if(result=="true"){
	    				//打开新的窗口
	    				window.open("/noob/jsps/delivery/pack/printBarCodeImg.jsp");
	    			}
	    		}
	    	});
	    }
	}); 
	
	//模糊查询按钮
	$("#btn_query").click(function(){
		$('').bootstrapTable("refresh",{
			url:"/noob/customer/customerPageQuery.action",
			queryParams:oTable.queryParams
	    });
	});
});  

//将毫秒时间转换为时间格式显示
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

var ButtonInit = function() {
	var oInit = new Object();
	var postdata = {};

	oInit.Init = function() {
		//模糊查询订单号
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
		
		//根据输入的工作单号查询包装表、工作单表、寄收人信息表信息
		$("#display_JLNo").bind("change", function() {
			$.ajax({
				url : "/noob/pack/findBarCodeInfo.action",
				type : "GET",
				data : {
					jobListNo : $("#display_JLNo").val()
				},
				success : function(response) {
					$("#txt_packagesNum").val(response.packagesNum);
					$("#txt_sortingCode").val(response.sortingCode);
					$("#txt_senderAddress").val(response.senderAddress);
					$("#txt_product").val(response.product);
					$("#txt_whither").val(response.whither);
					$("#txt_returnProductSign").val(response.returnProductSign);
					$("#txt_operateTime").val(formatDate(new Date()));
				}
			});
		})
	};
	return oInit;
};