<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<%@ page isELIgnored="false"%>

<%
	String orgId = request.getParameter("orgId");
	String userName = request.getParameter("userName");
	String userId = request.getParameter("userId");
	String orgName = request.getParameter("orgName");
	String jobListId = request.getParameter("jobListId");
%>

    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>工作单录入</title>

<style type="text/css">
body {
	font-size: 24px;
	margin: 0;
	padding: 0;
	min-height: 1000px;
}
#mainDiv{
	margin-left:10px;
}
.content{
	margin-top:15px;
	border-radius:5px;
	border: 1px solid #ddd;
}
.myLabel{
	float: right;
	text-align:right;
	margin-top:25px;
}
.myInput{
	margin-top:18px;
}
.myBtn{
	margin-top:17px;
}

</style>

<script src="${pageContext.request.contextPath }/js/jquery-3.1.1.min.js"></script>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/js/bootstrap/css/bootstrap.min.css">
<script type="text/javascript" src="${pageContext.request.contextPath }/js/bootstrap/js/bootstrap.min.js"></script>

<script type="text/javascript" src="${pageContext.request.contextPath }/js/sweetalert/sweetalert.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/toastr/toastr.min.js"></script>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/js/bootstrap-select/css/bootstrap-select.min.css">
<script type="text/javascript" src="${pageContext.request.contextPath }/js/bootstrap-select/js/bootstrap-select.min.js"></script>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/js/toastr/toastr.min.css">
<script type="text/javascript" src="${pageContext.request.contextPath }/js/toastr/toastr.min.js"></script>

<script type="text/javascript" src="${pageContext.request.contextPath }/js/bootstrap-datetimepicker/js/bootstrap-datetimepicker.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/bootstrap-datetimepicker/js/bootstrap-datetimepicker.zh-CN.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/js/bootstrap-datetimepicker/css/bootstrap-datetimepicker.css">

<script type="text/javascript" src="${pageContext.request.contextPath }/jsps/delivery/receipt/jobListEntering/js/jobListEntering.js"></script>

<!-- select2 组件引用 -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/select2/select2.css"/>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/select2/select2.full.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/select2/select2.min.js"></script>

<style type="text/css">
.bootstrap-select{
	margin-top:18px;
}
.select2-container .select2-selection--single{
	height:34px;
	margin-top:14px;
}
.select2-selection__arrow{
	margin-top:15px;
}
</style>

</head>
<body>

<div id="mainDiv">
	
	<div id="toolbar" class="btn-group col-md-12" style="float: none;">
		<input type="hidden" value="<%=userName %>" id="userNameIn">
		<input type="hidden" value="<%=userId %>" id="userIdIn">
		<input type="hidden" value="<%=orgId %>" id="orgIdIn">
		<input type="hidden" value="<%=jobListId %>" id="jobListIdIn">
		<button id="btn_sub" type="button" class="btn btn-default">
				<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>保存
		</button>
		<button id="btn_remove" type="button" class="btn btn-default">
				<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>取消
		</button>
	</div>
	
	<div class="col-md-12" style="float: none;"><br/></div>
	
	<div class="panel-body" id="accordion">
	
	<div class="panel panel-default">
		<div class="panel-heading">
			<h4 class="panel-title">
				<a data-toggle="collapse" data-parent="#accordion" 
				   href="#basicJobList">
					基本工作单
				</a>
			</h4>
		</div>
		
		<div id="basicJobList" class="panel-collapse collapse on">
		
		<div class="content col-md-12">
			<div class="col-md-1">
				<label class="myLabel control-label">工作单号:</label>
				<br/>
				<label class="myLabel control-label">到达地:</label>
				<br/>
				<label class="myLabel control-label">受理单位:</label>
			</div>
			
			<div class="col-md-2">
				<input type="text" class="myInput form-control" id="jobListCodeIn" readonly value="双击获取"/>
				<input type="text" class="myInput form-control" id="whitherIn" onclick="checkColor(this)" onblur="checkJobListWhitherIn(this)"/>
				<input type="text" class="myInput form-control" readonly unselectable="on" value="<%=orgName %>" id="operationOrg"/>
			</div>
			
			<div class="col-md-1" style="position: relative;right:20px;">
				<div style="margin-top:13px;"><br/><br/></div>
				<div style="margin-top:13px;"><br/><br/></div>
			</div>
			
			<div class="col-md-2" style="position: relative;right:40px;">
			
				<label class="myLabel control-label col-sm-12">业务通知单号:</label>
				<br/>
				<label class="myLabel control-label col-sm-12">产品:</label>
				<br/>
				<label class="myLabel control-label col-sm-12">取货人:</label>
			</div>
			
			<div class="col-md-2" style="position: relative;right:40px;">
				<select style="width: 100%;height:100%;" id="businessRecsiptNoIn" name="businessRecsiptNoIn" onchange="changeBusinessRecsiptNo(this)"></select>
				<select id="productIn" name="productIn" class="selectpicker form-control"></select>
				<input readonly id="getProductManNameIn" class="myInput form-control"></input>
				<input type="hidden" id="getProductManNameH">
			</div>
			
			<div class="col-md-1">
				<label class="myLabel control-label">客户单号:</label>
				<br/>
				<label class="myLabel control-label">配载要求:</label>
				
			</div>
			
			<div class="col-md-2">
				<input type="text" id="cuNoIn" class="myInput form-control" readOnly/>
				<select id="mannedRequireIn" class="selectpicker form-control"></select>
			</div>
			<div class="col-md-12"><br/></div>
			
			</div>
	</div>
	</div>
