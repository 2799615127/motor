$(function() {
	var TableInit = function() {
		var oTableInit = new Object();

		// 初始化Table
		oTableInit.Init = function() {
			$('#tb_departments').bootstrapTable({
				url : '../../../RecePageQquery.action', // 请求后台的URL（*）
				method : 'get', // 请求方式（*）
				toolbar : '#toolbar', // 工具按钮用哪个容器
				striped : true, // 是否显示行间隔色
				cache : false, // 是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
				editable:true,//开启编辑模式 
				pagination : true, // 是否显示分页（*）
				sortable : false, // 是否启用排序
				sortOrder : "asc", // 排序方式
				sidePagination : "server", // 分页方式：client客户端分页，server服务端分页（*）
				pageNumber : 1, // 初始化加载第一页，默认第一页
				pageSize : 10, // 每页的记录行数（*）
				pageList : [ 10, 25, 50, 100 ], // 可供选择的每页的行数（*）
				search : true, // 是否显示表格搜索，此搜索是客户端搜索，不会进服务端，所以，个人感觉意义不大
				strictSearch : true,
				showColumns : true, // 是否显示所有的列
				showRefresh : true, // 是否显示刷新按钮
				minimumCountColumns : 2, // 最少允许的列数
				clickToSelect : true, // 是否启用点击选中行
				height : 500, // 行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
				uniqueId : "standardId", // 每一行的唯一标识，一般为主键列
				showToggle : true, // 是否显示详细视图和列表视图的切换按钮
				cardView : false, // 是否显示详细视图
				detailView : false, // 是否显示父子表
		
				columns : [ {
					checkbox : true
				}/*, {
					field : 'standardId',
					title : '标准ID'
				}*/, {
					field : 'workNum',
					
					title : '工作单号'
				}, {
					field : 'arriveCity',
					title : '到达地',
					 formatter:function(value,row,index){  
                         var strHtml ='<a class="editable editable-click">'+ value +'</a>';  
                         return strHtml;  
                     }

				}, {
					field : 'product',
					title : '产品',
					formatter:function(value,row,index){  
                        var strHtml ='<a class="editable editable-click">'+ value +'</a>';  
                        return strHtml;  
                    }
				}, {
					field : 'number',
					title : '件数',
					formatter:function(value,row,index){  
                        var strHtml ='<a class="editable editable-click">'+ value +'</a>';  
                        return strHtml;  
                    }
				}, {
					field : 'weight',
					title : '重量',
					formatter:function(value,row,index){  
                        var strHtml ='<a class="editable editable-click">'+ value +'</a>';  
                        return strHtml;  
                    }

				}, {
					field : 'stowagePlan',
					title : '配载要求',
					formatter:function(value,row,index){  
                        var strHtml ='<a class="editable editable-click">'+ value +'</a>';  
                        return strHtml;  
                    }
				

				} ],
				onLoadSuccess: function(data){  //加载成功时执行
			          alert("加载成功"+data);
			    },
			    onLoadError: function(){  //加载失败时执行
			    	alert(2);
			    	$('#tb_departments').bootstrapTable('insertRow', { index:0, row:null });
			    	alert(2);
			    }
			
			});
		};

		return oTableInit;
	};

	var ButtonInit = function() {
		var oInit = new Object();
		var postdata = {};
		oInit.Init = function() {
			/* 当点击增加模态框时 */
			$("#btn_add").click(function() {

				$("#maxWeight").val("");
				$("#minWeight").val("");
				$('#isnullMsg').css("display", "none");
				$('#cuntMsg').css("display", "none");
				$('#sizeMsg').css("display", "none");
				$("#addModel").modal("show");
			});

			/* 当点击修改模态框 */
			$("#btn_edit").click(
					function() {
						$('#updaMag').css("display", "none");
						$('#bigMag').css("display", "none");
						$('#errorMsg').css("display", "none");
						var select = $('#tb_departments').bootstrapTable(
								'getSelections');
						var cancelSign = []; 
						var standardId =[];
						for (var i = 0; i < select.length; i++) {
							standardId[i] = select[i]['standardId'];
							cancelSign[i] = select[i]['cancelSign'];
						}
						
						
						if (select.length === 0) {
							toastr.warning('请选择一行进行修改!');
						} else if (select.length > 1) {
							toastr.warning('一次只能修改一行!');
						}else if(cancelSign[0]=='1'){
							toastr.warning('请选择正确的行!');
						} else {

							$("#updateModel").modal("show");
							$("#max").val(select[0]['maxWeight'])
							$("#min").val(select[0]['minWeight'])
						}

					});
			/**
			 * 点击修改模态框中的提交按钮时
			 */
			$("#upd")
					.click(function() {
						
								// 获取单行数据
								var select = $('#tb_departments')
										.bootstrapTable('getSelections');

								var standardId = [];
								var maxWeight = [];
								var minWeight = [];
								
								// 获取单行数据
								for (var i = 0; i < select.length; i++) {
									standardId[i] = select[i]['standardId'];
									maxWeight[i] = select[i]['maxWeight'];
									minWeight[i] = select[i]['minWeight'];
								}
								// 判断是否修改了数据和数据是否为空的校验
								if ($("#max").val() == maxWeight[0]
										&& $("#min").val() == minWeight[0]
										|| $("#max").val() == ""
										|| $("#min").val() == "") {
									$('#updaMag').css("display", "block");
									//$("#updateModel").modal("show");
									// 判断填写的数据最大重量不能比最小重量小的校验
								} else if ($("#max").val() <= $("#min").val()) {
									$('#bigMag').css("display", "block");
									$('#updaMag').css("display", "none")
								} else if ($("#max").val()<=0|| $("#min").val()<=0) {
									$('#bigMag').css("display", "block");
									$('#updaMag').css("display", "none")
								} else {
									$.ajax({
												url : '../../../receAndNameQuery.action',
												type : "GET",
												async : false,
												data : {
													standardName : $('#min').val()
															+ "~"
															+ $('#max')
																	.val()
															+ "公斤"
												},
												success : function(result) {
													if (result == "success") {
														var nameStand =$('#min').val()+ "~"+ $('#max').val()+ "公斤";
														
														$.ajax({
																	type : "GET",
																	url : '../../../update.action',
																	async : false,
																	data : {
																		newMaxWeight : $("#max").val(),
																		newMinWeight : $("#min").val(),
																		newStandardName : nameStand,
																		standardId : standardId[0]
																	},
																	success : function(
																			result) {
																		if (result == "success") {
																			toastr
																					.success('修改成功!');
																		} else {
																			toastr
																					.error('修改失败!');
																		}
																		$('#tb_departments').bootstrapTable('refresh',{
																			url : '../../../RecePageQquery.action'
													  					});
																						
																		$("#updateModel").modal(
																						"hide");
																	}

																});
													} else {
														$('#cuntMsg').css(
																"display",
																"block");
													}
												}
											})
								}

							});
			// 当点击作废按钮时
			$("#btn_delete")
					.click(function() {
								var select = $('#tb_departments')
										.bootstrapTable('getSelections');
								var cancelSign = []; 
								var standardId =[];
								for (var i = 0; i < select.length; i++) {
									standardId[i] = select[i]['standardId'];
									cancelSign[i] = select[i]['cancelSign'];
								}
								// 进行判断用户是否勾选了标准数据
								if (select.length === 0) {
									toastr.warning('请至少选择一行进行作废!');
								}else if(cancelSign[0]=='1'){
									toastr.warning('请选择正确的行!');
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
											},function() {

												var arrs = [];
												for (var i = 0; i < select.length; i++) {
													arrs[i] = select[i]['standardId'];
												}

												$.ajax({
															type : "GET",
															url : '../../../deleteReceU.action',
															data : {
																standardIds : arrs
															},
															success : function(
																	result) {
																if (result === "success") {
																	toastr
																			.success('作废成功!');
																} else {
																	toastr
																			.error('作废失败!');
																}
																$('#tb_departments').bootstrapTable('refresh',{
																					url : '../../../RecePageQquery.action'
															  					});
															}
														 });
											});

								  }

							});
             //当点击还原按钮时
			$("#btn_recover").click(function() {
						
								var select = $('#tb_departments')
										.bootstrapTable('getSelections');
								if (select.length == 0) {
									toastr.warning('请至少选择一行进行还原!');
								} else {
									swal(
											{
												title : "操作提示", // 弹出框的title
												text : "确定还原吗？", // 弹出框里面的提示文本
												type : "warning", // 弹出框类型
												showCancelButton : true, // 是否显示取消按钮
												confirmButtonColor : "#DD6B55",// 确定按钮颜色
												cancelButtonText : "取消",// 取消按钮文本
												confirmButtonText : "是的，确定还原！",// 确定按钮上面的文档
												closeOnConfirm : true
											},
											function() {
												var arrts = [];
												for (var i = 0; i < select.length; i++) {
													arrts[i] = select[i]['standardId'];
												}
												$.ajax({
															type : "GET",
															url : '../../../updateReceAndSignU.action',
															data : {
																standardIds : arrts
															},
															success : function(
																	result) {
																if (result == 'success') {
																	toastr
																			.success("还原成功");
																} else {
																	toastr
																			.error("还原失败");
																}
																$('#tb_departments')
																		.bootstrapTable(
																				'refresh',
																				{
																					url : '../../../RecePageQquery.action'
																				});
															}

													})
											}

									)
								}
							})

		};
		return oInit;
	};

	$(function() {
		// 1.初始化Table
		var oTable = new TableInit();
		oTable.Init();
		// 2.初始化Button的点击事件
		var oButtonInit = new ButtonInit();
		oButtonInit.Init();
	
		// 提示框
		toastr.options.positionClass = 'toast-top-center';
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
		// 清空时间框的数据
		$("#startTime").click(function() {
			if ($("#startTime").val() != '') {
				$("#startTime").val('');
			}
		})
		$("#endTime").click(function() {
			if ($("#endTime").val() != '') {
			}
			$("#endTime").val('');
		})

		// 点击添加模态框中的提交按钮进行添加
		$("#sub")
				.click(
						function() {
							$('#isnullMsg').css("display", "none");
							$('#errorMsg').css("display", "none");
							$('#sizeMsg').css("display", "none");
							// 进行为空校验和最小重量数据不能比最大重量数据大
							if ($('#maxWeight').val() == ""
									|| $('#minWeight').val() == "") {
								$('#isnullMsg').css("display", "block");
							} else if ($('#maxWeight').val() <= $('#minWeight')
									.val()) {
								$('#sizeMsg').css("display", "block");
							} else if ($('#maxWeight').val() <=0|| $('#minWeight')
									.val()<=0) {
								$('#sizeMsg').css("display", "block");
							} else {

								$.ajax({
											url : '../../../receAndNameQuery.action',
											type : "GET",
											async : false,
											data : {
												standardName : $('#minWeight')
														.val()
														+ "~"
														+ $('#maxWeight').val()
														+ "公斤"
											},
											success : function(result) {

												if (result == "success") {
													var obj = {
														maxWeight : $(
																'#maxWeight')
																.val(),
														minWeight : $(
																'#minWeight')
																.val(),
														standardName : $('#minWeight')
																.val()
																+ "~"
																+ $('#maxWeight').val()
																+ "公斤",
														username :$(
																'#username')
																.val(),
														userId : $("#userId")
																.val()
													};
													// 异步同步数据库
													$.ajax({
																type : "GET",
																url : '../../../addRece.action',
																data : obj,
																success : function(
																		result) {
																	if (result === "success") {
																		toastr
																				.success('添加成功!');
																	} else {
																		toastr
																				.error('添加失败!');
																	}
																	$(
																			'#tb_departments')
																			.bootstrapTable(
																					'refresh',
																					{
																						url : '../../../RecePageQquery.action'
																					});
																	$("#addModel").modal("hide");
																}
															});
												} else {
													$('#errorMsg').css(
															"display", "block");

												}
											}
										})

							}

						});

	});

	function cancel() {
		$('body').css('overflow', 'auto');
		$('body').css('padding-right', '0px');
		$('.model').addClass('hide');
		$('.model-dialog').addClass('hide');
	}

	
	// 设置选择时间框
	$(".form_datetime").datetimepicker({
		format : "yyyy-mm-dd  ",
		autoclose : true,
		todayBtn : true,
		language : 'zh-CN',
		pickerPosition : "bottom-right",
		minView : 2,
		startDate : '1999-06-06',
		endDate : new Date(),
		maxDate : new Date()

	});

	// 搜索按钮点击
	$("#btn_query").click(function() {
		var obj = {
			url : '../../../RecePageQquery.action',
			cilent : true,
			query : {

				maxWeight : $("#txt_search_maxWeight").val(),
				minWeight : $("#txt_search_minWeight").val(),
				username : $("#txt_search_statu").val(),
				startTime : $("#startTime").val(),
				endTime : $("#endTime").val()
			}
		};
		// 刷新表格
		$('#tb_departments').bootstrapTable('refresh');

	});

})