$(function () {
	
	$.fn.modal.Constructor.prototype.enforceFocus = function() {};
	
	 //1.初始化Table
   var oTable = new TableInit();
   oTable.Init();
   
   //初始化验证
   $(document).ready(function() {
	   validator();
   });
   
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
	
	// 添加中省的下拉框
	selectProvince("#txt_add_province");
	// 添加中市的下拉框
	selectCity("#txt_add");
	// 添加中区的下拉框
	selectDistrict("#txt_add");
	
	selectProvince("#txt_send_province");
	selectCity("#txt_send");
	selectDistrict("#txt_send");
	
	
	// 省下拉框改变事件
	$('#txt_add_province').change(function() {
		$('#txt_add_city').empty();
		$('#txt_add_city').change();
		$("#txt-create-senderAddress").val($('#txt_add_province').val());
	})
	$('#txt_send_province').change(function() {
		$('#txt_send_city').empty();
		$('#txt_send_city').change();
		$("#txt-create-addresseeAddress").val($('#txt_send_province').val());
	})
	
	// 市下拉框改变事件
	$('#txt_add_city').change(function() {
		$('#txt_add_district').empty();
		$("#txt-create-senderAddress").val($('#txt_add_province').val()+" "+$('#txt_add_city').val());
	})
	$('#txt_send_city').change(function() {
		$('#txt_send_district').empty();
		$("#txt-create-addresseeAddress").val($('#txt_send_province').val()+" "+$('#txt_send_city').val());
	})
	
	// 县下拉框改变事件
	$('#txt_add_district').change(function() {
		$("#txt-create-senderAddress").val($('#txt_add_province').val()+" "+$('#txt_add_city').val()+" "+$('#txt_add_district').val());
	})
	$('#txt_send_district').change(function() {
		$("#txt-create-addresseeAddress").val($('#txt_send_province').val()+" "+$('#txt_send_city').val()+" "+$('#txt_send_district').val());
	})
	
	//初始化日期框
	$('#txt_search_startTime').datetimepicker({
		 language: 'zh-CN',
        autoclose: true,
        todayHighlight: true
	});
	
	$('#txt_search_exceptionTime').datetimepicker({
		 language: 'zh-CN',
       autoclose: true,
       todayHighlight: true
	});
	
	$('#txt-create-billingTime').datetimepicker({
		 language: 'zh-CN',
      autoclose: true,
      todayHighlight: true
	});
	
    
    //简单查询按钮点击查询
    $("#Btn_simpleSerch").click(function(){
    	//刷新表格
    	 $('#tb_departments').bootstrapTable('refresh');
    });
    
    //高级查询按钮点击打开模态框
    $("#btn_seniorSerch").click(function(){
    	 $("#myModal_seniorSerch").modal("show");  
    });
    
    //执行打印操作
    $("#btn_stamp").click(function () { 
    	  //取得选中行的数据
	       var select = $('#tb_departments').bootstrapTable('getSelections');
	       var html = "";
		   var jobListNo = "";
		   var implementState = '';
		   var jobListId = '';
		   for (var i = 0; i < select.length; i++) {
			   jobListNo = select[i]['jobListNo'];
			   implementState = select[i]['implementState'];
			   jobListId =  select[i]['jobListId'];
		   }
    	   if (select.length != 1) {
    		   toastr.warning('请选择一行进行打印!');
 	       }else if(implementState == 1){
	      	 
		     //发送异步请求将数据绑定到域，在打印页面取得
			 $.ajax({				
  	    	   type:"post",
  	    	   url:"/noob/returnGoods/findMessageForstampQuery.action",
  	    	   data:{"jobListNo":jobListNo},
  	    	  // traditional:true,
  	           success: function(result){
  	        	   if(result=="true"){
  	        		 //打开新的窗口
		  	         window.open("/noob/jsps/delivery/returncargo/createRetrunGoods/jsp/stampJob.jsp");
  	        	   }
  	        	 
  	           }
	         }); 
 	       }else if(implementState == 3){
 	    	   //打印标签
 	    	//发送异步请求将数据绑定到域，在打印页面取得
 				 $.ajax({				
 	  	    	   type:"post",
 	  	    	   url:"/noob/returnGoods/findMessageForstampQuery.action",
 	  	    	   data:{"jobListNo":jobListNo,"jobListId":jobListId},
 	  	    	   traditional:true,
 	  	           success: function(result){
 	  	        	   if(result=="true"){
 	  	        		 //打开新的窗口
 			  	         window.open("/noob/jsps/delivery/returncargo/createRetrunGoods/jsp/stampReturn.jsp");
 	  	        	   }
 	  	        	 
 	  	           }
 		         }); 
 	    	   
 	       }
    	   
	  }); 
    
    //高级查询按钮点击查询
    $("#btn-seniorSerch-submit").click(function(){
 	 $('#tb_departments').bootstrapTable('refresh');
 	 $("#myModal_seniorSerch").modal("hide");
    });
    
    //清空高级查询条件
    $("#btn-seniorSerch-clear").click(function(){
    	 $("#txt-find-factQuantity").val("");//件数
         $("#txt-find-factQuantityEnd").val("");
         $("#txt-find-factWeight").val("");//重量
         $("#txt-find-factWeightEnd").val("");
         $("#txt-find-bagging").val("");//包装费
         $("#txt-find-baggingEnd").val("");
         $("#txt-find-cameCollect").val("");//到付款
         $("#txt-find-cameCollectEnd").val("");
         $("#txt-find-agencyFund").val("");//代收款
         $("#txt-find-agencyFundEnd").val("");
    });
    
    //生成返单打开模态框
    $("#btn_ReturnGoods").click(function(){
    
    	//取得选中行的工作单号
 	   var select = $('#tb_departments').bootstrapTable('getSelections');
 	   var jobListNo = [];
 	   var implementState = [];
 	   var handleState = [];
 	   
 	   for(var i = 0;i<select.length;i++){
 		  jobListNo[i] = select[i]['jobListNo'];	
 		  implementState[i] = select[i]['implementState'];
 		  handleState[i] = select[i]['handleState'];
 	   }
  	   
 	   //判断能否生成返货单
 	    if(select.length != 1) {
 		    toastr.warning('请选择一行记录生成返单!');
	    }else if(implementState == 3 && handleState == 2){
	    	toastr.warning('已生成返单，不能重复生成!');
	    }else if(implementState == 1 && handleState == 2){
	    	$("#myModal_ReturnGoods").modal("show");
	    	//清空下拉框
	    	$("#txt-create-product").children("option").remove();
	    	$("#txt-create-safeType").children("option").remove();
	    	$("#txt-create-settlingAccounts").children("option").remove();
	    	$("#txt-create-mannedRequire").children("option").remove();
	    	$("#txt-create-originalPackage").children("option").remove();
	    	$("#txt-create-jobListNo").val(jobListNo);
	  	   
	      //查询原工作单信息
	       $.ajax({
	  	    	   type: "GET",
	  	    	   url: "/noob/returnGoods/findFormerWorkMessageQuery.action",
	  	    	   data:"jobListNo="+jobListNo+"",
	  	           success: function(returnGoods){
	  	             
	  	            //产品类型下拉框
	  		  	    $.ajax({
	  		  	    	   type:"get",
	  		  	    	   url:"/noob/returnGoods/findNamesWidthIdOrderBysubSetIdQuery.action",
	  		  	    	   data:{"subsetId":returnGoods.product,"archivesId":"3DE0A4181561417C"},
	  		  	           success: function(result){
	  		  	        	 var html = "";
	  							for (var i = result.length-1;i>=0;i--) {
	  									html = html + "<option id='"
	  											+ result[i].subsetId + "'>"
	  											+ result[i].subsetName
	  											+ "</option>";
	  							}
	  							$("#txt-create-product").append(html);
	  							$("#txt-create-product").selectpicker("refresh");
	  		  	           }
	  			    });
	  	             
	  	           //给结算方式下拉框赋值
	  	           $.ajax({
			    	   type:"get",
			    	   url:"/noob/returnGoods/findNamesWidthIdOrderBysubSetIdQuery.action",
			    	   data:{"subsetId":returnGoods.methodOfSettlingAccounts,"archivesId":"C51A593A49334D55"},
			           success: function(result){
			        	 var html = "";
			        	 for (var i = result.length-1;i>=0;i--) {
								html = html + "<option id='"
										+ result[i].subsetId + "'>"
										+ result[i].subsetName
										+ "</option>";
						}
							$("#txt-create-settlingAccounts").append(html);
							$("#txt-create-settlingAccounts").selectpicker("refresh");
			           }
			    	});
		  	         
		  	       //给配置要求下拉框赋值
		  	       $.ajax({
			    	   type:"get",
			    	   url:"/noob/returnGoods/findNamesWidthIdOrderBysubSetIdQuery.action",
			    	   data:{"subsetId":returnGoods.mannedRequire,"archivesId":"0000000000000009"},
			           success: function(result){
			        	 var html = "";
							for (var i = result.length-1;i>=0;i--) {
									html = html + "<option id='"
											+ result[i].subsetId + "'>"
											+ result[i].subsetName
											+ "</option>";
							}
							$("#txt-create-mannedRequire").append(html);
						    $("#txt-create-mannedRequire").selectpicker("refresh");
			           }
			    	});
		  	       
		  	       //加载保险类型下拉框
				  	 $.ajax({
				    	   type:"get",
				    	   url:"/noob/returnGoods/findNamesWidthIdOrderBysubSetIdQuery.action",
				    	   data:{"subsetId":returnGoods.safeType,"archivesId":"4C385D06A6184637"},
				           success: function(result){
				        	 var html = "";
								for (var i = result.length-1;i>=0;i--) {
										html = html + "<option id='"
												+ result[i].subsetId + "'>"
												+ result[i].subsetName
												+ "</option>";
								}
								$("#txt-create-safeType").append(html);
								$("#txt-create-safeType").selectpicker("refresh");
				           }
				    	});
				    	
				    	 //加载原包装下拉框
					  	 $.ajax({
					    	   type:"get",
					    	   url:"/noob/returnGoods/findNamesWidthIdOrderBysubSetIdQuery.action",
					    	   data:{"subsetId":returnGoods.originalPackage,"archivesId":"073E7612A0344C38"},
					           success: function(result){
					        	 var html = "";
									for (var i = result.length-1;i>=0;i--) {
											html = html + "<option id='"
													+ result[i].subsetId + "'>"
													+ result[i].subsetName
													+ "</option>";
									}
									$("#txt-create-originalPackage").append(html);
									$("#txt-create-originalPackage").selectpicker("refresh");
					           }
					    	});
					 
	  	             $("#txt-create-factQuantity").val(returnGoods.factQuantity);
		  	         $("#txt-create-productName").val(returnGoods.productName);
	  	             $("#txt-create-factWeight").val(returnGoods.factWeight);
		  	         $("#txt-create-size").val(returnGoods.size);
		  	         $("#txt-create-addressee").val(returnGoods.addressee);
		  	         $("#txt-create-addresseeUnit").val(returnGoods.addresseeUnit);
			  	     $("#txt-create-addresseeFax").val(returnGoods.addresseeFax);
			  	     $("#txt-create-addresseeAddress").val(returnGoods.addresseeAddress);
			  	     $("#txt-create-addresseePhone").val(returnGoods.addresseePhone);
			     	 $("#txt-create-addresseeCellPhone").val(returnGoods.addresseeCellPhone);
			     	 $("#txt-create-recipientZipCode").val(returnGoods.recipientZipCode);
			     	 $("#txt-create-sender").val(returnGoods.sender);
			     	 $("#txt-create-senderUnit").val(returnGoods.senderUnit);
			     	 $("#txt-create-senderFax").val(returnGoods.senderFax);
			     	 $("#txt-create-senderAddress").val(returnGoods.senderAddress);
			     	 $("#txt-create-senderPhone").val(returnGoods.senderPhone);
			     	 $("#txt-create-senderCellPhone").val(returnGoods.senderCellPhone);
			  	     $("#txt-create-fetchAddress").val(returnGoods.fetchAddress);
			  	     $("#txt-create-safeMoney").val(returnGoods.safeMoney);
			  	     $("#txt-create-declaredValue").val(returnGoods.declaredValue);
			  	     $("#txt-create-important").val(returnGoods.important);
			  	     
			  	     if(returnGoods.cameCollect != null){
			  	    	 $("#txt-create-cameCollect").val(returnGoods.cameCollect);
			  	     }
			  	     
			  	    if(returnGoods.agencyFund != null){
			  	    	 $("#txt-create-agencyFund").val(returnGoods.agencyFund);
			  	     }
			  	     $("#txt-create-packingRequirement").val(returnGoods.packingRequirement);
			  	     $("#txt-create-chargedWeight").val(returnGoods.chargedWeight);
			  	     $("#txt-create-billingHuman").val(returnGoods.billingHuman);
			  	     $("#txt-create-billingTime").val(returnGoods.billingTimeStr);
			  	     $("#txt-create-operateUnit").val(returnGoods.operateUnit);
			  	     $("#txt-create-cuNo").val(returnGoods.cuNo);
			  	     $("#txt-create-arriveLocalityCode").val(returnGoods.sortingCode);
			  	      
			  	     //通过空格截取收获地址给 省市县街道赋值
				  	    var address1 = [];
				     	var  senderAddress = $("#txt-create-senderAddress").val();
				      	address1 = senderAddress.split(" "); 
				      	$("#txt_add_province").append("<option selected='selected'>"+address1[0]+"</option>");
				      	$("#txt_add_city").append("<option selected='selected'>"+address1[1]+"</option>");
				      	$("#txt_add_district").append("<option selected='selected'>"+address1[2]+"</option>");
				      	$("#txt_add_treet").val(address1[3]);
				        $("#txt-create-whither").val(address1[1]);
				      	 
				     //通过空格截取发货地址给 省市县街道赋值
				        var address2 = [];
				     	var  senderAddress = $("#txt-create-addresseeAddress").val();
				      	address2 = senderAddress.split(" "); 
				      	$("#txt_send_province").append("<option selected='selected'>"+address2[0]+"</option>");
				      	$("#txt_send_city").append("<option selected='selected'>"+address2[1]+"</option>");
				      	$("#txt_send_district").append("<option selected='selected'>"+address2[2]+"</option>");
				      	$("#txt_send_treet").val(address2[3]);
				    
				     
				     //调用获得取件单位的ajax函数
				     ajaxUnitOfAcquisition(address2[0],address2[1],address2[2],address2[3]);
				     
				     //调用获得到达地编码的ajax函数
				     ajaxArriveLocalityCode(address1[0],address1[1],address1[2],address1[3]);
				     
			  	   }
	
	  	    	 });
		      //开启验证
			   	$("#addReturn_form").data('bootstrapValidator').destroy();
				$('#saveadmin_form').data('bootstrapValidator', null);
		    	validator();
	    	
	    }
   });
    
    //提交生成返货单
    $("#btn_submit_returnGoods").click(function(){
    	
    	//获取选中行的工作单ID
    	 var select = $('#tb_departments').bootstrapTable('getSelections');
   	     var jobListId = "";
   	     for(var i = 0;i<select.length;i++){
   	    	jobListId = select[i]['jobListId'];
   	     }
    	
   	     //取得下拉框选中行的ID
    	var product = "";
    	for (var i = 0; i < $("#txt-create-product").children().length; i++) {
		     if ($("#txt-create-product").children()[i].selected) {
		    	 product = $($("#txt-create-product").children()[i]).attr("id");
		     }
        }
        
        //取得下拉框选中行的ID
        var settlingAccounts = "";
    	for (var i = 0; i < $("#txt-create-settlingAccounts").children().length; i++) {
		     if ($("#txt-create-settlingAccounts").children()[i].selected) {
		    	 settlingAccounts = $($("#txt-create-settlingAccounts").children()[i]).attr("id");
		     }
        }
    	
    	//取得下拉框选中行的ID
        var safeType = "";
    	for (var i = 0; i < $("#txt-create-safeType").children().length; i++) {
		     if ($("#txt-create-safeType").children()[i].selected) {
		    	 safeType = $($("#txt-create-safeType").children()[i]).attr("id");
		     }
        }
    	
    	 //取得下拉框选中行的ID
        var mannedRequire = "";
        for (var i = 0; i < $("#txt-create-mannedRequire").children().length; i++) {
		     if ($("#txt-create-mannedRequire").children()[i].selected) {
		    	 mannedRequire = $($("#txt-create-mannedRequire").children()[i]).attr("id");
		     }
        }
        
        //取得原包装下拉框选中行的ID
        var originalPackage = "";
        for (var i = 0; i < $("#txt-create-originalPackage").children().length; i++) {
		     if ($("#txt-create-originalPackage").children()[i].selected) {
		    	 originalPackage = $($("#txt-create-originalPackage").children()[i]).attr("id");
		     }
        }
        
    	var factQuantity = $("#txt-create-factQuantity").val();
        var productName = $("#txt-create-productName").val();
        var factWeight = $("#txt-create-factWeight").val();
        var whither = $("#txt-create-whither").val();
        var size = $("#txt-create-size").val();
        var addressee = $("#txt-create-addressee").val();
        var addresseeUnit = $("#txt-create-addresseeUnit").val();
        var addresseeFax = $("#txt-create-addresseeFax").val();
        var addresseeAddress = $("#txt-create-addresseeAddress").val();
        var addresseePhone = $("#txt-create-addresseePhone").val();
        var addresseeCellPhone = $("#txt-create-addresseeCellPhone").val();
        var recipientZipCode = $("#txt-create-recipientZipCode").val();
        var unitOfAcquisition = $("#txt-create-unitOfAcquisition").val();
        var senderAddress = $("#txt-create-senderAddress").val();
        var safeMoney = $("#txt-create-safeMoney").val();
        var declaredValue = $("#txt-create-declaredValue").val();
        var important = $("#txt-create-important").val();
        var cameCollect = $("#txt-create-cameCollect").val();
        var agencyFund = $("#txt-create-agencyFund").val();
        var packingRequirement = $("#txt-create-packingRequirement").val();
        var cuNo = $("#txt-create-cuNo").val();
        var chargedWeight = $("#txt-create-chargedWeight").val();
        var sender = $("#txt-create-sender").val();
        var senderFax = $("#txt-create-senderFax").val();
        var senderPhone = $("#txt-create-senderPhone").val();
        var senderCellPhone = $("#txt-create-senderCellPhone").val();
        var arriveLocalityCode = $("#txt-create-arriveLocalityCode").val();
        var billingTime = $("#txt-create-billingTime").val();
        var endMimeograph = $("#txt-create-endMimeograph").val();
        var billingHuman = $("#txt-create-billingHuman").val();
        var operateUnit = $("#txt-create-operateUnit").val();
        var senderUnit = $("#txt-create-senderUnit").val();
	     
	      $.ajax({
	  	    	type: "post",
	  	        url:"/noob/returnGoods/addReturnGoodsU.action",
	  	        data:{"jobListId":jobListId,
	  	        	  "product":product,
	  	        	  "factQuantity":factQuantity,
	  	        	  "settlingAccounts":settlingAccounts,
	  	        	  "productName":productName,
		  	          "originalPackage":originalPackage,
		  	          "factWeight":factWeight,
		  	          "whither":whither,
		  	          "size":size,
		  	          "addressee":addressee,
		  	          "addresseeUnit":addresseeUnit,
		  	          "addresseeFax":addresseeFax,
		  	          "addresseeAddress":addresseeAddress,
		  	          "addresseePhone":addresseePhone,
		  	          "addresseeCellPhone":addresseeCellPhone,
		  	          "recipientZipCode":recipientZipCode,
		  	          "unitOfAcquisition":unitOfAcquisition,
		  	          "senderAddress":senderAddress,
		  	          "safeType":safeType,
		  	          "safeMoney":safeMoney,
		  	          "declaredValue":declaredValue,
		  	          "important":important,
		  	          "cameCollect":cameCollect,
		  	          "agencyFund":agencyFund,
		  	          "packingRequirement":packingRequirement,
		  	          "cuNo":cuNo,  
		  	          "chargedWeight":chargedWeight,
		  	          "mannedRequire":mannedRequire,
				  	  "sender":sender,
				  	  "senderFax":senderFax,
				  	  "senderPhone":senderPhone,
				  	  "senderCellPhone":senderCellPhone,
				  	  "arriveLocalityCode":arriveLocalityCode,
				  	  "billingTimeStr":billingTime,
				  	  "endMimeograph":endMimeograph,
				      "billingHuman":billingHuman,
				  	  "operateUnit":operateUnit,
				  	  "senderUnit":senderUnit},
	  	        success: function(msg){
	  	        	if(msg == "true"){
	   	              $('#tb_departments').bootstrapTable('refresh');
	   	     		  $("#myModal_ReturnGoods").modal("hide");
	   	            	toastr.success('成功生成返单!');
	   	              }else{
	   	            	toastr.error('生成返单失败!');
	   	              }
			  	}
	
	  	  });
	    	
   });
	
   //打开追踪查询模态框 
    $("#btn_complicate").click(function () {  
        $("#myModal_complicate").modal("show");  
    });  
    
    //显示追踪查询结果 
    $("#btn_submit_complicate").click(function () {  
        $("#myModal_complicate_out").modal("show");  
        $("#myModal_complicate").modal("hide");  
    });  
    
    //打开转移模态框 
    $("#btn_edit").click(function () { 
    	//清空下拉框
    	$("#txt_edit_returnUnit").children("option").remove();
    	//获取选中行的工作单ID
      	 var select = $('#tb_departments').bootstrapTable('getSelections');
     	          var jobListId = "";
     	          var returnUnit = "";
     	   for(var i = 0;i<select.length;i++){
     	    	 jobListId = select[i]['jobListId'];
     	    	 returnUnit = select[i]['returnUnit'];
     	   }
    	   if (select.length != 1) {
    		     toastr.warning('请选择一行进行转移!');
   	       }else{
   	    	  $("#myModal_edit").modal("show");  
   	    	  //调用组织结构查询所有方法返货单位下拉框
   	    	 $.ajax({
		    	   type:"post",
		    	   url:"/noob/organization/orgPageQuery.action",
		           success: function(result){
			        	   var html = "";
					 		for (var i = result.length-1;i>=0;i--) {
								
								//将原单的返货单位设置为默认值
								if(returnUnit == result[i].orgName){
									html = html + "<option selected='selected'>"+result[i].orgName+"</option>";
								}else{
									html = html + "<option>"+ result[i].orgName+"</option>";
								}
									
							}
							$("#txt_edit_returnUnit").append(html);
							$("#txt_edit_returnUnit").selectpicker("refresh");
						 
						
		           }
		    	});
   	       }
        
    }); 
    
    //执行转移操作修改返货申请的返货单位
    $("#btn_submit_edit").click(function () { 
    	//获取选中行的工作单ID
     	 var select = $('#tb_departments').bootstrapTable('getSelections');
    	          var jobListId = "";
    	   for(var i = 0;i<select.length;i++){
    	    	 jobListId = select[i]['jobListId'];
    	   }
    	   
    	 $.ajax({
	    	   type:"post",
	    	   url:"/noob/returnGoods/updateReturnUnitByIdU.action",
	    	   data:{"returnUnit":$("#txt_edit_returnUnit").val(),"jobListId":jobListId},
	           success: function(result){
	        	 if(result =="true"){
	        		    $("#myModal_edit").modal("hide");  
	            		toastr.success('转移成功!');
	            		//刷新表格
		            	 $('#tb_departments').bootstrapTable('refresh');
  	              }else{
  	            	    toastr.error('转移失败!');
  	              }
	           }
	     });
    }); 
    
    //执行作废返货单 
    $("#btn_delete").click(function () { 
		    //获取选中行的工作单ID
		   	 var select = $('#tb_departments').bootstrapTable('getSelections');
		     var jobListId = "";
		     var implementState = "";
		 	 for(var i = 0;i<select.length;i++){
		 	    	 jobListId = select[i]['jobListId'];
		 	    	implementState = select[i]['implementState'];
		 	  }
		   	 
		     if (select.length != 1 || implementState != 3) {
			           toastr.warning('请选择一行已返记录进行作废!');
		      }else{
		    	     swal({  
							title: "操作提示",   //弹出框的title  
							text: "确定删除吗？",  //弹出框里面的提示文本  
							type: "warning",    //弹出框类型  
							showCancelButton: true, //是否显示取消按钮  
							confirmButtonColor: "#DD6B55",//确定按钮颜色  
							cancelButtonText: "取消",//取消按钮文本  
							confirmButtonText: "是的，确定删除！",//确定按钮上面的文档  
							closeOnConfirm: true
			          }, function () {
						 //删除返单表信息
				       	 $.ajax({
				   	    	   type:"post",
				   	    	   url:"/noob/returnGoods/deletetReturnGoodsByIdU.action",
				   	    	   data:{"jobListId":jobListId},
				   	           success: function(result){
				   	        	 if(result =="true"){
				   	        		//刷新表格
				   	            	 $('#tb_departments').bootstrapTable('refresh');
				   	            	 toastr.success('作废成功!');
				  	              }else{
				  	            	 toastr.error('作废失败!');
				  	              }
				   	           }
				   	     });
				    });
		    	}
         });
    
    
    
});

