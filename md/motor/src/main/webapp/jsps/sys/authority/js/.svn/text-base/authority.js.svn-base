/**
 * 双击用户表格，得到用户已分配的角色Id数组
 */
var onDbClickRoleIds = [];

/**
 * 得到双击用户表的用户Id
 */
var onDbClickUserId = "";

var onCheckUserIds = [];

var onCheckRoleIds = [];

/**
 * 初始化用户表格
 */
function userGrid(){
	var oUserTableInit = new Object();
	oUserTableInit.Init = function(){
		$('#userGrid').bootstrapTable({
			url : '../../../../userList.action', //请求后台的URL（*） 
			method : 'get', //请求方式（*） 
			striped : true, //是否显示行间隔色 
			cache : false, //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*） 
			pagination : true, //是否显示分页（*） 
			sortable : false, //是否启用排序 
			sortOrder : "asc", //排序方式 
			queryParams : oUserTableInit.queryParams,//传递参数（*）
			sidePagination : "server", //分页方式：client客户端分页，server服务端分页（*） 
			pageNumber : 1, //初始化加载第一页，默认第一页 
			pageSize : 10, //每页的记录行数（*） 
			pageList : [ 10, 20, 50, 100 ], //可供选择的每页的行数（*） 
			search : false, //是否显示表格搜索，此搜索是客户端搜索，不会进服务端，所以，个人感觉意义不大 
			strictSearch : true,
			maintainSelected:true,//翻页复选框状态不会改变
			clickToSelect:true,
			showColumns : false, //是否显示所有的列 
			showRefresh : false, //是否显示刷新按钮
			minimumCountColumns : 2, //最少允许的列数
			clickToSelect : true, //是否启用点击选中行 
			showToggle : false, //是否显示详细视图和列表视图的切换按钮 
			cardView : false, //是否显示详细视图
			detailView : false, //是否显示父子表
		    columns : [ {
				checkbox : true,
				formatter:stateUserFormatter
			}, {
				field : 'userName',
				title : '用户名'
			}, {
				field : 'orgName',
				title : '组织名'
			}],
			onCheck: function (row) {
				onCheckUserIds.push(row.userId);
				return true;
		    },
		    onUncheck: function (row) {
		    	onCheckUserIds = $.grep(onCheckUserIds, function(value) {
		    		 return value != row.userId;
		    	});
	            return true;
	        },
			rowStyle: function (row, index) {
                //这里有5个取值代表5中颜色['active', 'success', 'info', 'warning', 'danger'];
                var strclass = {};
                $.ajax({
					url:"../../../../sys/findRoleByUserNameCountQuery.action?userName="+row.userName,
					async:false,
					success:function(response){
						if(response>0){
							strclass = {css:{'background-color':'#FFCCCC'}};//还有一个active
						}
					}
				});
                return strclass 
            },
			onDblClickRow:function(row,$element){
				onDbClickRoleIds = [];
				onDbClickUserId = row.userId;
				$(".bs-checkbox").css({"background-color":"white"});
				$.ajax({
					url:"../../../../sys/findRoleByUserNameQuery.action?userName="+row.userName,
					async:false,
					success:function(response){
						for(var i=0;i<response.rows.length;i++){
							onDbClickRoleIds[i] = response.rows[i].roleId;
						}
					}
				});
				
				$('#roleGrid').bootstrapTable("refresh",{
			       	url:"../../../../sys/rolePageQuery.action"
			    });
				$($element.children()[0]).css({"background-color":"#C0C0C0"});
			}
		});
	}
	oUserTableInit.queryParams = function(params) {
 		var temp = {
 			//这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的 
 			limit : params.limit, //页面大小 
 			offset : params.offset, //页码 
			userName : $("#username").val(),
			orgName:$("#orgName").val()
 		};
 		return temp;
 	}; 
 	return oUserTableInit;
}

function stateUserFormatter(value,row,index){
	for(var i=0;i<onCheckUserIds.length;i++){
		if(row.userId==onCheckUserIds[i]){
			return {
				checked:true
			};
		}
	}
	return value;
}

