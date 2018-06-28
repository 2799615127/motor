function consult(){
	$("#consult_businessNo").select2();
	$("#consult_jobListNo").select2();
	
	cleanText();
	// 电话
	$("#consult_tele").val("");
	// 电话文本框失去焦点事件
	$("#consult_tele").blur(function(){
		cleanText();
		$.ajax({
			url:"/noob/consult/findCusByTelephoneQuery.action",
			type:"post",
			data:{telephone : $("#consult_tele").val()},
			success:function(response){
				// 日期
				$("#consult_date").val(formatNewDate(new Date()));
				if($("#consult_tele").val() == '' || $("#customerTelephone").val()==null){
					toastr.warning("请输入来电号码!");
				}else if(response == '' || response == null){
					$("#consult_yes").removeAttr("checked");;
					$("#consult_no").attr("checked",true);
					toastr.warning("该客户不存在,请填入信息!");
				}else{
					$("#consult_yes").attr("checked",true);
					//客户编号
					$("#consult_CNo").val(response.customerNo);
					//客户名
					$("#consult_CName").val(response.customerName);
					//联系人
					$("#consult_contacts").val(response.contacts);
					//取件地址
					$("#consult_address").val(response.fetchAddress);
					// 手机
					$("#consult_cell").val($("#consult_tele").val());
				}
			}
		});
	});
	
	$("#btn_consult").click(function(){
		//客户名称
		var customerName = $("#consult_CName").val();
		//联系人
		var contacts = $("#consult_contacts").val();
		//电话
		var telephone = $("#consult_tele").val();
		//手机
		var contactPhone = $("#consult_cell").val();
		//联系地址
		var contactAddress = $("#consult_address").val();
		//咨询内容
		var consultContent = $("#consult_content").val();
		//咨询结果
		var consultFruit = $("#consult_result").val();
		//是否合作过
		var cooperate = null;
		$("input[name=cooperate]").each(function(){
			if($(this).attr('checked') == 'checked'){
				if($(this).attr('id')=='consult_yes'){
					cooperate = 1;
				}else if($(this).attr('id')=='consult_no'){
					cooperate = 0;
				}
			}
		});
		if(customerName == null || customerName == "" ||
		   contacts == null || contacts == "" ||
		   telephone == null || telephone == "" ||
		   contactPhone == null || contactPhone == "" ||
		   contactAddress == null || contactAddress == "" ||
		   consultContent == null || consultContent == "" ||
		   consultFruit == null || consultFruit == "" ){
		   toastr.warning("输入的信息不能为空!");
		}else{
			$.ajax({
				url:'/noob/consult/addConsuleU.action',
				type:'GET',
				data:{customerName:customerName,
					customerNo:$("#consult_CNo").val(),
					contacts: contacts,
					telephone:telephone,
					contactPhone:contactPhone,
					contactAddress:contactAddress,
					consultType:$("#consult_type").val(),
					businessRecsiptNo:$("#consult_businessNo").val(),
					staffUnit:$("#consult_org").val(),
					recsiptTimes:$("#consult_time").val(),
					workOrderNo:$("#consult_jobListNo").val(),
					initialUnit:$("#consult_businsessOrg").val(),
					settlingAccounts:$("#consult_moneyType").val(),
					cooperate:cooperate,
					consultWay:$("#consult_way").val(),
					intention:$("#consult_intention").val(),
					consultTimes:$("#consult_date").val(),
					consultContent:consultContent,
					consultFruit:consultFruit,
					operationName:$("#userName").val(),
					operationOrgName:$("#orgName").val()
					},
					success:function(){
						cleanText();
					}
			});
		}	
	});
	
	$("#consult_type").bind("change",function(){
		if($(this).val() == "查货咨询"){
			findJobListNo();
		}else{
			$("#consult_businessNo").select2();
			$("#consult_businessNo").text('');
			$("#consult_jobListNo").select2();
			$("#consult_jobListNo").text('');
		}
	})
	
	if($("#consult_type").val() == "查货咨询"){
		findJobListNo();
	}else{
		$("#consult_businessNo").select2();
		$("#consult_businessNo").text('');
		$("#consult_jobListNo").select2();
		$("#consult_jobListNo").text('');
	}
	
	// 选择业务通知单
	$("#consult_businessNo").bind("change",function(){
		$.ajax({
			url:"/noob/consult/findBusinessMsgByNoQuery.action",
			type:"GET",
			data:{businessNo:$("#consult_businessNo").val()},
			success:function(response){
				$("#consult_time").val(formatNewDate(response.operationTime));
				$("#consult_org").val(response.takeOrgName);
			}
		});
	})
	
	// 选择工单号
	$("#consult_jobListNo").bind("change",function(){
		$.ajax({
			url:"/noob/consult/findJobListMsgByNoQuery.action",
			type:"GET",
			data:{jobListNo:$("#consult_jobListNo").val()},
			success:function(response){
				$("#consult_businsessOrg").val(response.settlingAccounts);
				$("#consult_moneyType").val(response.billingOperationUnit);
			}
		});
	})
	
}


