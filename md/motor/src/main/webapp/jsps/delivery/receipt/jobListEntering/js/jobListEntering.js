var businessRecsiptNoIns = null;
$(function() {
	
	//初始化操作消息提示框
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
	
	
	var jobListIdH = $("#jobListIdIn").val();
	selectDictionary("产品","#productIn");
	selectDictionary("配载要求","#mannedRequireIn");
	selectDictionary("保险类型","#safeTypeIn");
	selectDictionary("包装类型","#originalPackageIn");
	selectDictionary("包装类型","#actualPackingIn");
	selectDictionary("结算方式","#methodOfSettlingAccountsIn");
	selectDictionary("处理方式","#processModeIn");
	selectDictionary("签单返回","#signBackIn");
	
	if(jobListIdH!="" && jobListIdH != undefined && jobListIdH != null && jobListIdH!="null"){
		
		$.ajax({
		url:"../../../../jobListFind/findJobListById.action",
		type:"post",
		data:{'jobListId':jobListIdH},
		success:function(data){
			$("#jobListCodeIn").val(data.jobListNo);
			$("#cuNoIn").val(data.cuNo);
			$("#cuNoIn").attr("readonly","readonly");
			
			selectBeSelected("#productIn",data.product);
			
			$("#whitherIn").val(data.whither);
			$("#businessRecsiptNoIn").append("<option>"+data.businessRecsiptNo+"</option>");
			$("#businessRecsiptNoIn").selectpicker('refresh');
			//selectBeSelected("#businessRecsiptNoIn",data.businessRecsiptNo);
			$("#getProductManNameIn").val(data.getProductManName);
			$("#getProductManNameH").val(data.postInfo.getProductManId);
			$("#getProductManNameH").attr("title",data.postInfo.unitOfAcquisition);
			selectBeSelected("#mannedRequireIn",data.mannedRequire);
			$("#factWeightIn").val(data.factWeight);
			$("#factQuantityIn").val(data.factQuantity);
			$("#bigLogisticsTypeIn").val(data.bigLogisticsType);
			$("#isInternationalIn").val(data.isInternational);
			$("#productNameIn").val(data.productName);
			
			$("#senderNoIn").val(data.postInfo.senderNo);
			$("#senderNoIn").attr("readonly","readonly");
			$("#senderIn").val(data.postInfo.sender);
			$("#senderAddressIn").val(data.postInfo.senderAddress);
			$("#senderUnitIn").val(data.postInfo.senderUnit);
			$("#senderPhoneIn").val(data.postInfo.senderPhone);
			$("#senderCellPhoneIn").val(data.postInfo.senderCellPhone);
			$("#addresseeIn").val(data.postInfo.addressee);
			$("#addresseeAddressIn").val(data.postInfo.addresseeAddress);
			$("#addresseeUnitIn").val(data.postInfo.addresseeUnit);
			$("#addresseePhoneIn").val(data.postInfo.addresseePhone);
			$("#addresseeCellPhoneIn").val(data.postInfo.addresseeCellPhone);
			
			$("#billingQuantityIn").val(data.charginInfo.billingQuantity);
			$("#sizeIn").val(data.charginInfo.size);
			selectBeSelected("#safeTypeIn",data.charginInfo.safeType);
			
			$("#declaredValueIn").val(data.charginInfo.declaredValue);
			$("#safeMoneyIn").val(data.charginInfo.safeMoney);
			selectBeSelected("#originalPackageIn",data.charginInfo.originalPackage);
			selectBeSelected("#actualPackingIn",data.charginInfo.actualPacking);
			$("#baggingIn").val(data.charginInfo.bagging);
			$("#packingRequirementIn").val(data.charginInfo.packingRequirement);
			$("#chargedWeightIn").val(data.charginInfo.chargedWeight);
			$("#chargedWeightIn").attr("readonly","readonly");
			selectBeSelected("#methodOfSettlingAccountsIn",data.charginInfo.methodOfSettlingAccounts);
			
			$("#prechargeIn").val(data.charginInfo.precharge);
			
			$("#feedbackSignIn").val(data.transportInfo.feedbackSign);
			$("#collectTheGoodsOnHolidaysIn").val(data.transportInfo.collectTheGoodsOnHolidays);
			$("#serviceTimeLimitIn").val(formatDate(data.transportInfo.serviceTimeLimit));
			selectBeSelected("#processModeIn",data.transportInfo.processMode);
			selectBeSelected("#signBackIn",data.transportInfo.signBack);
			$("#importantIn").val(data.transportInfo.important);
			$("#isMimeographIn").val(data.transportInfo.isMimeograph);
		
			//$("#businessRecsiptNoIn").attr("readonly", true);
		}
	});
}else{
	$("#jobListCodeIn").dblclick(function(){
		$.ajax({
			url:"../../../../jobListEntering/getJobListNo.action",
			type:"post",
			success:function(data){
				$("#jobListCodeIn").val(data)
			}
		});
	});
	
	$("#businessRecsiptNoIn").select2({
		tags:true
	})
	
	$.ajax({
			url:"../../../../jobListEntering/findAllBusinessRecsipt.action",
			type:"post",
			data:{'operationOrg':$("#operationOrg").val()},
			success:function(data){
				businessRecsiptNoIns=data;
				$("#businessRecsiptNoIn").append("<option>--请选择--</option>");
				$.each(data,function(i){
					$("#businessRecsiptNoIn").append("<option value=" + data[i].businessRecsiptId + ">" + data[i].businessRecsiptNo + "</option>");
				});
				$("#businessRecsiptNoIn").selectpicker('refresh');
			}
		
		});
}
	$("#serviceTimeLimitIn").datetimepicker({
		format : "yyyy-mm-dd",
		autoclose : true,
		todayBtn : true,
		language : 'zh-CN',
		pickerPosition : "bottom-left",
		minView : 2,
		startDate : new Date(),
		minDate : new Date()
	    })
	$("input[type='checkbox']").each(function(i,val){
		$("input[type='checkbox']:eq("+i+")").click(function(){
			if($("input[type='checkbox']:eq("+i+")").is(":checked")){
				$("input[type='checkbox']:eq("+i+")").val("1");
			}else{
				$("input[type='checkbox']:eq("+i+")").val("0");
			}
		});
	})
	$("#btn_sub").click(function(){
		if($("#jobListCodeIn").val()!="双击获取"){
		$.ajax({
			url:"../../../../jobListEntering/subJobList.action",
			type:"post",
			traditional:true,
			data:{
				'jobListId':jobListIdH,
				'jobListNo':$("#jobListCodeIn").val(),
				'cuNo':$("#cuNoIn").val(),
				'product':$("#productIn>option:selected").text(),
				'whither':$("#whitherIn").val(),
				'businessRecsiptNo':$("#businessRecsiptNoIn>option:selected").text(),
				'getProductManName':$("#getProductManNameIn").val(),
				'unitOfAcquisition':$("#getProductManNameH").attr("title"),
				'getProductManId':$("#getProductManNameH").val(),
				'mannedRequire':$("#mannedRequireIn>option:selected").text(),
				'factWeight':$("#factWeightIn").val(),
				'factQuantity':$("#billingQuantityIn").val(),
				'bigLogisticsType':$("#bigLogisticsTypeIn").val(),
				'isInternational':$("#isInternationalIn").val(),
				'productName':$("#productNameIn").val(),
				'sender':$("#senderIn").val(),
				'senderAddress':$("#senderAddressIn").val(),
				'senderUnit':$("#senderUnitIn").val(),
				'senderPhone':$("#senderPhoneIn").val(),
				'senderCellPhone':$("#senderCellPhoneIn").val(),
				'addressee':$("#addresseeIn").val(),
				'addresseeAddress':$("#addresseeAddressIn").val(),
				'addresseeUnit':$("#addresseeUnitIn").val(),
				'addresseePhone':$("#addresseePhoneIn").val(),
				'addresseeCellPhone':$("#addresseeCellPhoneIn").val(),
				'billingQuantity':$("#billingQuantityIn").val(),
				'size':$("#sizeIn").val(),
				'safeType':$("#safeTypeIn>option:selected").text(),
				'declaredValue':$("#declaredValueIn").val(),
				'safeMoney':$("#safeMoneyIn").val(),
				'originalPackage':$("#originalPackageIn>option:selected").text(),
				'actualPacking':$("#actualPackingIn>option:selected").text(),
				'bagging':$("#baggingIn").val(),
				'packingRequirement':$("#packingRequirementIn").val(),
				'chargedWeight':$("#chargedWeightIn").val(),
				'methodOfSettlingAccounts':$("#methodOfSettlingAccountsIn>option:selected").text(),
				'precharge':$("#prechargeIn").val(),
				'agencyFund':$("#agencyFundIn").val(),
				'cameCollect':$("#cameCollectIn").val(),
				'orgId':$("#orgIdIn").val(),
				'userName':$("#userNameIn").val(),
				'userId':$("#userIdIn").val(),
				'feedbackSign':$("#feedbackSignIn").val(),
				'collectTheGoodsOnHolidays':$("#collectTheGoodsOnHolidaysIn").val(),
				'serviceTimeLimits':$("#serviceTimeLimitIn").val(),
				'processMode':$("#processModeIn>option:selected").text(),
				'signBack':$("#signBackIn>option:selected").text(),
				'important':$("#importantIn").val(),
				'isMimeograph':$("#isMimeographIn").val()
		},
			success:function(data){
				if("success"==data){
					toastr.success("成功")
				}else{
					toastr.error('失败');
				}
			}
			
		});
	}else{
		toastr.error("请完善工作单号");
	}
});
	
	$("#countBtn").click(function(){
		if($("#baggingIn").val().length==0||$("#chargedWeightIn").val().length==0){
		}else{
			$.ajax({
				url:"../../../../getFree.action",
				type:"post",
				traditional:true,
				data:{
					/*safeMoneyIn:$("#safeMoneyIn").val(),*/
					product:$("#productIn>option:selected").val(),
					weight:$("#chargedWeightIn").val(),
					startCity:$("#senderAddressIn").val(),
					endCity:$("#addresseeAddressIn").val()
				},
				success:function(data){
						$("#prechargeIn").val(parseInt(data.myPrice)+parseInt($("#safeMoneyIn").val())+parseInt($("#baggingIn").val()));
				}
			});
		}
	});
	
	function formatDate(ns){
		var now = new Date(ns);
		var year = now.getYear()+1900;
		var month = now.getMonth()+1;
		var date = now.getDate();
		return year+"-"+month+"-"+date;
	}
	
	function selectDictionary(myData,myId){
		$.ajax({
			url:"../../../../jobListEntering/selectDictionaryQuery.action",
			type:"get",
			data:{"archivesName":myData},
			success:function(data){
				$.each(data,function(i){
					$(myId).append("<option value=" + data[i].subsetId + ">" + data[i].subsetName + "</option>");
				});
				$(myId).selectpicker('refresh');
			}
		
		});
	}
});

