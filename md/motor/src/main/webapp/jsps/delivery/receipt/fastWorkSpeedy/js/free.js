$(function() {
	var TableInit = function() {
		var oTableInit = new Object();

		// 初始化Table
		oTableInit.Init = function() {
		    $('#tb_departments').bootstrapTable({  
		        method: 'get',  
		        editable:true,//开启编辑模式  
		        clickToSelect: true,  
		        columns: [  
		            {field:"user_email",edit:false,title:"email",align:"center"},  
		            {field:"user_company",edit:{  
		                        type:'select',//下拉框，如果是下拉则需要设置type为select  
		                        //url:'user/getUser.htm',//从服务器加载  
		                        data:[{id:1,text:'lzx'},{id:2,text:'lsl'}],  
		                        valueField:'id',  
		                        textField:'text',  
		                        onSelect:function(val,rec){  
		                            console.log(val,rec);  
		                        }  
		            },title:"company",align:"center",width:"200px"},  
		            {field:"user_dates",edit:{  
		                type:'date'//日期  
		            },title:"date",align:"center"},  
		            {field:"user_version",title:"version",align:"center",  
		                edit:{  
		                    required:true,  
		                    click:function(){  
		                    }  
		                }  
		            },  
		            {field:"user_isv2",title:"isv2",align:"center"},  
		            {field:"userstatus_usertype",title:"usertype",align:"center"},  
		            {field:"userstatus_package_id",title:"package_id",align:"center"},  
		            {field:"userstatus_end_time",title:"end_time",align:"center",formatter:function(value,row,rowIndex){  
		                var strHtml = '<a href="javascript:void(0);" onclick="removeRow('+rowIndex+')">删除</a>';  
		                return strHtml;  
		            },edit:false},  
		            {field:"user_lastlogintime",title:"lastlogintime",align:"center",valign:'middle'}  
		        ],  
		        data : []  
		    });  
		};

		return oTableInit;
	};

	var ButtonInit = function() {
		var oInit = new Object();
		var postdata = {};
		oInit.Init = function() {
		

		};
		return oInit;
	};

	$(function() {
		// 1.初始化Table
		var oTable = new TableInit();
		oTable.Init();
		// 2.初始化Button的点击事件
		var oButtonInit = new ButtonInit();
		oButtonInit.Init();
	
		// 提示框
		toastr.options.positionClass = 'toast-top-center';
		toastr.options = {
			closeButton : false, // 是否显示关闭按钮
			debug : false, // 是否为调试
			progressBar : true, // 是否显示进度条
			positionClass : "toast-top-center", // 在页面中显示的位置
			onclick : null, // 点击事件
			showDuration : "100", // 显示动作时间
			hideDuration : "1000", // 隐藏动作时间
			timeOut : "2000", // 自动关闭超时时间
			extendedTimeOut : "1000",
			showEasing : "swing",
			hideEasing : "linear",
			preventDuplicates : true,
			preventOpenDuplicates : true, // 重复内容的提示框在开启时只出现一个
			showMethod : "fadeIn", // 显示的方式
			hideMethod : "fadeOut" // 隐藏的方式
		};
	

	});

	function cancel() {
		$('body').css('overflow', 'auto');
		$('body').css('padding-right', '0px');
		$('.model').addClass('hide');
		$('.model-dialog').addClass('hide');
	}

	


})