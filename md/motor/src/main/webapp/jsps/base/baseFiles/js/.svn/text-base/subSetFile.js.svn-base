$(function() {
	//点击搜索
	$("#btn_querysf").click(function() {
		$("#archivesIdS").val("");
		//刷新表格
		$('#table-footer').bootstrapTable('refresh');
	});

	//添加框
	$("#ad_btn_f").click(
			function() {
             //清空下拉框
				$("#subSet_add_archivesId").children("option").remove();
				//加载下拉框
				$.ajax({
					url : "../../../../files/findAllArchivesNameQuery.action",
					type : "get",
					async : true,
					success : function(response) {
						var html = "";
						for (var i = 0; i < response.length; i++) {
							if (i == 0) {
								html = "<option selected id='"
										+ response[i].archivesId + "'>"
										+ response[i].archivesName
										+ "</option>";
							} else {
								html = html + "<option id='"
										+ response[i].archivesId + "'>"
										+ response[i].archivesName
										+ "</option>";
							}
						}
						
						$("#subSet_add_archivesId").append(html);
						$("#subSet_add_archivesId").selectpicker("refresh");
					}
				});

				$("#myModal-footer").modal("show");
			});

	//添加提交
	$("#subSetAdd")
			.click(
					function() {
						var archivesId = "";
						//获取基础档案的Id
						for (var i = 0; i < $("#subSet_add_archivesId")
								.children().length; i++) {
							if ($("#subSet_add_archivesId").children()[i].selected) {
								archivesId = $(
										$("#subSet_add_archivesId").children()[i])
										.attr("id");
							}
						}

						var subsetName = $('#subSet_add_subsetName').val();
						var mnemoniCode = $('#subSet_add_mnemoniCode').val();
						var description = $('#subSet_add_description').val();
                        
						if(subsetName.trim().length == 0){
			         		toastr.warning('名称呼不可为空!');
			       	    }else if(subsetValidateA() == true){
						$.ajax({
							type : "POST",
							url : "../../../../files/addsubSetFilesU.action",
							data : "subsetName=" + subsetName + "&archivesId="
									+ archivesId + "&mnemoniCode=" + mnemoniCode
									+ "&description=" + description + "",
							success : function(msg) {
								if (msg == "true") {
									 $('#subSet_add_subsetName').val("");
									 $('#subSet_add_mnemoniCode').val("");
									 $('#subSet_add_description').val("");
									 $("#myModal-footer").modal("hide");
									 $('#table-footer').bootstrapTable('refresh');
									 toastr.success('添加成功!');
								} else {
									toastr.error('添加失败!');

								}
							}

						});
			       	    }

					});

	//点击修改脚本打开模态框
	$("#btn_edit_f").click(function() {
		var select = $('#table-footer').bootstrapTable('getSelections');
		if (select.length === 0) {
			toastr.warning('请至少选择一行进行修改!');
		} else if (select.length > 1) {
			toastr.warning('不可同时修改多行!');
		} else {
			var subsetId = [];
			var subsetName = [];
			var mnemoniCode = [];
			var description = [];
			//获取单行数据
			for (var i = 0; i < select.length; i++) {
				subsetId[i] = select[i]['subsetId'];
				subsetName[i] = select[i]['subsetName'];
				mnemoniCode[i] = select[i]['mnemoniCode'];
				description[i] = select[i]['description'];
			}

			//给模态框赋值
			$("#subsetNameUp").val(subsetName);
			$("#mnemoniCodeUp").val(mnemoniCode);
			$("#subsetRemarksUp").val(description);

			$("#myModal-footer2").modal("show");

		}

	});

	//提交修改 
	$("#subset_editBtn")
			.click(
					function() {

						//获取单行数据集
						var select = $('#table-footer').bootstrapTable(
								'getSelections');

						//获取当前行数据
						var subsetId = [];
						var subsetNameR = [];
						var mnemoniCodeR = [];
						var descriptionR = [];
						for (var i = 0; i < select.length; i++) {
							subsetId[i] = select[i]['subsetId'];
							subsetNameR[i] = select[i]['subsetName'];
							mnemoniCodeR[i] = select[i]['mnemoniCode'];
							descriptionR[i] = select[i]['description'];
						}

						//获取输入框中数据
						var subsetName = $("#subsetNameUp").val();
						var mnemoniCode = $("#mnemoniCodeUp").val();
						var description = $("#subsetRemarksUp").val();

						//获取文本框中的值 判断是否修改了
						if (subsetName == subsetNameR
								&& mnemoniCode == mnemoniCodeR
								&& description == descriptionR) {
							toastr.warning('请修改数据!');
						} else if (subsetName.trim().length == 0) {
							toastr.warning('名字不可为空!');
						
						//如果行中的名字和文本框中值相等不做重名验证发送请求
						} else if(subsetName == subsetNameR){

							//未改动的字段发送空，不进行数据库操作
						/*	if (subsetName == subsetNameR) {
								subsetName = '';
							} else if (mnemoniCode == mnemoniCodeR) {
								mnemoniCode = '';
							} else if (description == descriptionR) {
								description = '';
							}*/
									$.ajax({
										type : "post",
										url : '../../../../files/updateSubsetFilesU.action',
										data : "subsetId=" + subsetId
												+ "&subsetName=" + subsetName
												+ "&mnemoniCode=" + mnemoniCode
												+ "&description=" + description
												+ "",
										success : function(msg) {
											if (msg == "true") {
												//清除弹窗原数据
												$("#subsetNameUp").val("");
												$("#mnemoniCodeUp").val("");
												$("#subsetRemarksUp").val("");

												$("#myModal-footer2").modal("hide");
												$('#table-footer').bootstrapTable('refresh');
												toastr.success('修改成功!');
											} else {
												toastr.error('修改失败!');
											}
										}
									});
						//如果行中的名字和文本框中值相等做重名验证发送请求...........................
						}else if(subsetValidateU() == true){
							//未改动的字段发送空，不进行数据库操作
							if (subsetName == subsetNameR) {
								subsetName = '';
							} else if (mnemoniCode == mnemoniCodeR) {
								mnemoniCode = '';
							} else if (description == descriptionR) {
								description = '';
							}
									$.ajax({
										type : "post",
										url : '../../../../files/updateSubsetFilesU.action',
										data : "subsetId=" + subsetId
												+ "&subsetName=" + subsetName
												+ "&mnemoniCode=" + mnemoniCode
												+ "&description=" + description
												+ "",
										success : function(msg) {
											if (msg == "true") {
												//清除弹窗原数据
												$("#subsetNameUp").val("");
												$("#mnemoniCodeUp").val("");
												$("#subsetRemarksUp").val("");

												$("#myModal-footer2").modal("hide");
												$('#table-footer').bootstrapTable('refresh');
												toastr.success('修改成功!');
											} else {
												toastr.error('修改失败!');
											}
										}
									});
						}

					});

	//点击删除
	$("#btn_delete_f").click(function() {
		var select = $('#table-footer').bootstrapTable('getSelections');

		if (select.length === 0) {
			toastr.warning('请至少选择一行进行删除!');

		} else {
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
					var subsetId = [];
					for (var i = 0; i < select.length; i++) {
						subsetId[i] = select[i]['subsetId'];
					}
					$.ajax({
						type : "GET",
						url : '../../../../files/deleteSubsetFilesU.action',
						data : "subsetId=" + subsetId + "",
						success : function(result) {
							if (result == "true") {
								//刷新表
		  			  		    $('#table-footer').bootstrapTable('refresh');
								toastr.success('删除成功!');
							} else {
								toastr.error('删除失败,选项中有被使用的辅助档案!');
							}
						}
					});
		
			    });
				
		   }
			
     });
});

