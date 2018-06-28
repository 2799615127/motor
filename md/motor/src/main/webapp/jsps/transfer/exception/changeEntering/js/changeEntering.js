$(function () {

	  //异步请求接收单位查询框，查询组织结构根据当前操作人的组织结构ID排序
    $.ajax({
	    	   type:"post",
	    	   url:"/noob/changeEntering/findOrgOrderByOrgIdQuery.action",
	    	   async:false,
	    	   data:{"orgId":"0000000000000000"},
	           success: function(result){
	        	 var html = "";
				for (var i = result.length-1;i>=0;i--) {
						html = html + "<option id='"
								+ result[i].orgId + "'>"
								+ result[i].orgName
								+ "</option>";
				}
				$("#txt_search_sendeeUnit").append(html);
				$("#txt_search_sendeeUnit").selectpicker("refresh");
	           }
    });
	  //异步请求录入人单位查询框，查询组织结构根据当前操作人的组织结构ID排序
    $.ajax({
	    	   type:"post",
	    	   url:"/noob/changeEntering/findOrgOrderByUserOrgIdQuery.action",
	    	   async:false,
	           success: function(result){
	        	 var html = "";
				for (var i = result.length-1;i>=0;i--) {
						html = html + "<option id='"
								+ result[i].orgId + "'>"
								+ result[i].orgName
								+ "</option>";
				}
				$("#txt_search_enteringUnit").append(html);
				$("#txt_search_enteringUnit").selectpicker("refresh");
	           }
    });
    
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
	
	
	//初始化日期框
	$('#txt_search_enteringTime').datetimepicker({
		 language: 'zh-CN',
        autoclose: true,
        todayHighlight: true
	});
	
	$('#txt_search_enteringTimeEnd').datetimepicker({
		 language: 'zh-CN',
       autoclose: true,
       todayHighlight: true
	});
	
    
    //条件查询按钮点击查询
    $("#btn_search_submit").click(function(){
    	
    	//选择含下级设置值为1,默认是0
    	if($('#txt_search_enteringUnitJunior').is(':checked')) {
    		$('#txt_search_enteringUnitJunior').attr("value","1");
    	}else{
    		$('#txt_search_enteringUnitJunior').attr("value","0");
    	}
    	
    	if($('#txt_search_sendeeUnitJunior').is(':checked')) {
    		$('#txt_search_sendeeUnitJunior').attr("value","1");
     	}else{
     		$('#txt_search_sendeeUnitJunior').attr("value","0");
     	}
    	
    	//刷新表格
    	 $('#tb_departments').bootstrapTable('refresh');
    });
    
    
    //打开保存模态框
    $("#btn_save").click(function(){
    	$("#myModal_save").modal("show");  
		  //消除验证信息
	 	$("#save_form").data('bootstrapValidator').destroy();
		$('#save_form').data('bootstrapValidator', null);
		validator();
		$("#btn_submit_saveChangeEntering").attr("disabled","disabled");
   });
    
	//提交保存
    $("#btn_submit_saveChangeEntering").click(function(){
	    var jobListNo =	$("#txt_save_jobListNo").val();
	    var changeCameCollect =	$("#txt_save_changeCameCollect").val();
	    var changeAgencyFund =	$("#txt_save_changeAgencyFund").val();
	    var changeCause =	$("#txt_save_changeCause").val();
	    
	    //获取接受单位和录入单位的ID和该单位的上级ID
    	var sendeeUnit = "";
    	for (var i = 0; i < $("#txt_save_sendeeUnit").children().length; i++) {
		     if ($("#txt_save_sendeeUnit").children()[i].selected) {
		    	 sendeeUnit = $($("#txt_save_sendeeUnit").children()[i]).attr("id");
		     }
        }
    	var sendeeUnitParentId = "";
    	for (var i = 0; i < $("#txt_save_sendeeUnit").children().length; i++) {
		     if ($("#txt_save_sendeeUnit").children()[i].selected) {
		    	 sendeeUnitParentId = $($("#txt_save_sendeeUnit").children()[i]).attr("class");
		     }
        }
    	
    	var cameCollect = $("#txt_save_cameCollect").val();
    	var agencyFund = $("#txt_save_agencyFund").val();
    	var productName = $("#txt_save_productName").val();
    	var addressee =	$("#txt_save_addressee").val();
    	var senderUnit =	$("#txt_save_senderUnit").val();
    	
        $.ajax({
	    	   type:"post",
	    	   url:"/noob/changeEntering/addChangeEnteringU.action",
	    	   async:false,
	    	   data:{"jobListNo":jobListNo,"changeCameCollect":changeCameCollect,"changeAgencyFund":changeAgencyFund,"changeCause":changeCause,"sendeeUnit":sendeeUnit,"sendeeUnitParentId":sendeeUnitParentId,"cameCollect":cameCollect,"agencyFund":agencyFund,"productName":productName,"addressee":addressee,"senderUnit":senderUnit},
	           success: function(result){
	        	   if(result== true ){
	        		   toastr.success('保存成功!');
	        		   $("#myModal_save").modal("hide");  
	        		   //刷新表格
	        	       $('#tb_departments').bootstrapTable('refresh');
	        	   }
	           }
       });
	    
    });
   
    //修改
    $("#btn_update").click(function(){
    	 //取得选中行的数据
	       var select = $('#tb_departments').bootstrapTable('getSelections');
	       var sendeeUnit = '';
	       var changeCause = '';
	       var changeAgencyFund = '';
	       var changeCameCollect = '';
	       var sendeeStatus ='';
		   for (var i = 0; i < select.length; i++) {
			   sendeeUnit = select[i]['sendeeUnit'];
			   changeCause = select[i]['changeCause'];
			   changeAgencyFund = select[i]['changeAgencyFund'];
			   changeCameCollect = select[i]['changeCameCollect'];
			   sendeeStatus = select[i]['sendeeStatus'];
		   }
	    
		   if(select.length==1 && sendeeStatus == '未接收'){
			   $("#txt_update_sendeeUnit").children("option").remove();
			   $("#myModal_update").modal("show"); 
			   $("#txt_update_changeCause").val(changeCause);
			   $("#txt_update_changeAgencyFund").val(changeAgencyFund);
			   $("#txt_update_changeCameCollect").val(changeCameCollect);
			   
			   //加载派送单位下拉框
			   $.ajax({
		    	   type:"post",
		    	   url:"/noob/organization/orgPageQuery.action",
		           success: function(result){
		        	   var html = "";
						for (var i = 0;i<result.length;i++) {
							
								if(result[i].orgName == sendeeUnit){
									html = html + "<option selected='selected' id='"+ result[i].orgId + "'>"+ result[i].orgName+"</option>";
								}else{
									html = html + "<option id='"+ result[i].orgId + "'>"+ result[i].orgName+"</option>";
								}
						}
						$("#txt_update_sendeeUnit").append(html);
						$("#txt_update_sendeeUnit").selectpicker("refresh");
		           }
	          });
			   
			   //开启验证
			 	$("#update_form").data('bootstrapValidator').destroy();
				$('#update_form').data('bootstrapValidator', null);
				validator();
	       }else{
	    	   toastr.warning('请选择一行未接收的记录进行修改!');
	       }
   });
    
    //提交修改
    $("#btn_submit_updateChangeEntering").click(function(){
    	   //取得各个文本框值
    	var changeCause = $("#txt_update_changeCause").val().trim();
    	var changeAgencyFund =   $("#txt_update_changeAgencyFund").val().trim();
    	var changeCameCollect =  $("#txt_update_changeCameCollect").val().trim();
    	var select = $('#tb_departments').bootstrapTable('getSelections');
    	//取得选中行的工作单号
    	var jobListNo = '';
		   for (var i = 0; i < select.length; i++) {
			   jobListNo = select[i]['jobListNo'];
		   }
		//获得接收单位的ID
		   var sendeeUnit = "";
	    	for (var i = 0; i < $("#txt_update_sendeeUnit").children().length; i++) {
			     if ($("#txt_update_sendeeUnit").children()[i].selected) {
			    	 sendeeUnit = $($("#txt_update_sendeeUnit").children()[i]).attr("id");
			     }
	        }
	    	
	    	 $.ajax({
		    	   type:"post",
		    	   url:"/noob/changeEntering/updateChangeEnteringByJobListNoU.action",
		    	   data:{"jobListNo":jobListNo,"changeCause":changeCause,'changeAgencyFund':changeAgencyFund,'changeCameCollect':changeCameCollect,"sendeeUnit":sendeeUnit},
		           success: function(result){
		        	   if(result== true ){
		        		   toastr.success('修改成功!');
		        		   $("#myModal_update").modal("hide");  
		        		 //刷新表格
		        	     $('#tb_departments').bootstrapTable('refresh');
		        	   }
		           }
	          });
		   
    });
    
    //接收
    $("#btn_sendee").click(function(){
    	 //取得选中行的数据
	       var select = $('#tb_departments').bootstrapTable('getSelections');
		  
	       var sendeeStatus = '';
	       var jobListNo = '';
	       var changeAgencyFund = '';
	       var changeCameCollect = '';
		   for (var i = 0; i < select.length; i++) {
			   sendeeStatus = select[i]['sendeeStatus'];
			   jobListNo = select[i]['jobListNo'];
			   changeAgencyFund = select[i]['changeAgencyFund'];
			   changeCameCollect = select[i]['changeCameCollect'];
		   }
	    
		   if(select.length ==1 && sendeeStatus == '未接收'){
			   
			   swal({  
					title: "确定接收吗？",   //弹出框的title  
					text: "变更到付:"+changeCameCollect+" 变更代收:"+changeAgencyFund+"",  //弹出框里面的提示文本  
					type: "warning",    //弹出框类型  
					showCancelButton: true, //是否显示取消按钮  
					confirmButtonColor: "#337AB7",//确定按钮颜色  
					cancelButtonText: "取消",//取消按钮文本  
					confirmButtonText: "确认",//确定按钮上面的文档  
					closeOnConfirm: true
	          }, function () {
	        	  $.ajax({
			    	   type:"post",
			    	   url:"/noob/changeEntering/sendeeChangeEnteringByJobListNoU.action",
			    	   data:{"jobListNo":jobListNo,'changeAgencyFund':changeAgencyFund,'changeCameCollect':changeCameCollect},
			           success: function(result){
			        	   if(result== true ){
			        		   toastr.success('接收成功!');
			        		 //刷新表格
			        	     $('#tb_departments').bootstrapTable('refresh');
			        	   }
			           }
		          });
		      });
	       }else{
	    	   toastr.warning('请选择一行未接收的记录接收!');
	       }
   });
    
    //删除
    $("#btn_delete").click(function(){
    	 //取得选中行的数据
	       var select = $('#tb_departments').bootstrapTable('getSelections');
		  
	       var jobListNo = [];
		   for (var i = 0; i < select.length; i++) {
			   jobListNo[i] = select[i]['jobListNo'];
		   }
	       
		   if(select.length >= 1){
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
	        	  $.ajax({
			    	   type:"post",
			    	   url:"/noob/changeEntering/deleteChangeEnteringByJobListNoU.action",
			    	   traditional:true,
			    	   data:{"jobListNoArray":jobListNo},
			           success: function(result){
			        	   if(result== true ){
			        		   toastr.success('删除成功!');
			        		 //刷新表格
			        	     $('#tb_departments').bootstrapTable('refresh');
			        	   }
			           }
		          });
		      });
	       }else{
	    	   toastr.warning('请至少选择一行进行删除!');
	       }
   });
    
});


