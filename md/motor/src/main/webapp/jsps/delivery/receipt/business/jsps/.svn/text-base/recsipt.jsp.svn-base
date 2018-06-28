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
<title>业务受理</title>
<!-- Jquery组件引用 -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js"></script>

<!-- bootstrap组件引用 -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/bootstrap/js/bootstrap.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/jsps/delivery/receipt/business/css/bootstrap.min.css">

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
	href="${pageContext.request.contextPath}/js/toastr/toastr.min.css" />
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

<script type="text/javascript" 
	src="${pageContext.request.contextPath}/js/bootstrap-editable/bootstrap-editable.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/bootstrap-editable/bootstrap-table-editable.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/js/bootstrap-editable/bootstrap-editable.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/jsps/delivery/receipt/business/js/consult.js"></script>

<!-- 单独的Js和Css的引用 -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/jsps/delivery/receipt/business/js/orderAttribute-table.js"></script>	
<script type="text/javascript"
	src="${pageContext.request.contextPath}/jsps/delivery/receipt/business/js/recsiptConsult-table.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/jsps/delivery/receipt/business/js/workOrderConsult-table.js"></script>	
<script type="text/javascript"
	src="${pageContext.request.contextPath}/jsps/delivery/receipt/business/js/workOrder-table.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/jsps/delivery/receipt/business/js/dateFormat.js"></script>
<!-- 运费查询 -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/jsps/delivery/receipt/business/js/freightCount.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/jsps/delivery/receipt/business/css/freightCount.css" />
<style type="text/css">
	body{
		font-size: 16px;
		font-family: "微軟正黑體";
	}
</style>

<script type="text/javascript">
$(function() {
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
	
	//-------------------到达地址--------------------
	// 添加中省的下拉框
	selectProvince("#txt_serveCity_province");
	// 添加中市的下拉框
	selectCity("#txt_serveCity");
	// 添加中区的下拉框
	selectDistrict("#txt_serveCity");
	
	// 省下拉框改变事件
	$('#txt_serveCity_province').change(function() {
		$('#txt_serveCity_city').empty();
		$('#txt_serveCity_city').change();
	})
	// 市下拉框改变事件
	$('#txt_serveCity_city').change(function() {
		$('#txt_serveCity_district').empty();
	})
	
	//------------------运费查询-----------------------------
	selectProvince("#start_province");
	selectCity("#start");
	selectDistrict("#start");
	// 省下拉框改变事件
	$('#start_province').change(function() {
		$('#start_city').empty();
		$('#start_add_city').change();
	})
	// 市下拉框改变事件
	$('#start_city').change(function() {
		$('#start_district').empty();
	})
	//-----------------到达城市---------------------
	selectProvince("#end_province");
	selectCity("#end");
	selectDistrict("#end");
	
	
	$('#end_province').change(function() {
		$('#end_city').empty();
		$('#end_city').change();
	})
	// 市下拉框改变事件
	$('#end_city').change(function() {
		$('#end_district').empty();
	})
		
	consult();
	
	// 初始化提示框的位置
	toastr.options.positionClass = 'toast-top-center';
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

	// 1.初始化工单Table
	var oTableWork = new TableInitWork();
	oTableWork.Init();
	// 2.初始化工单Button的点击事件
	var oButtonInitWork = new ButtonInitWork();
	oButtonInitWork.Init();
	
	// 1.初始化订单属性Table
	var oTableOrderAttr = new TableInitOrderAttr();
	oTableOrderAttr.Init();
	// 2.初始化订单属性Button的点击事件
	var oButtonInitOrderAttr = new ButtonInitOrderAttr();
	oButtonInitOrderAttr.Init();
	
	// 1.初始化受理咨询Table
	var oTableRecsipt = new TableInitRecsipt();
	oTableRecsipt.Init();
	// 2.初始化受理咨询Button的点击事件
	var oButtonInitRecsipt = new ButtonInitRecsipt();
	oButtonInitRecsipt.Init();
	
	// 1.初始化工单咨询Table
	var oTableWOConsults = new TableInitWOConsults();
	oTableWOConsults.Init();
	// 2.初始化工单咨询Button的点击事件
	var oButtonInitWOConsults = new ButtonInitWOConsults();
	oButtonInitWOConsults.Init();
	
	//预约取件时间
	$('#appointmentDispatchTime').datetimepicker({
		 language: 'zh-CN',
         autoclose: true,
         todayHighlight: true
	});
	
	//类型
	$.ajax({
		type:"post",
		async:false,
		data:{"archivesName":"产品"},
		url : '/noob/staff/findAllSubsetNameAndIdQuery.action',
		success:function(response){
			var html = "";
			for(var i=0;i<response.length;i++) {
				html = html+"<option id='"+response[i].subsetId+"'>"+response[i].subsetName+"</option>";
			}
			$("#product").append(html);
			$(".selectpicker").selectpicker("refresh");
		}
	});
	
	//最新消息
	$.ajax({
		type:"post",
		async:false,
		data:{
			status: 0,
			start: 0,
			pageSize:3},
		url : '/noob/disseminate/findAllDisseminate.action',
		success:function(response){
			var disseminates = response.rows;
			var htmlDiss = "";
			
			for(var i=0;i<disseminates.length;i++){
				htmlDiss += "<p>"+disseminates[i].disseminateContent+"</p>";
			}
			$(".disseminate").html(htmlDiss);
		}
	});
});
</script>
<style type="text/css">
	.prompt{
	 color: #a94442;
	}
	 /* #border{
		border-right:2px solid;
		height:930px;
		width: 725px;
		position: absolute;
		border-color: #20B2AA;
		margin: -15px 0 0 20px;
	}
	 #border-right{
		border-right:2px solid;
		border-radius:5px;
		height:930px;
		width: 725px;
		position: absolute;
		border-color: #20B2AA;
		margin: -15px 0 0 348px;
	}
	#border-left{
		border-left:2px solid;
		border-radius:5px;
		height:930px;
		width: 725px;
		position: absolute;
		border-color: #20B2AA;
		margin: -15px 0 0 15px;
	} 
	 #borderTwo{
		border-bottom:2px solid;
		border-radius:5px;
		width: 730px;
		position: absolute;
		border-color: #20B2AA;
		margin: 175px 0 0 15px;
	}
	#borderThree{
		border-bottom:2px solid;
		border-radius:5px;
		width: 730px;
		position: absolute;
		border-color: #20B2AA;
		margin: 410px 0 0 15px;
	}
 	#borderFour{
		border-top:2px solid;
		border-radius:5px;
		width: 1058px;
		position: absolute;
		border-color: #20B2AA;
		margin: -15px 0 0 15px;
	} 
	#borderFive{
		border-bottom:2px solid;
		border-radius:5px;
		width: 730px;
		position: absolute;
		border-color: #20B2AA;
		margin: 645px 0 0 15px;
	} 
	#borderSix{
		border-bottom:2px solid;
		border-radius:5px;
		width: 1058px;
		position: absolute;
		border-color: #20B2AA;
		margin: 915px 0 0 15px;
	} */
