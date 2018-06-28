var TableInitRecsipt = function() {
	var oTableInitRecsipt = new Object();
	// 初始化订单属性Table
	oTableInitRecsipt.Init = function() {
		$('#tb_recsiptConsults').bootstrapTable({
			url : '/noob/consult/recsiptConsultU.action', // 请求后台的URL（*）
			method : 'get', // 请求方式（*）
			toolbar : '#toolbar_recsiptConsult', // 工具按钮用哪个容器
			striped : true, // 是否显示行间隔色
			cache : false, // 是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
			pagination : true, // 是否显示分页（*）
			sortable : false, // 是否启用排序
			sortOrder : "asc", // 排序方式
			queryParams : oTableInitRecsipt.queryParams,// 传递参数（*）
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
			uniqueId : "", // 每一行的唯一标识，一般为主键列
			showToggle : true, // 是否显示详细视图和列表视图的切换按钮
			cardView : false, // 是否显示详细视图
			detailView : false, // 是否显示父子表
			columns : [ {
				checkbox : true
			}, {
				field : 'consultContent',
				title : '咨询内容'
			}, {
				field : 'consultFruit',
				title : '咨询结果'
			}, {
				field : 'operationStaffName',
				title : '受理人'
			}, {
				field : 'consultTime',
				title : '咨询时间',
				formatter:function(value){
					return formatDate(value);
				},
				
			} ]
		});
	};
	
	
	// 初始化工单咨询Table
	// 得到查询的参数
	oTableInitRecsipt.queryParams = function(params) {
		var temp = {
			// 这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
			pageSize : params.limit,
			start : params.offset,
		};
		return temp;
	};

	return oTableInitRecsipt;
};

