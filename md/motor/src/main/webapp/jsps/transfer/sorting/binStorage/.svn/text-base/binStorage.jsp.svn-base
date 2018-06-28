<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>入库管理</title>
	<link rel="stylesheet" type="text/css" href="${ pageContext.request.contextPath }/js/bootstrap/css/bootstrap.min.css">
	<script src="${ pageContext.request.contextPath }/js/jquery-3.1.1.min.js" type="text/javascript"></script>
	<script type="text/javascript" src="${ pageContext.request.contextPath }/js/bootstrap/js/bootstrap.min.js"></script>
    
    <link rel="stylesheet" href="${ pageContext.request.contextPath }/js/bootstrap-select/css/bootstrap-select.min.css">
  	<script src="${ pageContext.request.contextPath }/js/bootstrap-select/js/bootstrap-select.min.js"></script>
    
    <link rel="stylesheet" href="${ pageContext.request.contextPath }/js/toastr/toastr.min.css">
  	<script src="${ pageContext.request.contextPath }/js/toastr/toastr.min.js"></script>
    
    <script src="${ pageContext.request.contextPath }/js/bootstrap-table/bootstrap-table.js"></script>
    <link href="${ pageContext.request.contextPath }/js/bootstrap-table/bootstrap-table.css" rel="stylesheet" />
    <script src="${ pageContext.request.contextPath }/js/bootstrap-table/locale/bootstrap-table-zh-CN.js"></script>
    
    <link rel="stylesheet" href="${ pageContext.request.contextPath }/js/sweetalert/sweetalert.css">
  	<script src="${ pageContext.request.contextPath }/js/sweetalert/sweetalert.min.js"></script>
    
    <link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/js/bootstrap-datetimepicker/css/bootstrap-datetimepicker.css" />
	<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/bootstrap-datetimepicker/js/bootstrap-datetimepicker.js"></script>
	<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/bootstrap-datetimepicker/js/bootstrap-datetimepicker.zh-CN.js"></script>
    
  	<style type="text/css">
  		.serachDivMargin{
  			margin-bottom: 1%;
  		}
  		.modelDivBtnMargin{
  			margin-bottom: 5%;
  		}
  		
  	</style>
  	<script type="text/javascript" src="${pageContext.request.contextPath}/jsps/transfer/sorting/binStorage/binStorage.js"></script>
