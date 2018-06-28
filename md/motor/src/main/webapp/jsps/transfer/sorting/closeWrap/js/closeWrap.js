$(function() {

	
	$.ajax({
		url:"../../../../findAllMannedRequire.action",
		type:"get",
		dataType:"json",
		success:function(data){
			$.each(data,function(i,item){
				$('#edit_mannedRequire').append("<option value=" + item.subsetName + ">" + item.subsetName + "</option>");
			});
			$(".selectpicker" ).selectpicker("refresh");
		},
		error:function(data){
		}
	});
	//点击添加脚本打开模态框
	$("#add_btn").click(function() {
		//获得封签号
		$.ajax({
			url:"../../../../getSealNo.action",
			type:"post",
			success:function(data){
				$("#close_sealNo").val(data)
			}
		});
		var select = $('#table-footer').bootstrapTable('getSelections');

		if (select.length === 0) {
			toastr.warning('请至少选择一行进行合包!');
		}else{
			//获得用户名
			obj=$("#userName").val();
		      $("#close_username").val(obj);
		      var oddNo1 = [];
				for(var i=0;i<select.length;i++){
					var oddNumber = select[i].oddNumber;
					oddNo1.push(oddNumber);
				}
				//定义一个变量
				var packData=null;
				$.post('../../../../fileup.action',{strings:oddNo1},function(data){
					$("#table-bottom").bootstrapTable('removeAll');
					$('#table-bottom').bootstrapTable('append', data);
					//变量接受table-bottom表单里的数据
					packData=data;
					//定义变量
					var totalPackages = 0;
					var votes = 0;
					var totalWeight = 0;
					var totalVolume = 0;
					//遍历table-bottom表单里的数据
					for(var i=0;i<packData.length;i++){
						var destination = packData[i].whither;
						var vote = packData[i].poll;
						votes+=vote;
						var number = packData[i].factQuantity;
						totalPackages+=number;
						var actualWeight = packData[i].factWeight;
						totalWeight+=actualWeight;
						var volume = packData[i].size;
						totalVolume+=volume;
						var serviceTimeLimit=packData[i].serviceTimeLimit;
						var stowageRequirement = packData[i].mannedRequire;
					}
					//上传到input框
					$('#close_arriveLocal').val(destination);
					$('#close_totalPoll').val(votes);
					$('#close_Number').val(totalPackages);
					$('#close_weight').val(totalWeight);
					$('#close_volume').val(totalVolume);
					$('#close_time').val(FormatDate(serviceTimeLimit));
					$('#close_mannedRequire').val(stowageRequirement);
				})
				
		      
				$("#myModal").modal("show");
				$('#btn_add').click(function(){
				
					var listO = $('#table-bottom').bootstrapTable('getData');
					var listP = listO.slice(0);
					$.each(listP,function(i,item){
						delete item['0'];
						delete item['serviceTimeLimit'];
					});
					var obj = {
						closeWrapId:$('#close_closeNo').val(),
						sealNo:$('#close_sealNo').val(),
						whither:$('#close_arriveLocal').val(),
						totalPoll:$('#close_totalPoll').val(),
						totalNumber:$('#close_Number').val(),
						totalWeight:$('#close_weight').val(),
						serviceTimeLimit:$('#close_time').val(),
						mannedRequire:$('#close_mannedRequire').val(),
						totalVolume:$('#close_volume').val(),
						username:$('#close_username').val(),
						closeWrapDetail:listP
					};
					 if($('#close_closeNo').val()==''||$('#close_closeNo').val()==null){
						 toastr.warning('合包号不能为空,请双击可获取!');
					 }else{
					$.ajax({
						url:"../../../../addCloseWrap.action",
						type:"post",
						data:{closeWrap:JSON.stringify(obj)},
						dataType:'json',
						traditional:true,
						success:function(data){
							if (data.status == "success") {
								toastr.success('成功!');
							var objs = $('#table-footer').bootstrapTable('getSelections');
							 var str =[]
							 for(var i=0;i<objs.length;i++){
								 str.push(objs[i].oddNumber)
							 }
								$("#table-footer").bootstrapTable('remove', {field: 'oddNumber', values: str})
								//刷新表
								$("#myModal").modal("hide");
								$('#tb_departments').bootstrapTable('refresh',{
									url : '../../../../closeWrapPageQuery.action'
									});
							} else {
								toastr.error('失败!');
							}
						}
					});
					 }
					
				});
		}
	})
		
		

	
	//点击修改打开模态框，
	$("#btn_edit").click(function() {
	
		// 获取单行数据
		var select = $('#tb_departments')
				.bootstrapTable('getSelections');
		if(select.length !=1 ){
			toastr.warning('请选择一行');
		}else{
		var closeId=select[0]['closeId'];
		
	
		//点修改的保存
		$("#editModal").modal("show");
		
		$.ajax({
			url:"../../../../closeEditQuery.action",
			type:"post",
			data: {closeId:closeId},
			success:function(paramMaps){
			$("#edit_CloseWrapId").val(paramMaps.closeWrap.closeWrapId)
			$("#edit_sealNo").val(paramMaps.closeWrap.sealNo)
			$("#edit_contacts").val(paramMaps.closeWrap.whither);
			$("#edit_tele").val(paramMaps.closeWrap.serviceTimeLimit);
			$("#edit_poll").val(paramMaps.closeWrap.totalPoll);
			$("#edit_number").val(paramMaps.closeWrap.totalNumber);
			$("#edit_weight").val(paramMaps.closeWrap.totalWeight);
			$("#edit_mannedRequire").val(paramMaps.closeWrap.mannedRequire);
			obj=$("#userName").val();
		      $("#edit_username").val(obj)
			$("#edit_volume").val(paramMaps.closeWrap.totalVolume);
			$("#table-edit").bootstrapTable('load',paramMaps.closeWrapDetail);
			
			}
		});
		}
	})
	$("#endit").click(function(){
		// 获取单行数据
		var select = $('#tb_departments')
				.bootstrapTable('getSelections');
		
		var closeId=select[0]['closeId'];
		if($("#edit_contacts").val()==null||$("#edit_contacts").val()==''){
			toastr
			.warning('到达地不能为空!');
		}else{
     	$.ajax({
			type : "GET",
			url : '../../../../updateCloseU.action',
			async : false,
			data : {
				newWhither : $("#edit_contacts").val(),
				newMannedRequire : $("#edit_mannedRequire").val(),
				newUsername :$("#edit_username").val(),
				closeId :closeId
			},
			success : function(
					result) {
				if (result == "success") {
					$("#editModal").modal("hide");
					toastr
							.success('修改成功!');
				} else {
					toastr
							.error('修改失败!');
				}
				$('#tb_departments').bootstrapTable('refresh',{
					url : '../../../closeWrapPageQuery.action'
					});
								
			
			}

		});
		}
	})
	

     // 点击接受数据打开模态框
     
	$("#btn_accept").click(function() {
		$("#myModal2").modal('show');

	})
      //点击删除合包
	$("#btn_delete").click(function() {
		var select = $('#tb_departments').bootstrapTable('getSelections');

		if (select.length != 1) {
			toastr.warning('请选择一行进行删除!');

		} else {

			swal({
				title : "操作提示", //弹出框的title  
				text : "确定删除吗？", //弹出框里面的提示文本  
				type : "warning", //弹出框类型  
				showCancelButton : true, //是否显示取消按钮  
				confirmButtonColor : "#DD6B55",//确定按钮颜色  
				cancelButtonText : "取消",//取消按钮文本  
				confirmButtonText : "是的，确定删除！",//确定按钮上面的文档  
				closeOnConfirm : true
			}, function() {
				var closeId = [];
				for (var i = 0; i < select.length; i++) {
					closeId[i] = select[i]['closeId'];
				}

				$.ajax({
					type : "GET",
					url : '../../../../deleteCloseWrapU.action',
					data : "closeId=" + closeId + "",
					success : function(result) {
						if (result == "true") {
							toastr.success('删除成功!');
							//刷新表
							$('#tb_departments').bootstrapTable('refresh');
							$('#table-footer').bootstrapTable('refresh');
						} else {
							toastr.error('删除失败!');
						}
					}
				});
			});

		}

	})


	document.onkeydown = function(e) {
		e = e || event;
		if (e.keyCode == 46) { //判断是否单击的delete按键
			var select = $('#table-footer').bootstrapTable('getSelections');

			if (select.length === 0) {
				toastr.warning('请至少选择一行进行删除!');

			} else {
				swal({
					title : "操作提示", //弹出框的title  
					text : "确定删除吗？", //弹出框里面的提示文本  
					type : "warning", //弹出框类型  
					showCancelButton : true, //是否显示取消按钮  
					confirmButtonColor : "#DD6B55",//确定按钮颜色  
					cancelButtonText : "取消",//取消按钮文本  
					confirmButtonText : "是的，确定删除！",//确定按钮上面的文档  
					closeOnConfirm : true
				}, function() {
					var objs = $('#table-footer').bootstrapTable('getSelections');
					 var str =[]
					 for(var i=0;i<objs.length;i++){
						 str.push(objs[i].oddNumber)
					 }
						$("#table-footer").bootstrapTable('remove', {field: 'oddNumber', values: str})
						
						$('#table-footer').bootstrapTable('refresh');
						toastr.success('删除成功!');
				});

			}
			return false;
		}
	}
	//双击获取合包号
	$("#close_closeNo").dblclick(function(){
		$.ajax({
			url:"../../../../getCloseWrapId.action",
			type:"post",
			success:function(data){
				$("#close_closeNo").val(data)
			}
		});
	});

});

function FormatDate (strTime) {
    var date = new Date(strTime);
    return date.getFullYear()+"-"+(date.getMonth()+1)+"-"+date.getDate()+" "+date.getHours()+":"+date.getMinutes()+":"+date.getSeconds();
}

