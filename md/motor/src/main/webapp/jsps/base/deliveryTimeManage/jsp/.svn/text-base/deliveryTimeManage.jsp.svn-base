<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page isELIgnored="false" %>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro"%>
<%
	String userName = request.getParameter("userName");
	request.getSession().setAttribute("userName", userName);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
     <meta name="viewport" content="width=device-width" />
     
    <meta http-equiv="Cache-Control" content="max-age=0" />
    <meta http-equiv="Cache-control" content="no-cache" />

   <title>Insert title here</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js"></script>
	
	<!-- bootstrap组件引用 -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap/js/bootstrap.js"></script>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/bootstrap/css/bootstrap.min.css">
	
	<!-- bootstrap table组件以及中文包的引用 -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap-table/bootstrap-table.js"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/bootstrap-table/bootstrap-table.css" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>
    <script type="text/javascript"
	src="${pageContext.request.contextPath}/js/bootstrap-select/js/bootstrap-select.min.js"></script>
    <link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/js/bootstrap-select/css/bootstrap-select.min.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/toastr/toastr.min.js"></script>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/toastr/toastr.min.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/sweetalert/sweetalert.min.js"></script>
    <link  rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/sweetalert/sweetalert.css">
</head>
<!-- 模态框（Modal） -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	    <div class="modal-dialog">
	        <div class="modal-content">
	            <div class="modal-header">
	                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>	               
	               <div class="panel panel-success">
		                <div class="panel-heading">
							<h3 class="panel-title">添加</h3>
						</div>
					<div class="panel-body">
						<form class="form-horizontal" onsubmit="return check()" role="form">
							<div class="form-group">
								<label for="lastname" class="col-sm-2 control-label">平均上班时间</label>
								<div class="col-sm-10">
									<div class="col-sm-10">
								    <label class="col-sm-3 control-label">小时：</label>
                                      <div class="col-sm-3">
								        <select id="averageOnDutyTimeHr" style="width:75px" class="form-control" onchange="selectOnchang(this)" >
                                         <option>07</option>
                                         <option>08</option>
                                         <option>09</option>
                                         <option>20</option>
                                         <option>21</option>
                                         <option>22</option>
                                        </select>
                                      </div>
                                      <label class="col-sm-3 control-label">分钟：</label>
                                      <div class="col-sm-3">
                                        <select id="averageOnDutyTimeMin" style="width:75px" class="form-control" onchange="selectOnchang(this)" >
                                          <option>00</option>
                                          <option>10</option>
                                          <option>20</option>
                                          <option>30</option>
                                          <option>40</option>
                                          <option>50</option>
                                          <option>60</option>
                                        </select>
                                   </div>
								</div>
								</div>
							</div>
							
							
							<div class="form-group">
								<label for="lastname" class="col-sm-2 control-label">平均下班时间</label>
								<div class="col-sm-10">
									<div class="col-sm-10">
								    <label class="col-sm-3 control-label">小时：</label>
                                      <div class="col-sm-3">
								        <select id="averageKnockOffTimeHr" style="width:75px" class="form-control" onchange="selectOnchang(this)" >
                                         <option>19</option>
                                         <option>20</option>
                                         <option>21</option>
                                         <option>07</option>
                                         <option>08</option>
                                         <option>09</option>
                                        </select>
                                      </div>
                                      <label class="col-sm-3 control-label">分钟：</label>
                                      <div class="col-sm-3">
                                        <select id="averageKnockOffTimeMin"style="width:75px" class="form-control" onchange="selectOnchang(this)" >
                                          <option>00</option>
                                          <option>10</option>
                                          <option>20</option>
                                          <option>30</option>
                                          <option>40</option>
                                          <option>50</option>
                                          <option>60</option>
                                        </select>
                                   </div>
								</div>
								</div>
							</div>
							<div class="form-group">
								<label for="lastname" class="col-sm-2 control-label">周六上班时间</label>
								<div class="col-sm-10">
									<div class="col-sm-10">
								    <label class="col-sm-3 control-label">小时：</label>
                                      <div class="col-sm-3">
								        <select id="satOnDutyTimeHr" style="width:75px" class="form-control" onchange="selectOnchang(this)" >
                                         <option>07</option>
                                         <option>08</option>
                                         <option>09</option>
                                         <option>20</option>
                                         <option>21</option>
                                         <option>22</option>
                                        </select>
                                      </div>
                                      <label class="col-sm-3 control-label">分钟：</label>
                                      <div class="col-sm-3">
                                        <select id="satOnDutyTimeMin" style="width:75px" class="form-control" onchange="selectOnchang(this)" >
                                          <option>00</option>
                                          <option>10</option>
                                          <option>20</option>
                                          <option>30</option>
                                          <option>40</option>
                                          <option>50</option>
                                          <option>60</option>
                                        </select>
                                   </div>
								</div>
								</div>
							</div>
							<div class="form-group">
								<label for="lastname" class="col-sm-2 control-label">周六下班时间</label>
								<div class="col-sm-10">
									<div class="col-sm-10">
								    <label class="col-sm-3 control-label">小时：</label>
                                      <div class="col-sm-3">
								        <select id="satKnockOffTimeHr" style="width:75px" class="form-control" onchange="selectOnchang(this)" >
                                        <option>19</option>
                                         <option>20</option>
                                         <option>21</option>
                                         <option>07</option>
                                         <option>08</option>
                                         <option>09</option>
                                        </select>
                                      </div>
                                      <label class="col-sm-3 control-label">分钟：</label>
                                      <div class="col-sm-3">
                                        <select id="satKnockOffTimeMin" style="width:75px" class="form-control" onchange="selectOnchang(this)" >
                                          <option>00</option>
                                          <option>10</option>
                                          <option>20</option>
                                          <option>30</option>
                                          <option>40</option>
                                          <option>50</option>
                                          <option>60</option>
                                        </select>
                                   </div>
								</div>
								</div>
							</div>
							<div class="form-group">
								<label for="lastname" class="col-sm-2 control-label">周日上班时间</label>
								<div class="col-sm-10">
									<div class="col-sm-10">
								    <label class="col-sm-3 control-label">小时：</label>
                                      <div class="col-sm-3">
								        <select id="sundayOnDutyTimeHr" style="width:75px" class="form-control" onchange="selectOnchang(this)" >
                                         <option>07</option>
                                         <option>08</option>
                                         <option>09</option>
                                         <option>20</option>
                                         <option>21</option>
                                         <option>22</option>
                                        </select>
                                      </div>
                                      <label class="col-sm-3 control-label">分钟：</label>
                                      <div class="col-sm-3">
                                        <select id="sundayOnDutyTimeMin" style="width:75px" class="form-control" onchange="selectOnchang(this)" >
                                          <option>00</option>
                                          <option>10</option>
                                          <option>20</option>
                                          <option>30</option>
                                          <option>40</option>
                                          <option>50</option>
                                          <option>60</option>
                                        </select>
                                   </div>
								</div>
								</div>
							</div>
							<div class="form-group">
								<label for="lastname" class="col-sm-2 control-label">周日下班时间</label>
								<div class="col-sm-10">
									<div class="col-sm-10">
								    <label class="col-sm-3 control-label">小时：</label>
                                      <div class="col-sm-3">
								        <select id="sundayKnockOffTimeHr" style="width:75px" class="form-control" onchange="selectOnchang(this)" >
                                         <option>19</option>
                                         <option>20</option>
                                         <option>21</option>
                                         <option>07</option>
                                         <option>08</option>
                                         <option>09</option>
                                        </select>
                                      </div>
                                      <label class="col-sm-3 control-label">分钟：</label>
                                      <div class="col-sm-3">
                                        <select id="sundayKnockOffTimeMin" style="width:75px" class="form-control" onchange="selectOnchang(this)" >
                                          <option>00</option>
                                          <option>10</option>
                                          <option>20</option>
                                          <option>30</option>
                                          <option>40</option>
                                          <option>50</option>
                                          <option>60</option>
                                        </select>
                                   </div>
								</div>
								</div>
							</div>
							<div class="form-group">
								<label for="lastname" class="col-sm-2 control-label">描述</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="description"
										placeholder="请输入描述"  onfocus="if(this.value=='请输入描述')this.value=''" 
										onblur="if(this.value=='')this.value='请输入描述'">
								</div>
							</div>
							</form>
					   </div>
				   </div>
			       </div>
	            </div>	            
	            <div class="modal-footer">
	            	<button type="button" class="btn btn-primary" id="sub" data-dismiss="modal">提交更改</button>
	                <button type="button" class="btn btn-default4" data-dismiss="modal">关闭</button>
	            </div>
	        </div>
	    </div>
	