</div>
	
	<div class="panel-body" id="accordionOne">
	<div class="panel panel-default">
		<div class="panel-heading">
			<h4 class="panel-title">
				<a data-toggle="collapse" data-parent="#accordionOne" 
				   href="#basicJobListOne">
					寄收人信息
				</a>
			</h4>
		</div>
		
	<div id="basicJobListOne" class="panel-collapse collapse on">
	<div class="content col-md-12 col-md-offset-0.5">
		<div class="col-md-12"><br/>《寄件人信息》</div>
		<div class="col-md-1" >
				<label class="myLabel control-label">寄件人:</label>
		</div>
		<div class="col-md-2" >
				<input type="text" id="senderIn" class="myInput form-control" onclick="checkColor(this)" onblur="checkIsNull(this)"/>
		</div>
		
		<div class="col-md-1" >
				<label class="myLabel control-label">地址:</label>
		</div>
		<div class="col-md-2" >
				<input type="text" id="senderAddressIn" class="myInput form-control" onclick="checkColor(this)" onblur="checkIsNull(this)"/>
		</div>
		
		<div class="col-md-1" >
				<div class="myBtn"><button class="btn btn-primary">单位:</button></div>
		</div>
		
		<div class="col-md-2" >
				<input type="text" id="senderUnitIn" class="myInput form-control" onclick="checkColor(this)" onblur="checkIsNull(this)"/>
		</div>
		
		<div class="col-md-1" >
				<div class="myBtn"><button class="btn btn-primary">电话:</button></div>
		</div>
		<div class="col-md-2" >
				<input type="text" id="senderPhoneIn" class="myInput form-control" onclick="checkColor(this)"/>
		</div>
		<div class="col-md-1" >
				<label class="myLabel control-label">手机:</label>
		</div>
		<div class="col-md-2" >
				<input type="text" id="senderCellPhoneIn" class="myInput form-control" onclick="checkColor(this)"/>
		</div>
		<div class="col-md-12"><br/>《收件人信息》</div>
		
			<div class="col-md-1" >
				<label class="myLabel control-label">收件人:</label>
		</div>
		<div class="col-md-2" >
				<input type="text" id="addresseeIn" class="myInput form-control" onclick="checkColor(this)" onblur="checkIsNull(this)"/>
		</div>
		
		<div class="col-md-1" >
				<label class="myLabel control-label">地址:</label>
		</div>
		<div class="col-md-2" >
				<input type="text" id="addresseeAddressIn" class="myInput form-control" onclick="checkColor(this)" onblur="checkIsNull(this)"/>
		</div>
		
		<div class="col-md-1" >
				<div class="myBtn"><button class="btn btn-primary">单位:</button></div>
		</div>
		
		<div class="col-md-2" >
				<input type="text" id="addresseeUnitIn" class="myInput form-control" onclick="checkColor(this)" onblur="checkIsNull(this)"/>
		</div>
		
		<div class="col-md-1" >
				<div class="myBtn"><button class="btn btn-primary">电话:</button></div>
		</div>
		<div class="col-md-2" >
				<input type="text" id="addresseePhoneIn" class="myInput form-control" onclick="checkColor(this)"/>
		</div>
		<div class="col-md-1" >
				<label class="myLabel control-label">手机:</label>
		</div>
		<div class="col-md-2" >
				<input type="text" id="addresseeCellPhoneIn" class="myInput form-control" onclick="checkColor(this)"/>
		</div>
		
		<div class="col-md-12"><br/></div>	
	</div>
	</div>
	</div>
