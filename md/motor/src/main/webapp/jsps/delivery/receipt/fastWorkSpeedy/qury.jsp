<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/js/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/js/bootstrap-table/bootstrap-table.css">

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/js/sweetalert/sweetalert.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/js/toastr/toastr.css">

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/js/toastr/toastr.min.css">

<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/bootstrap-table/bootstrap-table.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/sweetalert/sweetalert.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/toastr/toastr.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/jsps/delivery/receipt/fastWorkSpeedy/js/free.js"></script>

<script type="text/javascript"
	src="${pageContext.request.contextPath }/jsps/delivery/receipt/fastWorkSpeedy/js/html5shiv.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/jsps/delivery/receipt/fastWorkSpeedy/js/respond.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>
<%-- <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/select2/select2.css"/>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/select2/select2.full.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/select2/select2.min.js"></script> --%>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/bootstrap-select/css/bootstrap-select.min.css"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap-select/js/bootstrap-select.min.js"></script>


<script type="text/javascript">
var dblclick = null;
    $(function() {  
    
        $.fn.handleTable = function (options) {  
        	
            //1.Settings 初始化设置  
            var c = $.extend({  
                "operatePos" : -1, //-1表示默认操作列为最后一列  
                "handleFirst" : false, //第一行是否作为操作的对象  
                "edit" : "编辑",  
                "save" : "保存",  
                "cancel" : "取消",  
                "add" : "添加",  
                "confirm" : "确认",  
                "del" : "删除",  
                "editableCols" : "0", //可编辑的列，从0开始  
                //"pos" : 0, //位置位于该列开头，还是结尾（左侧或右侧）  
                "order" : ["add",'edit',"del"], //指定三个功能的顺序  
                "saveCallback" : function(data, isSuccess) { //这里可以写ajax内容，用于保存编辑后的内容  
                    //data: 返回的数据  
                    //isSuccess: 方法，用于保存数据成功后，将可编辑状态变为不可编辑状态  
                    //ajax请求成功（保存数据成功），才回调isSuccess函数（修改保存状态为编辑状态）  
                },  
                "addCallback" : function(data, isSuccess) {  
                    //isSuccess: 方法，用于添加数据成功后，将可编辑状态变为不可编辑状态  
                },  
                "delCallback" : function(isSuccess) {  
                    //isSuccess: 方法，用于删除数据成功后，将对应行删除  
                }  
            }, options);  
      
            //表格的列数  
            var colsNum = $($(this).find('tr').last().children()).length; 
            //2.初始化操作列，默认为最后一列，从1算起  
            if(c.operatePos == -1) {  
                c.operatePos = colsNum - 1;  
            }  
      
            //3.获取所有需要被操作的行  
            var rows = $(this).find('tr');  
            if(!c.handleFirst) {  
                rows = rows.not(":eq(0)");  
            }  
      
            //4.获取放置“操作”的列，通过operatePos获取  
            var rowsTd = [];  
            var allTd = $(rows.children());  
            for(var i = c.operatePos; i <= allTd.length; i += colsNum) {  
                if(c.handleFirst) { //如果操作第一行，就把放置操作的列内容置为空  
                    allTd.eq(i).html("");  
                }  
                rowsTd.push(allTd.eq(i)[0]);  
            }  
      
            //6.修改设置 order 为空时的默认值  
            if(c.order.length == 0) {  
                c.order = ["edit"];  
            }  
      
            //7.保存可编辑的列  
            var cols = getEditableCols();  
      
            //8.初始化链接的构建  
            var saveLink = "", cancelLink = "", editLink = "", addLink = "", confirmLink = "", delLink = "";  
            initLink();  
      
            //9.初始化操作  
            initFunc(c.order, rowsTd); 
            var productData = null;
            var requireData = null;
            $.ajax({
        		url:"../../../../findAllProduct.action",
        		type:"get",
        		dataType:"json",
        		async:false,
        		success:function(data){
        			productData = data;
        		
        		},
        		error:function(data){
        			alert("没有数据"+data);
        		}
        	
        	});
        	$.ajax({
        		url:"../../../../findAllMannedRequire.action",
        		type:"get",
        		dataType:"json",
        		async:false,
        		success:function(data){
        			requireData = data;
        		},
        		error:function(data){
        			alert("没有数据"+data);
        		}
        	
        	});
        	var productHTML = "";
            var requideHTML = "";
            $.each(productData,function(k){
    			productHTML =  productHTML+"<option value=" + productData[k].subsetName + ">" + productData[k].subsetName + "</option>";
			}); 
            $.each(requireData,function(k){
    			requideHTML = requideHTML+"<option value=" + requireData[k].subsetName + ">" + requireData[k].subsetName + "</option>";
			});
           
          
        	for(var j=0;j<1;j++){
        		
    			
                //获取被点击“添加”的当前行 tr jQuery对象  
                var p = $("#head_tr");  
                var copyRow = p.clone(); //构建新的一行  
                var input = "<input type=\"text\"/>";  
                var childLen = p.children().length;  
                 
                for(var i = 0; i < childLen; i++) {  
                	if(i==2){           		
                		copyRow.children().eq(i).html("<select  class=\"selectpicker form-control\">"+productHTML+"</select>");  
                	}else if(i==5){                		
                		copyRow.children().eq(i).html("<select  class=\"selectpicker form-control\">"+requideHTML+"</select>");  
                	 }else if(i==3){
                	 	 copyRow.children().eq(i).html("<input  type=\"number\"id=\"nums\"min=\"1\" max=\"10\"/>");                	 
                	 }else if(i==0){
                		 copyRow.children().eq(i).html("<input type=\"text\" class=\"form-control\" onclick='dblclick(this)'/>");
                	 
                	 }else{
                    	copyRow.children().eq(i).html("<input type=\"text\" class=\"form-control\"/>");  
                	}
                	}  
               
                //最后一行是操作行  
                var last = copyRow.children().eq(c.operatePos);  
                last.html("");  
                p.after(copyRow); 
                
    			$('select').selectpicker('refresh');
    			$("#ss").attr("disabled","disabled")
                var confirm = $(confirmLink).appendTo(last).on("click", function() {
                	
                    var data = [];  
                    
                    for(var i = 0; i < childLen; i++){  
                        if(i != c.operatePos) {  
                        	
                            var v = copyRow.children().eq(i).children("input").val();
                            var sv = copyRow.children().eq(i).children("select").val();
                            if(v==''){
                            	
                            	/* toastr
    							.error('不能为空!') */;
                            	
                            	break;
                            	
                            }
                            
                            if(i==2||i==5){
                            	data.push(sv);  
                                copyRow.children().eq(i).html(sv);
                            }else{
                            	data.push(v);  
                                
                                copyRow.children().eq(i).html(v);
                            }
                              
                          
                    }  
                    }
                                           c.addCallback(data, function() {  
                        last.html("");  
                        //------------这里可以进行修改  
                        initFunc(c.order, last);  
                        
                    }); 
                	
                }); 
               
                $(confirm).after(cancelLink); //添加相应的取消保存的“取消链接”   
                $(confirm).next().on('click', function() {  
                    copyRow.remove();  
                }); 
        	}
        	
      
            /** 
             * 创建操作链接 
             */  
             function createLink(str) {  
                return "<a href=\"javascript:void(0)\" style=\"margin:0 3px\">" + str + "</a>";  
            }  
            /** 
             * 初始各种操作的链接 
             */  
            function initLink() {  
                for(var i = 0; i < c.order.length; i++) {  
                    switch (c.order[i]) {  
                        case "edit":  
                            //“编辑”链接
                     
                            editLink = createLink(c.edit);  
                            saveLink = createLink(c.save);  
                            cancelLink = createLink(c.cancel);  
                            break;  
                        case "add":  
                            //“添加”链接  
                            addLink = createLink(c.add);  
                            //“确认”链接  
                            confirmLink = createLink(c.confirm);  
                            //“取消”链接  
                            cancelLink = createLink(c.cancel);
                            //修改
                            editLink = createLink(c.edit); 
                            break;  
                        case "del":  
                            //“删除”链接  
                            delLink = createLink(c.del);  
                            break;  
                    }  
                }  
            }  
      
            /** 
             * 获取可进行编辑操作的列 
             */  
            function getEditableCols() {  
                var cols = c.editableCols;  
                if($.type(c.editableCols) != "array" && cols == "all") { //如果是所有列都可以编辑的话  
                    cols = [];  
                    for(var i = 0; i < colsNum; i++) {  
                        if(i != c.operatePos) { //排除放置操作的列  
                            cols.push(i);  
                        }  
                    }  
                } else if($.type(c.editableCols) == "array") { //有指定选择编辑的列的话需要排序放置“编辑”功能的列  
                    var copyCols = [];  
                    for(var i = 0; i < cols.length; i++) {  
                        if(cols[i] != c.operatePos) {  
                            copyCols.push(cols[i]);  
                        }  
                    }  
                    cols = copyCols;  
                }  
                return cols;  
            }  
      
            /** 
             * 根据c.order参数设置提供的操作 
             * @param func 需要设置的操作 
             * @param cols 放置操作的列 
             */  
            function initFunc(func, cols) {  
                for(var i = 0; i < func.length; i++) {  
                    var o = func[i];  
                    switch(o) {  
                     case "edit":  
                        createEdit(cols);  
                        break;   
                        case "add":  
                            createAdd(cols);  
                            break;  
                        case "del":  
                            createDel(cols);  
                            break;  
                    }  
                }  
            }  
      
            /** 
             * 创建“编辑一行”的功能 
             * @param operateCol 放置编辑操作的列 
             */  
            function createEdit(operateCol) {  
                $(editLink).appendTo(operateCol).on("click", function() {  
                	
                    if(replaceQuote($(this).html()) == replaceQuote(c.edit)) { //如果此时是编辑状态  
                        toSave(this); //将编辑状态变为保存状态  
                    } else if(replaceQuote($(this).html()) == replaceQuote(c.save)) { //如果此时是保存状态  

						var flag = true;
                    	var p = $(this).parents('tr'); //获取被点击的当前行  
                        var data  = []; //保存修改后的数据到数据内
                        
                        for(var i = 0; i < cols.length; i++) {  
                            var tr = p.children().eq(cols[i]);  
                            var inputValue = tr.children('input').val();  
                            var selectValue = tr.children('select').val();  
                            if(inputValue==''){
                            	flag = false;
                            	break;
                            }
                            if(inputValue<=0||inputValue>=999){
                            	flag = false;
                            	break;
                            }
                            data.push(inputValue);  
                            data.push(selectValue); 
                        }  
						if(flag){
							$this = this; //此时的this表示的是 被点击的 编辑链接  
	                        c.saveCallback(data, function() {  
	                            toEdit($this, true);  
	                        });
                        }else{
                        	alert("输入不能为空");
                        }
                          
                    }  
                });  
                var afterSave = []; //保存修改前的信息，用于用户点击取消后的数值返回操作  
                //修改为“保存”状态  
                function toSave(ele) {  
                    $(ele).html(c.save); //修改为“保存”  
                    $(ele).after(cancelLink); //添加相应的取消保存的“取消链接”  
                    $(ele).next().on('click', function() {  
                        if($(this).html() == c.cancel.replace(eval("/\'/gi"),"\"")) {  
                        toEdit(ele, false);  
                        }  
                    });  
      
                    //获取被点击编辑的当前行 tr jQuery对象  
                    var p = $(ele).parents('tr');  
      
                    afterSave = []; //清空原来保存的数据  
                    var editTr = "";
                    var tr;
                    for(var i = 0; i < cols.length; i++) {                       
                    	if(i==3){
                    		tr = p.children().eq(cols[i]);
                    		editTr = "<input  type=\"number\"id=\"nums\" value=\"" + tr.html() + "\" />";
                    		afterSave.push(tr.html()); //保存未修改前的数据  
                            tr.html(editTr);
                    	}else if(i==2){
                    		tr = p.children().eq(cols[i]);
                    		editTr = "<select  class=\"selectpicker form-control\">"+productHTML+"</select>";
                    		afterSave.push(tr.html()); //保存未修改前的数据  
                            tr.html(editTr);
                        }else if(i==5){
                        	tr = p.children().eq(cols[i]);
                    		editTr = "<select  class=\"selectpicker form-control\">"+requideHTML+"</select>";
                    		afterSave.push(tr.html()); //保存未修改前的数据  
                            tr.html(editTr);
                        }else{
                        	tr = p.children().eq(cols[i]); 
                        	editTr = "<input type=\"text\" class=\"form-control\" value=\"" + tr.html() + "\"/>"; 
                        	afterSave.push(tr.html()); //保存未修改前的数据  
                            tr.html(editTr);
                        }
                    } 
                    $('select').selectpicker('refresh');
                    $('select').selectpicker('refresh');
                }  
                //修改为“编辑”状态（此时，需要通过isSave标志判断是  
                // 因为点击了“保存”（保存成功）变为“编辑”状态的，还是因为点击了“取消”变为“编辑”状态的）  
              
                function toEdit(ele, isSave) {  
                    $(ele).html(c.edit);  
                    if(replaceQuote($(ele).next().html()) == replaceQuote(c.cancel)) {  
                        $(ele).next().remove();  
                    }  
      
                    var p = $(ele).parents('tr');  
      
                    for(var i = 0; i < cols.length; i++) {  
                        var tr = p.children().eq(cols[i]);  
                        var value; 
                        var values;
                        if(isSave) {  
                            value = tr.children('input').val(); 
                            values = tr.children('select').val(); 

                        } else {  
                            value = afterSave[i];  
                            values = afterSave[i];  
                        }  
      
                        tr.html(value);  
                        tr.html(values); 
                    }  
                }
            	
            }  
      
            /** 
             * 创建“添加一行”的功能 
             * @param operateCol 
             */  
            function createAdd(operateCol) {  
            	
                $(addLink).appendTo(operateCol).on("click", function() {  
                	
                	
        			
                	
                	//获取被点击“添加”的当前行 tr jQuery对象  
                    var p = $("#head_tr");  
                    var copyRow = p.clone(); //构建新的一行  
                    
                    var input = "<input type=\"text\"/>";  
                    var childLen = p.children().length;  
                     
                    for(var i = 0; i < childLen; i++) {  
                    	if(i==2){           		
                    		copyRow.children().eq(i).html("<select  class=\"selectpicker form-control\">"+productHTML+"</select>");  
                    	}else if(i==5){                		
                    		copyRow.children().eq(i).html("<select  class=\"selectpicker form-control\">"+requideHTML+"</select>");  
                    	 }else if(i==3){
                    	 	 copyRow.children().eq(i).html("<input  type=\"number\"id=\"nums\"min=\"1\" max=\"10\"/>");                	 
                    	 }else if(i==0){
                    		 copyRow.children().eq(i).html("<input type=\"text\" class=\"form-control\" onclick='dblclick(this)'/>");
                    	 }else{
                        copyRow.children().eq(i).html("<input type=\"text\" class=\"form-control\"/>");  
                    	}
                    	}  
                   
                    //最后一行是操作行  
                    var last = copyRow.children().eq(c.operatePos);  
                    last.html("");  
                    p.after(copyRow); 
                    
        			$('select').selectpicker('refresh');
                    var confirm = $(confirmLink).appendTo(last).on("click", function() {
                    	
                        var data = [];  
                       
                        for(var i = 0; i < childLen; i++){  
                            if(i != c.operatePos) {  
                            	
                                var v = copyRow.children().eq(i).children("input").val();
                                var sv = copyRow.children().eq(i).children("select").val();
                                if(v==''){
                                	
                                	/* toastr
        							.error('不能为空!'); */
                                	break;
                                	
                                }
                          
                                	
                                if(i==2||i==5){
                                	data.push(sv);  
                                    copyRow.children().eq(i).html(sv);
                                }else{
                                	data.push(v);  
                                    
                                    copyRow.children().eq(i).html(v);
                                }
                                  
                              
                        }  
                        }
                                               c.addCallback(data, function() {  
                            last.html("");  
                            //------------这里可以进行修改  
                            initFunc(c.order, last);  
                            
                        }); 
                    	
                    }); 
                   
                    $(confirm).after(cancelLink); //添加相应的取消保存的“取消链接”   
                    $(confirm).next().on('click', function() {  
                        copyRow.remove();  
                    }); 
                	
                }); 
                
            }  
      
            /** 
             * 创建“删除一行”的功能 
             * @param operateCol 
             */  
            function createDel(operateCol) {  
                $(delLink).appendTo(operateCol).on("click", function() {  
                    var _this = this;  
                    c.delCallback(function() {  
                        $(_this).parents('tr').remove();  
                    });  
                }); 
            }  
      
            /** 
             * 将str中的单引号转为双引号 
             * @param str 
             */  
            function replaceQuote(str) {  
                return str.replace(/\'/g, "\"");  
            }  
        };  
    });  
    
    
    
    
    $(function() {  
    	
        //$('.edit').handleTable({"cancel" : "<span class='glyphicon glyphicon-remove'></span>"});  
        $('.editable').handleTable({  
            "handleFirst" : true,  
            "cancel" : " <span class='glyphicon glyphicon-remove'></span> ",  
            "edit" : " <span class='glyphicon glyphicon-edit'></span> ",  
            "add" : " <span class='glyphicon glyphicon-plus'></span> ",  
            "save" : " <span class='glyphicon glyphicon-saved'></span> ",  
            "confirm" : " <span class='glyphicon glyphicon-ok'></span> ",  
            "operatePos" : -1,  
            "editableCols" : [0,1,2,3,4,5],  
            "order": ["add","edit"],  
            "saveCallback" : function(data, isSuccess) { //这里可以写ajax内容，用于保存编辑后的内容  
                //data: 返回的数据  
                //isSucess: 方法，用于保存数据成功后，将可编辑状态变为不可编辑状态  
                var flag = true; //ajax请求成功（保存数据成功），才回调isSuccess函数（修改保存状态为编辑状态）  
                
                if(flag) {  
                	isSuccess();
                	toastr.success("保存成功"); 
                
                } else {  
                	toastr.error("添加失败"); 
                }   
              
               
                return true;  
            },  
            "addCallback" : function(data,isSuccess) {  
            	var flag = true; 
                
               
                var jobListNo=data[0];
                var product=data[2]
                var whither=data[1];
                var mannedRequire=data[5]
                var factWeigh=data[4];
                var factQuantity=data[3];
                  
                if(jobListNo==''||jobListNo==null){
                	 toastr
						.error('工作单号不可以为空!');
             
                 }else if(whither==''||whither==null){
                	 toastr
						.error('到达地不能为空!');
                 }else if(factWeigh==''||factWeigh==null){
                	 toastr
						.error('重量不能为空!');
                 }else if(factQuantity==''||factQuantity==null){
                	 toastr
						.error('件数不能为空!');
                 }else if(factWeigh<=0||factWeigh>=999){
                	 toastr
						.error('请输入正确的重量');

                 }else if(factQuantity<=0||factQuantity>=999){
                	 toastr
						.error('请输入正确的件数!'); 
                	
                 }else{
                	 
                 	
                 	
                	 isSuccess();
                	$("#ss").attr("disabled",false)
            
                 }  
                 
            },  
            "delCallback" : function(isSuccess) {  
                var flag = true;  
                if(flag) {  
                    isSuccess();  
                    alert("删除成功");  
                } else {  
                    alert("删除失败");  
                }  
            }  
        });
        function del(jobListNo){
        	$("#table").find('tr').each(function(){
     		   var wno = $(this).find('th').eq(0).text();
     		   if(wno==jobListNo){
     			   $(this).remove();
     		   }
     		     
 				    
     	   });
        }
    	//批量保存
       function add(){
    	   var array=[];
    	   $("#table").find('tr').each(function(){
    		   var tr = [];  
    		   $(this).find('th').each(function(){
    		      		   //alert($(this).html())
    		  		tr.push($(this).html());
    		    	 
    		     });
    		   array.push(tr);
    		     
				    
    	   });
    	   
    	   var names=['jobListNo','whither','product','factQuantity','factWeight','mannedRequire']
    	   
    	   var filter=[];
    	   
    	   for(var i=1;i<array.length;i++){
    		   var obj = {};
    		   for(var j=0;j<array[i].length-1;j++){
    			   obj[names[j]]=array[i][j];
    		   }
    		   filter.push(obj);
    	   }
    	 
    	    $.ajax({
				url:"../../../../addWorkSheet.action",
				type:"get",
				data:{
					basicJobList:JSON.stringify(filter)
				},
				async:false,
				success:function(result){
					var errors = result.errors.length;
					var renos = result.renos.length;
					if(errors+renos==0){
						toastr.success("添加成功");
						$("#table").find('tr:not(:eq(0))').each(function(){
				 			$(this).remove();		    
				     	});
					}else{
						$("#table").find('tr:not(:eq(0))').each(function(){
							var wno = $(this).find('th').eq(0).text();
							if(result.errors.indexOf(wno)!=-1){
								$(this).css('background','red');
								toastr.error("添加失败,");
							}else if(result.renos.indexOf(wno)!=-1){
								$(this).css('background','yellow');
								toastr.error("已有此条工作单");
							}else{
								$(this).remove();
							}
							
				     	});
					}
					
					
					
					
				}
			}); 
    	  
		}
       //获取工作单号
       dblclick = function(obj){
       	$.ajax({
	        	url:"../../../../getJobListNoNum..action",
	        	type:"post",
	        	success:function(data){
	        	
	        		$(obj).val(data)
	        	}
       	
       	});

   	};
       //点击按钮
        $("#ss").on("click",function(){
             add();
             
        	})
        	//按快捷键保存数据
       	 $(window).keypress(function(event){
       		 if (event.ctrlKey && event.which == 115){
       			 event.preventDefault();
       			 add();
       			 return false;
       		 }else{
       			 return true;
       		 }
       	});  
    }); 
    
</script> 
<style type="text/css">
th{
 width:150px;
 text-align:center;
}
  #nums{
  padding:5px;
   width:120px;
  }