</head>
<body>
	<!-- 标签页切换标签 -->
	<ul id="myTab" class="nav nav-tabs">
	    <li class="active">
	        <a href="#cardTab" data-toggle="tab">交接单明细</a>
	    </li>
	    <li class="active">
	    <li>
	    	<a href="#tabulation" data-toggle="tab" id="storageConnect_btn">入库交接单查询</a>
	    </li>
	</ul>
	<div id="myTabContent" class="tab-content">	
		<div id="cardTab" class="tab-pane fade in active" style="padding-bottom: 0px;margin-top: 1%;">
			<div style="margin-top: 1%;margin-bottom:2%; padding-left: 2.4%;">
				<button id="cleanAllDataBtn" type="button" class="btn btn-default">
					<span class="glyphicon glyphicon-refresh" aria-hidden="true"></span>&nbsp;清空
				</button>
				<button id="start_Btn" type="button" class="btn btn-default">
					<span class="glyphicon glyphicon-transfer" aria-hidden="true"></span>&nbsp;对比
				</button>
				<button id="save_btn" type="button" class="btn btn-default">
					<span class="glyphicon glyphicon-film" aria-hidden="true"></span>&nbsp;保存
				</button>
			</div>
			<div class="col-sm-5">
				<div>			
					<div class="col-sm-5" style="margin-right: -4%;">
						<input type="text" placeholder="请输入出库交接单号" 
						class="form-control" id="storageDeliveryNums_text"/>
					</div>
					<div class="col-sm-1" >
								<button type="button" id="choose_query_btn"
									class="btn btn-primary" data-toggle="modal" 
									>关联交接单</button>
					</div>					
					<div class="col-sm-3" style="margin-left: 12%;">
						<button id="storageDelivery_addBtn" type="button" class="btn btn-default">
							<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
						</button>
						<button id="storageDelivery_removeBtn" type="button" class="btn btn-default">
							<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
						</button>  	
						<input id="storageDeliveryNums" type="hidden"/>
					</div>
				</div>
				<div style="padding-top: 10%;padding-left: 3%;">
					<table id="comparisonTable"></table>
				</div>
				
			</div>
			<div class="col-sm-7">
				<div>							
					<div class="col-sm-3" align="right">
						<input type="checkbox" id="add_checkbox"/>&nbsp;追加导入数据
					</div>
					<div class="col-sm-2">
						<button type="button" id="get_data_btn"
									class="btn btn-primary">接收数据</button> 
					</div>
					<div class="col-sm-1" style="margin-left: -3%;">
						<button type="button" id="insert_data_btn"
									class="btn btn-primary">导入数据</button>
						<input type="hidden" value="noob833A9C1A0," id="insert_data_text"/> 
					</div>
					<div class="col-sm-4" style="margin-right: -2%;margin-left: 5%;">
						<input id="storageDeliveryNumSon_text" type="text" class="form-control" placeholder="请输入工作单号"/>
					</div>
					<div class="col-sm-2">
						<button id="storageDeliveryNumSon_addBtn" type="button" class="btn btn-default">
							<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
						</button>
						<button id="storageDeliveryNumSon_removeBtn" type="button" class="btn btn-default">
							<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
						</button> 
						<input id="storageDeliveryNumSon" type="hidden" value="#,"/>
					</div>
				</div>
				<div style="padding-top: 7%;">
					<table id="beComparisonTable"></table>
				</div>
			</div>
		</div>
		<div id="tabulation" class="tab-pane fade" style="padding:10px;padding-bottom: 50px;">
			<div style="padding-top: 2%;">
				<div class="panel panel-default">
					<div class="panel-heading">
						<a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">
							查询条件
		                </a>
		            </div>
					<div class="panel-collapse collapse on" id="collapseTwo">
						<form id="formSearch" class="form-horizontal">
							<div class="form-group" style="margin-top: 15px">																							
								<!-- 开始时间 -->
								<label class="control-label col-sm-1"
									for="txt_search_startComeGoodsTime">开始时间</label>
								<div class="col-sm-3 serachDivMargin">
									<input type="text" readonly="readonly" class="form-control" 
									name="dateOfIssue" id="txt_search_startComeGoodsTime" 
									data-date-format="yyyy-mm-dd hh:mm:ss">
								</div>
								<!-- 结束时间 -->
								<label class="control-label col-sm-1"
									for="txt_search_endComeGoodsTime">结束时间</label>
								<div class="col-sm-3 serachDivMargin">
									<input type="text" readonly="readonly" class="form-control" 
									name="dateOfIssue" id="txt_search_endComeGoodsTime" 
									data-date-format="yyyy-mm-dd hh:mm:ss">
								</div>
								<!-- 接货人 -->
								<label class="control-label col-sm-1" for="txt_search_comeGoodsPerson">接货人</label>
								<div class="col-sm-3 serachDivMargin">
									<input type="text" class="form-control" id="txt_search_comeGoodsPerson">
								</div>
								<!-- 接收单位 -->
								<label class="control-label col-sm-1" for="txt_search_comeGoodsUnit">接收单位</label>
								<div class="col-sm-3 serachDivMargin">
									<input type="text" class="form-control" id="txt_search_comeGoodsUnit">
								</div>
								<!-- 发货人 -->
								<label class="control-label col-sm-1" for="txt_search_sendGoodsPerson">发货人</label>
								<div class="col-sm-3 serachDivMargin">
									<input type="text" class="form-control" id="txt_search_sendGoodsPerson">
								</div>
								<!-- 发货单位 -->
								<label class="control-label col-sm-1" for="txt_search_sendGoodsUnit">发货单位</label>
								<div class="col-sm-3 serachDivMargin">
									<input type="text" class="form-control" id="txt_search_sendGoodsUnit">
								</div>
								<div class="col-sm-12" style="text-align: right;">
									<button type="button" style="margin-right: 33px;width: 12%;" 
									id="btn_storageConnect_query" class="btn btn-primary">
									查询</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
			<div style="height: 85%;">			
				<div style="height: 50%;">
					<table id="storageConnectTable"></table>
				</div>
				<div class="panel panel-default" style="margin-top: 2%;">
					<div class="panel-heading">
						<a data-toggle="collapse" data-parent="#accordion" href="#collapseTh">
							查询条件
		                </a>
		            </div>
					<div class="panel-collapse collapse on" id="collapseTh">
						<form id="formSearch" class="form-horizontal">
							<div class="form-group" style="margin-top: 15px">																							
								<!-- 工作单状态 -->
								<label class="control-label col-sm-1" for="txt_search_status">工作单状态</label>
								<div class="col-sm-3 serachDivMargin">
									<select id="txt_search_status" class="selectpicker show-menu-arrow form-control" data-hide-disabled="true" data-size="5">
										<option selected value="">--请选择--</option>
										<option value="1">中转入库</option>
										<option value="2">二次入库</option>
										<option value="3">初始入库</option>
										<option value="4">有货无单</option>
									</select>
								</div>
								<!-- 单号 -->
								<label class="control-label col-sm-1" for="txt_search_storageConnectNumSon">单号</label>
								<div class="col-sm-3 serachDivMargin">
									<input type="text" class="form-control" id="txt_search_storageConnectNumSon">
								</div>
								<!-- 合包号 -->
								<label class="control-label col-sm-1" for="txt_search_packageNumber">合包号</label>
								<div class="col-sm-3 serachDivMargin">
									<input type="text" class="form-control" id="txt_search_packageNumber">
								</div>
								<div class="col-sm-12" style="text-align: right;">
									<button type="button" style="margin-right: 33px;width: 12%;" 
									id="btn_storageConnectSon_query" class="btn btn-primary">
									查询</button>
								</div>
							</div>
						</form>
					</div>
				</div>
				<div style="height: 50%;">
					<table id="storageConnectSonTable"></table>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="contrastModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true" onclick="clean()">&times;</button>
					<div class="panel panel-success">
						<div class="panel-heading">
							<h3 class="panel-title">关联交接单号</h3>
						</div>
						<div class="panel-body">
							<div class="col-sm-9">
								<table id="chooseTable"></table>
							</div>
							<div class="col-sm-3">
								<div class="modelDivBtnMargin">
									<input  type="button" class="btn btn-primary" 
									id="btn_Obtain_details" value="获取明细"/>
								</div>
								<div class="modelDivBtnMargin">
									<input type="button" class="btn btn-primary" 
									data-dismiss="modal" value="关闭"  />
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>