<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%  
	String userName = request.getParameter("userName");
	String orgName = request.getParameter("orgName");
%>        
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>盘库</title>
<!-- Jquery组件引用 -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js"></script>
<!-- bootstrap组件引用 -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/bootstrap/js/bootstrap.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/jsps/transfer/sorting/trayWarehouse/css/bootstrap.min.css">

<!-- bootstrap table组件以及中文包的引用 -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/bootstrap-table/bootstrap-table.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/js/bootstrap-table/bootstrap-table.css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>

<!-- 提示框Js文件和Css的引用 -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/toastr/toastr.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/js/toastr/toastr.min.css"/>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/sweetalert/sweetalert.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/js/sweetalert/sweetalert.css" />

<!-- 页面下拉框Js文件和Css的引用 -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/bootstrap-select/js/bootstrap-select.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/js/bootstrap-select/css/bootstrap-select.min.css" />
	
<!-- 页面校验Js文件和Css的引用 -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/bootstrap-validator/bootstrapValidator.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/js/bootstrap-validator/bootstrapValidator.min.css" />
	
<!-- 时间框Js文件和Css的引用 -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/bootstrap-datetimepicker/js/bootstrap-datetimepicker.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/bootstrap-datetimepicker/js/bootstrap-datetimepicker.zh-CN.js"></script>	
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/js/bootstrap-datetimepicker/css/bootstrap-datetimepicker.css" />

<!-- 下拉框 -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/select2/select2.css"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/select2/select2.full.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/select2/select2.min.js"></script>	
<script type="text/javascript" src="${pageContext.request.contextPath}/js/linkage.js"></script>

<!-- editable引用 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap-editable/edittable.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap-editable/bootstrap-table-editable.js"></script>

<!-- 页面JS和CSS的引用 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/jsps/transfer/sorting/trayWarehouse/js/trayWarehouse.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jsps/transfer/sorting/trayWarehouse/js/diskData.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jsps/transfer/sorting/trayWarehouse/js/masterData.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jsps/transfer/sorting/trayWarehouse/js/detailData.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jsps/transfer/sorting/trayWarehouse/js/tray.js"></script>

<!-- 引用导入的CSS以及JS -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jsps/delivery/receipt/jobsImport/css/fileinput.min.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jsps/delivery/receipt/jobsImport/css/worksheetLead.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/jsps/delivery/receipt/jobsImport/js/fileinput.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jsps/delivery/receipt/jobsImport/js/zh.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jsps/delivery/receipt/jobsImport/js/layer/layer.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jsps/delivery/receipt/jobsImport/js/bwizard.min.js"></script>
<style type="text/css">
	.file-drop-zone{
		height:95%;
	}  
	.mid-wrap-tit {
    	position: absolute;
    	background: #ffffff;
    	padding: 3px 6px;
    	left: 11px;
    	top: -16px;
	}
	.mid-wrap {
    	border: #EEEEEE 3px solid;
    	border-radius: 10px;
    	-moz-border-radius: 10px;
    	-webkit-border-radius: 10px;
    	-o-border-radius: 10px;
    	position: relative;
    	margin: 6px 0 15px 0;
    	padding: 28px;
	}
	#import-wrap {
    	font-size: 14px;
    	line-height: 1.8;
	}
	.file-preview-frame{
		height:200px;
	}
	.prompt{
	 	color: #a94442;
	}
