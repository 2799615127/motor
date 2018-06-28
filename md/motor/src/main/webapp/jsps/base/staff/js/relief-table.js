var TableInits = function() {
	var oTableInits = new Object();
	// 初始化Table
	oTableInits.Init = function() {
		$('#tb_departmentes').bootstrapTable({
			url : '/noob/relief/reliefPageQuery.action', // 请求后台的URL（*）
			method : 'get', // 请求方式（*）
			toolbar : '#toolbars', // 工具按钮用哪个容器
			striped : true, // 是否显示行间隔色
			cache : false, // 是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
			pagination : true, // 是否显示分页（*）
			sortable : false, // 是否启用排序
			sortOrder : "asc", // 排序方式
			queryParams : oTableInits.queryParams,// 传递参数（*）
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
			uniqueId : "reliefId", // 每一行的唯一标识，一般为主键列
			showToggle : true, // 是否显示详细视图和列表视图的切换按钮
			cardView : false, // 是否显示详细视图
			detailView : false, // 是否显示父子表
			columns : [ {
				checkbox : true
			}, {
				field : 'staffName',
				title : '替班人名字'
			}, {
				field : 'covStaffName',
				title : '被替班人名字'
			}, {
				field : 'startTime',
				title : '开始时间',
				formatter:function(value){
					return formatDate(value);
				}
			}, {
				field : 'endTime',
				title : '结束时间',
				formatter:function(value){
					return formatDate(value);
				}
			},{
				field : 'cancelSign',
				title : '作废标记',
				formatter : function(value, row, index) {
					if (row.cancelSign == '0') {
						return '否';
					} else {
						return '是';
					}
				}
			}, {
				field : 'orgName',
				title : '组织名称'
			}],
			rowStyle: function (row, index) {
                //这里有5个取值代表5中颜色['active', 'success', 'info', 'warning', 'danger'];
                var strclass = {};
                if (row.cancelSign == "1") {
                    strclass ={css:{'background-color':'#FFCCCC'}};//还有一个active
                }
                return strclass 
            }
		});
	};
	// 得到查询的参数
	oTableInits.queryParams = function(params) {
		var temp = {
			// 这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
			pageSize : params.limit,
			start : params.offset,
			startTime : $("#txt_search_startTime").val(),// 编号
			endTime : $("#txt_search_endTime").val(),// 取派员名
			orgName : $("#txt_search_orgNames").val(),// 收派标准
			staffName : $("#txt_search_staffNames").val(),// 所属单位
			covStaffName : $("#txt_search_covStaffName").val()
		// 类型

		};
		return temp;
	};

	return oTableInits;
};