function cleanText(){
	//客户编号
	$("#consult_CNo").val("");
	//客户名
	$("#consult_CName").val("");
	//联系人
	$("#consult_contacts").val("");
	//取件地址
	$("#consult_address").val("");
	//手机
	$("#consult_cell").val("");
	//取货单位
	$("#consult_org").val("");
	//受理时间
	$("#consult_time").val("");
	//初始受理单位
	$("#consult_businsessOrg").val("");
	//结算方式
	$("#consult_moneyType").val("");
	// 清除选中
	$("#consult_no").removeAttr("checked");
	$("#consult_yes").removeAttr("checked");
	//咨询日期
	$("#consult_date").val("");
	//咨询内容
	$("#consult_content").val("");
	//咨询结果
	$("#consult_result").val("");
	
	
		$("#consult_businessNo").select2("val","");
		
		$("#consult_jobListNo").select2("val","");
		
	
}


function findJobListNo(){
	$("#consult_jobListNo").select2({
		ajax: {
			language: "zh-CN", //设置 提示语言
		    url: "/noob/consult/findjobListNo.action",
		    data: function (params) {
		        var query = {
		          cuNo:$("#consult_CNo").val(),
		          jobListNo : params.term,
		        }
		        return query;
		      },
		   
		      processResults: function (data) {
		          return {
		            results: data
		          };
		        },
		        cache: true
		  },
		  
		  placeholder: '工作单号',
		  escapeMarkup: function (markup) { return markup; }, // let our custom formatter work
		  minimumInputLength: 0,
		  templateResult: function formatRepo(repo){
		  	  return repo.text;  
		  }, 
		  templateSelection:function formatRepoSelection(repo){
			  return repo.text;
		  }
	});
	
	$("#consult_businessNo").select2({
		ajax: {
			language: "zh-CN", //设置 提示语言
		    url: "/noob/consult/findBusinessNo.action",
		    data: function (params) {
		        var query = {
		          cuNo:$("#consult_CNo").val(),
		          businessNo : params.term,
		        }
		        return query;
		      },
		   
		      processResults: function (data) {
		          return {
		            results: data
		          };
		        },
		        cache: true
		  },
		  
		  placeholder: '业务单号',
		  escapeMarkup: function (markup) { return markup; }, // let our custom formatter work
		  minimumInputLength: 0,
		  templateResult: function formatRepo(repo){
		  	  return repo.text;  
		  }, 
		  templateSelection:function formatRepoSelection(repo){
			  return repo.text;
		  }
	});
}
//------------------------------------------

//校验客户名称
function checkConsultCName(obj){
	//校验是否为空
	if (obj.value.length == 0) {
		$("#"+obj.id + "_prompt").text("客户名称不能为空!");
		$("#btn_consult").attr("disabled",true);
	}else{
		$("#btn_consult").attr("disabled",false);
	};
}
//校验联系人
function checkConsultCntacts(obj){
	//校验是否为空
	if (obj.value.length == 0) {
		$("#"+obj.id + "_prompt").text("联系人不能为空!");
		$("#btn_consult").attr("disabled",true);
	}else{
		$("#btn_consult").attr("disabled",false);
	};
}

//校验来电号码
function checkConsultTele(obj){
	//格式是否合法
	var telephoneReg = /^1(3|4|5|7|8)\d{9}$/;
	
	//校验是否为空
	if (obj.value.length == 0) {
		$("#"+obj.id + "_prompt").text("电话不能为空!");
		$("#btn_consult").attr("disabled",true);
	}else if (!telephoneReg.test(obj.value)) {
		//获得姓名框后的提示框对象
		$("#"+obj.id + "_prompt").text("电话格式不正确!");
		$("#btn_consult").attr("disabled",true);
	}else{
		$("#btn_consult").attr("disabled",false);
	};
}

//校验手机
function checkConsultCell(obj){
	//格式是否合法
	var telephoneReg = /^1(3|4|5|7|8)\d{9}$/;
	
	//校验是否为空
	if (obj.value.length == 0) {
		$("#"+obj.id + "_prompt").text("手机不能为空!");
		$("#btn_consult").attr("disabled",true);
	}else if (!telephoneReg.test(obj.value)) {
		//获得姓名框后的提示框对象
		$("#"+obj.id + "_prompt").text("手机格式不正确!");
		$("#btn_consult").attr("disabled",true);
	}else{
		$("#btn_consult").attr("disabled",false);
	};
}

//校验联系地址
function checkConsultAddress(obj){
	//校验是否为空
	if (obj.value.length == 0) {
		$("#"+obj.id + "_prompt").text("联系地址不能为空!");
		$("#btn_consult").attr("disabled",true);
	}else{
		$("#btn_consult").attr("disabled",false);
	};
}

//校验咨询内容
function checkConsultContent(obj){
	//校验是否为空
	if (obj.value.length == 0) {
		$("#"+obj.id + "_prompt").text("咨询内容不能为空!");
		$("#btn_consult").attr("disabled",true);
	}else{
		$("#btn_consult").attr("disabled",false);
	};
}

//校验咨询结果
function checkConsultResult(obj){
	//校验是否为空
	if (obj.value.length == 0) {
		$("#"+obj.id + "_prompt").text("咨询结果不能为空!");
		$("#btn_consult").attr("disabled",true);
	}else{
		$("#btn_consult").attr("disabled",false);
	};
}

//清除提示
function cancelPrompt(obj) {
	$("#"+obj.id + "_prompt").text("");
};
//清除提示
function cancelPrompts() {
	$(".prompt").text("");
};