</style> 
</head>
<body>
	<div class="container">  
        <div class="bs-example" data-example-id="hoverable-table">  
         <button class="btn btn-primary col-sm-1" type="button"  id="ss" style="float:left">保存</button>
            <table class="table table-hover editable" id="table"> 
           
                <thead>  
                <tr id="head_tr">  
                   
                    <th>工作单号</th>  
                    <th>到达地</th>  
                    <th>产品</th>  
                    <th>件数</th>  
                    <th>重量</th>  
                    <th>配载要求</th>  
                    <th></th>
                </tr> 
                 
                </thead>  
                <tbody id="tbody">  
                </tbody>  
            </table>  
        </div>  
       <div class="exp-stan">
       <h3 style="color:red">快速录入操作说明:</h3> 
        <p>快速录入工作单是能够快速批量生成保存基本的工作单</p>
         <h3>具体操作:</h3>
        <p>工作单号:鼠标单击自动生成工作单号</p>
        <p>到达地:输入商品要到达的城市</p>
        <p>产品:鼠标单击选择产品的类型</p>
        <p>重量:输入商品的实际重量</p>
        <p>件数:输入这件商品的实际件数</p>
        <p>配载要求:鼠标单击选择你是否在物流的运输方式有些什么要求</p>
         
    </div>
    </div>  
</body>
</html>