var ButtonInitRecsipt = function() {
	var oInits = new Object();
	var postdatas = {};
	oInits.Init = function() {
		// 初始化页面上面的按钮事件
		//新单 
		$("#btn_newOrder").click(function() {
			/*
			 * 判断该客户是新客户还是老客户
			 * 新客户往客户表,业务通知单表,工单表中插入数据
			 * 老客户修改客户表,往业务通知单表,工单表中插入数据
			 */
			var customerD = $("#judgeCustomer").attr("name");
			
			//获取各个文本框中的数据
			//来电号码
			var customerTelephone = $("#customerTelephone").val();
			//客户名
			var customerName = $("#customerName").val();
			//客户编号
			var customerNo = $("#customerNo").val();
			//寄件城市
			var sendingCity = $("#sendingCity").val();
			//分拣编码
			var sortingCode = $("#sortingCode").val();
			//联系人
			var contacts = $("#contacts").val();
			//预约取件时间
			var appointmentDispatchTime = $("#appointmentDispatchTime").val();
			//取件地址
			var fetchAddress = $("#fetchAddress").val();
			//收件人
			var addressee = $("#addressee").val();
			//联系电话
			var telephone = $("#telephone").val();
			//品名
			var productName = $("#productName").val();
			//件数
			var numberPackages = $("#numberPackages").val();
			//重量
			var weight = $("#weight").val();
			//体积
			var volume = $("#volume").val();
			//省
			var province = $("#txt_add_province").val();
			//市
			var city = $("#txt_add_city").val();
			//县
			var district = $("#txt_add_district").val();
			//详细地址
			var detailedAddress = $("#detailedAddress").val();
			//类型Id
			var subsetId = "";
			for(var i=0;i<$("#product").children().length;i++){
				if($("#product").children()[i].selected){
					subsetId = $($("#product").children()[i]).attr("id");
				}
			}
			//到达城市
			var arrivalCity = $("#arrivalCity").val();
			//收件地址
			var serveCity = $("#serveCity").val();
			//备注
			var remarks = $("#remarks").val();
			//常用备注
			var commonRemarks = $("#commonRemarks").val();
			
			//判断是否输入来电号码,输入判断是新老客户,然后再判断各文本中的值是否为空
			if(customerTelephone == "" || customerTelephone == null ||
			   customerName == "" || customerName == null ||
			   contacts == "" || contacts == null ||
			   appointmentDispatchTime == "" || appointmentDispatchTime == null ||
			   fetchAddress == "" || fetchAddress == null ||
			   addressee == "" || addressee == null ||
			   telephone == "" || telephone == null ||
			   productName == "" || productName == null ||
			   numberPackages == "" || numberPackages == null ||
			   weight == "" || weight == null ||
			   volume == "" || volume == null ||
			   serveCity == "" || serveCity == null ||
			   remarks == "" || remarks == null ||
			   commonRemarks == "" || commonRemarks == null){
				toastr.warning("输入的信息不能为空!");
			}else{
			//是新客还是老客户
			if(customerD == 'old'){
				$.ajax({
					url:"/noob/business/oldCustomerUpdateCAddBW.action",
					type:"post",
					data:{
						customerName : customerName, //客户名
						customerNo : customerNo, //客户编号
						contacts : contacts, //联系人
						customerTelephone : customerTelephone, //客户电话
						fetchAddress : fetchAddress, //取件地址
						sendingCity : sendingCity,//寄件城市
						sortingCode : sortingCode,//分拣编码
						appointmentDispatchTimes : appointmentDispatchTime, //预约取件时间
						addressee : addressee, //收件人
						telephone : telephone, //联系电话
						productName : productName, //品名
						numberPackages : numberPackages, //件数
						weight : weight, //重量
						volume : volume, //体积
						product : subsetId, //产品时限
						arrivalCity : arrivalCity, //到达城市
						serveCity : serveCity, //收件地址
						remarks : remarks, //备注
						commonRemarks : commonRemarks,//常用备注
						operationStaffName : $("#userName").val(),//操作人
						operationOrg :  $("#orgName").val(),//操作人单位
						province : province,//省
						city : city,//市
						district : district,//县
						detailedAddress : detailedAddress,//详细地址
						},
						success:function(result){
							if(result == "success"){
								toastr.success("自动下单成功!");
								cleanNewOrder();
							}else{
								if(sortingCode == null || sortingCode == "" ){
									toastr.info("未匹配到正确分拣编码,转人工调度!");
									cleanNewOrder();
								}else{
									toastr.info("未找到合适的取派员,转人工调度!");
									cleanNewOrder();
								}
							}
						}
					});
			}else if(customerD == 'new'){
				$.ajax({
					url:"/noob/business/newCustomerAddCBW.action",
					type:"post",
					data:{
						customerName : customerName, //客户名
						contacts : contacts, //联系人
						customerTelephone : customerTelephone, //联系电话
						fetchAddress : fetchAddress, //取件地址
						sendingCity : sendingCity,//寄件城市
						sortingCode : sortingCode,//分拣编码
						appointmentDispatchTimes : appointmentDispatchTime, //预约取件时间
						addressee : addressee, //收件人
						telephone : telephone, //联系电话
						productName : productName, //品名
						numberPackages : numberPackages, //件数
						weight : weight, //重量
						volume : volume, //体积
						product : subsetId, //产品时限
						arrivalCity : arrivalCity, //到达城市
						serveCity : serveCity, //收件地址
						remarks : remarks, //备注
						commonRemarks : commonRemarks,//常用备注
						operationStaffName : $("#userName").val(),//操作人
						operationOrg :  $("#orgName").val(),//操作人单位
						province : province,//省
						city : city,//市
						district : district,//县
						detailedAddress : detailedAddress,//详细地址
						},
					success:function(result){
						if(result == "success"){
							toastr.success("自动下单成功!");
							cleanNewOrder();
						}else{
							if(sortingCode == null || sortingCode == ""){
								toastr.info("未匹配到正确分拣编码,转人工调度!");
								cleanNewOrder();
							}else{
								toastr.info("未找到合适的取派员,转人工调度!");
								cleanNewOrder();
							}
						}
					}
					
				});
			}
			// 业务单号table刷新
			$('#tb_business').bootstrapTable('refresh');
			// 订单属性table刷新
			$('#tb_orderAttributes').bootstrapTable('refresh');
		  }
		});
		
		// 修改按钮
		$("#btn_edit").click(function() {
			
		});
		
		//详细地址的失焦事件
		$("#detailedAddress").blur(function(){
			//省
			var province = $("#txt_add_province").val();
			//市
			var city = $("#txt_add_city").val();
			//县
			var district = $("#txt_add_district").val();
			//详细地址
			var detailedAddress = $("#detailedAddress").val();
			//取件地址
			var fetchAddress =  province+" "+city+" "+district+" "+detailedAddress;
			
			if(province == "" || province == null ||
			   city == "" || city == null ||
			   district == "" || district == null ||
			   detailedAddress == "" || detailedAddress == null){
			   toastr.warning("请依次输入省市县详细地址!");
			   $("#fetchAddress").val("");
			   $("#sendingCity").val("");
			   $("#sortingCode").val("");
			}else{
			   $("#fetchAddress").val(fetchAddress);
			   $("#sendingCity").val(city);
			   $.ajax({
					url:"/noob/business/findSendingCityAndSortingCodeByAddress.action",
					type:"post",
					data:{
						province : province,
						city : city,
						district : district,
						detailedAddress : detailedAddress,
						},
					success:function(response){
						$("#sortingCode").val(response.sortingCode);
					}
				});
			}
		});
		
		//收件地址详细地址的失焦事件
		$("#serveCityDetailedAddress").blur(function(){
			//省
			var province = $("#txt_serveCity_province").val();
			//市
			var city = $("#txt_serveCity_city").val();
			//县
			var district = $("#txt_serveCity_district").val();
			//详细地址
			var serveCityDetailedAddress = $("#serveCityDetailedAddress").val();
			//取件地址
			var serveCity =  province+" "+city+" "+district+" "+serveCityDetailedAddress;
			
			if(province == "" || province == null ||
			   city == "" || city == null ||
			   district == "" || district == null ||
			   serveCityDetailedAddress == "" || serveCityDetailedAddress == null){
			   toastr.warning("请依次输入省市县详细地址!");
			   $("#serveCity").val("");
			   $("#arrivalCity").val("");
			}else{
			   $("#serveCity").val(serveCity);
			   $("#arrivalCity").val(city);
			}
		});
		
		
		//来电号码的失焦事件
		$("#customerTelephone").blur(function(){
			$.ajax({
				url:"/noob/business/findCustomerByTelephoneQuery.action",
				type:"post",
				data:{telephone : $("#customerTelephone").val()},
				success:function(response){
					if($("#customerTelephone").val() == '' || $("#customerTelephone").val()==null){
						cleanNumber();
						toastr.warning("请输入来电号码!");
					}else if(response == '' || response == null){
						cleanNumber();
						$("#judgeCustomer").attr("name","new");
						toastr.warning("该客户不存在,请填入信息!");
					}else{
						cleanAddress();
						$("#judgeCustomer").attr("name","old");
						//通知单号
						$("#businessRecsiptNo").val(response.binessNo);
						//客户编号
						$("#customerNo").val(response.customerNo);
						//客户名
						$("#customerName").val(response.customerName);
						//寄件城市
						$("#sendingCity").val(response.sendingCity);
						//分拣编码
						$("#sortingCode").val(response.sortingCode);
						//联系人
						$("#contacts").val(response.contacts);
						//预约取件时间
						$("#appointmentDispatchTime").val(response.appointmentDispatchTime);
						//取件地址
						$("#fetchAddress").val(response.fetchAddress);
						/*//省
						$("#txt_add_province").attr("placeholder",response.province);
						//$("#txt_add_province" ).selectpicker("refresh");
						//市
						$("#txt_add_city").val(response.city);
						//县
						$("#txt_add_district").val(response.district);
						//详细地址
						$("#detailedAddress").val(response.detailedAddress);*/
					}
				}
			});
		});
	};
	return oInits;
};

