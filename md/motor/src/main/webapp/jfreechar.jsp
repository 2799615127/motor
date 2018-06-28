<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" 
        src="${pageContext.request.contextPath}/js/Chart.bundle.min.js"></script>

<!-- Jquery组件引用 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js"></script>
	<style type="text/css">
	   #lines {
	     width:640px;
	     height:365px;
	     float: right;
	   }
	   
	   #pieChart {
	     width:440px;
	     height:305px;
	     float:left;
	   }
	   
	   #bars {
	     width:640px;
	     height:365px;
	     float:left;
	   }
	   
	   #polarArea {
	     width:440px;
	     height:305px;
	     float:right;
	   }
	   
	   #doughnuts {
	     width:440px;
	     height:305px;
	     float:left;
	   }
	</style>
</head>
<body>

<div id="bars">
        <div><font size="4" color="#72BF7B">☞部分模块的数量</font></div>
	    <canvas id="Bar" style="width:100px;height:50px;"></canvas>
	    
	</div>
      <div id="lines">
      <div><font size="4" color="#72BF7B">☞每周的工作单数量</font></div>
	   <canvas id="Line" style="width:100px;height:50px;"></canvas>
	   </div>
	   
	   <div id="pieChart">
	       <div><font size="4" color="#72BF7B">☞业务受理状态</font></div>
           <canvas id="Pie" style="width:200px;height:100px;"></canvas> 
	   </div>
	
	   
	   <div id="doughnuts">
	      <div><font size="4" color="#72BF7B">☞工单类型</font></div>
	      <canvas id="Doughnut" style="width:200px;height:100px;"></canvas>
	   </div>
	   
	   
	
	<div id="polarArea">
	      <div><font size="4" color="#72BF7B">☞返货状态</font></div>
	   <canvas id="PolarArea" style="width:200px;height:100px;"></canvas>
	</div>
	
	
	
	
	
 <script type="text/javascript">
 $(function() {
	 
  $.ajax({
		url : "bargraph.action",
		type : "post",
		traditional : true,
		success : function(response) {
			createLine(['<%= new SimpleDateFormat("yyyy-MM-dd").format(new Date(new Date().getTime() - 86400000*6)) %>','<%= new SimpleDateFormat("yyyy-MM-dd").format(new Date(new Date().getTime() - 86400000*5)) %>','<%= new SimpleDateFormat("yyyy-MM-dd").format(new Date(new Date().getTime() - 86400000*4)) %>','<%= new SimpleDateFormat("yyyy-MM-dd").format(new Date(new Date().getTime() - 86400000*3)) %>','<%= new SimpleDateFormat("yyyy-MM-dd").format(new Date(new Date().getTime() - 86400000*2)) %>','<%= new SimpleDateFormat("yyyy-MM-dd").format(new Date(new Date().getTime() - 86400000)) %>','<%= new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime()) %>'],[response[6],response[5],response[4],response[3],response[2],response[1],response[0]]);

        }
   });
  
   $.ajax({
	 url : "bar.action",
     type : "post",
     traditional : true,
     success : function(response){
    	 createBar(['用户','需要调度','下单成功','取派员'],
    			 [response[0],response[1],response[2],response[3]]);
     } 
  });
   
   $.ajax({
		 url : "polarArea.action",
		 type : "post",
		 traditional : true,
		 success : function(response){
			 createPolarArea(['全部','已返货','已转发','未执行'],
					 [response[3],response[2],response[1],response[0]]);
		 }
	  });
   
   
    $.ajax({
		 url : "pie.action",
		 type : "post",
		 traditional : true,
		 success : function(response){
			 createPie(['下单失败','下单成功'],
					 [response[0],response[1]]);
		 }
	  });
    
    $.ajax({
		 url : "doughnut.action",
		 type : "post",
		 traditional : true,
		 success : function(response){
			 createDoughnut(['新单','追单','改单','销单'],
					 [response[0],response[1],response[2],response[3]]);
		 }
	  });
    
 });
 
   //createLine(['mm'],[10]);
   //----------------曲线图---------------//
  function createLine(names,data){
	   var ctx = document.getElementById("Line").getContext('2d');
		document.getElementById("Line").width = 100;
		document.getElementById("Line").height = 50;
	    var myChart = new Chart(ctx, {
	        type: 'line',
	        data: {
	            labels: names,
	            datasets: [{
	                label: '每周的工作单数量',
	                data: data,
	                fillColor : "rgba(151,187,205,0.5)",
	    			strokeColor : "rgba(151,187,205,1)",
	    			pointColor : "rgba(151,187,205,1)",
	    			pointStrokeColor : "#F0F8FF",
	    			bezierCurve : true,
	    			pointDotRadius : 8,          // 圆点的大小 
	            }]
	        },
	        options: {
	            scales: {
	                yAxes: [{
	                    ticks: {
	                        beginAtZero:true
	                    }
	                }]
	            }
	        }
	    });
   }
  
      //--------------柱状图--------------//
  function createBar(names,data){
	  var ctx = document.getElementById("Bar").getContext('2d');
		document.getElementById("Bar").width = 100;
		document.getElementById("Bar").height = 50;
	    var myChart = new Chart(ctx, {
	        type: 'bar',
	        data: {
	            labels: names,
	            datasets: [{
	                label: '部分模块的数量',
	                data: data,
	                backgroundColor: [
	                	'rgba(54, 162, 235, 0.2)',
	                    'rgba(54, 162, 235, 0.2)',
	                    'rgba(54, 162, 235, 0.2)',
	                    'rgba(54, 162, 235, 0.2)',
	                    'rgba(54, 162, 235, 0.2)',
	                    'rgba(54, 162, 235, 0.2)'
	                ],
	                borderColor: [
	                    'rgba(54, 162, 235, 1)',
	                    'rgba(54, 162, 235, 1)',
	                    'rgba(54, 162, 235, 1)',
	                    'rgba(54, 162, 235, 1)',
	                    'rgba(54, 162, 235, 1)',
	                    'rgba(54, 162, 235, 1)' 
	                ],
	                borderWidth: 1
	            }]
	        },
	        options: {
	            scales: {
	                yAxes: [{
	                    ticks: {
	                        beginAtZero:true
	                    }
	                }]
	            }
	        }
	    });
   } 
      
  //-------------极地区域图----------------//  
  function createPolarArea(names,data){
	   var ctx = document.getElementById("PolarArea").getContext('2d');
		document.getElementById("PolarArea").width = 200;
		document.getElementById("PolarArea").height = 100;
	    var myChart = new Chart(ctx, {
	        type: 'polarArea',
	        data: {
	            labels: names,
	            datasets: [{
	                label: '返货状态饼图',
	                data: data,
	                backgroundColor: [
	                    'rgba(255, 99, 132, 0.2)',
	                    'rgba(54, 162, 235, 0.2)',
	                    'rgba(255, 206, 86, 0.2)',
	                    'rgba(75, 192, 192, 0.2)',
	                    'rgba(153, 102, 255, 0.2)',
	                    'rgba(255, 159, 64, 0.2)'
	                ],
	                borderColor: [
	                    'rgba(255,99,132,1)',
	                    'rgba(54, 162, 235, 1)',
	                    'rgba(255, 206, 86, 1)',
	                    'rgba(75, 192, 192, 1)',
	                    'rgba(153, 102, 255, 1)',
	                    'rgba(255, 159, 64, 1)'
	                ],
	                borderWidth: 1
	            }]
	        }/* ,
	        options: {
	            scales: {
	                yAxes: [{
	                    ticks: {
	                        beginAtZero:true
	                    }
	                }]
	            }
	        } */
	    });
  }
  
  
  //----------------环状图----------------//
   function createPie(names,data){
	   var ctx = document.getElementById("Pie").getContext('2d');
		document.getElementById("Pie").width = 200;
		document.getElementById("Pie").height = 100;
	    var myChart = new Chart(ctx, {
	        type: 'doughnut',
	        data: {
	            labels: names,
	            datasets: [{
	                label: '下单状态饼图',
	                data: data,
	                backgroundColor: [
	                    'rgba(255, 99, 132, 0.2)',
	                    'rgba(54, 162, 235, 0.2)',
	                    'rgba(255, 206, 86, 0.2)',
	                    'rgba(75, 192, 192, 0.2)',
	                    'rgba(153, 102, 255, 0.2)',
	                    'rgba(255, 159, 64, 0.2)'
	                ],
	                borderColor: [
	                    'rgba(255,99,132,1)',
	                    'rgba(54, 162, 235, 1)',
	                    'rgba(255, 206, 86, 1)',
	                    'rgba(75, 192, 192, 1)',
	                    'rgba(153, 102, 255, 1)',
	                    'rgba(255, 159, 64, 1)'
	                ],
	                borderWidth: 1
	            }]
	        }
	        
	    });
 }
 
  
 //----------------饼图----------------//
   function createDoughnut(names,data){
	   var ctx = document.getElementById("Doughnut").getContext('2d');
		document.getElementById("Doughnut").width = 200;
		document.getElementById("Doughnut").height = 100;
	    var myChart = new Chart(ctx, {
	        type: 'pie',
	        data: {
	            labels: names,
	            datasets: [{
	                label: '工单状态饼图',
	                data: data,
	                backgroundColor: [
	                    'rgba(255, 99, 132, 0.2)',
	                    'rgba(54, 162, 235, 0.2)',
	                    'rgba(255, 206, 86, 0.2)',
	                    'rgba(75, 192, 192, 0.2)',
	                    'rgba(153, 102, 255, 0.2)',
	                    'rgba(255, 159, 64, 0.2)'
	                ],
	                borderColor: [
	                    'rgba(255,99,132,1)',
	                    'rgba(54, 162, 235, 1)',
	                    'rgba(255, 206, 86, 1)',
	                    'rgba(75, 192, 192, 1)',
	                    'rgba(153, 102, 255, 1)',
	                    'rgba(255, 159, 64, 1)'
	                ],
	                borderWidth: 1
	            }]
	        }
	        
	    });
 }
 
  
 </script>
	
</body>
</html>