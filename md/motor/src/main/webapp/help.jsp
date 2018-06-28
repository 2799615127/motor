<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>帮助页面</title>
<script src="index/lib/jquery-3.1.1.min.js" type="text/javascript"></script>
<!-- 提示框Js文件和Css的引用 -->
<script type="text/javascript" src="js/toastr/toastr.min.js"></script>
<link rel="stylesheet" type="text/css" href="js/toastr/toastr.min.css" />
<style type="text/css">
	body{
		text-align: center;
	}
	#buttonOne{
		width: 140px;
		height: 40px;
		background-color:#f56600;
		font-family:"微軟正黑體";
		font-size:18px;
		color:white;
		border:none;
		margin-top:200px; 
	}
	#buttonTwo{
		width: 140px;
		height: 40px;
		background-color:#f56600;
		font-family:"微軟正黑體";
		font-size:18px;
		color:white;
		border:none;
		margin:200px 0 0 10px; 
	}
</style>

<script type="text/javascript">
	$(function(){
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
		$("#buttonOne").click(function(){
			$.ajax({
				type:"post",
				async:false,
				url : '/noob/business/updateTakeStatusByBusinessRecsiptNoU.action',
				success:function(result){
					if(result == "success"){
						toastr.success("确认成功!");
					}else{
						toastr.error("确认失败!");
					}
				}
			});
		});
		
		$("#buttonTwo").click(function(){
			$.ajax({
				type:"post",
				async:false,
				url : '/noob/business/updateStatusByBusinessRecsiptNoU.action',
				success:function(result){
					if(result == "success"){
						toastr.success("确认成功!");
					}else{
						toastr.error("确认失败!");
					}
				}
			});
		});
	})
</script>
</head>
<body>
	<input type="button" value="已确认" id="buttonOne"/> 
	<input type="button" value="确认收货" id="buttonTwo"/>  
</body>
</html>