$(function() {
	$.fn.modal.Constructor.prototype.enforceFocus = function() {
	};
	//初始化操作消息提示框
	toastr.options = {
		closeButton : false, //是否显示关闭按钮
		debug : false, //是否为调试
		progressBar : true, //是否显示进度条
		positionClass : "toast-top-center", //在页面中显示的位置
		onclick : null, //点击事件
		showDuration : "100", //显示动作时间
		hideDuration : "1000", //隐藏动作时间
		timeOut : "2000", //自动关闭超时时间
		extendedTimeOut : "1000",
		showEasing : "swing",
		hideEasing : "linear",
		preventDuplicates : true,
		preventOpenDuplicates : true, //重复内容的提示框在开启时只出现一个
		showMethod : "fadeIn", //显示的方式
		hideMethod : "fadeOut" //隐藏的方式
	};

	//2.初始化Button的点击事件
	var oButtonInit = new ButtonInit();
	oButtonInit.Init();
});

var ButtonInit = function() {
	var oInit = new Object();
	var postdata = {};

	oInit.Init = function() {
		$("#display_line").select2({
			ajax : {
				language : "zh-CN", //设置 提示语言
				url : "/noob/registration/circuitTypeQuery.action",
				data : function(params) {
					var query = {
						lineType: $("#lineType").val(),
					}
					return query;
				},

				processResults : function(data) {
					return {
						results : data
					};
				},
				cache : true
			},

			escapeMarkup : function(markup) {
				return markup;
			}, // let our custom formatter work
			minimumInputLength : 0,
			templateResult : function formatRepo(repo) {
				return repo.text;
			},
			templateSelection : function formatRepoSelection(repo) {
				return repo.text;
			}
		});
		
		
		$("#logisticsCar").select2({
			ajax : {
				language : "zh-CN", //设置 提示语言
				url : "/noob/registration/logisticsCarQuery.action",
				data : function(params) {
					var query = {
						lineName: $("#display_line").val(),
					}
					return query;
				},

				processResults : function(data) {
					return {
						results : data
					};
				},
				cache : true
			},

			escapeMarkup : function(markup) {
				return markup;
			}, // let our custom formatter work
			minimumInputLength : 0,
			templateResult : function formatRepo(repo) {
				return repo.text;
			},
			templateSelection : function formatRepoSelection(repo) {
				return repo.text;
			}
		});

		$("#display_JLNo").bind("change", function() {
			$.ajax({
				url : "/noob/pack/findBasicJobListQuery.action",
				type : "GET",
				data : {
					jobListNo : $("#display_JLNo").val()
				},
				success : function(response) {
					$("#display_fQ").val(response.factQuantity);
					$("#display_FW").val(response.factWeight);
					$("#display_WH").val(response.whither);
					$("#jobListId").val(response.jobListId);
				}
			});
		})
	};
	return oInit;
};

var TableInit = function () {
    var oTableInit = new Object();
    //初始化Table
    oTableInit.Init = function () {
        /*$('#tb_departments_PIQ').bootstrapTable({
            url: '/noob/pack/findPackInfo.action', //请求后台的URL（*）
            method: 'get',                      //请求方式（*）
            toolbar: '#toolbar',                //工具按钮用哪个容器
            striped: true,                      //是否显示行间隔色
            cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
            pagination: false,                   //是否显示分页（*）
            sortable: false,                     //是否启用排序
            sortOrder: "asc",                   //排序方式
            queryParams: oTableInit.queryParams,//传递参数（*）
            sidePagination: "server",           //分页方式：client客户端分页，server服务端分页（*）
            strictSearch: false,
            showColumns: true,                  //是否显示所有的列
            showRefresh: true,                  //是否显示刷新按钮
            minimumCountColumns: 2,             //最少允许的列数
            clickToSelect: true,                //是否启用点击选中行
            uniqueId: "infoId",                     //每一行的唯一标识，一般为主键列
            showToggle:true,                    //是否显示详细视图和列表视图的切换按钮
            cardView: false,                    //是否显示详细视图
            detailView: false,                   //是否显示父子表
            columns: [{
            	field: 'company',
                title: '单位'
            }, {
                field: 'packaingProject',
                title: '包装项目'
            }, {
                field: 'specifications',
                title: '规格'
            }, {
                field: 'grade',
                title: '等级'
            }, {
                field: 'serviceCharge',
                title: '服务费'
            }, {
                field: 'number',
                title: '数量'
            }, {
                field: 'materialCost',
                title: '材料费'
            }, ]
        });*/
    	$('#tb_departments_CT').bootstrapTable({
			url: '/noob/pack/packPageWholeQuery.action', //请求后台的URL（*）
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
			pageSize: 5,                       //每页的记录行数（*）
			pageList: [5, 25, 50, 100],        //可供选择的每页的行数（*）
			strictSearch: true,
			showColumns: true,                  //是否显示所有的列
			showRefresh: true,                  //是否显示刷新按钮
			minimumCountColumns: 2,             //最少允许的列数
			clickToSelect: true,                //是否启用点击选中行
			uniqueId: "packId",                     //每一行的唯一标识，一般为主键列
			showToggle:true,                    //是否显示详细视图和列表视图的切换按钮
			cardView: false,                    //是否显示详细视图
			detailView: false,                   //是否显示父子表
			columns: [{
				checkbox: true
			}, {
				field: 'factWeight',
				title: 'ID'
			}, {
				field: 'chargedWeight',
				title: '状态'
			}, {
				field: 'chargedWeight',
				title: '线路类型'
			}, {
				field: 'size',
				title: '车号'
			}, ]
		});
    	$('#tb_departments_IR').bootstrapTable({
    		url: '', //请求后台的URL（*）
            method: 'get',                      //请求方式（*）
            toolbar: '#toolbar',                //工具按钮用哪个容器
            striped: true,                      //是否显示行间隔色
            cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
            pagination: false,                   //是否显示分页（*）
            sortable: false,                     //是否启用排序
            sortOrder: "asc",                   //排序方式
            queryParams: oTableInit.queryParams,//传递参数（*）
            sidePagination: "server",           //分页方式：client客户端分页，server服务端分页（*）
            strictSearch: false,
            showColumns: true,                  //是否显示所有的列
            showRefresh: true,                  //是否显示刷新按钮
            minimumCountColumns: 2,             //最少允许的列数
            clickToSelect: true,                //是否启用点击选中行
            uniqueId: "infoId",                     //每一行的唯一标识，一般为主键列
            showToggle:true,                    //是否显示详细视图和列表视图的切换按钮
            cardView: false,                    //是否显示详细视图
            detailView: false,                   //是否显示父子表
            columns: [{
				checkbox: true
			}, {
				field: 'jobListNo',
				title: '描述'
			}, {
				field: 'nameOfAPart',
				title: '节点名称'
			}, {
				field: 'product',
				title: '发车时间'
			}, {
				field: 'nuclearWeightUnit',
				title: '到达时间'
			}, {
				field: 'getProductManName',
				title: '车号'
			}, {
				field: 'userName',
				title: '实载重量'
			}, {
				field: 'billingOperationUnit',
				title: '下节点可装载量'
			}, {
				field: 'packagesNum',
				title: '满载量'
			}, {
				field: 'factWeight',
				title: '满载率'
			}, ]
		});
    };
    return oTableInit;
};

