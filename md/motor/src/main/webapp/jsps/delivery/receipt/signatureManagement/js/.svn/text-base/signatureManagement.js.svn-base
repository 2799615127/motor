var i=0;
$(function(){
	selectDictionary("签单返回","#returnBillType");
	selectDictionary("签单返回","#replaceType");
	
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
	
	var oTable = new TableInit();
	
	oTable.Init();
	
	$("#btn_addJobList").click(function(){
		var allTableData =$("#myTable").bootstrapTable('getData');//获取表格的所有内容行  
		var row = {
				Number:i+1,
				jobListNo:"<input type='text' class='myJobListInput form-control' value='noob'/>"
		}
		if(i<=0){
			$("#myTable").bootstrapTable('insertRow', {index: i, row: row});
			i++;
			$("#totalVotes").val(i);
		}else{
			if(allTableData[i-1].methodOfSettlingAccounts==undefined){
				toastr.warning("请先单击回车通过输入的工作单号获得对应签单信息");
			}else{
				$("#myTable").bootstrapTable('insertRow', {index: i, row: row});
				i++;
				$("#totalVotes").val(i);
			}
		}
	});
	
	$("#btn_addReturnNote").click(function(){
		var select = $('#myTable').bootstrapTable('getSelections');
		if(select.length<=0){
			toastr.warning("请先录入工作单");
		}else if(select.length>1){
			toastr.warning("一次只能添加一个返单备注");
		}else if(select[0].returnType==undefined){
			toastr.warning("请先单击回车通过输入的工作单号获得对应签单信息");
		}else{
			$("#addModel").modal("show");
			$("#subReturnNote").click(function(){
					$("#myTable").bootstrapTable('updateCell',{index:parseInt(select[0].Number)-1,field:'returnNote',value:$("#addReturnNoteIn").val()});
			});
		}
	});
	
	$("#btn_add").click(function(){
		if($("#repeatOrderIdIn").val()=="双击获取"){
			toastr.warning("请先获取返单号");
		}else if($("#receiveUnit>option:selected").val()=="--请选择--"){
			toastr.warning("请先选择接收单位");
		}else if($("#totalVotes").val()=="0"){
			toastr.warning("请先录入工作单");
		}else if($(".danger").length>0){
			toastr.warning("数据有误，请检查返单备注");
		}else{
			var allTableData =$("#myTable").bootstrapTable('getData');
			var myList = new Array();
			for(var k=0;k<allTableData.length;k++){
				allTableData[k].Number = undefined;
				allTableData[k].checkbox = undefined;
				myList.push(allTableData[k]);
			}
			$.ajax({
				url:"../../../../signatureManagement/signatureAdd.action",
				type:"get",
				traditional:true,//阻止深度序列化
				data:{
					repeatOrderId:$("#repeatOrderIdIn").val(),
					totalVotes:$("#totalVotes").val(),
					jobOffer:$("#receiveUnit>option:selected").text(),
					myList:JSON.stringify(myList)
				},
				success:function(data){
					if(data=="success"){
						toastr.success("成功");
						$("#repeatOrderIdIn").val("双击获取");
						$("#totalVotes").val(0);
						$("#myTable").bootstrapTable('removeAll');
						i=0;
						$("#receiveUnit>option:eq("+0+")").attr("selected",true);
						
					}else{
						toastr.error("失败");
					}
				}
			})
		}
	});
	
	$("#btn_update").click(function(){
		var select = $('#myTable').bootstrapTable('getSelections');
		if(select.length<=0){
			toastr.warning("至少选择一行进行替换");
		}else{
			for(var k=0;k<select.length;k++){
				if(select[k].returnType==undefined){
					toastr.warning("请先通过工作单号获得工作单详情");
				}else{
					
					var row  ={
    						Number:select[k].Number,
    						jobListNo:select[k].jobListNo,
    						returnType:$("#replaceType>option:selected").text(),
    						methodOfSettlingAccounts:select[k].methodOfSettlingAccounts,
    						whetherOrNotToPay:select[k].whetherOrNotToPay,
    						whetherTSCIITSC:select[k].whetherTSCIITSC,
    						returnRequest:select[k].returnRequest,
    						senderUnit:select[k].senderUnit,
    						receiveUnit:select[k].receiveUnit,
    						sendee:select[k].sendee,
    						receiptTime:select[k].receiptTime,
    				   };
    				   /*selectDictionary("签单返回",".mySelect:eq("+(i-1)+")");*/
    				   $("#myTable").bootstrapTable('updateRow', {index: parseInt(row.Number)-1, row: row});
				}
			}
		}
	});
	
	
	$("#repeatOrderIdIn").dblclick(function(){
		$.ajax({
			url:"../../../../jobListEntering/getJobListNo.action",
			type:"post",
			success:function(data){
				$("#repeatOrderIdIn").val(data)
			}
		});
	});
	 
	$(document).keypress(function(e) { 
	    // 回车键事件 
	       if(e.which == 13) { 
	    	   if($(".myJobListInput")[0].value=="noob"){
	    		   toastr.warning("请输入工作单号再回车查询");
	    	   }else{
	    		   var allTableData =$("#myTable").bootstrapTable('getData');
	    		   var flag = true;
	    		   for(var j=0;j<allTableData.length;j++){
	    			   if($(".myJobListInput")[0].value==allTableData[j].jobListNo){
	    				   toastr.warning("重复工作单无法录入");
	    				   flag = false;
	    				   break;
	    			   }
	    		   }
	    		   if(flag){
	    		   $.ajax({
	    			   url:"../../../../signatureManagement/signatureFind.action",
	    			   type:"get",
	    			   data:{
	    				   jobListNo:$(".myJobListInput")[0].value
	    			   },
	    			   success:function(data){
	    				   if(data.methodOfSettlingAccounts!=null&&data.methodOfSettlingAccounts!="null"){
	    				   var row  ={
	    						Number:i,
	    						jobListNo:$(".myJobListInput")[0].value,
	    						returnType:data.returnRequest,
	    						methodOfSettlingAccounts:data.methodOfSettlingAccounts,
	    						whetherOrNotToPay:data.whetherOrNotToPay,
	    						whetherTSCIITSC:data.whetherTSCIITSC,
	    						returnRequest:data.returnRequest,
	    						senderUnit:data.senderUnit,
	    						receiveUnit:data.receiveUnit,
	    						sendee:data.sendee,
	    						receiptTime:data.receiptTime,
	    				   };
	    				   /*selectDictionary("签单返回",".mySelect:eq("+(i-1)+")");*/
	    				   $("#myTable").bootstrapTable('updateRow', {index: i-1, row: row});
	    			   }else{
	    				   toastr.warning("未查询到该工作单");
	    			   }
	    			   }
	    			});
	    		   };
	    	   }
	       } 
	}); 
	$("#receiveUnit").select2({
		tags:true
	});
	
	$.ajax({
		url:"../../../../signatureManagement/findUnit.action",
		type:"get",
		success:function(data){
			$("#receiveUnit").append("<option>--请选择--</option>")
			$.each(data,function(i){
				$("#receiveUnit").append("<option value=" + data[i].orgId + ">" + data[i].orgName + "</option>");
			});
			$("#receiveUnit").selectpicker('refresh');
		}
	});
	
});

