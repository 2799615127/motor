// 查询所有数据
var TableInit = function () {
        var oTableInit = new Object();
        //初始化Table
        oTableInit.Init = function () {
            $('#tb_jobList').bootstrapTable({
                url:'/noob/jobListPrint/findAllJobListQuery.action',         //请求后台的URL（*）
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
                uniqueId: "value",                     //每一行的唯一标识，一般为主键列
                showToggle:true,                    //是否显示详细视图和列表视图的切换按钮
                cardView: false,                    //是否显示详细视图
                detailView: false,                   //是否显示父子表
                columns: [{
                    checkbox: true
                },{
                    field: '',
                    title: '序号',
                    formatter: function (value, row, index) {  
                        return index+1;  
                    } 
                }, {
                    field: 'jobListNo',
                    title: '工作单号'
                }, {
                    field: 'charginInfo.methodOfSettlingAccounts',
                    title: '结算方式'
                },{
                    field: 'product',
                    title: '发货类型'
                },{
                    field: 'mannedRequire',
                    title: '发货方式'
                },{
                    field: 'whither',
                    title: '到达地'
                }]
            });
        };

        //得到查询的参数
        oTableInit.queryParams = function (params) {
            var temp = {   //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
            		offset: params.offset,    
	                limit: params.limit    //页码
            };
            return temp;
        }; 
        return oTableInit;
    };
    
    // 初始化页面上面的按钮事件 
    var ButtonInit = function () {
    	var oInit = new Object();
		oInit.Init = function() {
			$("#btn_print").click(function(){
				var select = $('#tb_jobList').bootstrapTable('getSelections');
				if (select.length === 0) {
					toastr.warning('请至少选择一行进行打印');
				} else {
					$.ajax({
						url:"/noob/jobListPrint/printJobList.action",
						type:"GET",
						data:{jobListNo:select[0]["jobListNo"],
							cuNo:select[0]["cuNo"],
							productName:select[0]["productName"],
							factQuantity:select[0]["factQuantity"],
							factWeight:select[0]["factWeight"],
							product:select[0]["product"],
							whither:select[0]["whither"],
							mannedRequire:select[0]["mannedRequire"],
							sender:select[0]["postInfo"]["sender"],
							senderUnit:select[0]["postInfo"]["senderUnit"],
							senderAddress:select[0]["postInfo"]["senderAddress"],
							senderCellPhone:select[0]["postInfo"]["senderCellPhone"],
							senderPhone:select[0]["postInfo"]["senderPhone"],
							addressee:select[0]["postInfo"]["addressee"],
							addresseeUnit:select[0]["postInfo"]["addresseeUnit"],
							addresseeAddress:select[0]["postInfo"]["addresseeAddress"],
							addresseeCellPhone:select[0]["postInfo"]["addresseeCellPhone"],
							addresseePhone:select[0]["postInfo"]["addresseePhone"],
							precharge:select[0]["charginInfo"]["precharge"],
							packingRequirement:select[0]["charginInfo"]["packingRequirement"],
							bagging:select[0]["charginInfo"]["bagging"],
							safeMoney:select[0]["charginInfo"]["safeMoney"],
							methodOfSettlingAccounts:select[0]["charginInfo"]["methodOfSettlingAccounts"],
							serviceTimeLimits:formatNewDate(select[0]["transportInfo"]["serviceTimeLimit"]),
							signingTimes:formatNewDate(select[0]["transportInfo"]["signingTime"]),
							},
						success:function(response){
							if(response == "true"){
								window.open("/noob/jsps/delivery/receipt/jobListPrint/jsps/stampJobListPrint.jsp");
							}
						}
					});
					
				}
			});
			
			// 查询
			$("#searchSubmit").click(function(){
				var obj = {
		    			url:"/noob/jobListPrint/findVagueJobList.action",
		    			silent: true,
		    			query:{
		    				   jobListNo : $("#searchJobListNo").val(),
		    				   settlingAccounts : $("#searchSettlingAccounts").val(),
		    				   product : $("#searchProduct").val(),
		    				   mannedRequire : $("#searchMannedRequire").val(),
		    				   whither : $("#searchWhither").val()
		    			}
		    		};
					$('#tb_jobList').bootstrapTable('refresh', obj);
			});
		};
		return oInit;
    };