var ButtonInits = function() {
	var oInit = new Object();
	var postdata = {};
	oInit.Init = function() {
		// 初始化页面上面的按钮事件
		$("#btn_add").click(function() {
			test();
		});
		
		//修改按钮
		$("#btn_reliefEdit").click(function() {
			$(".prompt").text("");
			clean();
			var select = $('#tb_departmentes').bootstrapTable('getSelections');
			if (select.length === 0) {
				toastr.warning('请至少选择一行进行修改!');
			} else if (select.length > 1) {
				toastr.info('只能选择一行进行修改!');
			} else {
				//单位名称
				var selectOrgName = select[0]["orgName"];
				$("#updateReliefId").val(select[0]["reliefId"]);
				$("#updateStaffNameU").val(select[0]["staffName"]);
				$("#updateCovStaffNameU").val(select[0]["covStaffName"]);
				
				var updateStartTimeU = select[0]["startTime"];
				$("#updateStartTimeU").val(formatDate(updateStartTimeU));
				var updateEndTimeU = select[0]["endTime"];
				$("#updateEndTimeU").val(formatDate(updateEndTimeU));
				
				$("#updateCancelSignU").val(select[0]["cancelSign"]);
				
				//获得组织结构名
				$.ajax({
					url:"/noob/relief/findAllOrgNameAndIdQuery.action",
					type:"post",
					async:true,
					success:function(response){
						var html = "";
						for(var i=0;i<response.length;i++) {
							if(selectOrgName==response[i].orgName){
								html = html+"<option selected style='color:#ff6700;' id='"+response[i].orgId+"'>"+response[i].orgName+"</option>";
							}else{
								html = html+"<option id='"+response[i].orgId+"'>"+response[i].orgName+"</option>";
							}
						}
						$("#updateOrgNameU").append(html);
						$(".selectpicker").selectpicker("refresh");
					}
				});
				$("#myModalUpdateR").modal("show");
				$("#updateReliefFrom").data('bootstrapValidator').destroy();
				$('#updateReliefFrom').data('bootstrapValidator', null);
				validatorRU();
			}
		});
		
		//作废按钮
		$("#btn_reliefDelete").click(function() {
			var select = $('#tb_departmentes').bootstrapTable('getSelections');
			if (select.length === 0) {
				toastr.warning('请至少选择一行进行作废!');
			} else {
				swal({
					title : "操作提示", // 弹出框的title
					text : "确定作废吗？", // 弹出框里面的提示文本
					type : "warning", // 弹出框类型
					showCancelButton : true, // 是否显示取消按钮
					confirmButtonColor : "#DD6B55",// 确定按钮颜色
					cancelButtonText : "取消",// 取消按钮文本
					confirmButtonText : "是的，确定作废！",// 确定按钮上面的文档
					closeOnConfirm : true
				}, function() {
					var arrs = [];
					for (var i = 0; i < select.length; i++) {
						/*var array = select[i]['cancelSign'];
						if (array == "1") {
							toastr.info('该记录已作废不能再次作废!');
						} else {*/
							arrs[i] = select[i]['reliefId'];
						
					}
					//作废的ajax
					$.ajax({
						type : "GET",
						url : '/noob/relief/deleteLotReliefU.action',
						data : {
							reliefIds : arrs
						},
						success : function(result) {
							if (result == "success") {
								toastr.success('作废成功!');
							} else {
								toastr.error('作废失败!');
							}
							$('#tb_departmentes').bootstrapTable("refresh", {
								url : '/noob/relief/reliefPageQuery.action'
							});
						}
					});
				});
			}
		});
	};
	return oInit;
};


