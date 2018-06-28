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
	<c:forEach items="${sessionScope.appointList}" var="appointList">
		<table border="1px"
			style="margin: 50px auto 1px; text-align: center; font-size: 15px; border-collapse: collapse;">
			<thead>
				<tr>
					<td colspan="10" style="font-size:25px; border-bottom-color:white;">
						<span style=" color: #ccc;font-style:italic;font-size: 30px;position:absolute;left:240px"><img src="/noob/index/images/logo.jpg" height="10%" width="10%" />NOOB速递</span>
						<span style="margin:30px 30px 30px 30px">工作单</span>
					</td>
				</tr>

				<tr>
					<td colspan="2"
						style="text-align: left; border-right-color: white;">客户编号：${appointList.jobListId}</td>
					<td colspan="4" style="border-right-color: white;">打印日期：<%out.print(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())); %></td>
					<td colspan="2"
						style="text-align: right; border-right-color: white;">交接时间：${appointList.appointmentDispatchTime}</td>
				</tr>
			</thead>

			<tbody>
				<tr style="text-align: center;">
					<td>签收</td>
					<td>签收人</td>
					<td>派送单位</td>
					<td>受理单位</td>
					<td>产品类型</td>
					<td>产品时限</td>
					<td>结算方式</td>
					<td>品名</td>
				</tr>

				<tr>
					<td style="height:100px">${appointList.signInType}</td>
					<td>${appointList.addressee}</td>
					<td>${appointList.unitOfAcquisition}</td>
					<td>${appointList.unitOfAcquisition}</td>
					<td>${appointList.product}</td>
					<td>${appointList.serviceTimeLimit}</td>
					<td>${appointList.methodOfSettlingAccounts}</td>
					<td>${appointList.nameOfAPart}</td>
				</tr>
				
				<tr>
				  <td colspan="4">到达地</td>
				  <td colspan="4">配载要求</td>
				</tr>
				
				<tr>
				  <td colspan="4" style="height:80px">${appointList.addresseeAddress}</td>
				  <td colspan="4">${appointList.archivesId}</td>
				</tr>

			</tbody>

			<tfoot>
				<tr>
					<td colspan="2"
						style="border-right-color: white; text-align: left;">件数：${appointList.factQuantity}</td>
					<td colspan="4" style="border-right-color: white;">体积：${appointList.size}</td>
					<td colspan="2" style="text-align: right;">希望送达时间：${appointList.serviceTimeLimit}</td>
				</tr>
			</tfoot>

		</table>
	</c:forEach>
</body>
</html>