<body>
     <div class="panel-body" style="padding-bottom:0px;">
        <div class="panel panel-default">
            <div class="panel-heading">查询条件</div>
            <div class="panel-body">
                <form id="formSearch" class="form-horizontal">
                    <div class="form-group" style="margin-top:15px">
                        <label class="control-label col-sm-1" for="txt_search_departmentname">时间名称</label>
                        <div class="col-sm-3">
                            <input type="text" class="form-control" id="timeNames">
                        </div>
                        <label class="control-label col-sm-1" for="txt_search_statu">描述</label>
                        <div class="col-sm-3">
                            <input type="text" class="form-control" id="descriptions">
                        </div>
                        <div class="col-sm-4" style="text-align:left;">
                            <button type="button" style="margin-left:50px" id="btn_query" class="btn btn-primary">查询</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        
        <div id="toolbar" class="btn-group">
        	<shiro:hasPermission name="新增时间管理">
            <button type="button" class="btn btn-default1" data-toggle="modal" data-target="#myModal">
				<span class="glyphicon glyphicon-plus" aria-hidden="true" ></span>新增
			</button>
			</shiro:hasPermission>
			<shiro:hasPermission name="修改时间管理">
            <button id="btn_edit" type="button" class="btn btn-default">
                <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>修改
            </button>
            </shiro:hasPermission>
            <shiro:hasPermission name="作废时间管理">
            <button id="btn_delete" type="button" class="btn btn-default">
                <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>作废
            </button>
            </shiro:hasPermission>
            <shiro:hasPermission name="还原时间管理">
            <button id="btn_deoxidize" type="button" class="btn btn-default">
                <span  aria-hidden="true"></span>还原
            </button>
            </shiro:hasPermission>
        </div>
        <table id="tb_departments"></table>
    </div>
    
    <script type="text/javascript">
    //初始化操作消息提示框
    $(function(){
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
    })
	//模态框的初始化
    function test() {
		var oldWidth = $('body').outerWidth();
		var marginLeft = (document.documentElement.clientWidth - $(
				".model-dialog").outerWidth()) / 2;
		var marginHeight = (document.documentElement.clientHeight - $(
				".model-dialog").outerHeight()) / 2;
		$('.model-dialog').css('margin-left', marginLeft);
		$('.model-dialog').css('margin-top', marginHeight);
		$('body').css('overflow', 'hidden');
		var newWidth = $('body').outerWidth();
		var scrollbarWidth = newWidth - oldWidth;
		$('body').css('padding-right', scrollbarWidth + 'px');
		$('.model').removeClass('hide');
		$('.model-dialog').removeClass('hide');
		
	}
    

    $(function () {
        
        //1.初始化Table
        var oTable = new TableInit();
        oTable.Init();

        //2.初始化Button的点击事件
        var oButtonInit = new ButtonInit();
        oButtonInit.Init();

    });

    var TableInit = function () {
        var oTableInit = new Object();
        //初始化Table
        oTableInit.Init = function () {
        	//easyui的表格
            $('#tb_departments').bootstrapTable({
                url:'/noob/deliveryTime/deliveryTimeManagePageQuery.action',         //请求后台的URL（*）
                method: 'get',                      //请求方式（*）
                toolbar: '#toolbar',                //工具按钮用哪个容器
                striped: true,                      //是否显示行间隔色
                cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
                pagination: true,                   //是否显示分页（*）
                sortable: false,                     //是否启用排序
                sortOrder: "asc",                   //排序方式
                queryParamsType : "undefined",
                queryParams: oTableInit.queryParams,//传递参数（*）
                sidePagination: "server",           //分页方式：client客户端分页，server服务端分页（*）
                pageNumber:1,                       //初始化加载第一页，默认第一页
                pageSize: 5,                       //每页的记录行数（*）
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
                queryParams: function queryParams(params) {   //设置查询参数  
                	var param = {    
                			pageNumber: params.pageNumber,    
            	            pageSize: params.pageSize   //页码
            	            
	                };    
	                return param;                   
	            },//传递参数（*）
                columns: [{
                    checkbox: true
                },{
                    field: 'timeName',
                    title: '时间名称'
                }, {
                    field: 'averageOnDutyTime',
                    title: '平均上班时间'
                }, {
                    field: 'averageKnockOffTime',
                    title: '平均下班时间'
                },{
                    field: 'satOnDutyTime',
                    title: '周六上班时间'
                },{
                    field: 'satKnockOffTime',
                    title: '周六下班时间'
                },{
                    field: 'sundayOnDutyTime',
                    title: '周日上班时间'
                },{
                    field: 'sundayKnockOffTime',
                    title: '周日下班时间'
                },{
                    field: 'updateTimeStr',
                    title: '更新时间'
                },{
                    field: 'status',
                    title: '作废',
                    //判断status的数据是否为0,在修改显示在页面上的数据
                    formatter : function(value, row, index) {
    					if (row.status == '0') {
    						return '否';
    					} else {
    						return '是';
    					}
    				}

                },{
                    field: 'description',
                    title: '描述'
                },],
                //根据status的数据不同，数据在页面上显示的颜色不同
	            rowStyle: function (row, index) {
	                //这里有5个取值代表5中颜色['active', 'success', 'info', 'warning', 'danger'];
	                var strclass = {};
	                if (row.status == "1") {
	                    strclass ={css:{'background-color':'#7FFFD4'}};//还有一个active
	                }
	                return strclass 
	            }

            });
        };
      //得到查询的参数
        oTableInit.queryParams = function (params) {
            var temp = {   //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
            	pageNumber: params.pageNumber,    
	            pageSize: params.pageSize  //页码
            };
            return temp;
        }; 
        return oTableInit;
    };
     
    var ButtonInit = function() {
    	var oInit = new Object();
    	var postdata = {};
    	oInit.Init = function() {
    		// 初始化页面上面的按钮事件
    		$("#btn_add").click(function() {
    			test();
    		});
    		
    		// 点击查询按钮触发的事件
	    	$("#btn_query").click(function(){
	    		var obj = {
	    			url:"/noob/deliveryTime/deliveryTimeManagePageQuery.action",
	    			silent: true,
	    			query:{
	    				 timeName:$('#timeNames').val(),
	    				 description:$('#descriptions').val()
	    			}
	    		};
	    		$('#tb_departments').bootstrapTable('refresh', obj);
	 
	    	});
    		//点击修改按钮触发的事件
    		$("#btn_edit").click(function() {
    			//拿到本页面的表格
    			var select = $('#tb_departments').bootstrapTable('getSelections');
    			//当表格选中的行数为0行时
    			if (select.length === 0) {
    				toastr.warning("请选择一行");
    		    //当表格选中的行数为1时
    			}else if(select.length==1){
    				//条件达到跳转到修改页面
    				$(location).attr('href', '/noob/jsps/base/deliveryTimeManage/jsp/updateDeliveryTimeManage.jsp?timeId='
    						+select[0]['timeId']+'&description='+select[0]['description']);
    			}else{
    				toastr.warning("只能选择一行");
    			}
    		});
    		//点击添加按钮触发的事件 
    		$("#sub").click(
    			function(){
    				//判断状态是否为中
    			    if(''==$("#description").val()||null==$("#description").val()){
    			    	toastr.warning("状态不能为空");
    				}else{
    					$.ajax({
    	    	    		url:"/noob/deliveryTime/addDeliveryTimeManageU.action",
    	    	    	    type:"GET",
    	    	    	    data:{
    	    	    	       timeName:$("#averageOnDutyTimeHr").val()+"点"+$("#averageOnDutyTimeMin").val()+"到"+$("#averageKnockOffTimeHr").val()+"点"+$("#averageKnockOffTimeMin").val(),
    	      	    		   averageOnDutyTime:$("#averageOnDutyTimeHr").val()+":"+$("#averageOnDutyTimeMin").val()+":00",
    	      	    		   averageKnockOffTime:$("#averageKnockOffTimeHr").val()+":"+$("#averageKnockOffTimeMin").val()+":00",
    	      	    		   satOnDutyTime:$("#satOnDutyTimeMin").val()+":"+$("#satOnDutyTimeMin").val()+":00",
    	      	    		   satKnockOffTime:$("#satKnockOffTimeHr").val()+":"+$("#satKnockOffTimeMin").val()+":00",
    	      	    		   sundayOnDutyTime:$("#sundayOnDutyTimeHr").val()+":"+$("#sundayOnDutyTimeMin").val()+":00",
    	      	    		   sundayKnockOffTime:$("#sundayKnockOffTimeHr").val()+":"+$("#sundayKnockOffTimeMin").val()+":00",
    	      	    		   status:$("#status").val(),
    	      	    		   description:$("#description").val()
    	    	    	    },
    	    	    	   success:function(result){
    	    	    		   if(result=="success"){
    	    	    			   //重定向到本页面
    	    	    			   $('#tb_departments').bootstrapTable('refresh',{
    			    					url:"/noob/deliveryTime/deliveryTimeManagePageQuery.action"
    			    				});
    	    	    			   toastr.success('添加成功!');
    	    	    		   }else{
    	    	    			   toastr.error('添加失败');
    	    	    		   }
    	    	    	   }
    	    	    	});
    				}
    			});
    		
    	    //点击还原按钮的发生的事件
    	    $("#btn_deoxidize").click(function(){
    	    	var select = $('#tb_departments').bootstrapTable('getSelections');
    			if (select.length === 0) {
    				toastr.warning('请至少选择一行进行还原!');
    			} else{
    				swal({  
						title: "操作提示",   //弹出框的title  
						text: "确定还原吗？",  //弹出框里面的提示文本  
						type: "warning",    //弹出框类型  
						showCancelButton: true, //是否显示取消按钮  
						confirmButtonColor: "#DD6B55",//确定按钮颜色  
						cancelButtonText: "取消",//取消按钮文本  
						confirmButtonText: "是的，确定还原 ！",//确定按钮上面的文档  
						closeOnConfirm: true  
					},function(){
    				var arrs = [];
    				for (var i = 0; i < select.length; i++) {
    					arrs[i] = select[i]['timeId'];
    				}
    				$.ajax({
    					type: "GET", 
    					url:'/noob/deliveryTime/updateDeliveryTimeManageInStatusU.action',
    					data : {
    						timeIds:arrs,
    						status:0
    					},
    					success:function(result) {
    						if (result == "success") {
    							//重定向到本页面
    							$('#tb_departments').bootstrapTable('refresh',{
    		    					url:"/noob/deliveryTime/deliveryTimeManagePageQuery.action"
    		    				});
    							toastr.success('删除成功!');
    						} else {
    							toastr.error('删除失败!');
    						}
    					}
    				});
    			  });
    			}
    	    });
    	    
    	    //点击还原按钮所发生的事件
    		$("#btn_delete").click(function() {
    			var select = $('#tb_departments').bootstrapTable('getSelections');
    			if (select.length === 0) {
    				toastr.warning('请至少选择一行进行删除!');
    			} else {
    				swal({  
						title: "操作提示",   //弹出框的title  
						text: "确定作废吗？",  //弹出框里面的提示文本  
						type: "warning",    //弹出框类型  
						showCancelButton: true, //是否显示取消按钮  
						confirmButtonColor: "#DD6B55",//确定按钮颜色  
						cancelButtonText: "取消",//取消按钮文本  
						confirmButtonText: "是的，确定作废！",//确定按钮上面的文档  
						closeOnConfirm: true  
					},function(){
    				var arrs = [];
    				for (var i = 0; i < select.length; i++) {
    					arrs[i] = select[i]['timeId'];
    				}
    				$.ajax({
    					type: "GET", 
    					url:'/noob/deliveryTime/updateDeliveryTimeManageInStatusU.action',
    					data : {
    						timeIds:arrs,
    						status:1
    					},
    					success:function(result) {
    						if (result == "success") {
    							//重定向到本页面
    							$('#tb_departments').bootstrapTable('refresh',{
    		    					url:"/noob/deliveryTime/deliveryTimeManagePageQuery.action"
    		    				});
    							toastr.success('删除成功!');
    						} else {
    							toastr.error('删除失败!');
    						}
    					}
    				});
    			});
    			}	
    		});

    	};
    	return oInit;
    };

        
    </script>       
</body>
</html>