$(function() {
	// 初始化提示框的位置
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

	// 1.初始化Table
	var oTable = new TableInits();
	oTable.Init();
	// 2.初始化Button的点击事件
	var oButtonInits = new ButtonInits();
	oButtonInits.Init();
	// 点击查询按钮触发点击事件
	$('#btn_relief').click(function() {
		$('#tb_departmentes').bootstrapTable("refresh", {
			url : '/noob/relief/reliefPageVariousConditionQuery.action',
			queryParams : oTable.queryParams
		});
	});
	
	//下拉列表获取数据
	$("#bt_reliefInsert").click(function() {
		$(".prompt").text("");
		cleanR();
		$("#addReliefFrom").data('bootstrapValidator').destroy();
		$('#addReliefFrom').data('bootstrapValidator', null);
		validatorR();
		//类型 
		$.ajax({
			type:"post",
			async:false,
			url : '/noob/relief/findAllOrgNameAndIdQuery.action',
			success:function(response){
				var html = "<option>请选择类型</option>";
				for(var i=0;i<response.length;i++) {
					html = html+"<option id='"+response[i].orgId+"'>"+response[i].orgName+"</option>";
				}
				$("#orgNameR").append(html);
				$(".selectpicker").selectpicker("refresh");
			}
		});
		//替班人名称
		$.ajax({
			type:"post",
			async:false,
			url : '/noob/relief/findAllStaffNameAndIdQuery.action',
			success:function(response){
				var html = "<option>请选择替班人</option>";
				for(var i=0;i<response.length;i++) {
					html = html+"<option id='"+response[i].staffId+"'>"+response[i].staffName+"</option>";
				}
				$("#staffNameR").append(html);
				$(".selectpicker").selectpicker("refresh");
			}
		});
		
		//被替班人名称
		$.ajax({
			type:"post",
			async:false,
			url : '/noob/relief/findAllCovStaffNameAndIdQuery.action',
			success:function(response){
				var html = "<option>请选择被替班人</option>";
				for(var i=0;i<response.length;i++) {
					html = html+"<option id='"+response[i].staffId+"'>"+response[i].staffName+"</option>";
				}
				$("#covStaffNameR").append(html);
				$(".selectpicker").selectpicker("refresh");
			}
		});
	});
	
	//添加替班
	$("#addReliefButton").click(function(){
		//替班Id
		var staffId = "";
		for(var i=0;i<$("#staffNameR").children().length;i++){
			if($("#staffNameR").children()[i].selected){
				staffId = $($("#staffNameR").children()[i]).attr("id");
			}
		}
		
		//被替班Id
		var covStaffId = "";
		for(var i=0;i<$("#covStaffNameR").children().length;i++){
			if($("#covStaffNameR").children()[i].selected){
				covStaffId = $($("#covStaffNameR").children()[i]).attr("id");
			}
		}
		
		//组织Id
		var orgId = "";
		for(var i=0;i<$("#orgNameR").children().length;i++){
			if($("#orgNameR").children()[i].selected){
				orgId = $($("#orgNameR").children()[i]).attr("id");
			}
		}
		//获取各个属性的值
		var staffName =  $('#staffNameR').val();
		var covStaffName =  $('#covStaffNameR').val();
		var startTimeR = $('#txt_search_addStartTime').val();
		var endTimeR = $('#txt_search_addEndTime').val();
		if(staffId == "" || staffId==null){
			toastr.warning('替班人不能为空!');
		}if(covStaffId =="" || covStaffId==null){
			toastr.warning('被替班人不能为空!');
		}if(orgId =="" || orgId==null){
			toastr.warning('组织类型不能为空!');
		}else{
		if (startTimeR > endTimeR) {
			toastr.warning('开始时间不能比结束时间短!');
		} else if(staffName==covStaffName){
			toastr.warning('替班和被替班人名字不能相同!');
		} else{
			//添加
			$.ajax({
				type:"post",
				async:true,
				url : '/noob/relief/addReliefU.action',
				data : {		
					staffId: staffId,
					covStaffId: covStaffId,
					startTimeR: startTimeR,
					endTimeR: endTimeR,
					cancelSign: $('#txt_search_cancelSign').val(),
					orgId: orgId,
					staffName: staffName,
					covStaffName: covStaffName
				},
				success : function(result) {
					if(result == "info"){
						toastr.error('该替班已存在!');
					}else if(result == "success"){
						toastr.success('添加成功!');
					}else{
						toastr.error('添加失败!');
					}
					$('#tb_departmentes').bootstrapTable("refresh", {
						url : '/noob/relief/reliefPageVariousConditionQuery.action'
					});
				}
			});
		}
	}
	});
	
	//修改按钮
	$("#updateReliefButton").click(function(){
		var startTime = $("#updateStartTimeU").val();
		var endTime = $("#updateEndTimeU").val();
		//组织Id
		var orgId = "";
		for(var i=0;i<$("#updateOrgNameU").children().length;i++){
			if($("#updateOrgNameU").children()[i].selected){
				orgId = $($("#updateOrgNameU").children()[i]).attr("id");
			}
		}
		if(startTime > endTime){
			toastr.error('开始时间不能比结束时间短!');
		}else{
			$.ajax({
				type : "POST",
				async: true,
				url : '/noob/relief/updateReliefU.action',
				data : {
					reliefId : $("#updateReliefId").val(),
					startTimeU : startTime,
					endTimeU : endTime,
					cancelSign : $("#updateCancelSignU").val(),
					orgId : orgId
				},
				success : function(result) {
					if (result == "success") {
						toastr.success('修改成功!');
					} else {
						toastr.error('修改失败!');
					}
					$('#tb_departmentes').bootstrapTable("refresh", {
						url : '/noob/relief/reliefPageQuery.action'
					});
				}
			});
		}
	});

	//替班模糊查询日期框
	$('#txt_search_startTime').datetimepicker({
		 language: 'zh-CN',
         autoclose: true,
         todayHighlight: true
	});
	$('#txt_search_endTime').datetimepicker({
		language: 'zh-CN',
        autoclose: true,
        todayHighlight: true
	});
	
	//添加时间框
	$('#txt_search_addStartTime').datetimepicker({
		language: 'zh-CN',
        autoclose: true,
        todayHighlight: true
	}).on('hide',function(e) { 
		$('#addReliefFrom').data('bootstrapValidator') 
		.updateStatus('addStartTime', 'NOT_VALIDATED',null) 
		.validateField('addStartTime'); 
	}); 
	$('#txt_search_addEndTime').datetimepicker({
		language: 'zh-CN',
        autoclose: true,
        todayHighlight: true
	}).on('hide',function(e) { 
		$('#addReliefFrom').data('bootstrapValidator') 
		.updateStatus('addEndTime', 'NOT_VALIDATED',null) 
		.validateField('addEndTime'); 
	});
	
	//修改时间框
	$('#updateStartTimeU').datetimepicker({
		language: 'zh-CN',
        autoclose: true,
        todayHighlight: true
	}).on('hide',function(e) { 
		$('#updateReliefFrom').data('bootstrapValidator') 
		.updateStatus('updateStartTimeU', 'NOT_VALIDATED',null) 
		.validateField('updateStartTimeU'); 
	});
	$('#updateEndTimeU').datetimepicker({
		language: 'zh-CN',
        autoclose: true,
        todayHighlight: true
	}).on('hide',function(e) { 
		$('#updateReliefFrom').data('bootstrapValidator') 
		.updateStatus('updateEndTimeU', 'NOT_VALIDATED',null) 
		.validateField('updateEndTimeU'); 
	});
	validatorR();
	validatorRU();
});

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