//添加校验
function validator() {
	$('#update_form').bootstrapValidator({
		message : 'This value is not valid',
		feedbackIcons : {
			valid : 'glyphicon glyphicon-ok',
			invalid : 'glyphicon glyphicon-remove',
			validating : 'glyphicon glyphicon-refresh'
		},
		fields : {
		changeCameCollect : {
				validators : {
					notEmpty : {
						message : '到付变更金额不能为空!'
					},
					regexp : {
						regexp : /^(-?\d+)(\.\d+)?$/,
						message : '格式不正确！'
					}
				}
			},
			changeAgencyFund : {
				validators : {
					notEmpty : {
						message : '代收变更金额不能为空!'
					},
					regexp : {
						regexp : /^(-?\d+)(\.\d+)?$/,
						message : '格式不正确！'
					}
				}
			},
		},
	});
	
	$('#save_form').bootstrapValidator({
		message : 'This value is not valid',
		feedbackIcons : {
			valid : 'glyphicon glyphicon-ok',
			invalid : 'glyphicon glyphicon-remove',
			validating : 'glyphicon glyphicon-refresh'
		},
		fields : {
		changeCameCollect : {
				validators : {
					notEmpty : {
						message : '到付变更金额不能为空!'
					},
					regexp : {
						regexp : /^(-?\d+)(\.\d+)?$/,
						message : '格式不正确！'
					}
				}
			},
			changeAgencyFund : {
				validators : {
					notEmpty : {
						message : '代收变更金额不能为空!'
					},
					regexp : {
						regexp : /^(-?\d+)(\.\d+)?$/,
						message : '格式不正确！'
					}
				}
			},
			changeCause : {
				validators : {
					notEmpty : {
						message : '变更原因不能为空!'
					},
				}
			},
			jobListNo : {
				validators : {
					notEmpty : {
						message : '变更原因不能为空!'
					},
					/*regexp : {
						regexp : /[noob]{4}\d{9}/ ,
						message : '格式不正确！'
					}*/
				}
			},
		},
	});
};