//辅助档案添加同名验证函数
function subsetValidateA(){
	  //判断是需要验证修改和添加的名称框
	  var subsetNameA = $("#subSet_add_subsetName").val().trim();
	  var subsetNameU = $("#subsetNameUp").val("");
	  
	  var result = false;
	  
	  $.ajax({
		  url:"../../../../files/findSubsetFilesByNameQuery.action",
		  type:"post",
		  data:"subsetNameS="+subsetNameA+"&subsetNameS="+subsetNameU+"",
		  async:false,
		  success : function(msg) {
				if (msg == "false") {
					 toastr.success('名字不可重复!');
					
					 result = false;
				} else {
					 result = true;
				}
		  } 
	  });
	  
	  return result;
}

//辅助档案修改同名验证函数
function subsetValidateU(){
	  //判断是需要验证修改和添加的名称框
	  var subsetNameA = $("#subSet_add_subsetName").val("");
	  var subsetNameU = $("#subsetNameUp").val().trim();
	  
	  var result = false;
	  
	  $.ajax({
		  url:"../../../../files/findSubsetFilesByNameQuery.action",
		  type:"post",
		  data:"subsetNameS="+subsetNameA+"&subsetNameS="+subsetNameU+"",
		  async:false,
		  success : function(msg) {
				if (msg == "false") {
					 toastr.success('名字不可重复!');
					
					 result = false;
				} else {
					 result = true;
				}
		  } 
	  });
	  
	  return result;
}
