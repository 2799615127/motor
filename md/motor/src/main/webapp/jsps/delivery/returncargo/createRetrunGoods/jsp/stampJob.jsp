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
<title>NOOB速递工单打印</title>
<script src="${pageContext.request.contextPath }/js/jquery-3.1.1.min.js"
	type="text/javascript"></script>
	  
<style type="text/css">
td {
	padding: 10px;
}
</style>
</head>
<body>
	<c:forEach items="${returnGoodsList}" var="returnGoodsUtil">
		<table border="1px"
			style="margin: 50px auto 1px; text-align: center; font-size: 15px; border-collapse: collapse;">
			<thead>
				<tr>
					<td colspan="10"style="font-size:25px; border-bottom-color:white;">
						<span style=" color: #ccc;font-style:italic;font-size: 30px;">NOOB速递工单</span> 
					</td>
				</tr>

				<tr>
					<td colspan="2"
						style="text-align: left; border-right-color: white;">客户编号：${returnGoodsUtil.cuNo}</td>
					<td colspan="4" style="border-right-color: white;">开单日期：<%out.print(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())); %></td>
					<td colspan="2"
						style="text-align: right; border-right-color: white;">NO：${returnGoodsUtil.jobListNo}</td>
				</tr>
			</thead>

			<tbody>
				<tr style="text-align: center;">
					<td>返货状态</td>
					<td>品名</td>
					<td>处理结果</td>
					<td>件数</td>
					<td>体积</td>
					<td>产品类型</td>
					<td>委托人</td>
					<td>代收款</td>
				</tr>

				<tr>
					<td style="height:100px">${returnGoodsUtil.implementState}</td>
					<td>${returnGoodsUtil.productName}</td>
					<td>${returnGoodsUtil.important}</td>
					<td>${returnGoodsUtil.factQuantity}</td>
					<td>${returnGoodsUtil.size}</td>
					<td>${returnGoodsUtil.subsetName}</td>
					<td>${returnGoodsUtil.addressee}</td>
					<td>${returnGoodsUtil.agencyFund}元</td>
				</tr>
				
				<tr>
				  <td colspan="4">到达地</td>
				  <td colspan="4">委托单位</td>
				</tr>
				
				<tr>
				  <td colspan="4" style="height:80px">${returnGoodsUtil.whither}</td>
				  <td colspan="4">${returnGoodsUtil.addresseeUnit}</td>
				</tr>

			</tbody>

			<tfoot>
				<tr>
					<td colspan="2"
						style="border-right-color: white; text-align: left;">受理人：${returnGoodsUtil.operationStaffName}</td>
					<td colspan="4" style="border-right-color: white;">受理时间：${returnGoodsUtil.operationTimeStr}</td>
					<td colspan="2" style="text-align: right;">受理单位：${returnGoodsUtil.operationOrg}</td>
				</tr>
			</tfoot>

		</table>
	</c:forEach>
</body>
</html>