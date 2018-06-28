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
		$("#display_JLNo").select2({
			ajax : {
				language : "zh-CN", //设置 提示语言
				url : "/noob/pack/basicJobListQuery.action",
				data : function(params) {
					var query = {
						jobListNo : params.term,
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

			placeholder : '请输入单号',
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