var TableInitSeparatedList = function() {
	var oTableInitSeparatedList = new Object();
	//初始化Table 
	oTableInitSeparatedList.Init = function() {
		$('#tb_separatedList').bootstrapTable({
			method : 'get', //请求方式（*） 
			striped : true, //是否显示行间隔色 
			cache : false, //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*） 
			pagination : true, //是否显示分页（*） 
			sortable : false, //是否启用排序 
			sortOrder : "asc", //排序方式
			queryParams : oTableInitSeparatedList.queryParams,
			sidePagination : "server", //分页方式：client客户端分页，server服务端分页（*） 
			pageNumber : 1, //初始化加载第一页，默认第一页 
			pageSize : 10, //每页的记录行数（*） 
			pageList : [10,15,50,100], //可供选择的每页的行数（*） 
			search : false, //是否显示表格搜索，此搜索是客户端搜索，不会进服务端，所以，个人感觉意义不大 
			strictSearch : true,
			showColumns : true, //是否显示所有的列 
			showRefresh : true, //是否显示刷新按钮
			minimumCountColumns : 2, //最少允许的列数
			clickToSelect : true, //是否启用点击选中行 
			height : 550, //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度 
			uniqueId : "workOrderNo", //每一行的唯一标识，一般为主键列 
			showToggle : true, //是否显示详细视图和列表视图的切换按钮 
			cardView : false, //是否显示详细视图
			detailView : false, //是否显示父子表
			
			columns : [{
				checkbox : true
			}, {
				field : 'workOrderNo',
				title : '工作单号'
			}, {
				field : 'ssmNum',
				title : '运转中心'
			}, {
				field : 'businessRecsiptNo',
				title : '派送单位'
			}, {
				field : 'businessRecsiptNo',
				title : '货物地址'
			}, {
				field : 'businessRecsiptNo',
				title : '分单人'
			}, {
				field : 'businessRecsiptNo',
				title : '分单时间',
				formatter:function(value){
					return formatDate(value);
				}
			}, {
				field : 'businessRecsiptNo',
				title : '入库时间',
				formatter:function(value){
					return formatDate(value);
				}
			}, {
				field : 'workOrderTime',
				title : '出库时间',
				formatter:function(value){
					return formatDate(value);
				}
			}, {
				field : 'fetchAddress',
				title : '送达时限',
				formatter:function(value){
					return formatDate(value);
				}
			}, {
				field : 'contacts',
				title : '分拨批次',
				formatter:function(value){
					return formatDate(value);
				}
			}]
		});
	}; //得到查询的参数
	
	
	
	oTableInitSeparatedList.queryParams = function(params) {
		var temp = {
			//这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的 
			limit : params.limit, //页面大小 
			offset : params.offset, //页码 
			staffNumber : $("#staffNumber").val(),
		};
		return temp;
	};
	
	oTableInitSeparatedList.queryParamsWork = function(params) {
		var temp = {
			//这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的 
			limit : params.limit, //页面大小 
			offset : params.offset //页码 
		};
		return temp;
	};
	return oTableInitSeparatedList;
};

var ButtonInitSeparatedList = function() {
	var oInit = new Object();
	var postdata = {};
	oInit.Init = function() {
		$("#save").click(function(){
			var select = $('#tb_separatedList').bootstrapTable(
				'getSelections');
			var workOrderId = [];
			for (var i = 0; i < select.length; i++) {
				workOrderId[i] = select[i]['workOrderId'];
			}
			$.ajax({
				type:'post',
				url:'/noob/checkMachineTurnSingle/updateWorkOrderU.action',
				data:{
					customerName:customerName[0],
					modeOfTransfer:$("#modeOfTransfer").val(),
				},
				success:function(result) {				
					if (result == "success") {						
						toastr.success('转单成功!');
					} else {
						toastr.error('转单失败!');
					}
					var obj = {
							url : "/noob/checkMachineTurnSingle/workOrderIdPageQuery.action",
							silent : true,
							query : {
								workOrderId : workOrderId[0]
							}
					};
					$('#tb_lowturnSingle').bootstrapTable('refresh',obj);
					
					$('#tb_newturnSingle').bootstrapTable('refresh',{url:'/noob/checkMachineTurnSingle/workOrderPageQuery.action'});
				}
			}); 
			
			$('#modeOfTransfer').change(function() {
				$('#transferToTherTarget').empty();
			});
		});
	};
	return oInit;
};

$("#btn_query").click(function(){
	var staffNumber = $("#staffNumber").val();
	if(staffNumber == '' || staffNumber == null){
		toastr.error("员工号不能为空!");
	}else{
		var obj = {
			url : "/noob/checkMachineTurnSingle/checkMachineTurnSinglePageQuery.action",
			silent : true,
			query : {
				staffNumber : $("#staffNumber").val(),
			}
		};
		$('#tb_departments').bootstrapTable('refresh',obj); 
	}
	
	var staffPassword = $("#staffPassword").val();
	
	if(staffPassword == '' || staffPassword == "error"  ){
		toastr.error("查台密码为空,禁用转单与重发操作!");
		$("#TurnSingle").attr("disabled","disabled");
		$("#repeat").attr("disabled","disabled");
	}else{
		$("#TurnSingle").attr("disabled",false);
		$("#repeat").attr("disabled",false);
	}
}); 


$(function() {
	$.fn.modal.Constructor.prototype.enforceFocus = function() {};
	//1.初始化Table 
	var oTableInitSeparatedList = new TableInitSeparatedList();
	oTableInitSeparatedList.Init();
	//2.初始化Button的点击事件 
	var oButtonInitSeparatedList = new ButtonInitSeparatedList();
	oButtonInitSeparatedList.Init();
	//3.初始化消息提示框
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
	
	$(".form_datetime").datetimepicker({
	      format: "yyyy-mm-dd",
	      autoclose: true,
	      todayBtn: true,
	      language:'zh-CN',
	      pickerPosition:"bottom-right",
	      minView:2
	});
	
});	


function test() {
	var oldWidth = $('body').outerWidth();
	var marginLeft = (document.documentElement.clientWidth - $(
			".model-dialog").outerWidth()) / 2;
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