/**
 * 初始化角色表格
 */
var roleGrid = function() {
	var oTableInit = new Object();
	//初始化Table 
	oTableInit.Init = function() {
		$('#roleGrid').bootstrapTable({
			url : '../../../../sys/rolePageQuery.action', //请求后台的URL（*） 
			method : 'get', //请求方式（*） 
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
			maintainSelected:true,//翻页复选框状态不会改变
			clickToSelect:true,
			showColumns : false, //是否显示所有的列 
			showRefresh : false, //是否显示刷新按钮
			minimumCountColumns : 2, //最少允许的列数
			clickToSelect : true, //是否启用点击选中行 
			showToggle : false, //是否显示详细视图和列表视图的切换按钮 
			cardView : false, //是否显示详细视图
			detailView : false, //是否显示父子表
			columns : [ {
				checkbox : true,
				formatter:stateRoleFormatter
			}, {
				field : 'roleName',
				title : '角色名'
			}, {
				field : 'orgTypeName',
				title : '所属组织类型'
			}],
			onCheck: function (row) {
				onCheckRoleIds.push(row.roleId);
				return true;
		    },
		    onUncheck: function (row) {
		    	onCheckRoleIds = $.grep(onCheckRoleIds, function(value) {
		    		 return value != row.roleId;
		    	});
	            return true;
	        },
			rowStyle: function (row, index) {
                //这里有5个取值代表5中颜色['active', 'success', 'info', 'warning', 'danger'];
                var strclass = {};
                for(var i=0;i<onDbClickRoleIds.length;i++){
            		if(row.roleId==onDbClickRoleIds[i]){
            			strclass ={css:{'background-color':'#FFCCCC'}};//还有一个active
            		}
                }
                return strclass 
            }
		});
	}; //得到查询的参数

	oTableInit.queryParams = function(params) {
		var orgTypeId = "";
		for(var i=0;i<$("#queryOrgTypeName").children().length;i++){
			if($("#queryOrgTypeName").children()[i].selected && $($("#queryOrgTypeName").children()[i]).attr("id")!="0"){
				orgTypeId = $($("#queryOrgTypeName").children()[i]).attr("id");// 收集选中项
			}
		}
		var temp = {
			//这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的 
			limit : params.limit, //页面大小 
			offset : params.offset, //页码 
			roleName : $("#roleName").val(),
			orgType:orgTypeId
		};
		return temp;
	};
	return oTableInit;
};

function stateRoleFormatter(value,row,index){
	for(var i=0;i<onDbClickRoleIds.length;i++){
		if(row.roleId==onDbClickRoleIds[i]){
			return {
				checked: true
			};
		}
	}
	for(var i=0;i<onCheckRoleIds.length;i++){
		if(row.roleId==onCheckRoleIds[i]){
			return {
				checked:true
			};
		}
	}
	return value;
}

/**
 * 初始化条件查询的下拉框
 */
function selectInit(){
	//初始化组织类型下拉框
	$.ajax({
		url:"../../../../sys/findSubsetByArchivesNameQuery.action",
		type:"post",
		data:{"archivesName":"组织类型"},
		async:false,
		success:function(response){
			var html = "";
			for(var i=0;i<response.length;i++) {
				html = html+"<option id='"+response[i].subsetId+"'>"+response[i].subsetName+"</option>";
			}
			$("#queryOrgTypeName").append(html);
			$("#queryOrgTypeName").selectpicker("refresh");
		}
	});
}

/**
 * 给单个用户分配角色的方法
 */
