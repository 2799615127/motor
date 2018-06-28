
  
  $(function(){
	//1.初始化Table 
	var oTable = new TableInit();
	
	oTable.Init();

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
	
	selectDictionary("完整性状态",$("#integrityStateS"));
	selectDictionary("签收状态",$("#signInTypeS"));
	$("#startJobListTimeS").datetimepicker({
		format : "yyyy-mm-dd",
		autoclose : true,
		todayBtn : true,
		language : 'zh-CN',
		pickerPosition : "bottom-left",
		minView : 2,
		startDate : '2017-01-01',
		minDate:'1970-01-01',
		endDate:new Date() 
	    });
	
	$("#endJobListTimeS").datetimepicker({
		format : "yyyy-mm-dd",
		autoclose : true,
		todayBtn : true,
		language : 'zh-CN',
		pickerPosition : "bottom-left",
		minView : 2,
		startDate : '2017-01-01',
		minDate:'1970-01-01',
		endDate : new Date() 
	    });
	
	$.ajax({
		url:"../../../../jobListFind/findBillingOperationUnitS.action",
		type:"get",
		data:{
			"orgId":$("#orgIdH").val()
		},
		success:function(data){
			$.each(data,function(i){
				$('#billingOperationUnitS').append("<option value=" + data[i].orgId + ">" + data[i].orgName + "</option>");
			});
			$('#billingOperationUnitS').selectpicker('refresh');
		}
	});
	
	$("#btn_cancel").click(function(){
		var select = $('#jobListFindTb').bootstrapTable('getSelections');
		if (select.length === 0) {
			toastr.warning("请选择一行") ;
		} else if(select.length>1){
			toastr.warning("只能选择一行") ;
		}else{
			$.ajax({
				url:"../../../../jobListFind/cancelJobList.action",
				type:"get",
				data:{
					"jobListNo":select[0].jobListNo
				},
				success:function(data){
					if(data=="success"){
						toastr.success("成功作废");
					}else{
						toastr.error("失败");
					}
					$("#jobListFindTb").bootstrapTable("refresh",{
						url:"../../../../jobListFind/findSubJobList.action"
					});
				}
			});
		}
	});
	
	$("#btn_giveUpCancel").click(function(){
		var select = $('#jobListFindTb').bootstrapTable('getSelections');
		if (select.length === 0) {
			toastr.warning("请选择一行") ;
		} else if(select.length>1){
			toastr.warning("只能选择一行") ;
		}else if(select[0].cancelSign=="0"){
			toastr.warning("只能对作废的工作单进行取消作废") ;
		}else{
			$.ajax({
				url:"../../../../jobListFind/giveUpCancelJobList.action",
				type:"get",
				data:{
					"jobListNo":select[0].jobListNo
				},
				success:function(data){
					if(data=="success"){
						toastr.success("成功取消作废");
					}else{
						toastr.error("失败");
					}
					
					$("#jobListFindTb").bootstrapTable("refresh",{
						url:"../../../../jobListFind/findSubJobList.action"
					});
				}
			});
		}
	});
	
	
	$("#subFind").click(function(){
		$("#jobListFindTb").bootstrapTable("refresh",{
			url:"../../../../jobListFind/findSubJobList.action"
		});
	});
	
});


