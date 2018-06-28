// 查询所有数据
var TableInit = function () {
        var oTableInit = new Object();
        //初始化Table
        oTableInit.Init = function () {
            $('#tb_departments').bootstrapTable({
                url:'/noob/subarea/subareaPageQuery.action',         //请求后台的URL（*）
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
                search: true,                       //是否显示表格搜索，此搜索是客户端搜索，不会进服务端，所以，个人感觉意义不大
                strictSearch: true,
                showColumns: true,                  //是否显示所有的列
                showRefresh: true,                  //是否显示刷新按钮
                minimumCountColumns: 2,             //最少允许的列数
                clickToSelect: true,                //是否启用点击选中行
                uniqueId: "province",                     //每一行的唯一标识，一般为主键列
                showToggle:true,                    //是否显示详细视图和列表视图的切换按钮
                cardView: false,                    //是否显示详细视图
                detailView: false,                   //是否显示父子表
                /*queryParams: function queryParams(params) {   //设置查询参数  
                	var param = {    
	                   offset: params.offset,    
	                   limit: params.limit
	                };    
	                return param;                   
	            },*///传递参数(*)
                columns: [{
                    checkbox: true
                },{
                    field: 'province',
                    title: '省'
                }, {
                    field: 'city',
                    title: '市'
                }, {
                    field: 'district',
                    title: '县/区'
                },{
                    field: 'ripAreaCode',
                    title: '定区编码',
                    formatter : function(value, row, index) {
        				if (row.ripAreaCode == null) {
        					return '未分配定区';
        				}else{
        					return row.ripAreaCode;
        				}
        			}
                },{
                    field: 'keyword',
                    title: '关键字'
                },{
                    field: 'startNum',
                    title: '起始号'
                },{
                    field: 'endNum',
                    title: '终止号'
                },{
                    field: 'oddEvenNum',
                    title: '单双号',
                    formatter : function(value, row, index) {
        				if (row.oddEvenNum == 0) {
        					return '单';
        				}else if(row.oddEvenNum == 1){
        					return '双';
        				}
        			}
                },{
                    field: 'position',
                    title: '地址'
                }]
            });
        };

        //得到查询的参数
        oTableInit.queryParams = function (params) {
            var temp = {   //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
            		offset: params.offset,    
	                limit: params.limit,    //页码
	                province : $("#txt_search_province").val(),
	    			city : $("#txt_search_city").val(),
	    			district : $("#txt_search_district").val(),
	    			ripAreaCode : $("#txt_search_ripAreaCode").val(),
	    			keyword : $("#txt_search_keyword").val()
            };
            return temp;
        }; 
        return oTableInit;
    };
    
    // 初始化页面上面的按钮事件 
    var ButtonInit = function () {
    	var oInit = new Object();
		var postdata = {};
		oInit.Init = function() {
			function cleanAddText(){
				$("#txt_add_province").text('');
				$('#txt_add_city').text('');
				$('#txt_add_district').text('');
				$('#addKeyword').val('');
				$('#addStartNum').val('');
				$('#addEndNum').val('');
				$('#addOddEvenNum').val('');
			}
			
			// 清除提示内容
			function cleanSpan(formSpan){
				$(formSpan).each(function(){
					$(this).next().text('');
				});
			}
			
			// 清除提示css
			function cleanCss(cssStyle){
				$(cssStyle).each(function(){
					$(this).parent().parent().removeClass("has-error");
					$(this).parent().parent().removeClass("has-warning");
					$(this).parent().parent().removeClass("has-success");
				});
			}
			
			// 添加按钮
			$("#btnAdd").click(function(){
				$("#addSub").attr("data-dismiss","");
				// 清除文本和样式
				cleanAddText();
				cleanCss("#addForm input");
				cleanCss("#addForm select");
				cleanSpan("#addForm input");
				// 添加表单的所有input
				$("#addForm input").each(function (){
					var title = $(this).attr("title");
					$(this).attr('placeholder',title);
				});
			});
			
			
			
			// 批量导入
			$("#btn_leading-in").upload({
		        action:"/noob/subarea/uploadExcel.action", //表单提交的地址
		        name:"mySubareaFile",
		        enctype: 'multipart/form-data', // 编码格式  
		        autoSubmit: true, // 选中文件提交表单  
		        onSelect: function() {//当用户选择了一个文件后触发事件
		            //当选择了文件后，关闭自动提交
		            this.autoSubmit=false;
		            //校验上传的文件名是否满足后缀为.xls或.xlsx
		            var regex =/^.*\.(?:xls|xlsx)$/i;
		            //this.filename()返回当前选择的文件名称 (ps：我使用这个方法没好使，自己写了一个获取文件的名的方法) $("[name = '"+this.name()+"']").val())
		            if(regex.test($("[name = '"+this.name()+"']").val())){
		            	//通过校验
		                this.submit();
		            }else{
		                //未通过
		            	toastr.error('文件格式不正确'); //错误提示框，文件格式不正确，必须以.xls或.xlsx结尾
		            }
		        },
		        onComplete: function(data, self, element) { //提交表单之后
		        	if(data == '0'){
		        		toastr.success('添加成功'); //提示框，Excel导入成功
			        }else{
			            toastr.error('添加失败');//提示框，Excel导入失败
			        }
		        	$('#tb_departments').bootstrapTable('refresh', {
			        	url:"/noob/subarea/subareaPageQuery.action"
			        });
			    },
		    });
			
			// 批量导出
			$("#btn_leading-out").click(function(){
				swal({  
					title: "操作提示",   //弹出框的title  
					text: "确定导出吗？",  //弹出框里面的提示文本  
					type: "success",    //弹出框类型  
					showCancelButton: true, //是否显示取消按钮  
					confirmButtonColor: "#DD6B55",//确定按钮颜色  
					cancelButtonText: "取消",//取消按钮文本  
					confirmButtonText: "是的，确定导出！",//确定按钮上面的文档  
					closeOnConfirm: true  
				}, function () {
					$.ajax({
						url:"/noob/subarea/excleOut.action",
					    type: "GET",
					    data:{path:"C:\\Users\\Administrator\\Desktop\\分区导出数据.xlsx"},
						
					    success:function(data){
					    	if(data=="success"){
					    		toastr.success('导出成功');
					    	}else{
					    		toastr.error('导出失败');
					    	}
					    },
					});
				});
			});
			
			// 判断元素内容是否为空
			function checkNotNull(obj){
				if($(obj).val()=='' || $(obj).val()==null){
					$(obj).parent().parent().removeClass('has-success');
					$(obj).parent().parent().addClass('has-error');
					$(obj).next().text('不能为空');
				}else{
					$(obj).parent().parent().removeClass('has-error');
					$(obj).parent().parent().addClass('has-success');
					$(obj).next().text('');
				}
			}
			
			// 判断元素内容是否为空
			function checkNotNullSelect(obj){
				if($(obj).val()=='' || $(obj).val()==null){
					$(obj).parent().parent().removeClass('has-success');
					$(obj).parent().parent().addClass('has-error');
				}else{
					$(obj).parent().parent().removeClass('has-error');
					$(obj).parent().parent().addClass('has-success');
				}
			}
			
			// 判断开始号和结束号的大小
			function checkStartAndEnd(start,end){
				if(parseInt($(start).val()) >= parseInt($(end).val())){
					$(end).parent().parent().removeClass('has-success');
					$(end).parent().parent().addClass('has-warning');
					$(end).next().text('开始号不能大于等于结束号');
				}else{
					$(end).parent().parent().removeClass('has-warning');
					$(end).parent().parent().addClass('has-success');
					$(end).parent().next().text('');
				}
			}
			
			
			// 添加表单input焦点事件
			$("#addForm input").each(function(){
				$(this).blur(function(){
					checkNotNull(this);
				});
			});	
			
			// 添加表单select改变事件
			$("#addForm select").each(function(){
				$(this).bind("change",function(){
					checkNotNullSelect(this);
				})
			});	
			
			$("#addStartNum").blur(function(){
				checkStartAndEnd($(this),$("#addEndNum"));
			});
			$("#addEndNum").blur(function(){
				checkStartAndEnd($("#addStartNum"),$(this));
			});
			
			// 添加提交到数据库
			$("#addSub").click(function(){
				checkStartAndEnd($("#addStartNum"),$("#addEndNum"));
				
				$("#addForm input").each(function(){
					checkNotNull(this);
				});
				
				$("#addForm select").each(function(){
					checkNotNullSelect(this);
				});
				
				var result = true;
				$("#addForm .form-group").each(function(){
					if($(this).hasClass('has-error')||$(this).hasClass('has-warning')){
						result = false;
						return false;
					}
				});
				
				if(result){
					$("#addSub").attr("data-dismiss","modal");
					//异步同步数据库
					$.ajax({
						url:"/noob/subarea/addSubarea.action",
						type: "GET",
						data:{
					    	province:$("#txt_add_province").val(),
							city:$('#txt_add_city').val(),
							district:$('#txt_add_district').val(),
							keyword:$('#addKeyword').val(),
							startNum:$('#addStartNum').val(),
							endNum:$('#addEndNum').val(),
							oddEvenNum:$('#addOddEvenNum').val(),
						},
						
					    success:function(data){
					    	if(data=="success"){
					    		toastr.success('添加成功');
					    	}else{
					    		toastr.error('添加失败');
					    	}
					    	$('#tb_departments').bootstrapTable('refresh', {
					    		url:"/noob/subarea/subareaPageQuery.action"
					    	});
					    },
					});
				}
			});
			
			// 删除提交到数据库
			$("#btn_delete").click(
					function() {
						var select = $('#tb_departments').bootstrapTable(
								'getSelections');
						if (select.length === 0) {
							toastr.warning('请至少选择一行进行删除');
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
								var arrs = [];
								for (var i = 0; i < select.length; i++) {
									arrs[i] = select[i]['subareaId'];
								}
								$.ajax({
									url:"/noob/subarea/deleteSubarea.action",
								    type: "GET",
								    data:{subareaIds:arrs},
								    success:function(data){
								    	if(data=="success"){
								    		toastr.success('删除成功');
								    	}else{
								    		toastr.error('删除失败');
								    	}
								    	$('#tb_departments').bootstrapTable('refresh', {
								    			url:"/noob/subarea/subareaPageQuery.action"
								    	});
								    },
								});
							});
						}
					});
			
			// 修改触发模态框
			$("#btn_edit").click(function() {
				$("#updateSub").attr("data-dismiss","");
				cleanCss("#updateForm input");
				cleanCss("#updateForm select");
				cleanSpan("#updateForm input");
				// 添加表单的所有input
				$("#updateForm input").each(function (){
					var title = $(this).attr("title");
					$(this).attr('placeholder',title);
				});
				
				var select = $('#tb_departments').bootstrapTable(
							'getSelections');
				if (select.length === 0 || select.length > 1) {
					toastr.warning('只能选择一行进行修改');
				}else{
					$("#myMoalUpdate").modal("show");
					$("#txt_update_province").val(select[0]['province']);
					$("#txt_update_city").val(select[0]['city']);
					$("#txt_update_district").val(select[0]['district']);
					$("#updateKeyword").val(select[0]['keyword']);
					$("#updateStartNum").val(select[0]['startNum']);
					$("#updateEndNum").val(select[0]['endNum']);
					$("#updateOddEvenNum").val(select[0]['oddEvenNum']);
					$("#updatePosition").val(select[0]['position']);
				}
			});
			
			
			$("#updateForm input").each(function(){
				$(this).blur(function(){
					checkNotNull(this);
				});
			});	
			
			$("#updateForm select").each(function(){
				$(this).blur(function(){
					checkNotNullSelect(this);
				});
			});	
			
			$("#updateStartNum").blur(function(){
				checkStartAndEnd($(this),$("#updateEndNum"));
			});
			$("#updateEndNum").blur(function(){
				checkStartAndEnd($("#updateStartNum"),$(this));
			});
			
			// 修改提交到数据库
			$("#updateSub").click(function(){
				checkStartAndEnd($("#updateStartNum"),$("#updateEndNum"));
				
				$("#updateForm input").each(function(){
					checkNotNull(this);
				});
				
				$("#updateForm input").each(function(){
					checkNotNullSelect(this);
				});
				
				var result = true;
				$("#updateForm .form-group").each(function(){
					if($(this).hasClass('has-error')||$(this).hasClass('has-warning')){
						result = false;
						return false;
					}
				});
				
				if(result){
						$("#updateSub").attr("data-dismiss","modal");
						var select = $('#tb_departments').bootstrapTable('getSelections');
						var subareaId = select[0]['subareaId'];
						$.ajax({
							url:"/noob/subarea/updateSubareaAll.action",
						    type: "GET",
						    data:{
						    	subareaId : subareaId,
						    	keyword : $("#updateKeyword").val(),
						    	startNum : $("#updateStartNum").val(),
						    	endNum : $("#updateEndNum").val(),
						    	oddEvenNum : $("#updateOddEvenNum").val()
						    },
						    success:function(data){
						    	if(data=="success"){
						    		toastr.success('修改成功');
						    	}else{
						    		toastr.error('修改失败');
						    	}
						    	$('#tb_departments').bootstrapTable('refresh', {
						    		url:"/noob/subarea/subareaPageQuery.action"
						    	});
						    }
						});
					}
			});
			
			// 添加中省的下拉框
			selectProvince("#txt_add_province");
			// 添加中市的下拉框
			selectCity("#txt_add");
			// 添加中区的下拉框
			selectDistrict("#txt_add");
			
			// 省下拉框改变事件
			$('#txt_add_province').change(function() {
				$('#txt_add_city').empty();
				$('#txt_add_city').change();
			})
			// 市下拉框改变事件
			$('#txt_add_city').change(function() {
				$('#txt_add_district').empty();
			})
			
			// 模糊查询
	    	$("#btn_query").click(function(){
	    		var obj = {
	    			url:"/noob/subarea/conSubareaPageQuery.action",
	    			silent: true,
	    			query:{
	    				   province : $("#txt_search_province").val(),
		    			   city : $("#txt_search_city").val(),
		    			   district : $("#txt_search_district").val(),
		    			   ripAreaCode : $("#txt_search_ripAreaCode").val(),
		    			   keyword : $("#txt_search_keyword").val()
	    			}
	    		};
	    		$('#tb_departments').bootstrapTable('refresh', obj);
	 
	    	});
	    	
		};
		return oInit;
    };
    