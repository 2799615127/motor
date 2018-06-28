$(function() { 
	// 初始化提示框的位置
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

	// 1.初始化账面数据Table
	var oTableBookData = new TableInitBookData();
	oTableBookData.Init();
	// 2.初始化账面数据Button的点击事件
	var oButtonInitBookData = new ButtonInitBookData();
	oButtonInitBookData.Init();
	//点击查询
	$("#btn_findWork").click(function(){
		$("#tb_bookData").bootstrapTable("refresh", {
			url : '/noob/warehouse/trayWorkPageVariousConditionQuery.action',
			queryParams : oTableBookData.queryParams
		});
	});
	// 1.初始化属性实盘数据Table
	var oTableDiskData = new TableInitDiskData();
	oTableDiskData.Init();
	// 2.初始化实盘数据Button的点击事件
	var oButtonInitDiskData = new ButtonInitDiskData();
	oButtonInitDiskData.Init();
	
	// 1.初始化盘库单主表数据Table
	var oTableInitMasterData = new TableInitMasterData();
	oTableInitMasterData.Init();
	// 2.初始化盘库单主表数据Button的点击事件
	var oButtonInitMasterData = new ButtonInitMasterData();
	oButtonInitMasterData.Init();
	
	// 1.初始化盘库单主表明细数据Table
	var oTableInitDetailData = new TableInitDetailData();
	oTableInitDetailData.Init();
	// 2.初始化盘库单附表工作单明细数据 Button的点击事件
	var oButtonInitDetailData = new ButtonInitDetailData();
	oButtonInitDetailData.Init();
	
	//预约取件时间
	$('#txt_search_start').datetimepicker({
		 language: 'zh-CN',
         autoclose: true,
         todayHighlight: true
	});
	
	//预约取件时间
	$('#txt_search_end').datetimepicker({
		 language: 'zh-CN',
         autoclose: true,
         todayHighlight: true
	});
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
	});
	//下载模板
	$('#downloadBoard').click(function(){
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
	    uploadUrl: "/noob/warehouse/leadingIns.action",
	    language : 'zh',//设置语言
	    maxFileCount: 1,
	    allowedFileExtensions : ['xls']//接收的文件后缀
	}).on("fileuploaded", function (event, data, previewId, index) {
	   	//清除之前的文件
	    $(".kv-file-remove").trigger("click");
	    //导入框判断
	    $('#dowload').hide();
	    if(data.response.status=="success"){
			toastr.success("导入成功");
			$('#tb_diskData').bootstrapTable('load',data.response.list);
			$('#tb_contrastData').bootstrapTable('load',data.response.list);
			$('#leadingIn').modal('hide');
			$("#btn_contrast").attr('disabled',false); 
		}else{
			toastr.error("导入失败");
		}
	  });
	
	$("#btn_contrast").click(function() {
		$('#tb_contrastDetailData').bootstrapTable("refresh", {
			url : '/noob/warehouse/trayWorkPageQuery.action'
		});
		$('#tb_contrastDetailData').bootstrapTable({
			url : '/noob/warehouse/trayWorkPageQuery.action', // 请求后台的URL（*）
			method : 'get', // 请求方式（*）
			toolbar : '#toolbar_contrastDetailData', // 工具按钮用哪个容器
			striped : true, // 是否显示行间隔色
			cache : false, // 是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
			pagination : true, // 是否显示分页（*）
			sortable : false, // 是否启用排序
			sortOrder : "asc", // 排序方式
			queryParams : oTableInitDetailData.queryParams,// 传递参数（*）
			sidePagination : "server", // 分页方式：client客户端分页，server服务端分页（*）
			pageNumber : 1, // 初始化加载第一页，默认第一页
			pageSize : 4, // 每页的记录行数（*）
			pageList : [ 5, 10, 15, 20 ], // 可供选择的每页的行数（*）
			search : false, // 是否显示表格搜索，此搜索是客户端搜索，不会进服务端，所以，个人感觉意义不大
			strictSearch : true,
			showColumns : true, // 是否显示所有的列
			showRefresh : true, // 是否显示刷新按钮
			minimumCountColumns : 2, // 最少允许的列数
			clickToSelect : true, // 是否启用点击选中行
			uniqueId : "storageConnectNumSon", // 每一行的唯一标识，一般为主键列
			showToggle : true, // 是否显示详细视图和列表视图的切换按钮
			cardView : false, // 是否显示详细视图
			detailView : false, // 是否显示父子表
			columns : [ {
				field : 'storageConnectNumSon',
				title : '单号'
			}, {
				field : 'jobListNo',
				title : '工作单号'
			} ]
		});
	});
	$('#tb_contrastData').bootstrapTable({
		url : '', // 请求后台的URL（*）
		method : 'get', // 请求方式（*）
		toolbar : '#toolbar_contrastData', // 工具按钮用哪个容器
		striped : true, // 是否显示行间隔色
		cache : false, // 是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
		pagination : true, // 是否显示分页（*）
		sortable : false, // 是否启用排序
		sortOrder : "asc", // 排序方式
		queryParams : oTableInitDetailData.queryParams,// 传递参数（*）
		sidePagination : "client", // 分页方式：client客户端分页，server服务端分页（*）
		pageNumber : 1, // 初始化加载第一页，默认第一页
		pageSize : 4, // 每页的记录行数（*）
		pageList : [ 5, 10, 15, 20 ], // 可供选择的每页的行数（*）
		search : false, // 是否显示表格搜索，此搜索是客户端搜索，不会进服务端，所以，个人感觉意义不大
		strictSearch : true,
		showColumns : true, // 是否显示所有的列
		showRefresh : true, // 是否显示刷新按钮
		minimumCountColumns : 2, // 最少允许的列数
		clickToSelect : true, // 是否启用点击选中行
		uniqueId : "storageConnectNumSon", // 每一行的唯一标识，一般为主键列
		showToggle : true, // 是否显示详细视图和列表视图的切换按钮
		cardView : false, // 是否显示详细视图
		detailView : false, // 是否显示父子表
		columns : [ {
			field : 'storageConnectNumSon',
			title : '单号'
		}, {
			field : 'jobListNo',
			title : '工作单号'
		} ]
	});
	
	$("#confirmationContrastBtn").click(function(){
		$('#contrast').modal('hide');
		$("#btn_preserve").attr('disabled',false);
	});
	
	//保存按钮
	$("#btn_preserve").click(function() {
		var select = $('#tb_diskData').bootstrapTable('getSelections');
		if (select.length === 0) {
			toastr.warning('请至少选择一行进行保存!');
		} else {
			swal({
				title : "操作提示", // 弹出框的title
				text : "确定保存吗,保存后的数据不能删除?", // 弹出框里面的提示文本
				type : "warning", // 弹出框类型
				showCancelButton : true, // 是否显示取消按钮
				confirmButtonColor : "#DD6B55",// 确定按钮颜色
				cancelButtonText : "取消",// 取消按钮文本
				confirmButtonText : "是的，确定保存！",// 确定按钮上面的文档
				closeOnConfirm : true
			}, function() {
				var arrs = [];
				for (var i = 0; i < select.length; i++) {
					arrs[i] = select[i]['storageConnectNumSon'];
				}
				$.ajax({
					type : "GET",
					url : '/noob/warehouse/preserveTrayWorkByNumU.action',
					data : {
						storageConnectNumSons : arrs
					},
					success : function(result) {
						if (result == "success") {
							toastr.success('保存成功!');
						} else {
							toastr.error('保存失败!');
						}
						$('#tb_bookData').bootstrapTable("refresh", {
							url : '/noob/warehouse/trayWorkPageQuery.action'
						});
						$('#tb_detailData').bootstrapTable("refresh", {
							url : '/noob/warehouse/trayWorkPageQuery.action'
						});
					}
				});
			});
		}
	});
});