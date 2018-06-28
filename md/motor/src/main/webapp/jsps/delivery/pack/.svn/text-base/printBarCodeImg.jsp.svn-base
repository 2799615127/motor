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
<title>NOOB速递条码打印</title>
<script src="${pageContext.request.contextPath }/js/jquery-3.1.1.min.js"
	type="text/javascript"></script>
<script type="text/javascript">
	  
</script>
<style type="text/css">
td {
	padding: 10px;
}
</style>
</head>
<body>
	<table border="1px"
		style="margin: 50px auto 1px; text-align: center; font-size: 15px; border-collapse: collapse;">
		<thead style="background-color: #F0F8FF">
			<tr>
				<td colspan="12"
					style="font-size: 25px; border-bottom-color: white;">NOOB速递条码打印</td>
			</tr>

			<tr>
				<td colspan="4" style="text-align: left; border-right-color: white;">开单日期：${sessionScope.operateTime}</td>
				<td colspan="3"
					style="text-align: right; border-right-color: white;">工作单号：${sessionScope.jobListNo}</td>
			</tr>
		</thead>

		<tbody>
			<tr style="text-align: center; background-color: #969696">
				<td>件数</td>
				<td>分拣编码</td>
				<td>发站</td>
				<td>发货方式</td>
				<td>到站</td>
				<td>返货标志</td>
				<td>条码</td>
			</tr>


			<tr style="background-color: #F0F8FF">
				<td>${sessionScope.packagesNum}</td>
				<td>${sessionScope.sortingCode}</td>
				<td>${sessionScope.senderAddress}</td>
				<td>${sessionScope.product}</td>
				<td>${sessionScope.whither}</td>
				<td>${sessionScope.returnProductSign}</td>
				<td><img
					src="<%=request.getContextPath() %>/barcode?msg=${sessionScope.jobListNo}&BARCODE_TYPE=code39"
					height="100px" width=230px /></td>
			</tr>

		</tbody>
	</table>
</body>
</html>