<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>NOOB速递工作单打印</title>
<script src="${pageContext.request.contextPath }/js/jquery-3.1.1.min.js"
	type="text/javascript"></script>

<style type="text/css">
	td{
		padding: 10px;
	}
	
	.b_right{
		border-right: 0px;
	}
	
	.b_left{
		border-left: 0px;
	}
	
	.b_leftAndRight{
		border-right: 0px;
		border-left: 0px;
	}
	
	.b_bottom{
		border-bottom: 0px;
	}
	
	.b_top{
		border-top: 0px;
	}
	
	.padd_top{
		padding-top: 0px;
	}
	
	.padd_left{
		padding-left: 0px;
	}
	
	.padd_bottom{
		padding-bottom: 2px;
	}
</style>
</head>
<body>
	<table border="1px"
			style="margin: 50px auto 1px; text-align: center; font-size: 15px; border-collapse: collapse;">
			<thead>
				<tr>
					<td colspan="10"style="font-size:25px; border-bottom-color:white;">
						<span style=" color: #ccc;font-style:italic;font-size: 30px;position:absolute;left:330px"><img src="/noob/index/images/logo.jpg" height="10%" width="10%" />NOOB速递</span> 工作单
					</td>
				</tr>

				<tr>
					<td colspan="2"
						style="text-align: left; border-right-color: white;">客户编号：${sessionScope.basicJobList.cuNo}</td>
					<td colspan="4" style="border-right-color: white;">开单日期：<%out.print(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())); %></td>
					<td colspan="2"
						style="text-align: right; border-right-color: white;">NO：${sessionScope.basicJobList.jobListNo}</td>
				</tr>
			</thead>

		<tbody style="text-align: left;">
			<tr style="text-align: left;">
				<td class="b_bottom padd_bottom" colspan="4">寄件人信息</td>
				<td class="b_bottom padd_bottom" colspan="4">收件人信息</td>
			</tr>

			<tr>
				<td class="b_right b_top padd_top b_bottom padd_bottom">寄件人姓名：</td>
				<td class="b_leftAndRight b_top padd_top padd_left b_bottom padd_bottom" style="text-align: left;">${sessionScope.basicJobList.postInfo.sender}</td>
				<td class="b_leftAndRight b_top padd_top b_bottom padd_bottom">始发地：</td>
				<td class="b_left b_top padd_top padd_left b_bottom padd_bottom" style="text-align: left;">${sessionScope.basicJobList.postInfo.senderUnit}</td>
				<td class="b_right b_top padd_top b_bottom padd_bottom">收件人姓名：</td>
				<td class="b_leftAndRight b_top padd_top padd_left b_bottom padd_bottom" style="text-align: left;">${sessionScope.basicJobList.postInfo.addressee}</td>
				<td class="b_leftAndRight b_top padd_top b_bottom padd_bottom">目的地：</td>
				<td class="b_left b_top padd_top b_bottom padd_left padd_bottom" style="text-align: left;">${sessionScope.basicJobList.postInfo.addresseeUnit}</td>
			</tr>

			<tr>
				<td class="b_right b_top padd_top b_bottom padd_bottom">寄件地址：</td>
				<td class="b_leftAndRight b_top padd_left padd_top b_bottom padd_bottom" colspan="3" style="text-align: left;">${sessionScope.basicJobList.postInfo.senderAddress}</td>
				<td class="b_right b_top padd_top b_bottom padd_bottom">收件地址：</td>
				<td class="b_leftAndRight b_top padd_left padd_top b_bottom padd_bottom" colspan="3" style="text-align: left;">${sessionScope.basicJobList.postInfo.addresseeAddress}</td>
			</tr>

			<tr>
				<td class="b_right b_top padd_top">手&nbsp;机：</td>
				<td class="b_leftAndRight b_top padd_top padd_left" style="text-align: left;">${sessionScope.basicJobList.postInfo.senderCellPhone}</td>
				<td class="b_leftAndRight b_top padd_top">固定电话：</td>
				<td class="b_left b_top padd_top padd_left" style="text-align: left;">${sessionScope.basicJobList.postInfo.senderPhone}</td>
				<td class="b_right b_top padd_top">手&nbsp;机：</td>
				<td class="b_leftAndRight b_top padd_top padd_left" style="text-align: left;">${sessionScope.basicJobList.postInfo.addresseeCellPhone}</td>
				<td class="b_leftAndRight b_top padd_top">固定电话：</td>
				<td class="b_left b_top padd_top padd_left" style="text-align: left;">${sessionScope.basicJobList.postInfo.addresseePhone}</td>
			</tr>
			
			<tr style="text-align: left;">
				<td class="b_bottom padd_bottom" colspan="8">物品信息</td>
			</tr>
			
			<tr>
				<td class="b_right b_top padd_top b_bottom padd_bottom">品&nbsp;名：</td>
				<td class="b_leftAndRight b_top padd_top padd_left b_bottom padd_bottom" style="text-align: left;">${sessionScope.basicJobList.productName}</td>
				<td class="b_leftAndRight b_top padd_top b_bottom padd_bottom">件&nbsp;数：</td>
				<td class="b_leftAndRight b_top padd_top padd_left b_bottom padd_bottom" style="text-align: left;">${sessionScope.basicJobList.factQuantity}</td>
				<td class="b_leftAndRight b_top padd_top b_bottom padd_bottom">重&nbsp;量：</td>
				<td class="b_leftAndRight b_top padd_top padd_left b_bottom padd_bottom" style="text-align: left;">${sessionScope.basicJobList.factWeight}</td>
				<td class="b_leftAndRight b_top padd_top b_bottom padd_bottom"></td>
				<td class="b_left b_top padd_top b_bottom padd_left padd_bottom" style="text-align: left;"></td>
			</tr>
			
			<tr>
				<td class="b_right b_top padd_top b_bottom padd_bottom">发货类型：</td>
				<td class="b_leftAndRight b_top padd_top padd_left b_bottom padd_bottom" style="text-align: left;">${sessionScope.basicJobList.product}</td>
				<td class="b_leftAndRight b_top padd_top b_bottom padd_bottom">发货方式：</td>
				<td class="b_leftAndRight b_top padd_top padd_left b_bottom padd_bottom" style="text-align: left;">${sessionScope.basicJobList.mannedRequire}</td>
				<td class="b_leftAndRight b_top padd_top b_bottom padd_bottom">运费</td>
				<td class="b_leftAndRight b_top padd_top padd_left b_bottom padd_bottom" style="text-align: left;">${sessionScope.basicJobList.charginInfo.precharge}元</td>
				<td class="b_leftAndRight b_top padd_top b_bottom padd_bottom"></td>
				<td class="b_left b_top padd_top b_bottom padd_left padd_bottom" style="text-align: left;"></td>
			</tr>
			
			<tr>
				<td class="b_right b_top padd_top b_bottom padd_bottom">物品包装：</td>
				<td class="b_leftAndRight b_top padd_top padd_left b_bottom padd_bottom" style="text-align: left;">${sessionScope.basicJobList.charginInfo.precharge}</td>
				<td class="b_leftAndRight b_top padd_top b_bottom padd_bottom">包装要求：</td>
				<td class="b_leftAndRight b_top padd_top padd_left b_bottom padd_bottom" style="text-align: left;">${sessionScope.basicJobList.charginInfo.packingRequirement}</td>
				<td class="b_leftAndRight b_top padd_top b_bottom padd_bottom">包装费用：</td>
				<td class="b_leftAndRight b_top padd_top padd_left b_bottom padd_bottom" style="text-align: left;">${sessionScope.basicJobList.charginInfo.bagging}元</td>
				<td class="b_leftAndRight b_top padd_top b_bottom padd_bottom"></td>
				<td class="b_left b_top padd_top b_bottom padd_left padd_bottom" style="text-align: left;"></td>
			</tr>
			
			<tr>
				<td class="b_right b_top padd_top b_bottom">送达时限：</td>
				<td class="b_leftAndRight b_top padd_top padd_left b_bottom" style="text-align: left;">${sessionScope.basicJobList.transportInfo.serviceTimeLimit}</td>
				<td class="b_leftAndRight b_top padd_top b_bottom">签收时间：</td>
				<td class="b_leftAndRight b_top padd_top padd_left b_bottom" style="text-align: left;">${sessionScope.basicJobList.transportInfo.signingTime}</td>
				<td class="b_leftAndRight b_top padd_top b_bottom">保险费：</td>
				<td class="b_leftAndRight b_top padd_top padd_left b_bottom" style="text-align: left;">${sessionScope.basicJobList.charginInfo.safeMoney}元</td>
				<td class="b_leftAndRight b_top padd_top b_bottom">结算方式：</td>
				<td class="b_left b_top padd_top padd_left b_bottom" style="text-align: left;">${sessionScope.basicJobList.charginInfo.methodOfSettlingAccounts}</td>
			</tr>
			
			<tr>
				<td class="b_right b_top padd_top b_bottom padd_bottom" style="text-align: right;" colspan="2">总费用：</td>
				<td class="b_leftAndRight b_top" colspan="2" style="text-align: left;font-size:30px;">${sessionScope.basicJobList.charginInfo.precharge+sessionScope.basicJobList.charginInfo.bagging+sessionScope.basicJobList.charginInfo.safeMoney}元</td>
				<td class="b_leftAndRight b_top padd_top padd_left" style="text-align: right;" colspan="2">目的地：</td>
				<td class="b_left b_top padd_top padd_left b_bottom padd_bottom" style="text-align: left;font-size:30px;" colspan="2">${sessionScope.basicJobList.whither}</td>
			</tr>
		</tbody>

		<tfoot>
			<tr>
				<td colspan="2" style="border-right-color: white; text-align: left;">受理人：${returnGoodsUtil.operationStaffName}</td>
				<td colspan="4" style="border-right-color: white;">受理时间：${returnGoodsUtil.operationTimeStr}</td>
				<td colspan="2" style="text-align: right;">受理单位：${returnGoodsUtil.operationOrg}</td>
			</tr>
		</tfoot>

	</table>
</body>
</html>