//清除
function cleanR() {
	$('#txt_search_addStartTime').val("");
	$('#txt_search_addEndTime').val("");
	$('#txt_search_cancelSign').val("");
	$("#staffNameR").children("option").remove();
	$("#covStaffNameR").children("option").remove();
	$("#orgNameR").children("option").remove();
}

//模态框位置
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
//---------------------------------------------------------
//校验替班开始时间
function checkStartTime(obj) {
	//校验是否为空
	if (obj.value.length == 0) {
		$("#"+obj.id + "_prompt").text("");
		$("#addReliefButton").prop('disabled', true);
	}else{
		$("#"+obj.id + "_prompt").text("")
	};
};

//校验替班结束时间
function checkEndTime(obj) {
	//校验是否为空
	if (obj.value.length == 0) {
		$("#"+obj.id + "_prompt").text("");
		$("#addReliefButton").prop('disabled', true);
	}else{
		$("#"+obj.id + "_prompt").text("");
	};
};

//校验修改替班开始时间
function checkStartTimeU(obj) {
	//校验是否为空
	if (obj.value.length == 0) {
		$("#"+obj.id + "_prompt").text("");
		$("#updateReliefButton").prop('disabled', true);
	}else{
		$("#"+obj.id + "_prompt").text("");
	};
	
};

//校验修改替班结束时间
function checkEndTimeU(obj) {
	//校验是否为空
	if (obj.value.length == 0) {
		$("#"+obj.id + "_prompt").text("");
		$("#updateReliefButton").prop('disabled', true);
	}else{
		$("#"+obj.id + "_prompt").text("");
	};
};
//校验总和
function checkAddRelief(){
	checkStartTime(txt_search_addStartTime);
	checkEndTime(txt_search_addEndTime);
};
//修改校验总和
function checkAddReliefU(){
	checkStartTimeU(updateStartTimeU);
	checkEndTimeU(updateEndTimeU);
};
//清除提示
function cancelPromptR(obj) {
		$("#"+obj.id + "_prompt").text("");
};
function check() {
	// 校验逻辑
	return false;
};
//添加校验
function validatorR(){
	$('#addReliefFrom').bootstrapValidator({
		message: 'This value is not valid',
		feedbackIcons:{
		valid: 'glyphicon glyphicon-ok',
		invalid: 'glyphicon glyphicon-remove',
		validating: 'glyphicon glyphicon-refresh'
	},
    fields: {
	    	addStartTime: {
	             validators: {
		             notEmpty: {
		                 message: '开始时间不能为空!',
		             },
	              }
	           },
	           addEndTime: {
	        	   validators: {
			             notEmpty: {
			                 message: '结束时间不能为空!',
			             },
		           }
             }
         }
     });
};
//修改校验
function validatorRU() {
	$('#updateReliefFrom').bootstrapValidator({
		message : 'This value is not valid',
		feedbackIcons : {
			valid : 'glyphicon glyphicon-ok',
			invalid : 'glyphicon glyphicon-remove',
			validating : 'glyphicon glyphicon-refresh'
		},
		fields : {
			updateStartTimeU : {
				validators : {
					notEmpty : {
						message : '开始时间不能为空!',
					},
				}
			},
			updateEndTimeU : {
				validators : {
					notEmpty : {
						message : '结束时间不能为空!',
					},
				}
			}
		}
	});
};