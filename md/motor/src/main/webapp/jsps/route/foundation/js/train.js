// 查询所有数据
var TableInit = function () {
        var oTableInit = new Object();
        //初始化Table
        oTableInit.Init = function () {
            $('#tb_train').bootstrapTable({
                url:'/noob/routeBase/findAllLineQuery.action?baseType='+$("#searchType").val(),         //请求后台的URL（*）
                method: 'get',                      //请求方式（*）
                toolbar: '#toolbar',                //工具按钮用哪个容器
                striped: true,                      //是否显示行间隔色
                cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
                pagination: true,                   //是否显示分页（*）
                sortable: false,                     //是否启用排序
                sortOrder: "asc",                   //排序方式
                queryParams: oTableInit.queryParams,//传递参数（*）
                sidePagination: "server",           //分页方式：client客户端分页，server服务端分页（*）
                pageNumber:1,                       //初始化加载第一页，默认第一页
                pageSize: 10,                       //每页的记录行数（*）
                pageList: [10, 20, 30, 50],        //可供选择的每页的行数（*）
                //search: true,                       //是否显示表格搜索，此搜索是客户端搜索，不会进服务端，所以，个人感觉意义不大
                //strictSearch: true,
                // showColumns: true,                  //是否显示所有的列
                //showRefresh: true,                  //是否显示刷新按钮
                minimumCountColumns: 2,             //最少允许的列数
                clickToSelect: true,                //是否启用点击选中行
                uniqueId: "routeBaseId",                     //每一行的唯一标识，一般为主键列
                //showToggle:true,                    //是否显示详细视图和列表视图的切换按钮
                //cardView: false,                    //是否显示详细视图
                detailView: false,                   //是否显示父子表
                columns: [{
                    checkbox: true
                }, {
                    field: 'city',
                    title: '城市',
                    editable: {  
                        type: 'text',  
                        validate: function (value) {  
                            if ($.trim(value) == '') {  
                                return '城市不能为空!';  
                            }  
                        }  
                    }
                }, {
                    field: 'cityCode',
                    title: '编码',
                    editable: {  
                        type: 'text',  
                        validate: function (value) {  
                            if ($.trim(value) == '') {  
                                return '编码不能为空!';  
                            }  
                        }  
                    }
                },{
                    field: 'baseName',
                    title: '名称',
                    editable: {  
                        type: 'text',  
                        validate: function (value) {  
                            if ($.trim(value) == '') {  
                                return '名称不能为空!';  
                            }  
                        }  
                    }
                },{
                    field: 'baseType',
                    title: '类型',
                    formatter:function(value){
                    	if(value==1){
                    		return "汽车站";
                    	}else if(value==2){
                    		return "火车站";
                    	}else if(value==3){
                    		return "机场";
                    	}else if(value==4){
                    		return "港口";
                    	}else if(value==5){
                    		return "零担货场";
                    	}
    				}
                },{
                    field: 'address',
                    title: '地址',
                    editable: {  
                        type: 'text',  
                        validate: function (value) {  
                            if ($.trim(value) == '') {  
                                return '地址不能为空!';  
                            }
                        }  
                    }
                },{
                    field: 'telephone',
                    title: '电话',
                    editable: {  
                        type: 'text',  
                        validate: function (value) {  
                        	if ($.trim(value) == '') {  
                                return '电话不能为空!';  
                            }else if(!/^1(3|4|5|7|8)\d{9}$/.test($.trim(value))){
                            	return '电话格式不正确!';  
                            }  
                        }  
                    }
                },{
                    field: 'remark',
                    title: '备注',
                    editable: {  
                        type: 'text',  
                        validate: function (value) {  
                            if ($.trim(value) == '') {  
                                return '备注不能为空!';  
                            }  
                        }  
                    }
                },{
                    field: 'enterName',
                    title: '录入人',
                },{
                    field: 'enterOrgName',
                    title: '录入单位'
                },{
                    field: 'enterTime',
                    title: '录入时间',
                    formatter:function(value){
    					return formatDate(value);
    				}
                },{
                    field: 'lastUpdateName',
                    title: '最后修改人'
                },{
                    field: 'lastUpdateTime',
                    title: '最后修改时间',
                    formatter:function(value){
                    	var date = formatDate(value);
                    	if(date == '1970-01-01 08:00'){
                    		return null;
                    	}
    					return date;
    				}
                }]
            });
        };

        //得到查询的参数
        oTableInit.queryParams = function (params) {
            var temp = {   //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
            		offset: params.offset,    
	                limit: params.limit,    //页码
	                city:$("#searchCity").val(),
					cityCode:$("#searchCityCode").val(),
					baseName:$("#searchBaseName").val(),
					baseType:$("#searchType").val(),
					address:$("#searchAddress").val(),
					telephone:$("#searchTelephone").val(),
					remark:$("#searchRemark").val(),
					enterName:$("#searchEnterName").val(),
					enterOrgName:$("#searchEnterOrgName").val(),
					enterTimes:$("#searchEnterTime").val(),
					lastUpdateName:$("#searchLastUpdateName").val(),
					lastUpdateTimes:$("#searchLastUpdateTime").val()
            };
            return temp;
        }; 
        return oTableInit;
    };
    
    // 初始化页面上面的按钮事件 
    var ButtonInit = function () {
    	var oInit = new Object();
		oInit.Init = function() {
			$("#searchType").bind("change",function(){
				var obj = {
		    			url:"/noob/routeBase/findAllLineQuery.action",
		    			silent: true,
		    			query:{
		    				   baseType:$(this).val(),
		    			}
		    		};
				$('#tb_train').bootstrapTable('refresh', obj);
			})
			
			// 选择添加
			$("#btn_addRouteBase").click(function(){
				cleanText();
			});
			
			// 添加
			$("#addRoute").click(function(){
				$("#addRoute").attr("data-dismiss","modal");
				$.ajax({
					url:'/noob/routeBase/addRouteBaseU.action',
					type:'POST',
					data:{
						city:$("#addCity").val(),
						cityCode:$("#addCityCode").val(),
						baseName:$("#addBaseName").val(),
						baseType:$("#searchType").val(),
						address:$("#addAddress").val(),
						telephone:$("#addTelephone").val(),
						remark:$("#addRemark").val(),
						longitude:$("#addLongitude").val(),
						latitude:$("#addLatitude").val()
					},
					success:function(response){
						if(response=="success"){
							toastr.success('添加成功');
						}else{
							toastr.success('添加失败');
						}
						$('#tb_train').bootstrapTable('refresh', {
				        	url:"/noob/routeBase/findAllLineQuery.action?baseType="+$("#searchType").val()
				        });
					}
				});
			});
			
			// 修改
			$("#btn_updateRouteBase").click(function(){
				var select = $('#tb_train').bootstrapTable('getSelections');
				if (select.length === 0&&select.length>1) {
					toastr.warning('只能选择一行进行修改');
				}else{
					$.ajax({
						url:'/noob/routeBase/updateRouteBaseU.action',
						type:'GET',
						data:{
							routeBaseId:select[0]['routeBaseId'],
							city:select[0]['city'],
							cityCode:select[0]['cityCode'],
							baseName:select[0]['baseName'],
							address:select[0]['address'],
							telephone:select[0]['telephone'],
							remark:select[0]['remark']
						},
						success:function(response){
							if(response=="success"){
								toastr.success('修改成功');
							}else{
								toastr.success('修改失败');
							}
							$('#tb_train').bootstrapTable('refresh', {
					        	url:"/noob/routeBase/findAllLineQuery.action?baseType="+$("#searchType").val()
					        });
						}
					});
				}
			});
			
			// 查询
			$("#searchSubmit").click(function(){
				var obj = {
		    			url:"/noob/routeBase/findAllLineQuery.action",
		    			silent: true,
		    			query:{
		    				city:$("#searchCity").val(),
							cityCode:$("#searchCityCode").val(),
							baseName:$("#searchBaseName").val(),
							baseType:$("#searchType").val(),
							address:$("#searchAddress").val(),
							telephone:$("#searchTelephone").val(),
							remark:$("#searchRemark").val(),
							enterName:$("#searchEnterName").val(),
							enterOrgName:$("#searchEnterOrgName").val(),
							enterTimes:$("#searchEnterTime").val(),
							lastUpdateName:$("#searchLastUpdateName").val(),
							lastUpdateTimes:$("#searchLastUpdateTime").val()
		    			}
		    		};
				$('#tb_train').bootstrapTable('refresh', obj);
			});
			
			// 删除
			$("#btn_canCelRouteBase").click(function(){
				var select = $('#tb_train').bootstrapTable('getSelections');
				if (select.length === 0) {
					toastr.warning('请至少选择一行进行删除');
				} else {
					swal({  
						title: "操作提示",   //弹出框的title  
						text: "确定删除吗？",  //弹出框里面的提示文本  
						type: "success",    //弹出框类型  
						showCancelButton: true, //是否显示取消按钮  
						confirmButtonColor: "#DD6B55",//确定按钮颜色  
						cancelButtonText: "取消",//取消按钮文本  
						confirmButtonText: "是的，确定删除！",//确定按钮上面的文档  
						closeOnConfirm: true  
					}, function () {
						var arrs = [];
						for (var i = 0; i < select.length; i++) {
							arrs[i] = select[i]['routeBaseId'];
						}
						$.ajax({
							url:"/noob/routeBase/deleteRouteBaseU.action",
							type:"POST",
							data:{
								routeBaseIds:arrs
							},
							success:function(response){
								if(response=="success"){
									toastr.success('删除成功');
								}else{
									toastr.success('删除失败');
								}
								$('#tb_train').bootstrapTable('refresh', {
						        	url:"/noob/routeBase/findAllLineQuery.action?baseType="+$("#searchType").val()
						        });
							}
						});
					})
				}
			});
		}
		return oInit;
    }
    
    // 清除添加文本
    function cleanText(){
    	$("#addCity").val("");
		$("#addCityCode").val("");
		$("#addBaseName").val("");
		$("#addAddress").val("");
		$("#addTelephone").val("");
		$("#addRemark").val("");
		$("#addLongitude").val("");
		$("#addLatitude").val("");
	}