function saveUserRole(){
	$("#save_user_role").click(function(){
		var selectUser = $('#userGrid').bootstrapTable(
			'getSelections');
		if(selectUser!=0){
			toastr.warning("请取消您勾中的用户！");
		}else if(onDbClickUserId==""){
			toastr.warning("请双击你要分配角色的用户");
		}else{
			swal({  
				title: "操作提示",   //弹出框的title  
				text: "确定保存分配吗？",  //弹出框里面的提示文本  
				type: "warning",    //弹出框类型  
				showCancelButton: true, //是否显示取消按钮  
				confirmButtonColor: "#DD6B55",//确定按钮颜色  
				cancelButtonText: "取消",//取消按钮文本  
				confirmButtonText: "是的，确定保存分配！",//确定按钮上面的文档  
				closeOnConfirm: true  
			},function(){
				$.ajax({
					url:"../../../../sys/saveUserRoleU.action",
					type:"post",
					traditional:true,
					data:{"userId":onDbClickUserId,"roleIds":onCheckRoleIds},
					success:function(response){
						if("true"==response){
							toastr.success("保存分配成功");
							onDbClickRoleIds = [];
							onCheckRoleIds = [];
							$('#userGrid').bootstrapTable("refresh",{
						       	url:"../../../../userList.action"
						    });
							$('#roleGrid').bootstrapTable("refresh",{
						       	url:"../../../../sys/rolePageQuery.action"
						    });
						}else{
							toastr.error("保存分配失败");
						}
					}
				});
			});
		}
	});
}

/**
 * 添加用户角色的方法
 */
function addUserRole(){
	$("#add_user_role").click(function(){
		if(onCheckUserIds.length < 1) {
			toastr.warning('请至少选择一个用户');
		}else if(onCheckRoleIds.length < 1){
			toastr.warning('请至少选择一个角色');
		}else{
			swal({  
				title: "操作提示",   //弹出框的title  
				text: "确定分配吗？",  //弹出框里面的提示文本  
				type: "warning",    //弹出框类型  
				showCancelButton: true, //是否显示取消按钮  
				confirmButtonColor: "#DD6B55",//确定按钮颜色  
				cancelButtonText: "取消",//取消按钮文本  
				confirmButtonText: "是的，确定分配！",//确定按钮上面的文档  
				closeOnConfirm: true  
			},function(){
				$.ajax({
					url:"../../../../sys/addUserRoleU.action",
					type:"post",
					traditional:true,
					data:{"userIds":onCheckUserIds,"roleIds":onCheckRoleIds},
					success:function(response){
						if("true"==response){
							toastr.success("分配成功");
							onCheckUserIds = [];
							onCheckRoleIds = [];
							$('#userGrid').bootstrapTable("refresh",{
						       	url:"../../../../userList.action"
						    });
							$('#roleGrid').bootstrapTable("refresh",{
						       	url:"../../../../sys/rolePageQuery.action"
						    });
						}else{
							toastr.error("分配失败");
						}
					}
				});
			});
		}
	});
}
/*-----------------------------------------------------------------------------------
 * -----------------------分界线：上面是分配角色，下面是分配资源-------------------------------
 * ----------------------------------------------------------------------------------*/

var onDbClickResourceIds = [];

var onDbClickRoleId = "";

var onCheckRoleTabIds = [];

/**
 * 初始化分配资源的角色表格
 */
