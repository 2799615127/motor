var TableInitBookData = function() {
	var oTableInitBookData= new Object();
	// 初始化账面数据Table
	oTableInitBookData.Init = function() {
		$('#tb_bookData').bootstrapTable({
			url : '/noob/warehouse/trayWorkPageQuery.action', // 请求后台的URL（*）
			method : 'get', // 请求方式（*）
			toolbar : '#toolbar_bookData', // 工具按钮用哪个容器
			striped : true, // 是否显示行间隔色
			cache : false, // 是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
			pagination : true, // 是否显示分页（*）
			sortable : false, // 是否启用排序
			sortOrder : "asc", // 排序方式
			queryParams : oTableInitBookData.queryParams,// 传递参数（*）
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
			},  {
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
	oTableInitBookData.queryParams = function(params) {
		var temp = {
			// 这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
			pageSize : params.limit,
			start : params.offset,
			storageConnectNumSon : $("#txt_search_storageConnectNumSon").val(),
			jobListNo : $("#txt_search_jobListNo").val(),
			warehouses : $("#txt_search_warehouses").val(),
			startTime : $("#txt_search_start").val(),
			endTime : $("#txt_search_end").val(),
		};
		return temp;
	};

	return oTableInitBookData;
};

var ButtonInitBookData = function() {
	var oInits = new Object();
	var postdatas = {};
	oInits.Init = function() {
		// 初始化页面上面的按钮事件
		//新单 
		$("#btn_deleteBookData").click(function() {
			var select = $('#tb_bookData').bootstrapTable('getSelections');
			if (select.length === 0) {
				toastr.warning('请至少选择一行进行删除!');
			} else if (select.length > 1) {
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
					var trayWorkId = select[0]['trayWorkId'];
					$.ajax({
						type : "GET",
						url : '/noob/warehouse/deleteTrayWorkByIdU.action',
						data : {
							trayWorkId : trayWorkId
						},
						success : function(result) {
							if (result == "success") {
								toastr.success('删除成功!');
							} else {
								toastr.error('删除失败!');
								toastr.info('该数据以核对不能删除!');
							}
							$('#tb_bookData').bootstrapTable("refresh", {
								url : '/noob/warehouse/trayWorkPageQuery.action'
							});
							$('#tb_detailData').bootstrapTable("refresh", {
								url : '/noob/warehouse/trayWorkPageQuery.action'
							});
						}
					});
				});
			}
		});
		
		//账面数据新增按钮
		$("#btn_addBookData").click(function() {
			cleanSelect();
			//查询所有盘点单号
			$.ajax({
				type:"post",
				async:false,
				url : '/noob/warehouse/findAllCheckNoQuery.action',
				success:function(response){
					var html = "<option>请选择盘点单号</option>";
					for(var i=0;i<response.length;i++) {
						html = html+"<option id='"+response[i].trayWarehouseId+"'>"+response[i].checkNo+"</option>";
					}
					$("#checkNo").append(html);
					$(".selectpicker").selectpicker("refresh");
				}
			});
			
			//入库交接单号
			$.ajax({
				type:"post",
				async:false,
				url : '/noob/warehouse/findAllStorageConnectNumSonAndIdQuery.action',
				success:function(response){
					var html = "<option>请选单号</option>";
					for(var i=0;i<response.length;i++) {
						html = html+"<option id='"+response[i].storageConnectSonId+"'>"+response[i].storageConnectNumSon+"</option>";
					}
					$("#storageConnectNumSon").append(html);
					$(".selectpicker").selectpicker("refresh");
				}
			});
		});
		
		//点击入库交接单号获取对应的数据
		$("#storageConnectNumSon").bind("change",function(){
			$.ajax({
				url:"/noob/warehouse/findTorageConnectAndSonBySonNumQuery.action",
				type:"post",
				data:{
					storageConnectNumSon :$("#storageConnectNumSon").val(),
					},
				success:function(response){
					//工作单号
					$("#jobListNo").val(response.jobListNo);
					//合包号
					$("#sourcingNo").val(response.packageNumber);
					//件数
					$("#numberPackages").val(response.factQuantity);
					//重量
					$("#weight").val(response.factWeight);
					//体积
					$("#volume").val(response.size);
					//类型
					$("#type").val(response.product);
					//到达地
					$("#arrivalCity").val(response.whither);
					//入库人
					$("#warehouses").val(response.userName);
					//入库时间
					$("#laidUpTime").val(response.comeGoodsTime);
				}
			 });
		});
		
		// 添加按钮
		$("#addBookDataButton").click(function() {
			//盘点主表Id
			var trayWarehouseId = "";
			for(var i=0;i<$("#checkNo").children().length;i++){
				if($("#checkNo").children()[i].selected){
					trayWarehouseId = $($("#checkNo").children()[i]).attr("id");
				}
			}
			
			//入库交接单号子表Id
			var storageConnectSonId = "";
			for(var i=0;i<$("#storageConnectNumSon").children().length;i++){
				if($("#storageConnectNumSon").children()[i].selected){
					storageConnectSonId = $($("#storageConnectNumSon").children()[i]).attr("id");
				}
			}
			//单号
			var storageConnectNumSon = $("#storageConnectNumSon").val();
			//工作单号
			var jobListNo = $("#jobListNo").val();
			//合包号
			var sourcingNo = $("#sourcingNo").val();
			//件数
			var numberPackages = $("#numberPackages").val();
			//体积
			var volume = $("#volume").val();
			//重量
			var weight = $("#weight").val();
			//类型
			var type = $("#type").val();
			//到达地
			var arrivalCity = $("#arrivalCity").val();
			//入库人
			var warehouses = $("#warehouses").val();
			//入库时间
			var laidUpTime = $("#laidUpTime").val();
			$.ajax({
				url:"/noob/warehouse/addTrayWorkU.action",
				type:"post",
				data:{
					trayWarehouseId : trayWarehouseId,
					storageConnectSonId : storageConnectSonId,
					storageConnectNumSon : storageConnectNumSon,
					jobListNo : jobListNo,
					sourcingNo : sourcingNo,
					numberPackages : numberPackages,
					volume : volume,
					weight : weight,
					type : type,
					arrivalCity : arrivalCity,
					warehouses : warehouses,
					laidUpTimes : laidUpTime,
					},
				success:function(result){
					if(result == "info"){
						toastr.info("已有该盘库明细数据!");
					}else if(result == "success"){
						toastr.success("添加成功!");
					}else{
						toastr.error("添加失败");
					}	
					$('#tb_bookData').bootstrapTable("refresh", {
						url : '/noob/warehouse/trayWorkPageQuery.action'
					});
					$('#tb_detailData').bootstrapTable("refresh", {
						url : '/noob/warehouse/trayWorkPageQuery.action'
					});
				}
			 });
			 $("#addBookData").modal('hide');
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
//新增明细单的清除方法
function cleanSelect() {
	$("#checkNo").children("option").remove();
	$("#storageConnectNumSon").children("option").remove();
	$("#jobListNo").val("");
	$("#sourcingNo").val("");
	$("#weight").val("");
	$("#volume").val("");
	$("#type").val("");
	$("#arrivalCity").val("");
	$("#warehouses").val("");
	$("#laidUpTime").val("");
	$("#numberPackages").val("");
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


//清除提示
function cancelPrompt(obj) {
	$("#"+obj.id + "_prompt").text("");
};

function cancelPrompts() {
	$(".prompt").text("");
};