var TableInit = function() {
	var oTableInit = new Object();
	//初始化Table 
	oTableInit.Init = function() {
		$("#jobListFindTb").bootstrapTable({
			url:'',
			method : 'get', //请求方式（*） 
			toolbar : '#toolbar', //工具按钮用哪个容器 
			striped : true, //是否显示行间隔色 
			cache : false, //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*） 
			pagination : true, //是否显示分页（*） 
			sortable : false, //是否启用排序 
			sortOrder : "asc", //排序方式
			queryParams : oTableInit.queryParams,//传递参数（*） 
			sidePagination : "server", //分页方式：client客户端分页，server服务端分页（*） 
			pageNumber : 1, //初始化加载第一页，默认第一页 
			pageSize : 10, //每页的记录行数（*） 
			pageList : [ 10, 25, 50, 100 ], //可供选择的每页的行数（*） 
			strictSearch : true,
			showColumns : true, //是否显示所有的列 
			minimumCountColumns : 2, //最少允许的列数
			clickToSelect : true, //是否启用点击选中行 
			uniqueId : "jobListNo", //每一行的唯一标识，一般为主键列 
			detailView : false, //是否显示父子表
			rowStyle: function (row, index) {
                //这里有5个取值代表5中颜色['active', 'success', 'info', 'warning', 'danger'];
                var strclass = "";
                if (row.cancelSign == "1") {
                    strclass = 'danger';//还有一个active
                }
                else {
                    return {};
                }
                return { classes: strclass }
            },
			columns : [ {
				checkbox : true
			}, {
				field : 'jobListNo',
				title : '工作单号'
			}, {
				field : 'returnProductSign',
				title : '返单标志'
			}, {
				field : 'productName',
				title : '品名'
			},  {
				field : 'billingQuantity',
				title : '件数'
			} , {
				field : 'product',
				title : '产品'
			},
			{
				field : 'sender',
				title : '委托人'
			},
			{
				field : 'senderCellPhone',
				title : '委托电话'
			},
			{
				field : 'senderUnit',
				title : '委托单位'
			},
			{
				field : 'whither',
				title : '到达地'
			},
			{
				field : 'serviceTimeLimit',
				title : '希望到达时间',
				formatter:function(value,row,index){
					var e="<span>"+formatDate(value)+"</span> "
					return e;
				}
			},
			{
				field : 'addressee',
				title : '签收人'
			},
			{
				field : 'supplement',
				title : '补录人'
			},
			{
				field : 'currentSupplementaryUnit',
				title : '补录单位'
			},
			{
				field : 'patchUpTime',
				title : '补录时间',
				formatter:function(value,row,index){
					var e="<span>"+formatDate(value)+"</span> "
					return e;
				}
			}],
			 onDblClickRow: function (row) {
				 if (row.cancelSign == "1") {
					 toastr.warning("已作废的工作单无法修改");
				 }else{
				 var url ='jsps/delivery/receipt/jobListEntering/jobListEntering.jsp?jobListId='+row.jobListId+"&&orgName="+$("#myOrgNameIn").val();
				 var html ="<li style='border: medium none;'>"
         			+"<a id='"+url+"' style='rgb(0, 136, 204);' class='tab-title' onclick='menuAClick(this)' href='#myModal' data-toggle='tab'>" +
         					"<button class='am-btn am-btn-default am-radius am-btn-xs'>工作单录入" +
         					"</button>" +
         					"</a>"
        			+"<a class='am-close am-close-spin' onclick='closeBtn(this)' name='"+url+"'>&times;</a>"
        			+"</li>";
				 
				 $('.tab-title', window.parent.document).css("color","#0088CC");
		        $('.nav-tabs li', window.parent.document).css("border","none");
				 $('.nav-tabs', window.parent.document).append(html);
				 
				 $('#myModal', window.parent.document).attr("src",url);
			 }
		}
		});
	}
	oTableInit.queryParams = function(params) {
		
		var integrityState =$("#integrityStateS>option:selected").text();
		var billingOperationUnit =$("#billingOperationUnitS>option:selected").text();
		var signInType = $("#signInTypeS>option:selected").text();
		
		if(integrityState=="--请选择--"){
			integrityState ="";
		}
		if(billingOperationUnit=="--请选择--"){
			billingOperationUnit="";
		}
		if(signInType=="--请选择--"){
			signInType="";
		}
		
		
		var temp = {
			//这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的 
			limit : params.limit, //页面大小 
			offset : params.offset, //页码 
			jobListNo:$("#jobListCodeIn").val(),
			startJobListTime:$("#startJobListTimeS").val(),
			endJobListTime:$("#endJobListTimeS").val(),
			senderUnit:$("#senderUnitIn").val(),
			billingQuantity:$("#billingQuantityIn").val(),
			addresseeUnit:$("#addresseeUnitIn").val(),
			integrityState:integrityState,
			billingOperationUnit:billingOperationUnit,
			signInType:signInType
			
		};
		return temp;
	};
	
	return oTableInit;
}


function selectDictionary(myData,myId){
	$.ajax({
		url:"../../../../jobListEntering/selectDictionaryQuery.action",
		type:"get",
		data:{"archivesName":myData},
		success:function(data){
			$(myId).append("<option>--请选择--</option>");
			$.each(data,function(i){
				$(myId).append("<option value=" + data[i].subsetId + ">" + data[i].subsetName + "</option>");
			});
			$(myId).selectpicker('refresh');
		}
	});
}
function formatDate(ns){
	if(ns!=null&&ns!="null"&&ns!=""){
	var now = new Date(ns);
	var year = now.getYear()+1900;
	var month = now.getMonth()+1;
	var date = now.getDate();
	return year+"-"+month+"-"+date;
	}else{
		return " ";
	}
}