</div>
	
	
	<div class="panel-body" id="accordionTwo">
	<div class="panel panel-default">
		<div class="panel-heading">
			<h4 class="panel-title">
				<a data-toggle="collapse" data-parent="#accordionTwo" 
				   href="#basicJobListTwo">
					计费信息
				</a>
			</h4>
		</div>
		
	<div id="basicJobListTwo" class="panel-collapse collapse on">
	<div class="content col-md-12 col-md-offset-0.5">
		<div class="col-md-12"><br/>《保险》</div>	
		<div class="col-md-1" >
				<label class="myLabel control-label">保险类型:</label>
		</div>
		<div class="col-md-2" >
					<select id="safeTypeIn" class="selectpicker form-control" onchange="selectBaoxianOnChange(this)"></select>
		</div>
		<div class="col-md-1" >
				<label class="myLabel control-label">声明价值:</label>
		</div>
		<div class="col-md-2" >
				<input type="text" id="declaredValueIn" class="myInput form-control" readonly="readonly" value="0"/>
		</div>
		<div class="col-md-1" >
				<label class="myLabel control-label">保险费:</label>
		</div>
		<div class="col-md-2" >
				<input type="text" id="safeMoneyIn" class="myInput form-control" readonly="readonly" value="0"/>
		</div>
		<div class="col-md-12"><br/>《包装》</div>
		<div class="col-md-1" >
				<label class="myLabel control-label">原包装:</label>
		</div>
		<div class="col-md-2" >
					<select id="originalPackageIn" class="selectpicker form-control"></select>
		</div>
		<div class="col-md-1" >
				<label class="myLabel control-label">实际包装:</label>
		</div>
		<div class="col-md-2" >
					<select id="actualPackingIn" class="selectpicker form-control"></select>
		</div>
		
		<div class="col-md-1" >
				<label class="myLabel control-label">包装费:</label>
		</div>
		<div class="col-md-2" >
				<input type="text" id="baggingIn" class="myInput form-control" onclick="checkColor(this)" onblur="checkIsNull(this)" value="0"/>
		</div>
		<div class="col-md-1" >
				<label class="myLabel control-label">包装要求:</label>
		</div>
		<div class="col-md-2" >
				<input type="text" id="packingRequirementIn" class="myInput form-control" onclick="checkColor(this)"/>
		</div>
		<div class="col-md-12"><br/>《物品属性》</div>
		<div class="col-md-1" >
				<label class="myLabel control-label">实际重量:</label>
		</div>
		<div class="col-md-2" >
				<input type="text" id="factWeightIn" class="myInput form-control" onclick="checkColor(this)" onblur="checkIsNull(this)"/>
		</div>
		<div class="col-md-1" >
				<label class="myLabel control-label">品名:</label>
		</div>
		
		<div class="col-md-2" >
				<input type="text" id="productNameIn" class="myInput form-control" onclick="checkColor(this)" onblur="checkIsNull(this)"/>
		</div>
		
		<div class="col-md-1" >
				<label class="myLabel control-label">体积:</label>
		</div>
		
		<div class="col-md-2" >
				<input type="text" id="sizeIn" class="myInput form-control" onclick="checkColor(this)" onblur="checkIsNull(this)"/>
		</div>
		
		<div class="col-md-12"><br/>《结算》</div>
		<div class="col-md-1" >
				<label class="myLabel control-label">结算方式:</label>
		</div>
		<div class="col-md-2" >
					<select id="methodOfSettlingAccountsIn" class="selectpicker form-control" onchange="selectOnchang(this)"></select>
		</div>
		<div class="col-md-1" >
				<label class="myLabel control-label">计费重量:</label>
		</div>
		<div class="col-md-2" >
				<input type="text" id="chargedWeightIn" class="myInput form-control" onclick="checkColor(this)" onblur="checkIsNull(this)"/>
		</div>
		
		<div class="col-md-1" >
				<label class="myLabel control-label">实际件数:</label>
		</div>
		<div class="col-md-2" >
				<input type="text" id="billingQuantityIn" class="myInput form-control" onclick="checkColor(this)" onblur="checkIsNull(this)"/>
		</div>
		<div class="col-md-12"><br/>《收款》</div>
		
		<div class="col-md-1" >
				<label class="myLabel control-label">预收费:</label>
		</div>
		<div class="col-md-2" >
				<input type="text" id="prechargeIn" class="myInput form-control" readonly unselectable="on"/>
		</div>
		<div class="col-md-3" >
				<div class="myBtn"><button class="btn btn-primary col-md-12" id="countBtn">计算</button></div>
		</div>
		
		
		<div class="col-md-1" >
				<label class="myLabel control-label">代收款:</label>
		</div>
		<div class="col-md-2" >
				<input type="text" id="agencyFundIn" class="myInput form-control" readonly="readonly"/>
		</div>
		
		<div class="col-md-1" >
				<label class="myLabel control-label">到付款:</label>
		</div>
		<div class="col-md-2" >
				<input type="text" id="cameCollectIn" class="myInput form-control" readonly unselectable="on"/>
		</div>
		
		<div class="col-md-12"><br/></div>	
		
	</div>
	</div>
