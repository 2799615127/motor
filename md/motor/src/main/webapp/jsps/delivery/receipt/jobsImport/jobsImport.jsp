<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>"	>

<title>工作单导入</title>
<meta http-equiv="Content-Type" content="multipart/form-data; charset=utf-8" />
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

 
<style type="text/css">
body {
	margin: 0;
	padding: 0;
}
.background {
	margin-left: 100px;
}
p {
	height: 40px;
	line-height: 40px;
}
.open-model {
	text-align: center;
}
.open-model input {
	padding: 10px 20px;
	font-size: 24px;
	line-height: 24px;
	border: 0px;
	background: #F53639;
	color: #FFF;
	cursor: pointer;
}
.open-model input:hover {
	background: #F3726D;
}
.open-model input:focus {
	border: 0px;
	outline-width: 0px;
}
.model {
	opacity: 0.75;
	background: #666;
	position: fixed;
	left: 0;
	right: 0;
	top: 0;
	bottom: 0;
	z-index: 1000;
}
.model-dialog {
	width: 600px;
	height: 400px;
	background: white;
	position: absolute;
	z-index: 1001;
	left: 0;
	top: 0;
}
.hide {
	display: none;
}
.col-sm-2{
	width:25%;
}
.col-sm-3{
	width:15%;
}
.col-sm-4{
	width:30%;
}
.txt_select_add{
	width:440px;
}
.prompt{
	color:#ff6700;
}
#dowload{
	height:50%;
}
.file-preview{
	height:40%;
}
.modal-content{
	width:625px;
}

</style>
	<!-- 引用css -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/toastr/toastr.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/bootstrap-table/bootstrap-table.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jsps/delivery/receipt/jobsImport/css/fileinput.min.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/bootstrap-editable/bootstrap-editable.css" />
   	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/bootstrap-datetimepicker/css/bootstrap-datetimepicker.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jsps/delivery/receipt/jobsImport/css/worksheetLead.css" />
    <!-- Jquery组件引用 -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/toastr/toastr.js"></script>
	<!-- bootstrap组件引用 -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap/js/bootstrap.js"></script>
	<!-- bootstrap table组件以及中文包的引用 -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap-table/bootstrap-table.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>
	<!-- fileinput引用 -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/jsps/delivery/receipt/jobsImport/js/fileinput.js"></script>
	<!-- zh引用 -->	
	<script type="text/javascript" src="${pageContext.request.contextPath}/jsps/delivery/receipt/jobsImport/js/zh.js"></script>
	<!-- layer引用 -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/jsps/delivery/receipt/jobsImport/js/layer/layer.js"></script>
	<!-- editable引用 -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap-editable/edittable.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap-editable/bootstrap-table-editable.js"></script>
	<!-- datetimepicker引用 -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap-datetimepicker/js/bootstrap-datetimepicker.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap-datetimepicker/js/bootstrap-datetimepicker.zh-CN.js"></script>
	<!-- bwizard引用 -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/jsps/delivery/receipt/jobsImport/js/bwizard.min.js"></script>
	<!-- select2 组件引用 -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/select2/select2.css"/>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/select2/select2.full.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/select2/select2.min.js"></script>
	<!-- 工作单导入js -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/jsps/delivery/receipt/jobsImport/js/jobsImport.js"></script>
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
	</style>
</head>
 
<body>
	
	<div class="panel-body" style="padding-bottom:0px;">
		<div id="toolbar" class="btn-group">
			<!-- 按钮触发模态框 -->
			<button id="btn_enter" type="button" class="btn btn-default" >
				<span aria-hidden="true" class="glyphicon glyphicon-share"></span>下载与导入
			</button>
			<button id="btn_batch" type="button" class="btn btn-default" disabled="disabled">
				<span aria-hidden="true" class="glyphicon glyphicon-qrcode"></span> 生成工作单号
			</button>
			<button id="btn_keep" type="button" class="btn btn-default" data-toggle="modal" disabled="disabled">
				<span aria-hidden="true" class="glyphicon glyphicon-hand-up"></span> 指定取派员 
			</button> 
			<button id="btn_save" type="button" class="btn btn-default" data-toggle="modal" disabled="disabled">
				<span aria-hidden="true" class="glyphicon glyphicon-phone"></span>保存
			</button> 
			<button id="btn_explain" type="button" class="btn btn-default">
				<span aria-hidden="true" class="glyphicon glyphicon-send" ></span> 填写说明
			</button>
		</div>	
	</div>
	<!-- 表格数据 -->
	<table id="tb_departments"></table>
		
	<!-- 模态框（Modal） -->
	<!-- 导入 -->
	<div class="modal fade" id="enter" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">工作单导入</h4>
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
							<div id="step1" role="tabpanel" class="bwizard-activated "
								aria-hidden="false" style="">
								<div style="margin-top: 20px; margin-bottom: 20px;">
									导入模板下载 &nbsp;&nbsp; <a href="DownServlet?filename=Import.xls">
										<button type="button" class="btn btn-success"
											id="downloadBoard">
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
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" id="after" class="btn btn-primary hide">上一步</button>
					<button type="button" id="over" class="btn btn-primary hide"
						data-dismiss="modal" onclick="cancel()">完成</button>
				</div>
			</div>
		</div>
	</div>
	<!-- ================================================================================== -->
	
	<!-- 保存 -->
	<div class="modal fade" id="keep" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">保存</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" onsubmit="return check()" role="form"
						id="">
						<div class="form-group">
							<label for="firstname" class="col-sm-2 control-label">取件人工号</label>
							<div class="col-sm-10">
								<select id="empNum" class="txt_select_add" name="txt_add_empNum" style="width:490px;">
            				   	</select>
							</div>
						</div>

						<div class="form-group">
							<label for="firstname" class="col-sm-2 control-label" >取件人</label>
							<div class="col-sm-10">
            				   	<input type="text" class="form-control" id="empName" disabled="disabled">
							</div> 
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal"
						onclick="cancel()">取消</button>
					<button type="button" id="addImport" class="btn btn-primary">指定</button>
				</div>
			</div>
		</div>
	</div>
	
	<!-- ================================================================================== -->
	<!-- 填写说明开始 -->
	<div class="modal fade" id="remake" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">填写说明</h4>
				</div>


				<div class="modal-body">
					<p style="margin-top: 20px;">1)下载EXCEL空白格式模板,填充数据</p>
					<p style="margin-top: 20px;">2)模板中红色字体的列为必填项;</p>
					<p style="margin-top: 20px;">3)选择已下载填写完成的模板,点击文件上传导入;</p>
					<p style="margin-top: 20px;">4)点击批量生成工作单号按钮生成工作单号</p>
					<p style="margin-top: 20px;">5)点击指定取派员按钮指定取派员</p>
					<p style="margin-top: 20px;">6)保存操作结果</p>
				</div>
			</div>
		</div>
	</div>
	<!-- 填写说明结束 -->
</body>
</html>
