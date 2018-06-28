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
<title>打印标签</title>
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
		<table border="2px" style="margin: 50px auto 1px; text-align: center; font-size: 15px; border-collapse: collapse;">
		   <tr>
		       <td><%out.print(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())); %></td>
		       <td>返货</td>
		   </tr>
		    <tr>
		       <td>021</td>
		       <td>SSH</td>
		   </tr>
		    <tr>
		       <td colspan="2" style="border-color: white;">
		       <img src="<%=request.getContextPath() %>/barcode?msg=1-${returnGoodsUtil.factQuantity}-${returnGoodsUtil.jobListNo}&BARCODE_TYPE=code39"
					height="100px" width=230px /></td>
		   </tr>
		</table>
		
		</c:forEach>
</body>
</html>