var checkIsNull = function(obj){
	if(obj.value.length==0){
		obj.setAttribute('style',"-webkit-box-shadow:0 0 6px rgba(255,0,0,.475);");
		return false;
	}
	return true;
}
function checkColor(obj){
	obj.setAttribute('style',"-webkit-box-shadow:0 0 6px rgba(0,0,255,.475);");
}

function selectOnchang(obj){ 
	var value = obj.options[obj.selectedIndex].text;
	if(value=='到付'){
		$("#agencyFundIn").removeAttr("readonly");
		$("#cameCollectIn").removeAttr("readonly");
	}else{
		$("#agencyFundIn").attr("readonly","readonly");
		$("#cameCollectIn").attr("readonly","readonly");
	}
}

function selectBaoxianOnChange(obj){

	var value = obj.options[obj.selectedIndex].text;
	if(value=='不保险'){
		$("#declaredValueIn").attr("readonly","readonly");
		$("#safeMoneyIn").attr("readonly","readonly");
	}else{
		$("#declaredValueIn").removeAttr("readonly");
		$("#safeMoneyIn").removeAttr("readonly");
	}
}

function selectBeSelected(myId,newId){
	
	for(var i=0;i<$(myId).children().length;i++){
		
		if(newId==$(myId).children()[i].value){
			$(myId).children()[i].setAttribute("selected","selected");
			$(myId).val($(myId).children()[i].value).trigger("change");
			$(myId).change();
			$(myId).selectpicker('refresh');
			
		}else if(newId==$(myId).children()[i].text){
			$(myId).children()[i].setAttribute("selected","selected");
			$(myId).val($(myId).children()[i].value).trigger("change");
			$(myId).change();
			$(myId).selectpicker('refresh');
		}
	}
}

