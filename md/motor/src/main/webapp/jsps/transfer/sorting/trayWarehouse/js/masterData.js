var TableInitMasterData = function() {
	var oTableInitMasterData= new Object();
	// 初始化盘库单主表数据Table
	oTableInitMasterData.Init = function() {
		$('#tb_masterData').bootstrapTable({
			url : '/noob/warehouse/trayWarehousePageQuery.action', // 请求后台的URL（*）
			method : 'get', // 请求方式（*）
			toolbar : '#toolbar_masterData', // 工具按钮用哪个容器
			striped : true, // 是否显示行间隔色
			cache : false, // 是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
			pagination : true, // 是否显示分页（*）
			sortable : false, // 是否启用排序
			sortOrder : "asc", // 排序方式
			queryParams : oTableInitMasterData.queryParams,// 传递参数（*）
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
			uniqueId : "checkNo", // 每一行的唯一标识，一般为主键列
			showToggle : true, // 是否显示详细视图和列表视图的切换按钮
			cardView : false, // 是否显示详细视图
			detailView : false, // 是否显示父子表
			columns : [ {
				checkbox : true
			}, {
				field : 'checkNo',
				title : '盘点单号'
			}, {
				field : 'count',
				title : '总件数'
			}, {
				field : 'trayWarehouseTime',
				title : '盘库时间',
				formatter:function(value){
					return formatDate(value);
				}
			}, {
				field : 'trayWarehouseName',
				title : '盘库人'
			}, {
				field : 'operatingOrg',
				title : '操作人单位'
			} ]
		});
	};
	
	
	// 初始化工单咨询Table
	// 得到查询的参数
	oTableInitMasterData.queryParams = function(params) {
		var temp = {
			// 这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
			pageSize : params.limit,
			start : params.offset,
		};
		return temp;
	};

	return oTableInitMasterData;
};

var ButtonInitMasterData = function() {
	var oInits = new Object();
	var postdatas = {};
	oInits.Init = function() {
		// 初始化页面上面的按钮事件
		// 新增
		$("#btn_addMasterData").click(function() {
			cleanAddMasterData();
			$("#addMasterDataButton").prop('disabled', false);
			$("#trayWarehouseName").val($("#userName").val());
			$("#operatingOrg").val($("#orgName").val());
		});
		
		$("#addMasterDataButton").click(function(){
			 $.ajax({
				url:"/noob/warehouse/addTrayWarehouseU.action",
				type:"post",
				data:{
					count : $("#count").val(),
					trayWarehouseName : $("#trayWarehouseName").val(),
					operatingOrg : $("#operatingOrg").val(),
					},
				success:function(result){
					if(result == "success"){
						toastr.success("添加成功!");
					}else{
						toastr.error("添加失败");
					}	
					$('#tb_masterData').bootstrapTable("refresh", {
						url : '/noob/warehouse/trayWarehousePageQuery.action',
					});
				}
			 });
			 $("#addMasterData").modal('hide');
		});
		
		//删除按钮
		$("#btn_deleteMasterData").click(function() {
			var select = $('#tb_masterData').bootstrapTable('getSelections');
			if(select.length === 0) {
				toastr.warning('请至少选择一行进行删除!');
			}else if (select.length > 1) {
				toastr.info('只能选择一行进行删除!');
			} else {
				swal({
					title : "操作提示", // 弹出框的title
					text : "删除后数据将会消失确定删除吗？", // 弹出框里面的提示文本
					type : "warning", // 弹出框类型
					showCancelButton : true, // 是否显示取消按钮
					confirmButtonColor : "#DD6B55",// 确定按钮颜色
					cancelButtonText : "取消",// 取消按钮文本
					confirmButtonText : "是的，确定删除！",// 确定按钮上面的文档
					closeOnConfirm : true
				}, function() {
					var trayWarehouseId = select[0]['trayWarehouseId'];
					$.ajax({
						type : "GET",
						url : '/noob/warehouse/deleteTrayWarehouseAndWorkU.action',
						data : {
							trayWarehouseId : trayWarehouseId
						},
						success : function(result) {
							if (result == "success") {
								toastr.success('删除成功!');
							} else {
								toastr.error('删除失败!');
								toastr.error('该子表数据已核对不能删除!');
							}
							$('#tb_bookData').bootstrapTable("refresh", {
								url : '/noob/warehouse/trayWorkPageQuery.action'
							});
							$('#tb_detailData').bootstrapTable("refresh", {
								url : '/noob/warehouse/trayWorkPageQuery.action'
							});
							$('#tb_masterData').bootstrapTable("refresh", {
								url : '/noob/warehouse/trayWarehousePageQuery.action'
							});
						}
					});
				});
			}
		});
	};
	return oInits;
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


function cleanAddress() {
	$("#detailedAddress").val("");
	$("#txt_add_province").children("option").remove();
	$("#txt_add_city").children("option").remove();
	$("#txt_add_district").children("option").remove();
}
//清除方法
function cleanAddMasterData() {
	$("#count").val("");
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
//-----------------------------------------------------------------
function checkCount(obj){
	//格式是否合法
	var numberPackagesReg = /^[0-9]*$/;
	
	//校验是否为空
	if (obj.value.length == 0) {
		$("#"+obj.id + "_prompt").text("总件数不能为空!");
		$("#addMasterDataButton").prop('disabled', true);
	}else if (!numberPackagesReg.test(obj.value)) {
		//获得姓名框后的提示框对象
		$("#"+obj.id + "_prompt").text("总件数只能为正整数!");
		$("#addMasterDataButton").prop('disabled', true);
	}else{
		$("#addMasterDataButton").prop('disabled', false);
	};
}

function cancelPrompts() {
	$(".prompt").text("");
};