//街道文本框改变
function treetChange(){
 	$("#txt-create-senderAddress").val($('#txt_add_province').val()+" "+$('#txt_add_city').val()+" "+$('#txt_add_district').val()+" "+$("#txt_add_treet").val());
 	//获得省市县街道
 	var province = $('#txt_add_province').val();
 	var city = $('#txt_add_city').val();
 	var district = $('#txt_add_district').val();
 	var treet = $("#txt_add_treet").val();
 	ajaxArriveLocalityCode(province,city,district,treet);
}

function treetChangeSend(){
 	$("#txt-create-addresseeAddress").val($('#txt_send_province').val()+" "+$('#txt_send_city').val()+" "+$('#txt_send_district').val()+" "+$("#txt_send_treet").val());
	//获得省市县街道
 	var province = $('#txt_send_province').val();
 	var city = $('#txt_send_city').val();
 	var district = $('#txt_send_district').val();
 	var treet = $("#txt_send_treet").val();
 	//调用加载取件单位函数
 	ajaxUnitOfAcquisition(province,city,district,treet);
}

//到达地编码函数
function ajaxArriveLocalityCode(province,city,district,treet){
 	//获取到达地编码
 	$.ajax({
			type: "GET", 
			url:'/noob/returnGoods/findCortingCodeQuery.action',
			data :{"province":province,"city":city,"district":district,"treet":treet},
			success:function(result) {
				$("#txt-create-arriveLocalityCode").val(result.ripAreaCode);
			}
	});
}