</style>

</head>

<body>
	<!-- 标签页切换标签 -->
	<ul id="myTab" class="nav nav-tabs">
		<li class="dropdown">
			<a href="#" id="myTabDrop1" class="dropdown-toggle" 
			   data-toggle="dropdown">受理 
				<b class="caret"></b>
			</a>
			<ul class="dropdown-menu" role="menu" aria-labelledby="myTabDrop1">
				<li><a href="#recsipt" data-toggle="tab">新单</a></li>
				<li><a href="#workOrder" data-toggle="tab">工单</a></li>
			</ul>
		</li>
	    <li>
	    	<a href="#consult" data-toggle="tab" onclick="cancelPrompts()">咨询</a>
	    </li>
	     <li>
	    	<a href="#zijigai" data-toggle="tab" onclick="cleanFree();">运费查询</a>
	    </li>
	</ul>
	
	<!-- 受理 -->
	<div id="myTabContents" class="tab-content" >
		<!-- 受理 -->
		<div id="recsipt" class="tab-pane fade in active" style="padding: 15px;padding-bottom: 0px;">
			<form class="form-horizontal"><!-- class="form-horizontal" -->
				<div id="toolbar" class="btn-group" style="padding: 0 15px 15px 0; ">
					<button id="btn_newOrder" type="button" class="btn btn-default">
						<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新单
					</button>
					<button style="margin-left: 10px;" id="btn_freight" type="button" class="btn btn-default" data-toggle="modal">
						<span class="glyphicon glyphicon-usd" aria-hidden="true"></span>运费计算
					</button>
				</div>	
				<div class="panel panel-default">
					<div class="panel-heading">
						<a data-toggle="collapse" data-parent="#accordion"
							href="#collapseOne"> 受理界面 </a>
					</div>
					<div class="panel-collapse collapse on" id="collapseOne">
						<div class="form-group" style="margin-top: 15px">
							<div id="border"></div>
							<div id="border-left"></div>
							<div id="border-right"></div>
							<!-- 来电号码 -->
							<label class="control-label col-sm-1" for="txt_search_statu">来电号码</label>
							<div class="col-sm-3">
								<input type="text" class="form-control" id="customerTelephone" name = "customerTelephone" 
								placeholder="请输入来电号码" onblur="checkCustomerTelephone(this)" onfocus="cancelPrompt(this)">
								 <input type="hidden" id="judgeCustomer" name="">
								 <span id="customerTelephone_prompt" class="prompt"></span>
							</div>
							<!-- 通知单号 -->
							<label class="control-label col-sm-1" for="txt_search_statu">通知单号</label>
							<div class="col-sm-3">
								<input type="text" class="form-control" id="businessRecsiptNo" 
								 placeholder="自动生成" disabled>
							</div>
							<!-- 最新消息 -->
							<div class="col-sm-3">
								<!-- <textarea  rows="30" cols="10" class="form-control disseminate" style="position: absolute;">最新消息</textarea> -->
								<div class="form-control disseminate" style="height: 600px;position: absolute;line-height: 30px;">
								</div>
							</div>
							<!-- 客户编号-->
							<label class="control-label col-sm-1" for="txt_search_statu">客户编号</label>
							<div class="col-sm-3">
								<input type="text" class="form-control" id="customerNo" name="customerNo"
								 placeholder="自动生成" disabled>
							</div>
							<!-- 客户名称 -->
							<label class="control-label col-sm-1" for="txt_search_statu" >客户名称</label>
							<div class="col-sm-3">
								<input type="text" class="form-control" id="customerName" name="customerName" 
								placeholder="请输入客户名称" onblur="checkCustomerName(this)" onfocus="cancelPrompt(this)">
								<span id="customerName_prompt" class="prompt"></span>
							</div>
							<div class="col-sm-3">
							</div>
							<!-- 联系人 -->
							<label class="control-label col-sm-1" for="txt_search_statu">联系人</label>
							<div class="col-sm-3">
								<input type="text" class="form-control" id="contacts" 
								 name="contacts" placeholder="请输入联系人" onblur="checkContacts(this)" onfocus="cancelPrompt(this)">
								<span id="contacts_prompt" class="prompt"></span>
							</div>
							<!-- 预约取件时间 -->
							<label class="control-label col-sm-1" for="txt_search_statu">预约取件时间</label>
							<div class="col-sm-3">
								<input type="text" class="form-control" id="appointmentDispatchTime"
									   data-date-format="yyyy-mm-dd hh:ii:ss" name="appointmentDispatchTime"
									   placeholder="请选择预约取件时间" >
								<!-- <span id="appointmentDispatchTime_prompt" class="prompt"></span> onblur="checkAppointmentDispatchTime(this)" onfocus="cancelPrompt(this)"-->
							</div>
							<div class="col-sm-3">
							</div>
							<div id="borderTwo"></div>
							<!-- 寄件城市 -->
							<label class="control-label col-sm-1" for="txt_search_statu">寄件城市</label>
							<div class="col-sm-3">
								<input type="text" class="form-control" id="sendingCity" 
								 placeholder="根据取件地址自动生成" disabled>
							</div>
							<!-- 分拣编码 -->
							<label class="control-label col-sm-1" for="txt_search_statu" >分拣编码</label>
							<div class="col-sm-3">
								<input type="text" class="form-control" id="sortingCode" placeholder="根据取件地址自动生成" disabled>
							</div>
							<div class="col-sm-3">
							</div>
							<!-- 省 -->
							<label class="control-label col-sm-1" for="txt_search_statu">省</label>
							<div class="col-sm-3">
								<select class="js-example-basic-multiple form-control" name="txt_add_province"
								        id="txt_add_province" style="width: 100%;">
								</select>
							</div>
							<!-- 市 -->
							<label class="control-label col-sm-1" for="txt_search_statu">市</label>
							<div class="col-sm-3">
								<select class="js-example-basic-multiple form-control" 
									    id="txt_add_city" style="width: 100%;">
								</select>
							</div>
							<div class="col-sm-3">
							</div>
							<!-- 县/区/县级市 -->
							<label class="control-label col-sm-1" for="txt_search_statu">县/区/县级市</label>
							<div class="col-sm-3">
								<select class="js-example-basic-multiple form-control" 
									    id="txt_add_district" style="width: 100%;">
								</select>
							</div>
							<!-- 详细地址 -->
							<label class="control-label col-sm-1" for="txt_search_statu">详细地址</label>
							<div class="col-sm-3">
								<input type="text" class="form-control" id="detailedAddress" 
								 name="detailedAddress" placeholder="请输入取件地址的详细地址" onblur="checkDetailedAddress(this)" onfocus="cancelPrompt(this)">
								<span id="detailedAddress_prompt" class="prompt"></span>
							</div>
							<div class="col-sm-3">
							</div>
							<div id="borderThree"></div>
							<!-- 取件地址 -->
							<label class="control-label col-sm-1" for="txt_search_statu">取件地址</label>
							<div class="col-sm-3">
								<input type="text" class="form-control" id="fetchAddress"  name="fetchAddress"
								 style="width: 725px" placeholder="根据省市县详细地址自动生成" onblur="checkFetchAddress(this)" onfocus="cancelPrompt(this)" disabled>
								<span id="fetchAddress_prompt" class="prompt"></span>
							</div>
							<div class="col-sm-3">
							</div>
							<div class="col-sm-4">
							</div> 
							<!-- 收件人 -->
							<label class="control-label col-sm-1" for="txt_search_statu">收件人</label>
							<div class="col-sm-3">
								<input type="text" class="form-control" id="addressee" 
								 name="addressee" placeholder="请输入收件人" onblur="checkAddressee(this)" onfocus="cancelPrompt(this)">
								<span id="addressee_prompt" class="prompt"></span>
							</div>
							<!-- 联系电话 -->
							<label class="control-label col-sm-1" for="txt_search_statu" >联系电话</label>
							<div class="col-sm-3">
								<input type="text" class="form-control" id="telephone" 
								 name="telephone" placeholder="请输入联系电话" onblur="checkTelephone(this)" onfocus="cancelPrompt(this)">
								<span id="telephone_prompt" class="prompt"></span>
							</div>
							<div class="col-sm-3">
							</div>
							<!-- 品名 -->
							<label class="control-label col-sm-1" for="txt_search_statu">品名</label>
							<div class="col-sm-3">
								<input type="text" class="form-control" id="productName" 
								 name="productName" placeholder="请输入品名" onblur="checkProductName(this)" onfocus="cancelPrompt(this)">
								<span id="productName_prompt" class="prompt"></span>
							</div>
							<!-- 件数 -->
							<label class="control-label col-sm-1" for="txt_search_statu">件数</label>
							<div class="col-sm-3">
								<input type="text" class="form-control" id="numberPackages" 
								 name="numberPackages" placeholder="请输入件数" onblur="checkNumberPackages(this)" onfocus="cancelPrompt(this)">
								<span id="numberPackages_prompt" class="prompt"></span>
							</div>
							<div class="col-sm-3">
							</div>
							<!-- 重量 -->
							<label class="control-label col-sm-1" for="txt_search_statu">重量</label>
							<div class="col-sm-3">
								<input type="text" class="form-control" id="weight" 
								 name="weight" placeholder="请输入重量(kg)" onblur="checkWeight(this)" onfocus="cancelPrompt(this)">
								<span id="weight_prompt" class="prompt"></span>
							</div>
							<!-- 体积 -->
							<label class="control-label col-sm-1" for="txt_search_statu" >体积</label>
							<div class="col-sm-3">
								<input type="text" class="form-control" id="volume" 
								 name="volume" placeholder="请输入体积(m³)" onblur="checkVolume(this)" onfocus="cancelPrompt(this)">
								<span id="volume_prompt" class="prompt"></span>
							</div>
							<div class="col-sm-3">
							</div>
							<div id="borderFour"></div>
							<!-- 到达城市 -->
							<label class="control-label col-sm-1" for="txt_search_statu">到达城市</label>
							<div class="col-sm-3">
								<input type="text" class="form-control" id="arrivalCity" 
								 name="arrivalCity" placeholder="请输入到达城市" disabled>
							</div>
							<!-- 产品 -->
							<label class="control-label col-sm-1" for="txt_search_statu">产品</label>
							<div class="col-sm-3">
								<select class="selectpicker show-menu-arrow" id="product"
									name="product" data-width="100%" data-size="5">
								</select>
							</div>
							<div class="col-sm-3">
							</div>
							<div id="borderFive"></div>
							<!-- 省 -->
							<label class="control-label col-sm-1" for="txt_search_statu">省</label>
							<div class="col-sm-3">
								<select class="js-example-basic-multiple form-control" 
								        id="txt_serveCity_province" style="width: 100%;">
								</select>
							</div>
							<!-- 市 -->
							<label class="control-label col-sm-1" for="txt_search_statu">市</label>
							<div class="col-sm-3">
								<select class="js-example-basic-multiple form-control" 
									    id="txt_serveCity_city" style="width: 100%;">
								</select>
							</div>
							<div class="col-sm-3">
							</div>
							<!-- 县/区/县级市 -->
							<label class="control-label col-sm-1" for="txt_search_statu">县/区/县级市</label>
							<div class="col-sm-3">
								<select class="js-example-basic-multiple form-control" 
									    id="txt_serveCity_district" style="width: 100%;height: 34px">
								</select>
							</div>
							<!-- 详细地址 -->
							<label class="control-label col-sm-1" for="txt_search_statu">详细地址</label>
							<div class="col-sm-3">
								<input type="text" class="form-control" id="serveCityDetailedAddress" 
								 name="serveCityDetailedAddress" placeholder="请输入收件地址的详细地址" onblur="checkServeCityDetailedAddress(this)" onfocus="cancelPrompt(this)">
								<span id="serveCityDetailedAddress_prompt" class="prompt"></span>
							</div>
							<div class="col-sm-3">
							</div>
							<!-- 收件地址 -->
							<label class="control-label col-sm-1" for="txt_search_statu">收件地址</label>
							<div class="col-sm-3">
								<input type="text" class="form-control" id="serveCity" name="serveCity" 
								style="width: 725px" placeholder="根据省市县详细地址自动生成" disabled>
							</div>
							<div class="col-sm-3">
							</div>
							<div class="col-sm-4">
							</div>
							<!-- 备注 -->
							<label class="control-label col-sm-1" for="txt_search_statu" >备注</label>
							<div class="col-sm-3">
								<input type="text" class="form-control" id="remarks" 
								 name="remarks" placeholder="请输入备注" onblur="checkRemarks(this)" onfocus="cancelPrompt(this)">
								<span id="remarks_prompt" class="prompt"></span>
							</div>
							<!-- 常用备注 -->
							<label class="control-label col-sm-1" for="txt_search_statu" >常用备注</label>
							<div class="col-sm-3">
								<input type="text" class="form-control" id="commonRemarks" 
								 name="commonRemarks" placeholder="请输入常用备注" onblur="checkCommonRemarks(this)" onfocus="cancelPrompt(this)">
								<span id="commonRemarks_prompt" class="prompt"></span>
							</div>
							<div class="col-sm-3">
							</div>
							<div id="borderSix"></div>
						</div>
					</div>
				</div>
			</form>
		</div>
		
		<!-- 工单 -->
		<div id="workOrder" class="tab-pane fade" style="padding: 15px;padding-bottom: 0px;">
			<div class="panel panel-default">
			<div class="panel-heading">
				<a data-toggle="collapse" data-parent="#accordion" href="#collapseOneWork">
					查询条件
                </a>
                </div>
			<div class="panel-collapse collapse on" id="collapseOneWork">
				<form id="formSearch" class="form-horizontal">
					<div class="form-group" style="margin-top: 15px">
						<!-- 受理单号 -->
						<label class="control-label col-sm-1"
							for="searchBusinessRecsiptNo">受理单号</label>
						<div class="col-sm-3">
							<input type="text" class="form-control" id="searchBusinessRecsiptNo">
						</div>
						<!-- 客户名 -->
						<label class="control-label col-sm-1" for="searchCustomerName">客户名</label>
						<div class="col-sm-3">
							<input type="text" class="form-control" id="searchCustomerName">
						</div>
						<!-- 所属单位 -->
						<label class="control-label col-sm-1" for="searchArrivalCity">到达城市</label>
						<div class="col-sm-3" style="width: 22%">
							<input type="text" class="form-control" id="searchArrivalCity">
						</div>
						<!-- 产品 -->
						<label class="control-label col-sm-1" for="searchProduct">产品</label>
						<div class="col-sm-3">
							<input type="text" class="form-control" id="searchProduct">
						</div>
						<!-- 定区编码 -->
						<label class="control-label col-sm-1" for="searchSortingCode">定区编码</label>
						<div class="col-sm-3">
							<input type="text" class="form-control" id="searchSortingCode">
						</div>
						<div class="col-sm-3" style="text-align: left;">
							<button type="button" style="margin-left: 90px" id="searchSubmit"
								class="btn btn-primary">查询</button>
						</div>
					</div>
				</form>
			</div>
		</div>
			<div id="toolbarWork" class="btn-group" style="padding: 0 15px 15px 0; ">
				<button id="btn_traceWork" type="button" class="btn btn-default">
					<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>追单
				</button>
				<button id="btn_updateWork" type="button" class="btn btn-default">
					<span class=" glyphicon glyphicon-pencil" aria-hidden="true"></span>改单
				</button>
				<button id="btn_canCelWork" type="button" class="btn btn-default">
					<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>销单
				</button>
				<!-- <button id="btn_" type="button" class="btn btn-default">
					<span class="glyphicon glyphicon-usd" aria-hidden="true"></span>计算运费
				</button> -->
			</div>
			<table id="tb_business"></table>
		</div>
		
		<!-- 销单模态框 -->
		<div class="modal fade" id="myMoalUpdate" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		    <div class="modal-dialog">
		        <div class="modal-content">
		            <div class="modal-header">
		                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>	               
		               <div class="panel panel-success">
			                <div class="panel-heading">
								<h3 class="panel-title">销单原因</h3>
							</div>
						<div class="panel-body">
							<form id="updateForm" class="form-horizontal" role="form">
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">异常原因</label>
									<div class="col-sm-9">
										<select class="selectpicker show-menu-arrow form-control" id="cancelCause">
											<option value="太慢了">太慢了</option>
											<option value="服务态度差">服务态度差</option>
											<option value="其他">其他</option>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">备注</label>
									<div class="col-sm-9">
										<textarea id="cancelRemark" class="form-control" style="max-width:395px;min-width:395px;min-height:80px;max-height:120px;"></textarea>
									</div>
								</div>
							</form>
						</div>
					</div>
	            </div>	            
	            <div class="modal-footer">
	            	<button type="button" id="cancelWorkOrder" data-dismiss="modal" class="btn btn-primary">修改</button>
	                <button type="button" class="btn btn-default4" data-dismiss="modal">关闭</button>
	            </div>
	        </div>
	    </div>
	</div>
	
		<!-- 咨询 -->
		<div id="consult" class="tab-pane fade" style="padding: 15px;padding-bottom: 0px">
			<div id="recsipt" class="tab-pane fade in active">
				<form id="" class="form-horizontal">
				<div id="toolbar" class="btn-group" style="padding: 0 15px 15px 0; ">
					<button id="btn_consult" type="button" class="btn btn-default">
						<span class="glyphicon glyphicon-question-sign" aria-hidden="true"></span>新咨询
					</button>
				</div>
				<div class="panel panel-default">
					<div class="panel-heading">
						<a data-toggle="collapse" data-parent="#accordion"
							href="#collapseConsult"> 咨询界面 </a>
					</div>
					<div class="panel-collapse collapse in" id="collapseConsult">
							<div class="form-group" style="margin-top: 15px">
								<!-- 客户名称 -->
								<label class="control-label col-sm-1" for="txt_search_statu">客户名称 </label>
								<div class="col-sm-3">
									<input type="text" class="form-control" id="consult_CName" onblur="checkConsultCName(this)" onfocus="cancelPrompt(this)">
									<span id="consult_CName_prompt" class="prompt"></span>
								</div>
								<!-- 客户编号 -->
								<label class="control-label col-sm-1" for="txt_search_statu">客户编号</label>
								<div class="col-sm-3">
									<input type="text" class="form-control" id="consult_CNo" disabled>
								</div>
								<!-- 联系人 -->
								<label class="control-label col-sm-1" for="txt_search_statu">联系人</label>
								<div class="col-sm-3" style="width: 22%">
									<input type="text" class="form-control" id="consult_contacts" onblur="checkConsultCntacts(this)" onfocus="cancelPrompt(this)">
									<span id="consult_contacts_prompt" class="prompt"></span>
								</div>
								<!-- 电话 -->
								<label class="control-label col-sm-1" for="txt_search_statu">电话</label>
								<div class="col-sm-3">
									<input type="text" class="form-control" id="consult_tele" onblur="checkConsultTele(this)" onfocus="cancelPrompt(this)">
									<span id="consult_contacts_prompt" class="prompt"></span>
								</div>
								<!-- 手机 -->
								<label class="control-label col-sm-1" for="txt_search_statu">手机</label>
								<div class="col-sm-3">
									<input type="text" class="form-control" id="consult_cell" onblur="checkConsultCell(this)" onfocus="cancelPrompt(this)">
									<span id="consult_cell_prompt" class="prompt"></span>
								</div>
								
								<!-- 联系地址 -->
								<label class="control-label col-sm-1" for="txt_search_statu">联系地址</label>
								<div class="col-sm-3" style="width: 22%;">
									<input type="text" class="form-control" id="consult_address" onblur="checkConsultAddress(this)" onfocus="cancelPrompt(this)">
									<span id="consult_address_prompt" class="prompt"></span>
								</div>
								<!-- 咨询类型 -->
								<label class="control-label col-sm-1" for="txt_search_statu">咨询类型</label>
								<div class="col-sm-3">
									<select class="selectpicker show-menu-arrow" id="consult_type"
									name="" data-width="100%" data-size="5">
									<option value="受理咨询">受理咨询</option>
									<option value="查货咨询">查货咨询</option>
									</select>
								</div>
								<!-- 通知单号 -->
								<label class="control-label col-sm-1" for="txt_search_statu">通知单号</label>
								<div class="col-sm-3">
									<select class="js-example-basic-multiple form-control" 
									    id="consult_businessNo" style="width: 100%;">
									</select>
								</div>
								<!-- 取货单位 -->
								<label class="control-label col-sm-1" for="txt_search_statu">取货单位</label>
								<div class="col-sm-3" style="width: 22%">
									<input type="text" class="form-control" id="consult_org" disabled>
								</div>
								<!-- 受理时间 -->
								<label class="control-label col-sm-1" for="txt_search_statu">受理时间</label>
								<div class="col-sm-3">
									<input type="text" class="form-control" id="consult_time" data-date-format="yyyy-mm-dd hh:ii" disabled>
								</div>
								<!-- 工作单号 -->
								<label class="control-label col-sm-1" for="txt_search_statu">工单号</label>
								<div class="col-sm-3">
									<select class="js-example-basic-multiple form-control" 
									    id="consult_jobListNo" style="width: 100%;">
									</select>
								</div>
								<!-- 初始受理单位 -->
								<label class="control-label col-sm-1" for="txt_search_statu">初始受理单位</label>
								<div class="col-sm-3" style="width: 22%">
									<input type="text" class="form-control" id="consult_businsessOrg" disabled>
								</div>
								<!-- 结算方式 -->
								<label class="control-label col-sm-1" for="txt_search_statu">结算方式</label>
								<div class="col-sm-3">
									<input type="text" class="form-control" id="consult_moneyType" disabled>
								</div>
								<!-- 是否合作过 -->
								<label class="control-label col-sm-1" for="txt_search_statu">是否合作过</label>
								<div class="col-sm-3">
									<input type="radio" id="consult_yes" name="cooperate" style="margin: 15px 0 0 20px" disabled="disabled">是
									<input type="radio" id="consult_no" name="cooperate" style="margin: 0 0 0 20px" disabled="disabled">否
								</div>
								<!-- 方式 -->
								<label class="control-label col-sm-1" for="txt_search_statu">方式</label>
								<div class="col-sm-3" style="width: 22%">
									<select class="selectpicker show-menu-arrow" id="consult_way"
									name="" data-width="100%" data-size="5">
									<option value="电话">电话</option>
									<option value="网络">网络</option>
									</select>
								</div>
								<!-- 意向 -->
								<label class="control-label col-sm-1" for="txt_search_statu">意向</label>
								<div class="col-sm-3">
									<select class="selectpicker show-menu-arrow" id="consult_intention"
									name="" data-width="100%" data-size="5">
										<option value="很强烈">很强烈</option>
										<option value="有意向">有意向</option>
										<option value="无意向">无意向</option>
									</select>
								</div>
								<!-- 咨询日期 -->
								<label class="control-label col-sm-1" for="txt_search_statu">咨询日期</label>
								<div class="col-sm-3">
									<input type="text" class="form-control" id="consult_date" date-format="yyyy-MM-dd HH:mm" disabled="disabled">
								</div>
								<!-- 咨询内容 -->
								<label class="control-label col-sm-1" for="txt_search_statu">咨询内容</label>
								<div class="col-sm-3" style="width: 22%">
									<textarea rows="" cols="" class="form-control" id="consult_content" 
									onblur="checkConsultContent(this)" onfocus="cancelPrompt(this)"></textarea>
									<span id="consult_content_prompt" class="prompt"></span>
								</div>
								<!-- 咨询结果 -->
								<label class="control-label col-sm-1" for="txt_search_statu">咨询结果</label>
								<div class="col-sm-3">
									<input type="text" class="form-control" id="consult_result" onblur="checkConsultResult(this)" onfocus="cancelPrompt(this)">
									<span id="consult_result_prompt" class="prompt"></span>
								</div>
								<!-- 隐藏域获得用户名和对应的组织名 -->
								<input type="hidden" value="<%=userName%>" id="userName" />
								<input type="hidden" value="<%=orgName%>" id="orgName" />
							</div>
						</div>
					</div>	
				</form>
			</div>		
		</div>
		
		<!-- 计算运费 -->
		<div id="zijigai" class="tab-pane fade"style="padding: 15px;">
			<div class="panel panel-success">
				<div class="panel-heading">
					<h3 class="panel-title">运费查询</h3>
				</div>
				<div class="panel-body">
					<form id="findFree" role="form" class="form-horizontal">
						<div class="form-group ">
							<!-- 原寄地 -->
							<div class="col-sm-12">
								<label class="control-label " for="txt_search_departmentname"
									style="font-size: 20px; color: #000000">原寄地:</label>
							</div>
							<!-- 省 -->
							<label class="control-label col-sm-1" for="txt_search_statu">省</label>
							<div class="col-sm-3">
								<select class="js-example-basic-multiple form-control" name="start_province"
								        id="start_province" style="width: 100%;">
								</select>
							</div>
							<!-- 市 -->
							<label class="control-label col-sm-1" for="txt_search_statu">市</label>
							<div class="col-sm-3">
								<select class="js-example-basic-multiple form-control" 
									    id="start_city" style="width: 100%;">
								</select>
							</div>
							<!-- 县/区/县级市 --> 
							<label class="control-label col-sm-1" for="txt_search_statu">县/区</label>
							<div class="col-sm-3" style="width: 22%">
								<select class="js-example-basic-multiple form-control" 
									    id="start_district" style="width: 100%;">
								</select>
							</div>
							<!-- 详细地址 -->
							<label class="control-label col-sm-1" for="txt_search_statu">详细地址</label>
							<div class="col-sm-3">
								<input type="text" class="form-control" id="explicit" 
								 name="explicit" placeholder="请输入取件地址的详细地址">
								
							</div>
							<!-- 寄件地址 -->
							<label class="control-label col-sm-1" for="txt_search_statu">寄件地址</label>
							<div class="col-sm-3">
								<input type="text" class="form-control" id="str"  name="str"
								 style="width:675px" placeholder="根据省市县详细地址自动生成" disabled>
							</div>	
							<div class="col-sm-3">
							</div>	
							<!---------------目的地------------->
							<!-- 目的地 -->
							<div class="col-sm-12">
								<label class="control-label " for="txt_search_departmentname"
									style="font-size: 20px;color: red;">目的地:</label>
							</div>
							<!-- 省 -->
							<label class="control-label col-sm-1" for="txt_search_statu">省</label>
							<div class="col-sm-3">
								<select class="js-example-basic-multiple form-control" name="start_province"
								        id="end_province" style="width: 100%;">
								</select>
							</div>
							<!-- 市 -->
							<label class="control-label col-sm-1" for="txt_search_statu">市</label>
							<div class="col-sm-3">
								<select class="js-example-basic-multiple form-control" 
									    id="end_city" style="width: 100%;">
								</select>
							</div>
							<!-- 县/区/县级市 -->
							<label class="control-label col-sm-1" for="txt_search_statu">县/区</label>
							<div class="col-sm-3" style="width: 22%">
								<!-- <select class="js-example-basic-multiple form-control" 
									    id="end_district" style="width: 209px;" >
								</select> -->
								<select class="js-example-basic-multiple form-control" 
									    id="end_district" style="width: 100%;">
								</select>
							</div>
							<!-- 详细地址 -->
							<label class="control-label col-sm-1" for="txt_search_statu">详细地址</label>
							<div class="col-sm-3">
								<input type="text" class="form-control" id="addresses" 
								 name="addresses" placeholder="请输入收件地址的详细地址">
							</div>
							<!-- 到达地地址 -->
							<label class="control-label col-sm-1" for="txt_search_statu">到达地址</label>
							<div class="col-sm-3">
								<input type="text" class="form-control" id="location"  name="location"
								 style="width: 675px" placeholder="根据省市县详细地址自动生成" disabled>
							</div>	
							<label class="col-sm-3">
							</label>
							<!-- 重量 -->
							<label class="control-label col-sm-1" for="txt_search_statu"  >重量</label>
							<div class="col-sm-3">
								<input type="text" class="form-control" id="scale" 
								 name="scale" placeholder="请输入重量单位(/kg)">
								
							</div>	
							<!-- 产品 -->
							<label class="control-label col-sm-1" for="txt_search_statu">产品</label>
							<div class="col-sm-3">
								<select class="selectpicker show-menu-arrow" id="merchandise"
									name="merchandise" data-width="234px" data-size="5">
								</select>
							</div>	
							<!-- 查询 -->
							<div class="col-sm-3" id="quey" >
								<button type="button" id="btn_query" class="btn btn-primary" style="width: 120px;">查询</button>
							</div>	
						</div>
					</form>
				</div>
			</div>
			<div id="look">
				<div id="fruit">查询结果</div>
				<div class="panel panel-success" id="tables">
					<div class="panel-heading">
						<div class="panel-title">
							<span class="fonts">产品</span> 
							<span class="fonts">重量</span> 
							<span class="fonts">金额</span>
						</div>
					</div>
					<div id="goods">
						<span class="tax" id="pro"></span> 
						<span class="tax" id="max"></span>
						<span class="tax" id="free"></span>
					</div>
				</div>
			</div>
			<div class="exp-stan">
				<h3>说明:</h3>
				<p>1、此价格只适用于一般货物的标准快递服务；非一般货物（贵重物品、高档手机、名牌包、高档首饰、高档手表、精密仪器、生物制药、恒温需求货物、易碎物品等）需在此价格水平上浮25%-40%，具体请咨询当地宅急送。</p>
				<p>2、此报价系统个别城市将无法提供服务，具体是否可服务详情敬请查询取派区域或拨打全国统一客服热线4006789000。</p>
				<p>3、此报价系统从2015年3月15日开始使用。</p>
				<p>准时送达承诺：宅急送承诺按上述时间准时将您的物品递送到运单注明的收件人手中，如若延误，宅急送将予以减免运费。</p>
				<h3>具体标准为:</h3>
				<p>(1) 快件产品：晚点免单-晚点则运费全免；</p>
				<p>(2) 航空件产品：晚点打折-晚一天减免运费10%，减免最多不超过运费的40%；</p>
				<p>(3) 普件产品：不享有准时承诺-因分拣等货、找特殊派送资源需额外时间。</p>
				<p>(县级及以下偏远地区不在本承诺范畴中）。</p>
			</div>

		</div>
	</div>
	<!-- 运费计算模态框（Modal） -->
	<div class="modal fade" id="myModalFreight" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content" id="contentAdd">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true" onclick="clean()">&times;</button>
					<div class="panel panel-success">
						<div class="panel-heading">
							<h3 class="panel-title">运费计算</h3>
						</div>
						<div class="panel-body">
							<form class="form-horizontal" onsubmit="return check()"
								role="form" id="">
								<!-- 产品 -->
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">产品</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" id="wares" name="wares"
											placeholder="请输入产品" style="width: 410px;"disabled >
										<span id="_prompt" class="prompt"></span>	
									</div>
								</div>
								<!-- 寄件城市 -->
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">寄件城市</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" id="origin" name="origin"
											placeholder="请输入寄件城市" style="width: 410px;" disabled />
										<span id="_prompt" class="prompt"></span>	
									</div>
								</div>
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">到达城市</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" id="point" name="point"
											placeholder="请输入查台密码" style="width: 410px;"disabled/>
										<span id="_prompt" class="prompt"></span>	
									</div>
								</div>
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">重量</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" id="ponderance" name="ponderance"
											placeholder="请输入电话" style="width: 410px;" disabled/>
										<span id="_prompt" class="prompt"></span>
									</div>
								</div>
								<div class="modal-footer">
								    <div  style="text-align: left;">
								       	<span>价格:</span><span id="ss" style="font-size:22px;color:red"></span>
								    </div>
									<input type="button" class="btn btn-primary"  id="okey" value="确认查询" />
									<input type="button" class="btn btn-default4" data-dismiss="modal" value="关闭" onclick="clean()" />
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- ---------------------------------------------------------- -->
	<!-- 标签页切换标签 -->
	<ul class="nav nav-tabs" style="padding-top: 25px;">
	    <li class="active">
	        <a href="#orderAttribute" data-toggle="tab">订单属性</a>
	    </li>
	    <li>
	    	<a href="#recsiptConsult" data-toggle="tab">受理咨询</a>
	    </li>
	    <li>
	    	<a href="#workOrderConsult" data-toggle="tab">工单咨询</a>
	    </li>
	</ul>
	
	<div class="tab-content">
		<!-- 订单属性 -->
		<div id="orderAttribute" class="tab-pane fade in active" style="padding: 15px;padding-bottom: 0px">
			<div id="toolbar_orderAttribute" class="btn-group">
			</div>
			<table id="tb_orderAttributes"></table>
		</div>
		<!-- 受理咨询 -->
		<div id="recsiptConsult" class="tab-pane fade" style="padding: 15px;padding-bottom: 0px">
			<div id="toolbar_recsiptConsult" class="btn-group">
			</div>
			<table id="tb_recsiptConsults"></table>
		</div>
		<!-- 工单咨询 -->
		<div id="workOrderConsult" class="tab-pane fade" style="padding: 15px;padding-bottom: 0px">
			<div id="toolbar_workOrderConsult" class="btn-group">
			</div>
			<table id="tb_workOrderConsults"></table>
		</div>
	</div>
</body>
</html>