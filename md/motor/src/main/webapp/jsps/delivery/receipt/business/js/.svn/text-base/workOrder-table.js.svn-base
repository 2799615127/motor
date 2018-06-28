var TableInitWork = function() {
	var oTableInitWork = new Object();
	// 初始化订单属性Table
	oTableInitWork.Init = function() {
		$('#tb_business').bootstrapTable({
			url : '/noob/workOrder/businessPageQuery.action', // 请求后台的URL（*）
			method : 'get', // 请求方式（*）
			toolbar : '#toolbarWork', // 工具按钮用哪个容器
			striped : true, // 是否显示行间隔色
			cache : false, // 是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
			pagination : true, // 是否显示分页（*）
			sortable : false, // 是否启用排序
			sortOrder : "asc", // 排序方式
			queryParams : oTableInitWork.queryParams,// 传递参数（*）
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
			uniqueId : "businessRecsiptId", // 每一行的唯一标识，一般为主键列
			showToggle : true, // 是否显示详细视图和列表视图的切换按钮
			cardView : false, // 是否显示详细视图
			detailView : true, // 是否显示父子表
			columns : [ {
				checkbox : true
			}, {
				field : 'businessRecsiptNo',
				title : '受理单号'
			}, {
				field : 'customerName',
				title : '客户名',
				editable: {  
                    type: 'text',  
                    validate: function (value) {  
                        if ($.trim(value) == '') {  
                            return '客户名不能为空!';  
                        }  
                    }  
                }  
			}, {
				field : 'contacts',
				title : '联系人',
				editable: {  
                    type: 'text',  
                    validate: function (value) {  
                        if ($.trim(value) == '') {  
                            return '联系人不能为空!';  
                        }  
                    }  
                }  
			}, {
				field : 'customerPhone',
				title : '电话',
				editable: {  
                    type: 'text',  
                    validate: function (value) {  
                        if ($.trim(value) == '') {  
                            return '电话不能为空!';  
                        }else if(!/^1(3|4|5|7|8)\d{9}$/.test($.trim(value))){
                        	return '电话格式不正确!';  
                        }
                    }  
                }  
			}, {
				field : 'fetchAddress',
				title : '取件地址',
				editable: {  
                    type: 'text',  
                    validate: function (value) {  
                        if ($.trim(value) == '') {  
                            return '取件地址不能为空!';  
                        }  
                    }  
                }  
			}, {
				field : 'sendingCity',
				title : '寄件城市',
				editable: {  
                    type: 'text',  
                    validate: function (value) {  
                        if ($.trim(value) == '') {  
                            return '寄件城市不能为空!';  
                        }  
                    }  
                }  
			}, {
				field : 'arrivalCity',
				title : '到达城市',
				editable: {  
                    type: 'text',  
                    validate: function (value) {  
                        if ($.trim(value) == '') {  
                            return '到达城市不能为空!';  
                        }  
                    }  
                }  
			}, {
				field : 'serveCity',
				title : '送达地址'
			}, {
				field : 'goodName',
				title : '产品'
			}, {
				field : 'sortingCode',
				title : '定区编码'
			}, {
				field : 'appointmentDispatchTime',
				title : '预约时间',
				formatter:function(value){
					return formatDate(value);
				},
				editable: {  
                    type: 'datetime',  
                    validate: function (value) {  
                        if ($.trim(value) == '') {  
                            return '预约时间不能为空!';  
                        }  
                    }  
                }  
			}, {
				field : 'productName',
				title : '品名',
				editable: {  
                    type: 'text',  
                    validate: function (value) {  
                        if ($.trim(value) == '') {  
                            return '品名不能为空!';  
                        }  
                    }  
                }  
			}, {
				field : 'weight',
				title : '重量',
				editable: {  
                    type: 'text',  
                    validate: function (value) {  
                        if ($.trim(value) == '') {  
                            return '重量不能为空!';  
                        }else if(!/^([\+-]?\d+)(\.\d+)?$/.test($.trim(value))){
                        	return '只能输入小数或数字!';
                        } 
                    }  
                }  
			}, {
				field : 'volume',
				title : '体积',
				editable: {  
                    type: 'text',  
                    validate: function (value) {  
                        if ($.trim(value) == '') {  
                            return '体积不能为空!';  
                        }else if(!/^([\+-]?\d+)(\.\d+)?$/.test($.trim(value))){
                        	return '只能输入小数或数字!';
                        }   
                    }  
                }  
			}, {
				field : 'numberPackages',
				title : '件数'
			}, {
				field : 'commonRemarks',
				title : '常用备注',
				editable: {  
                    type: 'text'
                }  
			}],
			
			//注册加载子表的事件。注意下这里的三个参数！
            onExpandRow: function (index, row, $detail) {
            	oTableInitWork.InitSubTable(index, row, $detail);
            }
		});
		
	    //初始化子表格(无线循环)
		oTableInitWork.InitSubTable = function (index, row, $detail) {
	        var parentid = row.businessRecsiptId;
	        var cur_table = $detail.html('<table id="tb_workOrder"></table>').find('table');
	        $(cur_table).bootstrapTable({
	            url: '/noob/workOrder/workOrderPageQuery.action',
	            method: 'get',
	            queryParams: {businessRecsiptId: parentid},
	            ajaxOptions: {businessRecsiptId: parentid},
	            clickToSelect: true,
	            detailView: false,//父子表
	            uniqueId: "workOrderId",
	            pageSize: 10,
	            pageList: [10, 25],
	            sidePagination : "server", // 分页方式：client客户端分页，server服务端分页（*）
	            columns : [{
					field : 'workOrderNo',
					title : '工单号'
				}, {
					field : 'workOrderType',
					title : '工单类型'
				}, {
					field : 'takeStatus',
					title : '取件状态',
					formatter : function(value, row, index) {
		    			if (row.takeStatus == 1) {
		    				return '新单';
		    			}else if (row.takeStatus == 2){
		    				return '已通知';
		    			}else if (row.takeStatus == 3){
		    				return '已确认';
		    			}else if (row.takeStatus == 4){
		    				return '已取件';
		    			}else if(row.takeStatus == 5){
		    				return '新建';
		    			}else if(row.takeStatus == 6){
		    				return '已取消'
		    			}else if(row.takeStatus == 7){
		    				return '已调度'
		    			}
		    		}					
				}, {
					field : 'ssmNum',
					title : '短信序号'
				}, {
					field : 'workOrderTime',
					title : '生成时间',
					formatter:function(value){
						return formatDate(value);
					}
				}, {
					field : 'traceNum',
					title : '追单数'
				}, {
					field : 'staffNumber',
					title : '取派员编号'
				}, {
					field : 'staffName',
					title : '取件员名'
				}, {
					field : 'takeOrgName',
					title : '取件单位'
				}, {
					field : 'takeTime',
					title : '取件时间',
					formatter:function(value){
						return formatDate(value);
					}
				}, {
					field : 'sortingCode',
					title : '定区编码'
				} ],
				//无线循环取子表，直到子表里面没有记录
	            onExpandRow: function (index, row, $Subdetail) {
	            	oTableInitWork.InitSubTable(index, row, $Subdetail);
	            }
	        });
	    };
	};
	
	
	// 初始化工单咨询Table
	// 得到查询的参数
	oTableInitWork.queryParams = function(params) {
		var temp = {
			// 这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
			pageSize : params.limit,
			start : params.offset,
			businessRecsiptNo : $("#searchBusinessRecsiptNo").val(),
			   customerName : $("#searchCustomerName").val(),
			   arrivalCity : $("#searchArrivalCity").val(),
			   product : $("#searchProduct").val(),
			   sortingCode : $("#searchSortingCode").val()
		};
		return temp;
	};

	return oTableInitWork;
};