//获取各种下拉列表的数据
function getDataInsert(){
} 

//来电号码失焦的清除方法
function cleanNumber() {
	$("#customerNo").val("");
	$("#customerName").val("");
	$("#contacts").val("");
	$("#businessRecsiptNo").val("");
	$("#fetchAddress").val("");
	$("#appointmentDispatchTime").val("");
	$("#sendingCity").val("");
	$("#sortingCode").val("");
	$("#detailedAddress").val("");
	$("#txt_add_province").children("option").remove();
	$("#txt_add_city").children("option").remove();
	$("#txt_add_district").children("option").remove();
	$("#serveCityDetailedAddress").val("");
	$("#txt_serveCity_province").children("option").remove();
	$("#txt_serveCity_city").children("option").remove();
	$("#txt_serveCity_district").children("option").remove();
}
function cleanAddress() {
	$("#detailedAddress").val("");
	$("#txt_add_province").children("option").remove();
	$("#txt_add_city").children("option").remove();
	$("#txt_add_district").children("option").remove();
}
//新单的清除方法
function cleanNewOrder() {
	$("#customerTelephone").val("");
	$("#businessRecsiptNo").val("");
	$("#customerNo").val("");
	$("#customerName").val("");
	$("#sendingCity").val("");
	$("#sortingCode").val("");
	$("#contacts").val("");
	$("#appointmentDispatchTime").val("");
	$("#fetchAddress").val("");
	$("#addressee").val("");
	$("#telephone").val("");
	$("#numberPackages").val("");
	$("#weight").val("");
	$("#volume").val("");
	$("#productName").val("");
	$("#arrivalCity").val("");
	$("#serveCity").val("");
	$("#remarks").val("");
	$("#commonRemarks").val("");
	$("#detailedAddress").val("");
	$("#txt_add_province").children("option").remove();
	$("#txt_add_city").children("option").remove();
	$("#txt_add_district").children("option").remove();
	$("#serveCityDetailedAddress").val("");
	$("#txt_serveCity_province").children("option").remove();
	$("#txt_serveCity_city").children("option").remove();
	$("#txt_serveCity_district").children("option").remove();
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
//校验来电号码
function checkCustomerTelephone(obj){
	//格式是否合法
	var telephoneReg = /^1(3|4|5|7|8)\d{9}$/;
	
	//校验是否为空
	if (obj.value.length == 0) {
		$("#"+obj.id + "_prompt").text("号码不能为空!");
		$("#btn_newOrder").prop('disabled', true);
	}else if (!telephoneReg.test(obj.value)) {
		//获得姓名框后的提示框对象
		$("#"+obj.id + "_prompt").text("号码格式不正确!");
		$("#btn_newOrder").prop('disabled', true);
	}else{
		$("#btn_newOrder").prop('disabled', false);
	};
}

//校验客户名称
function checkCustomerName(obj){
	//校验是否为空
	if (obj.value.length == 0) {
		$("#"+obj.id + "_prompt").text("客户名不能为空!");
		$("#btn_newOrder").prop('disabled', true);
	}else{
		$("#btn_newOrder").prop('disabled', false);
	};
}

//校验联系人
function checkContacts(obj){
	//校验是否为空
	if (obj.value.length == 0) {
		$("#"+obj.id + "_prompt").text("联系人不能为空!");
		$("#btn_newOrder").prop('disabled', true);
	}else{
		$("#btn_newOrder").prop('disabled', false);
	};
}

//详细地址
function checkDetailedAddress(obj){
	//校验是否为空
	if (obj.value.length == 0) {
		$("#"+obj.id + "_prompt").text("详细地址不能为空!");
		$("#btn_newOrder").prop('disabled', true);
	}else{
		$("#btn_newOrder").prop('disabled', false);
	};
}

//校验取件地址
function checkFetchAddress(obj){
	//校验是否为空
	if (obj.value.length == 0) {
		$("#"+obj.id + "_prompt").text("取件地址不能为空!");
		$("#btn_newOrder").prop('disabled', true);
	}else{
		$("#btn_newOrder").prop('disabled', false);
	};
}

//校验收件人
function checkAddressee(obj){
	//校验是否为空
	if (obj.value.length == 0) {
		$("#"+obj.id + "_prompt").text("收件人不能为空!");
		$("#btn_newOrder").prop('disabled', true);
	}else{
		$("#btn_newOrder").prop('disabled', false);
	};
}

//校验联系电话
function checkTelephone(obj){
	//格式是否合法
	var telephoneReg = /^1(3|4|5|7|8)\d{9}$/;
	
	//校验是否为空
	if (obj.value.length == 0) {
		$("#"+obj.id + "_prompt").text("联系电话不能为空!");
		$("#btn_newOrder").prop('disabled', true);
	}else if (!telephoneReg.test(obj.value)) {
		//获得姓名框后的提示框对象
		$("#"+obj.id + "_prompt").text("联系电话格式不正确!");
		$("#btn_newOrder").prop('disabled', true);
	}else{
		$("#btn_newOrder").prop('disabled', false);
	};
}

//校验品名
function checkProductName(obj){
	//校验是否为空
	if (obj.value.length == 0) {
		$("#"+obj.id + "_prompt").text("收件人不能为空!");
		$("#btn_newOrder").prop('disabled', true);
	}else{
		$("#btn_newOrder").prop('disabled', false);
	};
}

//件数
function checkNumberPackages(obj){
	//格式是否合法
	var numberPackagesReg = /^[0-9]*$/;
	
	//校验是否为空
	if (obj.value.length == 0) {
		$("#"+obj.id + "_prompt").text("件数不能为空!");
		$("#btn_newOrder").prop('disabled', true);
	}else if (!numberPackagesReg.test(obj.value)) {
		//获得姓名框后的提示框对象
		$("#"+obj.id + "_prompt").text("件数只能为正整数!");
		$("#btn_newOrder").prop('disabled', true);
	}else{
		$("#btn_newOrder").prop('disabled', false);
	};
}

//校验重量
function checkWeight(obj){
	//格式是否合法
	var weightReg = /^([\+-]?\d+)(\.\d+)?$/;
	
	//校验是否为空
	if (obj.value.length == 0) {
		$("#"+obj.id + "_prompt").text("重量不能为空!");
		$("#btn_newOrder").prop('disabled', true);
	}else if (!weightReg.test(obj.value)) {
		//获得姓名框后的提示框对象
		$("#"+obj.id + "_prompt").text("重量只能为数字!");
		$("#btn_newOrder").prop('disabled', true);
	}else{
		$("#btn_newOrder").prop('disabled', false);
	};
}

//校验体积
function checkVolume(obj){
	//格式是否合法
	var volumeReg = /^([\+-]?\d+)(\.\d+)?$/;
	
	//校验是否为空
	if (obj.value.length == 0) {
		$("#"+obj.id + "_prompt").text("体积不能为空!");
		$("#btn_newOrder").prop('disabled', true);
	}else if (!volumeReg.test(obj.value)) {
		//获得姓名框后的提示框对象
		$("#"+obj.id + "_prompt").text("体积只能为数字!");
		$("#btn_newOrder").prop('disabled', true);
	}else{
		$("#btn_newOrder").prop('disabled', false);
	};
}

//校验详细地址
function checkServeCityDetailedAddress(obj){
	//校验是否为空
	if (obj.value.length == 0) {
		$("#"+obj.id + "_prompt").text("详细地址不能为空!");
		$("#btn_newOrder").prop('disabled', true);
	}else{
		$("#btn_newOrder").prop('disabled', false);
	};
}

//校验备注
function checkRemarks(obj){
	//校验是否为空
	if (obj.value.length == 0) {
		$("#"+obj.id + "_prompt").text("备注不能为空!");
		$("#btn_newOrder").prop('disabled', true);
	}else{
		$("#btn_newOrder").prop('disabled', false);
	};
}

//校验常用备注
function checkCommonRemarks(obj){
	//校验是否为空
	if (obj.value.length == 0) {
		$("#"+obj.id + "_prompt").text("常用备注不能为空!");
		$("#btn_newOrder").prop('disabled', true);
	}else{
		$("#btn_newOrder").prop('disabled', false);
	};
}

//清除提示
function cancelPrompt(obj) {
	$("#"+obj.id + "_prompt").text("");
};

function cancelPrompts() {
	$(".prompt").text("");
};
//添加新单校验
function validatorBusinessForm() {
	$('#businessForm').bootstrapValidator({
		message : 'This value is not valid',
		feedbackIcons : {
			valid : 'glyphicon glyphicon-ok',
			invalid : 'glyphicon glyphicon-remove',
			validating : 'glyphicon glyphicon-refresh'
		},
		fields : {
			//来电号码
			customerTelephone : {
				message : '来电号码不能为空!',
				validators : {
					notEmpty : {
						message : '来电号码不能为空!',
					},
					regexp : {
						regexp : /^1(3|4|5|7|8)\d{9}$/,
						message : '格式不正确!'
					}
				}
			},
			/*//客户名
			customerName : {
				validators : {
					notEmpty : {
						message : '客户名不能为空!',
					},
					regexp : {
						regexp : /^[\u4E00-\u9FA5]{2,4}$/,
						message : '客户名只能为中文例如:张三!'
					}
				}
			},
			//联系人
			contacts : {
				validators : {
					notEmpty : {
						message : '联系人不能为空!'
					},
					regexp : {
						regexp : /^[\u4E00-\u9FA5]{2,4}$/,
						message : '联系人只能为中文例如:张三!'
					}
				}
			},
			//预约取件时间
			appointmentDispatchTime : {
				validators : {
					notEmpty : {
						message : '预约取件时间不能为空!'
					}
				}
			},
			//取件地址
			fetchAddress : {
				validators : {
					notEmpty : {
						message : '取件地址不能为空!'
					}
				}
			},
			//收件人
			addressee : {
				validators : {
					notEmpty : {
						message : '收件人不能为空!'
					},
					regexp : {
						regexp : /^[\u4E00-\u9FA5]{2,4}$/,
						message : '收件人只能为中文例如:张三!'
					}
				}
			},
			//联系电话
			telephone : {
				validators : {
					notEmpty : {
						message : '联系不能为空!'
					},
					regexp : {
						regexp : /^1(3|4|5|7|8)\d{9}$/,
						message : '格式不正确!'
					}
				}
			},
			//品名
			productName : {
				validators : {
					notEmpty : {
						message : '品名不能为空!'
					},
				}
			},
			//件数
			numberPackages : {
				validators : {
					notEmpty : {
						message : '件数不能为空!'
					},
					regexp : {
						regexp : /^\d{n}$/,
						message : '只能为数字!'
					}
				}
			},
			//重量
			weight : {
				validators : {
					notEmpty : {
						message : '重量不能为空!'
					},
					regexp : {
						regexp : /^\d{n}$/,
						message : '只能为数字,单位: kg!'
					}
				}
			},
			//体积
			volume : {
				validators : {
					notEmpty : {
						message : '体积不能为空!'
					},
					regexp : {
						regexp : /^\d{n}$/,
						message : '只能为数字!'
					}
				}
			},
			//收件地址
			serveCity : {
				validators : {
					notEmpty : {
						message : '收件地址不能为空!'
					},
					regexp : {
						regexp : /^\d{n}$/,
						message : '只能为数字!'
					}
				}
			},
			//备注
			remarks : {
				validators : {
					notEmpty : {
						message : '备注不能为空!'
					}
				}
			},
			//常用备注
			commonRemarks : {
				validators : {
					notEmpty : {
						message : '常用不能为空!'
					}
				}
			},*/
		}
	});
};