function changeBusinessRecsiptNo(obj){
	for(var i=0;i<businessRecsiptNoIns.length;i++){
		if(businessRecsiptNoIns[i].businessRecsiptId==obj.options[obj.selectedIndex].value){
			$("#cuNoIn").val(businessRecsiptNoIns[i].customerNo);
			$.ajax({
				url:"../../../../jobListEntering/findTelByCustomerNo.action",
				type:"get",
				data:{"customerNo":businessRecsiptNoIns[i].customerNo},
				success:function(data){
					$("#senderCellPhoneIn").val(data);
				}
			});
			$.ajax({
				url:"../../../../jobListEntering/findWorkOrderByBusinessRecsiptId.action",
				data:{"businessRecsiptId":businessRecsiptNoIns[i].businessRecsiptId},
				success:function(data){
						$("#getProductManNameIn").val(data.staffName);
						$("#getProductManNameH").val(data.staffNumber);
						$("#getProductManNameH").attr("title",data.takeOrgName);
						
				}
			});
			$("#whitherIn").val(businessRecsiptNoIns[i].serveCity);
			$("#addresseeCellPhoneIn").val(businessRecsiptNoIns[i].telephone);
			$("#senderAddressIn").val(businessRecsiptNoIns[i].fetchAddress);
			$("#addresseeAddressIn").val(businessRecsiptNoIns[i].serveCity);
			selectBeSelected("#productIn",businessRecsiptNoIns[i].product);
			$("#productNameIn").val(businessRecsiptNoIns[i].productName);
			$("#chargedWeightIn").val(businessRecsiptNoIns[i].weight);
			$("#sizeIn").val(businessRecsiptNoIns[i].volume);
			$("#billingQuantityIn").val(businessRecsiptNoIns[i].numberPackages);
			$("#addresseeIn").val(businessRecsiptNoIns[i].addressee);
			$("#operationOrg").val(businessRecsiptNoIns[i].operationOrg);
			$("#senderIn").val(businessRecsiptNoIns[i].customerName);
		}
	}
}