var ButtonInitWork = function() {
	var oInitWork = new Object();
	var postdataWork = {};
	oInitWork.Init = function() {
		// 追单
		$("#btn_traceWork").click(function() {
			var select = $('#tb_business').bootstrapTable('getSelections');
			if (select.length === 0 || select.length > 1) {
				toastr.warning('只能选择一行进行修改');
			}else{
				$.ajax({
					url:"/noob/workOrder/traceOrderU.action",
					type:'GET',
					data:{
						businessRecsiptId:select[0]['businessRecsiptId'],
						businessRecsiptNo:select[0]['businessRecsiptNo'],
						separateListType:select[0]['separateListType'],
						takeTime:select[0]['appointmentDispatchTime']
					},
					success:function(data){
						if(data == 'success'){
							toastr.success('追单成功');
						}else if(data == 'take'){
							toastr.error('已取件');
						}else if(data == 'cancal'){
							toastr.error('已取消');
						}else{
							toastr.error('追单失败');
						}
						$('#tb_business').bootstrapTable('refresh');
					}
				});
			}
		});
		
		//保存改单数据
		$("#btn_updateWork").click(function() {
			var select = $('#tb_business').bootstrapTable('getSelections');
			if (select.length === 0 || select.length > 1) {
				toastr.warning('只能选择一行进行保存');
			}else{
				$.ajax({
					url:'/noob/workOrder/updateBusinessSaveU.action',
					type:'POST',
					data:{
						businessRecsiptId:select[0]['businessRecsiptId'],
						businessRecsiptNo:select[0]['businessRecsiptNo'],
						customerName:select[0]['customerName'],
						contacts:select[0]['contacts'],
						telephone:select[0]['telephone'],
						fetchAddress:select[0]['fetchAddress'],
						sendingCity:select[0]['sendingCity'],
						arrivalCity:select[0]['arrivalCity'],
						product:select[0]['product'],
						appointmentTakeTime:formatDate(select[0]['appointmentDispatchTime']),
						productName:select[0]['productName'],
						weight:select[0]['weight'],
						volume:select[0]['volume'],
						commonRemarks:select[0]['commonRemarks'],
						sortingCode:select[0]['sortingCode']
					},
					success:function(data){
						if(data == 'success'){
							toastr.success('改单成功');
						}else if(data == 'take'){
							toastr.error('已取件');
						}else if(data == 'cancal'){
							toastr.error('已取消');
						}else{
							toastr.error('改单失败');
						}
						$('#tb_business').bootstrapTable('refresh');
					}
				});
			}
		});
		
		// 销单
		$("#btn_canCelWork").click(function() {
			$("#cancelCause").text(""),
			$("#cancelRemark").val("")
			var select = $('#tb_business').bootstrapTable('getSelections');
			if (select.length === 0 || select.length > 1) {
				toastr.warning('只能选择一行进行销单');
			}else if(select[0]['separateListType'] == 1){
				toastr.warning('订单已转调度');
			}else{
				$("#myMoalUpdate").modal("show");
			}
		});

		// 销单提交按钮
		$("#cancelWorkOrder").click(function(){
			var select = $('#tb_business').bootstrapTable('getSelections');
			$.ajax({
				url:'/noob/workOrder/cancelOrderU.action',
				type:'POST',
				data:{
					businessRecsiptId:select[0]['businessRecsiptId'],
					separateListType:select[0]['separateListType'],
					cause:$("#cancelCause").val(),
					remark:$("#cancelRemark").val()
				},
				success:function(data){
					if(data == 'success'){
						toastr.success('销单成功');
					}else if(data == 'take'){
						toastr.error('已取件');
					}else if(data == 'cancal'){
						toastr.error('已取消');
					}else{
						toastr.error('销单失败');
					}
					$('#tb_business').bootstrapTable('refresh');
				}
			});
		});
		
		// 模糊查询
		$("#searchSubmit").click(function(){
			var obj = {
	    			url:"/noob/workOrder/conBusinessPageQuery.action",
	    			silent: true,
	    			query:{
	    				   businessRecsiptNo : $("#searchBusinessRecsiptNo").val(),
	    				   customerName : $("#searchCustomerName").val(),
	    				   arrivalCity : $("#searchArrivalCity").val(),
	    				   product : $("#searchProduct").val(),
	    				   sortingCode : $("#searchSortingCode").val()
	    			}
	    		};
	    		$('#tb_business').bootstrapTable('refresh', obj);
		});
	};
	return oInitWork;
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