var roleTabGrid = function() {
	var oTableInit = new Object();
	//初始化Table 
	oTableInit.Init = function() {
		$('#roleTabGrid').bootstrapTable({
			url : '../../../../sys/rolePageQuery.action', //请求后台的URL（*） 
			method : 'get', //请求方式（*） 
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
			maintainSelected:true,//翻页复选框状态不会改变
			clickToSelect:true,
			showColumns : false, //是否显示所有的列 
			showRefresh : false, //是否显示刷新按钮
			minimumCountColumns : 2, //最少允许的列数
			clickToSelect : true, //是否启用点击选中行 
			showToggle : false, //是否显示详细视图和列表视图的切换按钮 
			cardView : false, //是否显示详细视图
			detailView : false, //是否显示父子表
			onCheck: function (row) {
				onCheckRoleTabIds.push(row.roleId);
				return true;
		    },
		    onUncheck: function (row) {
		    	onCheckRoleTabIds = $.grep(onCheckRoleTabIds, function(value) {
		    		 return value != row.roleId;
		    	});
	            return true;
	        },
			rowStyle: function (row, index) {
                //这里有5个取值代表5中颜色['active', 'success', 'info', 'warning', 'danger'];
                var strclass = {};
                $.ajax({
					url:"../../../../sys/findResourceByRoleIdCountQuery.action?roleId="+row.roleId,
					async:false,
					success:function(response){
						if(response>0){
							strclass = {css:{'background-color':'#FFCCCC'}};//还有一个active
						}
					}
				});
                return strclass 
            },
			columns : [ {
				checkbox : true,
				formatter:stateRoleTabFormatter
			}, {
				field : 'roleName',
				title : '角色名'
			}, {
				field : 'orgTypeName',
				title : '所属组织类型'
			}],
            onDblClickRow:function(row,$element){
            	onDbClickResourceIds = [];
            	onDbClickRoleId = row.roleId;
				$(".bs-checkbox").css({"background-color":"white"});
				$.ajax({
					url:"../../../../sys/findResourceByRoleIdQuery.action?roleId="+row.roleId,
					async:true,
					beforeSend:function(){
						swal({
							  title: '提示',
							  text: '资源加载中,请稍后！',
							  type: 'info',
							  showCancelButton: false,
							  allowOutsideClick:false, 	
							  allowEscapeKey:false,
							  showConfirmButton:false});
					},
					success:function(response){
						for(var i=0;i<response.length;i++){
							onDbClickResourceIds[i] = response[i].resourceId;
						}
						resourceByRole();
						swal.close();
						toastr.info("资源加载完毕！");
					}
				});
				$($element.children()[0]).css({"background-color":"#C0C0C0"});
			}
		});
	}; //得到查询的参数

	oTableInit.queryParams = function(params) {
		var orgTypeId = "";
		for(var i=0;i<$("#orgTypeName_Tab").children().length;i++){
			if($("#orgTypeName_Tab").children()[i].selected && $($("#orgTypeName_Tab").children()[i]).attr("id")!="0"){
				orgTypeId = $($("#orgTypeName_Tab").children()[i]).attr("id");// 收集选中项
			}
		}
		var temp = {
			//这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的 
			limit : params.limit, //页面大小 
			offset : params.offset, //页码 
			roleName : $("#roleName").val(),
			orgType:orgTypeId
		};
		return temp;
	};
	return oTableInit;
};

function stateRoleTabFormatter(value,row,index){
	for(var i=0;i<onCheckRoleTabIds.length;i++){
		if(row.roleId==onCheckRoleTabIds[i]){
			return {
				checked:true
			};
		}
	}
	return value;
}

/**
 * 初始化分配资源的模糊查询的下拉框
 */
function selectTabInit(){
	//初始化组织类型下拉框
	$.ajax({
		url:"../../../../sys/findSubsetByArchivesNameQuery.action",
		type:"post",
		data:{"archivesName":"组织类型"},
		async:false,
		success:function(response){
			var html = "";
			for(var i=0;i<response.length;i++) {
				html = html+"<option id='"+response[i].subsetId+"'>"+response[i].subsetName+"</option>";
			}
			$("#orgTypeName_Tab").append(html);
			$("#orgTypeName_Tab").selectpicker("refresh");
		}
	});
}

/**
 * 根据传入的url，初始化资源的树形表格
 * @param url 资源数据的url
 */