var TableInit = function() {
	var oTableInit = new Object();
	//初始化Table 
	oTableInit.Init = function() {
		$("#myTable").bootstrapTable({
			url:'',
			method : 'get', //请求方式（*） 
			striped : true, //是否显示行间隔色 
			cache : false, //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*） 
			pagination : false, //是否显示分页（*） 
			sortable : false, //是否启用排序 
			sortOrder : "asc", //排序方式
			sidePagination : "server", //分页方式：client客户端分页，server服务端分页（*） 
			pageNumber : 1, //初始化加载第一页，默认第一页 
			pageSize : 10, //每页的记录行数（*） 
			height:600,
			pageList : [ 10, 25, 50, 100 ], //可供选择的每页的行数（*） 
			//showColumns : true, //是否显示所有的列 
			minimumCountColumns : 2, //最少允许的列数
			clickToSelect : true, //是否启用点击选中行 
			uniqueId : "Number", //每一行的唯一标识，一般为主键列 
			detailView : false, //是否显示父子表
			rowStyle: function (row, index) {
                //这里有5个取值代表5中颜色['active', 'success', 'info', 'warning', 'danger'];
                var strclass = "";
                if (row.returnType != row.returnRequest&&row.returnNote==undefined) {
                    strclass = 'danger';//还有一个active
                }
                else {
                    return {};
                }
                return { classes: strclass }
            },
			columns : [{
				field:'checkbox',
				checkbox : true,
			},{  
				field: 'Number',//可不加  
				title: '序号',//标题  可不加  
                width:30
            }, {
				field : 'jobListNo',
				title : '工作单号',
				width:180
			}, {
				field : 'returnType',
				title : '返单类型',
				width:120
			}, {
				field : 'methodOfSettlingAccounts',
				title : '结算方式'
			},  {
				field : 'whetherOrNotToPay',
				title : '是否到付'
			} , {
				field : 'whetherTSCIITSC',
				title : '是否同城'
			},
			{
				field : 'returnRequest',
				title : '返单要求'
			},
			{
				field : 'senderUnit',
				title : '委托单位'
			},
			{
				field : 'receiveUnit',
				title : '收件单位'
			},{
				field : 'sendee',
				title : '收件人'
			},
			{
				field : 'receiptTime',
				title : '收件时间'
			},{
				field : 'returnNote',
				title : '返单备注'
			}],
			onDblClickRow:function(row,e,field){
					i--;
					$("#totalVotes").val(i);
					onRemove(row.Number);
					var allTableData =$("#myTable").bootstrapTable('getData');//获取表格的所有内容行  
					for(var k=0;k<allTableData.length;k++){
						if(allTableData[k].Number>row.Number){
							$("#myTable").bootstrapTable('updateCell',{index:k,field:'Number',value:parseInt(allTableData[k].Number)-1});
						}
					}
			}
		});
	}
	
	oTableInit.queryParams = function(params) {
		var temp = {
			//这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的 
			limit : params.limit, //页面大小 
			offset : params.offset, //页码 
		};
		return temp;
	}
	
	return oTableInit;
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

function onRemove(id){
	$("#myTable").bootstrapTable('remove',{
		field:'Number',
		values:[parseInt(id)]
	})
}
