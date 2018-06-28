$(function(){
	 toastr.options.positionClass = 'toast-top-center';
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
	
	//导入
	$('#btn_enter').click(function(){
		$('#enter').modal('show');
	});
	$('#enter').modal('show');
	//div下载在文件按钮点击事件
	$('#download a').click(function(e){
		e.preventDefault();
		$('#download').attr('class','active');
		$('#uploadLead').attr('class','');
		$('#step1').attr('aria-hidden',false).attr('class','bwizard-activated');
		$('#step2').attr('aria-hidden',true).attr('class','hide');
		$('#next').removeClass('hide');
		$('#after').addClass('hide');
		$('#over').addClass('hide');
	});
	
	$('#next').click(function(){
		$('#download').attr('class','');
		$('#uploadLead').attr('class','active');
		$('#step1').attr('aria-hidden',true).attr('class','hide');
		$('#step2').attr('aria-hidden',false).attr('class','bwizard-activated');
		$('#next').addClass('hide');
		$('#after').removeClass('hide');
		$('#over').removeClass('hide');
	});
	//div上传导入文件点击事件
	$('#uploadLead a').click(function(e){
		e.preventDefault();
		$('#download').attr('class','');
		$('#uploadLead').attr('class','active');
		$('#step1').attr('aria-hidden',true).attr('class','hide');
		$('#step2').attr('aria-hidden',false).attr('class','bwizard-activated');
		$('#next').addClass('hide');
		$('#after').removeClass('hide');
		$('#over').removeClass('hide');
	});
	$('#after').click(function(){
		$('#download').attr('class','active');
		$('#uploadLead').attr('class','');
		$('#step1').attr('aria-hidden',false).attr('class','bwizard-activated');
		$('#step2').attr('aria-hidden',true).attr('class','hide');
		$('#next').removeClass('hide');
		$('#after').addClass('hide');
		$('#over').addClass('hide');
	})
	//填写说明
	$('#btn_explain').click(function(){
		$('#remake').modal('show');
	});
	//批量生成工作单号
	$('#btn_batch').click(function(){
		var table = $('#tb_departments').bootstrapTable("getSelections");
		if(table.length==0){
			toastr.warning('至少选择一行');
		}else{
			/*$('#batch').modal('show');*/
			$.ajax({
				type:"POST",
				data:{num:table.length},
				url:"/noob/batchCreateWorkSheet.action",
				traditional: true,// 这里设置为true
	       		success:function(data){
		       		for(var i = 0;i<table.length;i++){
		       			var item = table[i];
		       			item.jobListNo=data[i].jobListNo;
		       			item.businessRecsiptNo=data[i].businessRecsiptNo;
		       			item.cuNo=data[i].cuNo;
		       			$('#tb_departments').bootstrapTable('updateRow', {index: item.index, row: item});
		       		}	 
      	        }
			});
			$('#btn_keep').attr('disabled', false);
		}
	});
	
	//保存
	$('#btn_keep').click(function(){
		var table = $('#tb_departments').bootstrapTable("getSelections");
		if(table.length==0){
			toastr.warning('至少选择一行');
		}else{
			$('#keep').modal('show');
			//获取取件人工号
			$("#empNum").select2({
				ajax: {
					language: "zh-CN", //设置 提示语言
				    url: "/noob/appointStaffNum.action",
				    data: function (params) {
				        var query = {
				          address: table[0]["senderAddress"],
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
				  
				  placeholder: '',
				  escapeMarkup: function (markup) { return markup; }, // let our custom formatter work
				  minimumInputLength: 0,
				  templateResult: function formatRepo(repo){
				  	  return repo.text;  
				  }, 
				  templateSelection:function formatRepoSelection(repo){
					  return repo.text;
				  }
			})
			
		}
		//指定取派员
		$("#addImport").click(function(){
			var sr = $("#empNum").val();
			var ss = $("#empName").val();
			var select = $('#tb_departments').bootstrapTable('getSelections');
			for (var i = 0; i < select.length; i++) {
				var item = select[i];
				item.getProductManId= sr;
				item.getProductManName = ss;
				$('#tb_departments').bootstrapTable('updateRow', {
					index : item.index,
					row : item
				});
			}
			toastr.success("指定成功");
			$('#keep').modal('hide');
			//指定取派员打开
			$("#btn_save").attr('disabled',false); 
		});
		
		//保存到数据库
		$('#btn_save').click(function(){
			var flag = false;
			var select = $('#tb_departments').bootstrapTable(
			'getSelections');
			if(select.length==0){
				toastr.warning('至少选择一行');
			}else{
				for(var i=0;i<select.length;i++){
					if(select[i].product==""||select[i].product==null
							||select[i].whither==""||select[i].whither==null
							||select[i].mannedRequire==""||select[i].mannedRequire==null
							||select[i].sender==""||select[i].sender==null
							||select[i].senderAddress==""||select[i].senderAddress==null
							||select[i].senderPhone==""||select[i].senderPhone==null
							||select[i].addressee==""||select[i].addressee==null
							||select[i].addresseeAddress==""||select[i].addresseeAddress==null
							||select[i].addresseePhone==""||select[i].addresseePhone==null
							||select[i].methodOfSettlingAccounts==""||select[i].methodOfSettlingAccounts==null
							||select[i].agencyFund==""||select[i].agencyFund==null
							||select[i].cameCollect==""||select[i].cameCollect==null){
						flag = true;
						break;
					}
				}
			}
			
			if(flag){
				toastr.warning('信息不完整');
			}else{
				for (var i = 0; i < table.length; i++) {
					$.ajax({
						type:"POST",
						url:"/noob/addWorkSheetImport.action",
						data:{
							jobListNo:table[i]["jobListNo"],businessRecsiptNo:table[i]["businessRecsiptNo"],
							cuNo:table[i]["cuNo"],product:table[i]["product"],whither:table[i]["whither"],
							getProductManId:$('#empNum').val(),getProductManName:$('#empName').val(),
							mannedRequire:table[i]["mannedRequire"],sender:table[i]["sender"],
							senderAddress:table[i]["senderAddress"],senderUnit:table[i]["senderUnit"],senderPhone:table[i]["senderPhone"],
							senderCellPhone:table[i]["senderCellPhone"],senderZipCode:table[i]["senderZipCode"],senderNo:table[i]["senderNo"],
							addressee:table[i]["addressee"],addresseeAddress:table[i]["addresseeAddress"],
							addresseeUnit:table[i]["addresseeUnit"],addresseePhone:table[i]["addresseePhone"],addresseeCellPhone:table[i]["addresseeCellPhone"],
							recipientZipCode:table[i]["recipientZipCode"],factWeight:table[i]["factWeight"],nameOfAPart:table[i]["nameOfAPart"],
							size:table[i]["size"],safeType:table[i]["safeType"],safeMoney:table[i]["safeMoney"],
							declaredValue:table[i]["declaredValue"],originalPackage:table[i]["originalPackage"],actualPacking:table[i]["actualPacking"],
							bagging:table[i]["bagging"],packingRequirement:table[i]["packingRequirement"],factQuantity:table[i]["factQuantity"],
							chargedWeight:table[i]["chargedWeight"],precharge:table[i]["precharge"],
							methodOfSettlingAccounts:table[i]["methodOfSettlingAccounts"],agencyFund:table[i]["agencyFund"],cameCollect:table[i]["cameCollect"],
							feedbackSign:table[i]["feedbackSign"],collectTheGoodsOnHolidays:table[i]["collectTheGoodsOnHolidays"],serviceTimeLimits:table[i]["serviceTimeLimit"],
							processMode:table[i]["processMode"],signBack:table[i]["signBack"],important:table[i]["important"]
						},
					});
					toastr.success('保存成功');
					//保存打开
					$('#btn_save').attr('disabled', false);
				}
			}
			
			
		});
	});
	
	//获取取件人
	$('#empNum').change(function(){
		$.ajax({
			type:'post',
			url:'/noob/appointStaffName.action',
			data:{staffNumber:$('#empNum').val()},
			traditional:true,
			success:function(data){
				$('#empName').val(data.staffName);
			}
		});
	});
	
	//下载模板
	$('#downloadBorder').click(function(){
		$.post('/noob/findDownLoadBorder.action',{date:new Date()},function(action){
			$('#dddd').find(".modal-body").html("");
			$.each(action,function(i,item){		
				var qwe =$('<div><label><input type="checkbox" class="class"></label></div>');
					qwe.append(item).find("input").attr('name','filename').attr('value',item);
					$('#dddd').find(".modal-body").append(qwe);	
			});
		});
		$('#modal').modal('show');
	});
	//导入上传
   $("#input-file").fileinput({
        uploadUrl: "/noob/uploadWorkSheetLead.action",
        language : 'zh',//设置语言
        maxFileCount: 1,
        allowedFileExtensions : ['xls', 'xlsx']//接收的文件后缀
    }).on("fileuploaded", function (event, data, previewId, index) {
    	$('#enter').modal('hide');
    	//初始化表格
        var oTable = new TableInit();
    	oTable.Init(data.response.list);
    	
    	//清除之前的文件
    	$(".kv-file-remove").trigger("click");
    	
    	//年月日
    	/*$(".serviceTimeLimitD").datetimepicker({
    		format : "yyyy-mm-dd",
    		autoclose : true,
    		todayBtn : true,
    		language : 'zh-CN',
    		pickerPosition : "bottom-left",
    		minView : 2,
    		startDate : new Date(),
    		minDate:new Date(),
    	});*/
    	
    	//导入框判断
    	$('#dowload').hide();
    	if(data.response.status=="success"){
			toastr.success("导入成功");
			$("#btn_enter").attr('disabled',true);
			$("#btn_batch").attr('disabled',false);
			$("#btn_save").attr('disabled',true);
		}else{
			toastr.error("导入失败");
		}
  });
   
});
//下载中的弹框
function check(){
	//fileinput-upload-button
	var checks = $('.class:checked');
	var len = checks.length;
	if(len==0){
		toastr.warning("请选中复选框");
		return false;
	}else{
		return true;
	}
}
//时间格式
function formatDate(ns){
	var now = new Date(ns);
	var year = now.getYear()+1900;
	var month = now.getMonth()+1;
	var date = now.getDate();
	return year+"-"+month+"-"+date;
}
//页面表格
var TableInit = function() {
	var oTableInit = new Object();
	//初始化Table 
	oTableInit.Init = function(data) {
		$('#tb_departments').bootstrapTable({
			data:data,
			toolbar : '#toolbar', //工具按钮用哪个容器 
			striped : true, //是否显示行间隔色 
			cache : false, //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*） 
			pagination : true, //是否显示分页（*） 
			sortable : false, //是否启用排序 
			sortOrder : "asc", //排序方式
			queryParams : oTableInit.queryParams,
			sidePagination : "client", //分页方式：client客户端分页，server服务端分页（*） 
			pageNumber : 1, //初始化加载第一页，默认第一页 
			pageSize : 3, //每页的记录行数（*） 
			pageList : [ 5, 10, 50,100 ], //可供选择的每页的行数（*） 	
			search : false, //是否显示表格搜索，此搜索是客户端搜索，不会进服务端，所以，个人感觉意义不大 
			strictSearch : true,
			showColumns : true, //是否显示所有的列 
			showRefresh : true, //是否显示刷新按钮
			minimumCountColumns :2, //最少允许的列数
			clickToSelect : true, //是否启用点击选中行 
			height : 370, //表格高度
			uniqueId : "jobListId", //每一行的唯一标识，一般为主键列 
			showToggle : true, //是否显示详细	视图和列表视图的切换按钮 
			cardView : false, //是否显示详细视图
			detailView : false, //是否显示父子表
		    
			columns : [ {
				checkbox : true
			}, {
				field : 'jobListNo',
				title : '工作单号',
			}, {
				field : 'businessRecsiptNo',
				title : '业务通知单号'
			}, {
				field : 'cuNo',
				title : '客户单号'
			}, {
				field : 'product',
				title : '产品　',
				editable : {
					type : 'text',
					title : '产品'
				}
			}, {
				field : 'whither',
				title : '到达地　　　',
				editable : {
					type : 'text',
					title : '到达地'
				}
			}, {
				field : 'getProductManId',
				title : '取货人工号'
			}, {
				field : 'getProductManName',
				title : '取货人姓名'
			}, {
				field : 'mannedRequire',
				title : '配载要求　',
				editable : {
					type : 'text',
					title : '配载要求'
				}
			}, {
				field : 'sender',
				title : '寄件人',
				editable : {
					type : 'text',
					title : '寄件人',
					validate : function(v) {
						if (v == null || v == '' || v == ' ')
							return '寄件人不能为空';
					}
				}
			},{
				field : 'senderAddress',
				title : '寄件人地址　　　　　',
				editable : {
					type : 'text',
					title : '寄件人地址',
					validate : function(v) {
						if (v == null || v == '' || v == ' ')
							return '寄件人地址不能为空';
					}
				}
			}, {
				field : 'senderUnit',
				title : '寄件人单位　',
			}, {
				field : 'senderPhone',
				title : '寄件人电话',
				editable : {
					type : 'text',
					title : '寄件人电话',
					validate : function(v) {
						if (v == null || v == '' || v == ' ')
							return '寄件人电话不能为空';
						if (!(/^1[34578]\d{9}$/.test(v))) {
							return '手机格式不正确';
						}
					}
				}
			}, {
				field : 'senderCellPhone',
				title : '寄件人手机'
			}, {
				field : 'senderZipCode',
				title : '寄件人邮编'
			}, {
				field : 'senderNo',
				title : '寄件人编号'
			}, {
				field : 'addressee',
				title : '收件人',
				editable : {
					type : 'text',
					title : '收件人',
					validate : function(v) {
						if (v == null || v == '' || v == ' ')
							return '收件人不能为空';
					}
				}
			}, {
				field : 'addresseeAddress',
				title : '收件人地址　　　　　',
				editable : {
					type : 'text',
					title : '收件人地址',
					validate : function(v) {
						if (v == null || v == '' || v == ' ')
							return '收件人地址不能为空';
					}
				}
			}, {
				field : 'addresseeUnit',
				title : '收件人单位'
			}, {
				field : 'addresseePhone',
				title : '收件人电话',
				editable : {
					type : 'text',
					title : '收件人电话',
					validate : function(v) {
						if (v == null || v == '' || v == ' ')
							return '收件人不能为空';
						if (!(/^1[34578]\d{9}$/.test(v))) {
							return '手机格式不正确';
						}
					}
				}
			}, {
				field : 'addresseeCellPhone',
				title : '收件人手机'
			}, {
				field : 'recipientZipCode',
				title : '收件人邮编'
			}, {
				field : 'factWeight',
				title : '实际重量'
			}, {
				field : 'nameOfAPart',
				title : '品名'
			}, {
				field : 'size',
				title : '体积'
			}, {
				field : 'safeType',
				title : '保险类型'
			}, {
				field : 'safeMoney',
				title : '保险费',
			}, {
				field : 'declaredValue',
				title : '声明价值'
			}, {
				field : 'originalPackage',
				title : '原包装'
			}, {
				field : 'actualPacking',
				title : '实际包装'
			}, {
				field : 'bagging',
				title : '包装费'
			}, {
				field : 'packingRequirement',
				title : '包装要求'
			}, {
				field : 'factQuantity',
				title : '实际件数'
			}, {
				field : 'chargedWeight',
				title : '计费重量'
			}, {
				field : 'precharge',
				title : '预收费'
			}, {
				field : 'methodOfSettlingAccounts',
				title : '结算方式',
				editable : {
					type : 'text',
					title : '结算方式',
					validate : function(v) {
						if (v == null || v == '' || v == ' ')
							return '结算方式不能为空';
					}
				}
			}, {
				field : 'agencyFund',
				title : '代收款',
				editable : {
					type : 'text',
					title : '代收款',
					validate : function(v) {
						if (v == null || v == '' || v == ' ')
							return '代收款不能为空';
					}
				}
			}, {
				field : 'cameCollect',
				title : '到付款',
				editable : {
					type : 'text',
					title : '到付款',
					validate : function(v) {
						if (v == null || v == '' || v == ' ')
							return '到付款不能为空';
					}
				}
			}, {
				field : 'feedbackSign',
				title : '反馈签收',
			}, {
				field : 'collectTheGoodsOnHolidays',
				title : '节假日可以收货',
			}, {
				field : 'serviceTimeLimit',
				title : '送达时限  ',
				/*formatter:function(value,row,index){
					var e="<input type='text' class='serviceTimeLimitD'value="+formatDate(value)+">"
					return e;
				}*/
				editable : {
					type : 'date',
					title : '送达时限'
				}
			}, {
				field : 'processMode',
				title : '处理方式　　　　　'
			}, {
				field : 'signBack',
				title : '签单返回'
			}, {
				field : 'important',
				title : '重要提示'
			}]
		});
		
	}; 

	return oTableInit;
};