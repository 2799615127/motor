$(function () {
	 //1.初始化Table
   var oTable = new TableInit();
   oTable.Init();
  
  //点击添加脚本打开模态框
   $("#ad_btn").click(function () {  
       $("#myModal").modal("show");  
   }); 
  
   //提交添加
      $("#baseAddBtn").click(function(){
       	  var archivesName = $('#archivesNameAdd').val();
       	  var classification =  $("#yes").val();
       	  var description = $('#description').val();
       	  
       	  if(archivesName.trim().length == 0){
         		toastr.warning('名称呼不可为空!');
       	    
       	  }else if(basevalidateA() == true){
       	     $.ajax({
	  	    	   type: "GET",
	  	    	   url: "../../../../files/addBaseFilesU.action",
	  	    	   data:"archivesName="+archivesName+"&classification="+classification+"&description="+description+"",
	  	           success: function(msg){
	  	              if(msg == "true"){
	  	            	 //清空模态框
	  	            	 $('#archivesNameAdd').val("")
	  	            	 $('#description').val("")
	  	            	 $("#myModal").modal("hide"); 
	  	            	 $('#tb_departments').bootstrapTable('refresh');
	  	            	 toastr.success('添加成功!');
	  	              }else{
	  	            	 toastr.error('添加失败!');
	  	              }
	  	           }
	
	  	    	 });
       	    }
	    	   
	      });
  
   //点击修改脚本打开模态框
   $("#btn_edit").click(function () { 
   	var select = $('#tb_departments').bootstrapTable('getSelections');
   	if (select.length === 0) {
   		   toastr.warning('请至少选择一行进行修改!');
		}else if(select.length > 1){
			toastr.warning('不可同时修改多行!');
			 
		}else{
			var archivesId = [];
			var archivesName = [];
			var description = [];
			//获取单行数据
				for (var i = 0; i < select.length; i++) {
					archivesId[i] = select[i]['archivesId'];
					archivesName[i] = select[i]['archivesName'];
					description[i] = select[i]['description'];
				}
				
			//给模态框赋值
			$("#archivesNameEdit").val(archivesName);
			$("#descriptionEdit").val(description);
			
			
			
			$("#myModal2").modal("show"); 
		}
   	
      
   }); 
   
   //提交修改 
    $("#archives_editBtn").click(function(){
   	
   	 //获取单行数据
   	    var select = $('#tb_departments').bootstrapTable('getSelections');
   	        var archivesId = [];
			var archivesNameR = [];
			var descriptionR = [];
			
				for (var i = 0; i < select.length; i++) {
					archivesId[i] = select[i]['archivesId'];
					archivesNameR[i] = select[i]['archivesName'];
					descriptionR[i] = select[i]['description'];
				}
			
	    //获取输入框中数据
		var archivesName = $("#archivesNameEdit").val();
		var description = $("#descriptionEdit").val();
		
		//获取文本框中的值 判断是否修改了
	 if(archivesName == archivesNameR && description == descriptionR){
			toastr.warning('请修改数据!');
   	 }else if(archivesName.trim().length == 0){
   		toastr.warning('名字不可为空!');
   		
   	//如果行中的名字和文本框中值bu相等做重名验证发送请求...........................
   	 }else if(archivesName == archivesNameR){ 
   		 
   		 //未改动的字段发送空，不进行数据库操作
   		/* if(archivesName == archivesNameR){
   			archivesName ='';
   		 }else if(description == descriptionR){
   			description = '';
   		 }*/
   		 
   		 $.ajax({
       		   type: "GET",
	   	    	   url: '../../../../files/updateBaseFilesU.action',
	   	    	   data: "archivesId="+archivesId+"&archivesName="+archivesName+"&description="+description+"",
	   	           success: function(msg){
	   	              if(msg == "true"){
	   	            	
	   	            	 $('#tb_departments').bootstrapTable('refresh');
	   	            	 //清空模态框
	   	            	 $("#archivesNameEdit").val("");
	   	     		     $("#descriptionEdit").val("");
	   	     		     
	   	     		 $("#myModal2").modal("hide");
	   	     		     
	   	            	toastr.success('修改成功!');
	   	              }else{
	   	            	toastr.error('修改失败!');
	   	              }
	   	           }
       	 });
   	//如果行中的名字和文本框中值相等做重名验证发送请求...........................
   	 }else if(basevalidateU() == true){
   		 
   		 //未改动的字段发送空，不进行数据库操作
   		 if(archivesName == archivesNameR){
   			archivesName ='';
   		 }else if(description == descriptionR){
   			description = '';
   		 }
   		 
   		 $.ajax({
       		   type: "GET",
	   	    	   url: '../../../../files/updateBaseFilesU.action',
	   	    	   data: "archivesId="+archivesId+"&archivesName="+archivesName+"&description="+description+"",
	   	           success: function(msg){
	   	              if(msg == "true"){
	   	            	
	   	            	 $('#tb_departments').bootstrapTable('refresh');
	   	            	 //清空模态框
	   	            	 $("#archivesNameEdit").val("");
	   	     		     $("#descriptionEdit").val("");
	   	     		     
	   	     		 $("#myModal2").modal("hide");
	   	     		     
	   	            	toastr.success('修改成功!');
	   	              }else{
	   	            	toastr.error('修改失败!');
	   	              }
	   	           }
       	 });
   	 }
   	 
    });
  
  //点击删除
  $("#btn_delete").click(function(){
	   
			var select = $('#tb_departments').bootstrapTable('getSelections');
			
  			if (select.length != 1) {
  				toastr.warning('请选择一行进行删除!');
  				
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
	  				var archivesId = [];
	  				for (var i = 0; i < select.length; i++) {
	  					archivesId[i] = select[i]['archivesId'];
	  				}
	  				
	  				$.ajax({
	  					type: "GET", 
	  					url:'../../../../files/deleteBaseFilesU.action',
	  					data :"archivesId="+archivesId+"",
	  					success:function(result) {
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
				
	});

  //搜索按钮点击
  $("#btn_query").click(function(){
	   //刷新表格
	   $('#tb_departments').bootstrapTable('refresh');
	   
  });
  
  //点击选项是
  $("#check1").click(function(){
	   $("#check1").attr("value","1");
  });
  
  //选项否
  $("#check2").click(function(){
	   $("#check1").attr("value","0");
  });
  
  //选择否改变单选框yes的值
  $("#no").click(function(){
      $("#yes").attr("value","false");
  });

	
	
	
	
});

//基本档案添加同名验证函数
function basevalidateA(){
	  //判断是需要验证修改和添加的名称框
	  var archivesNameA = $("#archivesNameAdd").val().trim();
	  var archivesNameU = $("#archivesNameEdit").val("");
	  
	  var result = false;
	  
	  $.ajax({
		  url:"../../../../files/findBaseFilesByNameQuery.action",
		  type:"post",
		  data:"archivesNameS="+archivesNameA+"&archivesNameS="+archivesNameU+"",
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

//基本档案修改同名验证函数
function basevalidateU(){
	  //判断是需要验证修改和添加的名称框
	  var archivesNameA = $("#archivesNameAdd").val("");
	  var archivesNameU = $("#archivesNameEdit").val().trim();
	  
	  var result = false;
	  
	  $.ajax({
		  url:"../../../../files/findBaseFilesByNameQuery.action",
		  type:"post",
		  data:"archivesNameS="+archivesNameA+"&archivesNameS="+archivesNameU+"",
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