//加载取件单位函数
function ajaxUnitOfAcquisition(province,city,district,treet){
  	$.ajax({
 			type: "post", 
 			url:'/noob/returnGoods/findCortingCodeQuery.action',
 			data :{"province":province,"city":city,"district":district,"treet":treet},
 			success:function(result) {
 				//取到定区ID
 				var ripAreaId = result.ripAreaId;
	 				$.ajax({
	 		 			type: "post", 
	 		 			url:'/noob/returnGoods/findStaffOrgByRipAreaIdQuery.action',
	 		 			data :{"ripAreaId":ripAreaId},
	 		 			success:function(staffOrgName) {
	 		 				$("#txt-create-unitOfAcquisition").val(staffOrgName[0]);
	 		 			}
	 		 	     });
	 				
 			}
 	});
}





//添加校验
function validator() {
	$('#addReturn_form').bootstrapValidator({
		message : 'This value is not valid',
		feedbackIcons : {
			valid : 'glyphicon glyphicon-ok',
			invalid : 'glyphicon glyphicon-remove',
			validating : 'glyphicon glyphicon-refresh'
		},
		fields : {
			txtCreateFactQuantity : {
				validators : {
					notEmpty : {
						message : '实际件数不能为空！',
					},
					regexp : {
						regexp : /^[0-9]*$/,
						message : '格式不正确！'
					}
				}
			},
			txtCreateFactWeight : {
				validators : {
					notEmpty : {
						message : '实际重量不能为空！',
					},
					regexp : {
						regexp : /^(-?\d+)(\.\d+)?$/,
						message : '格式不正确！'
					}
				}
			},
			txtCreateSize : {
				validators : {
					notEmpty : {
						message : '体积不能为空!'
					},
					regexp : {
						regexp : /^(-?\d+)(\.\d+)?$/,
						message : '格式不正确！'
					}
				}
			},
			txtCreateAddressee : {
				validators : {
					notEmpty : {
						message : '委托人不能为空!'
					},
				}
			},
			txtCreateSafeMoney : {
				validators : {
					notEmpty : {
						message : '保险费不能为空!'
					},
					regexp : {
						regexp : /^(-?\d+)(\.\d+)?$/,
						message : '格式不正确！'
					}
				}
			},
			txtCreatePackingRequirement : {
				validators : {
					notEmpty : {
						message : '包装要求不能为空!'
					},
				}
			},
			txtCreateBillingTime : {
				validators : {
					notEmpty : {
						message : '开单时间不能为空!'
					},
				}
			},
			txtCreateChargedWeight : {
				validators : {
					notEmpty : {
						message : '计费重量不能为空!'
					},
					regexp : {
						regexp : /^(-?\d+)(\.\d+)?$/,
						message : '格式不正确！'
					}
				}
			},
			txtCreateUnitOfAcquisition : {
				validators : {
					notEmpty : {
						message : '取件单位不能为空!'
					},
				}
			}, 
			txtCreateRecipientZipCode : {
				validators : {
					regexp : {
						regexp : /^[1-9]\d{5}$/,
						message : '格式不正确！'
					}
				}
			},
			txtCreateAddresseeUnit : {
				validators : {
					notEmpty : {
						message : '发货单位不能为空!'
					},
				}
			},
			txtCreateAddresseePhone : {
				validators : {
					notEmpty : {
						message : '发货电话不能为空!'
					},
					regexp : {
						regexp :/^0\d{2,3}-[1-9]\d{6,7}$/,
						message : '格式不正确！'
					}
				}
			},
			txtCreateAddresseeCellPhone : {
				validators : {
					notEmpty : {
						message : '发货手机不能为空!'
					},
					regexp : {
						regexp : /^1(3|4|5|7|8)\d{9}$/,
						message : '格式不正确！'
					}
				}
			},
			txtCreateAddresseeAddress : {
				validators : {
					notEmpty : {
						message : '发货地址不能为空!'
					},
				}
			},
			txtCreateSender : {
				validators : {
					notEmpty : {
						message : '收货人不能为空!'
					},
				}
			},
			txtCreateSenderUnit : {
				validators : {
					notEmpty : {
						message : '收单位不能为空!'
					},
				}
			},
			txtCreateSenderPhone : {
				validators : {
					notEmpty : {
						message : '收货电话不能为空!'
					},
					regexp : {
						regexp :/^0\d{2,3}-[1-9]\d{6,7}$/,
						message : '格式不正确！'
					}
				}
			},
			txtCreateSenderCellPhone : {
				validators : {
					notEmpty : {
						message : '收货手机不能为空!'
					},
					regexp : {
						regexp : /^1(3|4|5|7|8)\d{9}$/,
						message : '格式不正确！'
					}
				}
			},
			txtCreateSenderAddress : {
				validators : {
					notEmpty : {
						message : '收货地址不能为空!'
					},
				}
			},
		}
	});
};