function jqxtreegridInit(url){
	var resourceName = $("#resourceName").val();
	var resourceTypeId = "";
	for(var i=0;i<$("#queryResourceTypeName").children().length;i++){
		if($("#queryResourceTypeName").children()[i].selected && $($("#queryResourceTypeName").children()[i]).attr("id")!="0"){
			resourceTypeId = $($("#queryResourceTypeName").children()[i]).attr("id");// 收集选中项
		}
	}
	if(resourceName=="" && resourceTypeId==""){
		url = "../../../../findAllResource.action";
	}
	var source = {
	    dataType: "json",
	    data:{"resourceName":resourceName,"resourceType":resourceTypeId},
	    dataFields: [
	        { name: 'resourceId', type: 'string' },
	        { name: 'resourceName', type: 'string' },
	        { name: 'resourceTypeName', type: 'string' },
	        { name: 'keyword', type: 'string' },
	        { name: 'location', type: 'string' },
	        { name: 'code', type: 'string' },
	        { name: 'description', type: 'string' },
	        { name: 'parentId', type: 'string' },
	        { name: 'parentName', type: 'string' },
	        { name: 'childResList', type: 'array' }
	    ],
	    hierarchy:{
	    	root:"childResList"
	    },
	    id: 'resourceId',
	    url:url
	};
	var dataAdapter = new $.jqx.dataAdapter(source);
	$("#treegrid").jqxTreeGrid({
	   	width:  "100%",
	   	pageSize: 14,
	   	pageSizeOptions: ['14', '20', '30'],
	   	pageable:true,
	   	pagerPosition:'bottom',
	    source: dataAdapter,
	    sortable: true,
	    theme: 'energyblue',
	    altRows:true,  //隔行变色
	    hierarchicalCheckboxes: true,  //分层复选框
	    columns: [
	      { text: '资源名', dataField: 'resourceName', width:"auto"},
	      { text: '资源类型', dataField: 'resourceTypeName', width:"auto"}
	    ],
	    checkboxes:true
	});
	$('#treegrid').on('rowExpand',function(event){
		var args = event.args;
        var row = args.row;
        var key = args.key;
    	console.info(row);
    	console.info(key);
	});
}

/**
 * 双击角色后查看其所分配的资源
 */
function resourceByRole(){
	var rows = $("#treegrid").jqxTreeGrid('getRows');
    var traverseTree = function(rows){
        for(var i = 0; i < rows.length; i++) {
        	$("#treegrid").jqxTreeGrid("uncheckRow",rows[i].resourceId);
            for(var j=0;j<onDbClickResourceIds.length;j++){
            	if(onDbClickResourceIds[j]==rows[i].resourceId){
            		$("#treegrid").jqxTreeGrid("checkRow",rows[i].resourceId);
            	}
            }
            if (rows[i].records){
               traverseTree(rows[i].records);
            }
        }
    };
    traverseTree(rows);
}

/**
 * 分配资源的模糊查询
 * @param url 数据的url地址
 */
function vaguePageQuery(url){
	$("#query_resource_btn").click(function(){
		jqxtreegridInit(url);
	});
}

/**
 * 给单个角色分配资源的方法
 */
function saveRoleResource(){
	$("#save_role_resource").click(function(){
		var selectRole = $('#roleTabGrid').bootstrapTable(
			'getSelections');
		if(selectRole.length!=0){
			toastr.warning('请取消您勾中的角色！');
		}else if(onDbClickRoleId==""){
			toastr.warning('请双击一个角色！');
		}else{
			swal({  
				title: "操作提示",   //弹出框的title  
				text: "确定保存分配吗？",  //弹出框里面的提示文本  
				type: "warning",    //弹出框类型  
				showCancelButton: true, //是否显示取消按钮  
				confirmButtonColor: "#DD6B55",//确定按钮颜色  
				cancelButtonText: "取消",//取消按钮文本  
				confirmButtonText: "是的，确定保存分配！",//确定按钮上面的文档  
				closeOnConfirm: true  
			},function(){
				var selectResource = $("#treegrid").jqxTreeGrid('getCheckedRows');
				var resourceIds = [];
				for(var i=0;i<selectResource.length;i++){
					resourceIds[i] = selectResource[i].resourceId;
				}
				$.ajax({
					url:"../../../../sys/saveRoleResourceU.action",
					type:"post",
					traditional:true,
					data:{"resourceIds":resourceIds,"roleId":onDbClickRoleId},
					success:function(response){
						if("true"==response){
							toastr.success("分配成功");
							$('#roleTabGrid').bootstrapTable("refresh",{
						       	url:"../../../../sys/rolePageQuery.action"
						    });
							var url = '../../../../sys/resourcePageQuery.action';
							jqxtreegridInit(url);
						}else{
							toastr.error("分配失败");
						}
					}
				});
			});
		}
	});
}

/**
 * 给多个角色分配资源的方法
 */