</div>	
</div>
	
	
	<div class="panel-body" id="accordionThree">
	<div class="panel panel-default">
		<div class="panel-heading">
			<h4 class="panel-title">
				<a data-toggle="collapse" data-parent="#accordionThree" 
				   href="#basicJobListThree">
					配送需求
				</a>
			</h4>
		</div>
		
	<div id="basicJobListThree" class="panel-collapse collapse on">
	<div class="content col-md-12">
	<div class="col-md-12"><br/>《处理》</div>
		<div class="col-md-2" >
				<input type="checkbox" id="feedbackSignIn" value="0" style="margin-top:28px;margin-left:22px;"/>&nbsp;&nbsp;<label class="myLabel control-label" style="float: left">反馈签收</label>
		</div>
		<div class="col-md-2" >
				<input type="checkbox" id="collectTheGoodsOnHolidaysIn" value="0" style="margin-top:28px;margin-left:20px;"/>&nbsp;&nbsp;<label class="myLabel control-label" style="float: left">节假日可收货</label>
		</div>
		
		<div class="col-md-1" >
				<label class="myLabel control-label">送达时限:</label>
		</div>
		<div class="col-md-2" >
				<input type="text" id="serviceTimeLimitIn" class="myInput form-control" onclick="checkColor(this)"/>
		</div>
		<div class="col-md-1" >
				<label class="myLabel control-label">处理方式:</label>
		</div>
		<div class="col-md-2" >
					<select id="processModeIn" class="selectpicker form-control"></select>
		</div>
		
		<div class="col-md-12"><br/>《其他》</div>
		<div class="col-md-1" >
				<label class="myLabel control-label">签单返回:</label>
		</div>
		<div class="col-md-2" >
					<select id="signBackIn" class="selectpicker form-control"></select>
		</div>
		
		<div class="col-md-1">
				<label class="myLabel control-label">大物流类型:</label>
		</div>
		<div class="col-md-2" >
			<input type="text" id="bigLogisticsTypeIn" class="myInput form-control" onclick="checkColor(this)" onblur="checkIsNull(this)"/>
		</div>
		
		<div class="col-md-2" >
			<label class="myLabel control-label" style="float: left;">是否打印</label>&nbsp;&nbsp;<input type="checkbox" id="isMimeographIn" style="margin-top:28px;margin-left:25px;" checked="checked" value="1"/>
		</div>
		<div class="col-md-2" >
			<label class="myLabel control-label" style="float: left;">是否国际</label>&nbsp;&nbsp;<input type="checkbox" id="isInternationalIn" style="margin-top:28px;margin-left:20px;" value="0"/>
		</div>
		
		<div class="col-md-12"><br/>《备注》</div>
		<div class="col-md-1" >
				<label class="myLabel control-label">重要提示:</label>
		</div>
		<div class="col-md-10" >
			<input type="text" id="importantIn" class="myInput form-control" onclick="checkColor(this)"/>
		</div>
		<div class="col-md-12"><br/></div>
	</div>
</div>
</div>
</div>

	
	<div class="col-md-12"><br/><br/><br/></div>
</div>
	

</body>
</html>