</style>
</head>
<body>
	<!-- 标签页切换标签 -->
	<ul class="nav nav-tabs">
	    <li class="active">
	        <a href="#card" data-toggle="tab">卡片</a>
	    </li>
	    <li>
	    	<a href="#tabulation" data-toggle="tab">列表</a>
	    </li>
	</ul>
	<div class="tab-content">
		<div id="card" class="tab-pane fade in active" style="margin:15px 15px;">
			<div class="panel panel-default">
				<div class="panel-heading">
					<a data-toggle="collapse" data-parent="#accordion" href="#collapseCard">
						查询条件
	                </a>
	            </div>
				<div class="panel-collapse collapse on" id="collapseCard">
					<form id="formSearch" class="form-horizontal">
						<div class="form-group" style="margin-top: 15px">
							<!-- 单号 -->
							<label class="control-label col-sm-1" for="txt_search_statu">单号 </label>
							<div class="col-sm-3">
								<input type="text" class="form-control" id="txt_search_storageConnectNumSon">
							</div>
							<!-- 工作单号 -->
							<label class="control-label col-sm-1" for="txt_search_statu">工作单号</label>
							<div class="col-sm-3">
								<input type="text" class="form-control" id="txt_search_jobListNo" >
							</div>
							<!-- 入库人 -->
							<label class="control-label col-sm-1" for="txt_search_statu">入库人</label>
							<div class="col-sm-3">
								<input type="text" class="form-control" id="txt_search_warehouses" >
							</div>
							<!-- 入库时间 -->
							<label class="control-label col-sm-1" for="txt_search_statu">入库时间</label>
							<div class="col-sm-3">
								<input type="text" class="form-control" id="txt_search_start">
							</div>
							<!-- 入库时间 -->
							<label class="control-label col-sm-1" for="txt_search_statu">~</label>
							<div class="col-sm-3">
								<input type="text" class="form-control" id="txt_search_end">
							</div>
							<div class="col-sm-4" style="text-align: left;">
								<button type="button" style="margin-left: 90px;padding: 6px 24px;" id="btn_findWork"
									class="btn btn-primary">查询</button>
							</div>
						</div>
					</form>
				</div>
			</div>
			<!-- 标签页切换标签 -->
			<ul class="nav nav-tabs">
			    <li class="active">
			        <a href="#bookData" data-toggle="tab">账面数据</a>
			    </li>
			    <li>
			    	<a href="#diskData" data-toggle="tab">实盘数据</a>
			    </li>
			</ul> 
			<div class="tab-content">
				<!-- 账面数据 -->
				<div id="bookData" class="tab-pane fade in active" style="padding: 15px;padding-bottom: 0px">
					<div id="toolbar_bookData" class="btn-group">
						<div class="btn-group">
							<button id="btn_addBookData" type="button" class="btn btn-default" data-toggle="modal" data-target="#addBookData">
								<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增
							</button>
							<button style="margin-left: 10px;" id="btn_deleteBookData" type="button" class="btn btn-default" data-toggle="modal">
								<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>删除
							</button>
						</div>
					</div>
					<table id="tb_bookData"></table>
				</div>
				<!-- 实盘数据 -->
				<div id="diskData" class="tab-pane fade" style="padding: 15px;padding-bottom: 0px">
					<div id="toolbar_diskData" class="btn-group">
						<div class="btn-group">
							<button id="btn_" type="button" class="btn btn-default" data-toggle="modal" data-target="#leadingIn">
								<span class="glyphicon glyphicon-log-in" aria-hidden="true"></span>导入
							</button>
							<button style="margin-left: 10px;" id="btn_contrast" type="button" class="btn btn-default" data-toggle="modal" data-target="#contrast" disabled>
								<span class="glyphicon glyphicon-check" aria-hidden="true"></span>对比
							</button>
							<button style="margin-left: 10px;" id="btn_preserve" type="button" class="btn btn-default" data-toggle="modal" disabled>
								<span class="glyphicon glyphicon-saved" aria-hidden="true"></span>保存
							</button>
						</div>	
					</div>
					<table id="tb_diskData"></table>
				</div>
			</div>
		</div>
		
		<!-- 列表 -->
		<div id="tabulation" class="tab-pane fade" style="padding: 15px;padding-bottom: 0px">
			<div class="tab-content">
				<!-- 盘库单主表数据 -->
				<div id="toolbar_masterData" class="btn-group" style="padding-bottom: 0px">
					<div class="btn-group">
						<button onclick="cancelPrompts();" id="btn_addMasterData" type="button" class="btn btn-default" data-toggle="modal" data-target="#addMasterData">
							<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增
						</button>
						<button style="margin-left: 15px;" id="btn_deleteMasterData" type="button" class="btn btn-default">
							<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>删除
						</button>
					</div>		
				</div>
				<table id="tb_masterData"></table>
			
				<!-- 盘库单附表工作单明细数据 -->
				<div id="toolbar_detailData" class="btn-group" style="padding-bottom: 0px">
				</div>
				<table id="tb_detailData"></table>
			</div>
		</div>
	</div>
	
	<!-- 盘库单主表添加模态框（Modal） -->
	<div class="modal fade" id="addMasterData" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<div class="panel panel-success">
						<div class="panel-heading">
							<h3 class="panel-title">添加</h3>
						</div>
						<div class="panel-body">
							<form class="form-horizontal" role="form">
								<!-- 总件数 -->
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">总件数</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" id="count" name="count"
											placeholder="请输入总件数" style="width: 410px;" onblur="checkCount(this)" onfocus="cancelPrompt(this)">
										<span id="count_prompt" class="prompt"></span>
									</div>
								</div>
								<!-- 盘库人 -->
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">盘库人</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" id="trayWarehouseName" name="trayWarehouseName"
											placeholder="请输入盘库人" style="width: 410px;" disabled>
									</div>
								</div>
								<!-- 操作人单位 -->
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">操作人单位</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" id="operatingOrg" name="operatingOrg"
											placeholder="请输入操作人单位" style="width: 410px;" disabled>
									</div>
								</div>
								<div class="modal-footer"> 
									<input type="button" class="btn btn-primary" id="addMasterDataButton" value="确认添加" />
									<input type="button" class="btn btn-default" data-dismiss="modal" value="关闭"  />
								</div>
								<!-- 隐藏域获得用户名和对应的组织名 -->
								<input onclick="checkCount()" type="hidden" value="<%=userName%>" id="userName" />
								<input type="hidden" value="<%=orgName%>" id="orgName" />
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 盘库明细表账面数据添加模态框（Modal） -->
	<div class="modal fade" id="addBookData" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<div class="panel panel-success">
						<div class="panel-heading">
							<h3 class="panel-title">添加</h3>
						</div>
						<div class="panel-body">
							<form class="form-horizontal" role="form">
								<!-- 盘点单号 -->
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">盘点单号</label>
									<div class="col-sm-10">
										<select id="checkNo" class="selectpicker show-menu-arrow" name="checkNo" data-width="410px" data-size="5" >
										</select>
									</div>
								</div>
								<!-- 单号 -->
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">单号</label>
									<div class="col-sm-10">
										<select id="storageConnectNumSon" class="selectpicker show-menu-arrow" name="" data-width="410px" data-size="5" >
										</select>
									</div>
								</div>
								<!-- 工作单号 -->
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">工作单号</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" id="jobListNo" name="jobListNo"
											placeholder="请输入工作单号" style="width: 410px;" disabled>
									</div>
								</div>
								<!-- 合包号 -->
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">合包号</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" id="sourcingNo" name="sourcingNo"
											placeholder="请输入合包号" style="width: 410px;" disabled>
									</div>
								</div>
								<!-- 件数 -->
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">件数</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" id="numberPackages" name="numberPackages"
											placeholder="请输入件数" style="width: 410px;" disabled>
									</div>
								</div>
								<!-- 重量 -->
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">重量</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" id="weight" name="weight"
											placeholder="请输入重量 " style="width: 410px;" disabled>
									</div>
								</div>
								<!-- 体积 -->
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">体积</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" id="volume" name="volume"
											placeholder="请输入体积 " style="width: 410px;" disabled>
									</div>
								</div>
								<!-- 类型 -->
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">类型</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" id="type" name="type"
											placeholder="请输入类型" style="width: 410px;" disabled>
									</div>
								</div>
								<!-- 到达地 -->
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">到达地</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" id="arrivalCity" name="arrivalCity"
											placeholder="请输入到达地" style="width: 410px;" disabled>
									</div>
								</div>
								<!-- 入库人 -->
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">入库人</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" id="warehouses" name="warehouses"
											placeholder="请输入入库人" style="width: 410px;" disabled>
									</div>
								</div>
								<!-- 入库时间 -->
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">入库时间</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" id="laidUpTime" name="laidUpTime"
											data-date-format="yyyy-mm-dd hh:ii:ss" placeholder="入库时间 " style="width: 410px;" disabled>
									</div>
								</div>
								<div class="modal-footer"> 
									<input onclick="" type="button" class="btn btn-primary" id="addBookDataButton" value="确认添加" />
									<input onclick="" type="button" class="btn btn-default" data-dismiss="modal" value="关闭"  />
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 导入 -->
	<div class="modal fade" id="leadingIn" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">盘库单导入</h4>
				</div>
				<div class="modal-body">
					<div id="wizard" class="bwizard clearfix">
						<ol class="bwizard-steps clearfix clickable" role="tablist">
							<li role="tab" style="z-index: 1;" aria-selected="true"
								class="active" id="download"><a href="#step1"
								class="hidden-phone" style="text-decoration:none">下载模板并填写</a></li>
							<li role="tab" style="z-index: 2;" aria-selected="false"id="uploadLead">
								<a href="#step2" class="hidden-phone" style="text-decoration:none">上传导入文件</a></li>
						</ol>
						<div class="tab-content">
							<div id="step1" role="tabpanel" class="bwizard-activated"
								aria-hidden="false" style="">
								<div style="margin-top: 20px; margin-bottom: 20px;">
									导入模板下载 &nbsp;&nbsp; <a href="../../../../../DownServlet?filename=Leading-InTray.xls">
										<button type="button" class="btn btn-success" id="downloadBoard">
											<span aria-hidden="true"></span> 下载
										</button>
									</a>
								</div>
								<div>
									<div class="mid-wrap import">
										<span class="mid-wrap-tit">导入说明</span>
										<h4>填写excel模版</h4>
										<div id="templateCaption">
											<p>1)下载EXCEL空白格式模板,填充数据</p>
											<p>2)模板中红色字体的列为必填项;</p>
										</div>
									</div>
								</div>
							</div>
							<div id="step2" role="tabpanel" class="hide" aria-hidden="true"
								style="">
								<div class="panel panel-default" id="hide"
									style="margin-top: 20px;">
									<div class="file-loading">
										<input id="input-file" name="myFile" type="file" multiple />
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" id="next" class="btn btn-primary">下一步</button>
					<button type="button" id="after" class="btn btn-primary hide">上一步</button>
					<button type="button" id="over" class="btn btn-primary hide"
						data-dismiss="modal" onclick="cancel()">完成</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>	
				</div>
			</div>
		</div>
	</div>
	
	<!-- 对比数据模态框（Modal） -->
	<div class="modal fade" id="contrast" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content" style="width: 730px;right: 60px;">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<div class="panel panel-success" style="width: 700px;">
						<div class="panel-heading">
							<h3 class="panel-title">对比</h3>
						</div>
						<div class="col-sm-6">
							<h3><font color="red">账面数据</font></h3>
							<!-- 盘库单附表工作单明细数据 -->
							<div id="toolbar_contrastDetailData" class="btn-group" style="padding-bottom: 0px">
							</div>
							<table id="tb_contrastDetailData"></table>
						</div>
						<div class="col-sm-6">
							<h3><font color="#FF6700">实盘数据</font></h3>
							<!-- 盘库单附表工作单明细数据 -->
							<div id="toolbar_contrastData" class="btn-group" style="padding-bottom: 0px">
							</div>
							<table id="tb_contrastData"></table>
						</div>
						<div class="modal-footer"> 
							<input type="button" class="btn btn-primary" style="margin-top:20px;" id="confirmationContrastBtn" value="确认对比数据" />
							<input type="button" class="btn btn-default" style="margin-top:20px;" data-dismiss="modal" value="关闭"  />
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>									
</body>
</html>