function addRoleResource(){
	$("#add_role_resource").click(function(){
		var selectResource = $("#treegrid").jqxTreeGrid('getCheckedRows');
		if(selectResource.length < 1) {
			toastr.warning('请至少选择一个资源');
		}else if(onCheckRoleTabIds.length < 1){
			toastr.warning('请至少选择一个角色');
		}else{
			swal({  
				title: "操作提示",   //弹出框的title  
				text: "确定分配吗？",  //弹出框里面的提示文本  
				type: "warning",    //弹出框类型  
				showCancelButton: true, //是否显示取消按钮  
				confirmButtonColor: "#DD6B55",//确定按钮颜色  
				cancelButtonText: "取消",//取消按钮文本  
				confirmButtonText: "是的，确定分配！",//确定按钮上面的文档  
				closeOnConfirm: true  
			},function(){
				var resourceIds = [];
				for(var i=0;i<selectResource.length;i++){
					resourceIds[i] = selectResource[i].resourceId;
				}
				$.ajax({
					url:"../../../../sys/addRoleResourceU.action",
					type:"post",
					traditional:true,
					data:{"resourceIds":resourceIds,"roleIds":onCheckRoleTabIds},
					success:function(response){
						if("true"==response){
							toastr.success("分配成功");
							onCheckRoleTabIds = [];
							$('#roleTabGrid').bootstrapTable("refresh",{
						       	url:"../../../../sys/rolePageQuery.action"
						    });
							var url = '../../../../sys/resourcePageQuery.action';
							jqxtreegridInit(url);
						}else{
							toastr.error("分配失败");
						}
					}
				});
			});
		}
	});
}

/*-----------------------------------------------------------------------------------
 * -----------------------分界线：上面是分配资源，下面是主方法-------------------------------
 * ----------------------------------------------------------------------------------*/
/**
 * 主方法
 */
$(function(){
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
	
	//初始化用户表格
	var oUserTable = new userGrid();
	oUserTable.Init();
	
	//初始化分配角色的下拉框
	selectInit();
	
	//用户表格的模糊查询
	$("#query_user_btn").click(function(){
		$('#userGrid').bootstrapTable("refresh",{
	       	url:"../../../../userList.action",
	       	queryParams:oUserTable.queryParams
	    }); 
	});
	
	//初始化角色表格
	var oRoleTable = new roleGrid();
	oRoleTable.Init();
	
	//角色表格的模糊查询
	$("#query_role_btn").click(function(){
		$('#roleGrid').bootstrapTable("refresh",{
	       	url:"../../../../sys/rolePageQuery.action",
	       	queryParams:oRoleTable.queryParams
	    }); 
	});
	//保存给单个用户分配角色
	saveUserRole();
	//给用户添加角色
	addUserRole();
	
	/*----------------------------------------------------------*/
	//初始化分配资源的下拉框
	selectTabInit();
	//初始化分配资源角色表格
	var oRoleTabTable = new roleTabGrid();
	oRoleTabTable.Init();
	//分配资源页的角色表格的模糊查询
	$("#query_role_Tab_btn").click(function(){
		$('#roleTabGrid').bootstrapTable("refresh",{
	       	url:"../../../../sys/rolePageQuery.action",
	       	queryParams:oRoleTabTable.queryParams
	    }); 
	});
    //初始化资源类型下拉框
    $.ajax({
    	url:"../../../../sys/findSubsetByArchivesNameQuery.action",
    	type:"post",
    	data:{"archivesName":"资源类型"},
    	success:function(response){
    		var html = "";
			for(var i=0;i<response.length;i++) {
				html = html+"<option id='"+response[i].subsetId+"'>"+response[i].subsetName+"</option>";
			}
			$("#queryResourceTypeName").append(html);
			$(".selectpicker" ).selectpicker("refresh");
    	}
    });
    //初始化树形表格
    var url = '../../../../findAllResource.action';
	jqxtreegridInit(url);
	
	var url = '../../../../findResourceQuery.action';
    //模糊查询的方法
    vaguePageQuery(url);
    //给多个角色分配资源
    addRoleResource();
    
    saveRoleResource();
});