//查询工作单信息
function findJobListMessage(){
	//清空下拉框
	$("#txt_save_sendeeUnit").children("option").remove();
	var jobListNo = $("#txt_save_jobListNo").val();
	$.ajax({
		type:"post", 
		url:'/noob/changeEntering/findJobListMessage.action',
		data :{"jobListNo":jobListNo},
		success:function(result) {
			$("#txt_save_cameCollect").val(result.cameCollect);
			$("#txt_save_agencyFund").val(result.agencyFund);
			$("#txt_save_productName").val(result.productName);
			$("#txt_save_addressee").val(result.addressee);
			$("#txt_save_senderUnit").val(result.senderUnit);
			$("#txt_save_enteringUnit").val(result.enteringUnit);
			
			//如果查询的工作单记录不为为空
			if(result != ''){
				//查询到所有的组织结构，并根据工作单派送单位名排序
			    $.ajax({
			    	   type:"post",
			    	   url:"/noob/changeEntering/findOrgOrderByOrgIdQuery.action",
			    	   async:false,
			    	   data:{"orgId":result.sendeeUnit},
			           success: function(result2){
			        	 var html = "";
						for (var i = result2.length-1;i>=0;i--) {
								html = html + "<option id='"
										+ result2[i].orgId + "' class='"+result2[i].parentId+"'>"
										+ result2[i].orgName
										+ "</option>";
						}
						$("#txt_save_sendeeUnit").append(html);
						$("#txt_save_sendeeUnit").selectpicker("refresh");
			           }
		        });
			}else{
				//设置下拉框的值为空
				toastr.error('未找到符合条件的工作单!');
			}
		}
    });
}


