$(function() {  
        $.fn.handleTable = function (options) {  
            //1.Settings 初始化设置  
            var c = $.extend({  
                "operatePos" :-1, //-1表示默认操作列为最后一列  
                "handleFirst" : false, //第一行是否作为操作的对象  
                "edit" : "编辑",  
                "save" : "保存",  
                "cancel" : "取消",  
                "add" : "添加",  
                "confirm" : "确认",  
                "del" : "删除",  
                "editableCols" : "all", //可编辑的列，从0开始  
                //"pos" : 1, //位置位于该列开头，还是结尾（左侧或右侧）  
                "order" : ["edit", "add", "del"], //指定三个功能的顺序  
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
                       /* case "edit":  
                            //“编辑”链接  
                            editLink = createLink(c.edit);  
                            saveLink = createLink(c.save);  
                            cancelLink = createLink(c.cancel);  
                            break;*/  
                        case "add":  
                            //“添加”链接  
                            addLink = createLink(c.add);  
                            //“确认”链接  
                            confirmLink = createLink(c.confirm);  
                            //“取消”链接  
                            cancelLink = createLink(c.cancel);  
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
                        var p = $(this).parents('tr'); //获取被点击的当前行  
                        var data  = []; //保存修改后的数据到数据内  
                        for(var i = 0; i < cols.length; i++) {  
                            var tr = p.children().eq(cols[i]);  
                            var inputValue = tr.children('input').val();  
                            data.push(inputValue);  
                        }  
      
                        $this = this; //此时的this表示的是 被点击的 编辑链接  
                        c.saveCallback(data, function() {  
                            toEdit($this, true);  
                        });  
                    }  
                });  
                var afterSave = []; //保存修改前的信息，用于用户点击取消后的数值返回操作  
                //修改为“保存”状态  
                function toSave(ele) {  
                    $(ele).html(c.save); //修改为“保存”  
                    $(ele).after(cancelLink); //添加相应的取消保存的“取消链接”  
                    $(ele).next().on('click', function() {  
                        //if($(this).html() == c.cancel.replace(eval("/\'/gi"),"\"")) {  
                        toEdit(ele, false);  
                        //}  
                    });  
      
                    //获取被点击编辑的当前行 tr jQuery对象  
                    var p = $(ele).parents('tr');  
      
                    afterSave = []; //清空原来保存的数据  
                    for(var i = 0; i < cols.length; i++) {  
                        var tr = p.children().eq(cols[i]);  
                        var editTr = "<input type=\"text\" class=\"form-control\" value=\"" + tr.html() + "\"/>";  
                        afterSave.push(tr.html()); //保存未修改前的数据  
                        tr.html(editTr);  
                    }  
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
                        if(isSave) {  
                            value = tr.children('input').val();  
                        } else {  
                            value = afterSave[i];  
                        }  
      
                        tr.html(value);  
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
                	if($("#display_JLNo").val()!=null){
                		var p = $(this).parents('tr');  
                        var copyRow = p.clone(); //构建新的一行  
                        var input = "<input type=\"number\"/>";  
                        var childLen = p.children().length;  
                        for(var i = 0; i < childLen; i++) {
                        	if(i==1){
                        		copyRow.children().eq(i).html("<input type=\"text\" readonly=\"readonly\"value=\""+$('#display_JLNo').val()+"\"class=\"form-control\"/>");                       		
                        	}else if(i==4){
                        		copyRow.children().eq(i).html("<input type=\"text\" readonly=\"readonly\"value=\""+$('#userName').val()+"\"class=\"form-control\"/>"); 
                        	}else if(i==0){
                        		copyRow.children().eq(i).html("<input type=\"text\" readonly=\"readonly\"value=\""+$('#display_JLNo').val()+"\"class=\"form-control\" />"); 
                        	}else{
                        		copyRow.children().eq(i).html("<input type=\"text\" class=\"form-control\"/>"); 
                        	}
                        }  
          
                        //最后一行是操作行  
                        var last = copyRow.children().eq(c.operatePos);  
                        last.html("");  
                        p.after(copyRow);  
          
                        var confirm = $(confirmLink).appendTo(last).on("click", function() {  
                            var data = [];  
                            for(var i = 0; i < childLen; i++) {  
                                if(i != c.operatePos) {  
                                    var v = copyRow.children().eq(i).children("input").val();  
                                    data.push(v);  
                                    copyRow.children().eq(i).html(v);  
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
                	}else{
                		toastr.warning('请选择单号');
                	}
                    
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
    
	//四舍五入保留2位小数（不够位数，则用0替补）
	function keepTwoDecimalFull(num) {
	  var result = parseFloat(num);
	  if (isNaN(result)) {
	    alert('传递参数错误，请检查！');
	    return false;
	  }
	  result = Math.round(num * 100) / 100;
	  var s_x = result.toString();
	  var pos_decimal = s_x.indexOf('.');
	  if (pos_decimal < 0) {
	    pos_decimal = s_x.length;
	    s_x += '.';
	  }
	  while (s_x.length <= pos_decimal + 2) {
	    s_x += '0';
	  }
	  return s_x;
	}
    
    
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
            "editableCols" : [2,3,4],  
            "order": ["add","edit"],  
            "saveCallback" : function(data, isSuccess) { //这里可以写ajax内容，用于保存编辑后的内容  
                //data: 返回的数据  
                //isSucess: 方法，用于保存数据成功后，将可编辑状态变为不可编辑状态  
                var flag = true; //ajax请求成功（保存数据成功），才回调isSuccess函数（修改保存状态为编辑状态）  
                if(flag) {  
                    isSuccess();  
                    alert(data + " 保存成功");  
                } else {  
                    alert(data + " 保存失败");  
                }  

                return true;  
            },  
            "addCallback" : function(data,isSuccess) {
            	var flag = true;
            	var nucleatedParts = $("#nucleatedParts").val(data[3]);
               	var nucleatedHeavy = $("#nucleatedHeavy").val(data[2]);
               	var Gewichtsdifferenz = $("#Gewichtsdifferenz").val(keepTwoDecimalFull(parseFloat(data[2],2) - parseFloat($("#display_FW").val(),2)));
               	var jobListId = $("#jobListId").val();
               	var orgName = $("#orgName").val();
               	var userId = $("#userId").val();
               	var stripeCode = data[0];
               	var packagesNum = data[3];
               	var thisWeight = data[2];
               	var jobListNo = data[1];
               	if(thisWeight==""||thisWeight==null){
                	toastr.error('核重重量不能为空');
               	}else if(packagesNum==""||packagesNum==null){
               		toastr.error('核重件数不能为空');
               	}else{
               		$.ajax({
                   		url:"/noob/pack/addPackU.action",
                   		type:"POST",
                   		async:false,
                   		data:{"nucleatedParts":nucleatedParts.val(),
                   			"nucleatedHeavy":nucleatedHeavy.val(),
                   			"gewichtsdifferenz":Gewichtsdifferenz.val(),
                   			"jobListId":jobListId,
                   			"operatingPer":userId,
                   			"nuclearWeightUnit":orgName,
                   			"stripeCode":stripeCode,
                   			"packagesNum":packagesNum,
                   			"thisWeight":thisWeight,
                   			"jobListNo":jobListNo
                   		},
                   		success:function(response){
                   			if("true"==response){
                   				isSuccess();
       							toastr.success('核重成功');
       						}else{
       							toastr.error('核重失败');
       						}
                   		}
                   	});
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
    }); 