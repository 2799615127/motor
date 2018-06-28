$(function() {
	$.ajax({
		url:"../../../../../findAllSubset.action",
		type:"get",
		dataType:"json",
		success:function(data){
			$.each(data,function(i){
				$('#merchandise').append("<option value=" + data[i].subsetName + ">" + data[i].subsetName + "</option>");
			});
		},
		error:function(data){
		}
	});
	
	$("#quey").click(function(){
		
		var province = $('#start_province').val();
		var city = $('#start_city').val();
		var district = $('#start_district').val();
		var end_province = $('#end_province').val();
		var end_city = $('#end_city').val();
		var end_district = $('#end_district').val();
		var weight =$("#scale").val();
		var product =$("#merchandise").val();
		var detailed=$("#detailed").val()
		
		if(province==""||province==null||end_province==""||end_province==null){
			toastr.warning('省不能为空!');
		
		}else if(city==""||city==null|| end_city==""|| end_city==null){
			toastr.warning('市不能为空!');
		}else if(district==""||district==null||end_district==""||end_district==null){
			toastr.warning('区不能为空!');
		}else if(weight==""||weight==null){
			toastr.warning('重量不能为空!');
		}else if(weight<=0||weight>=999){
			toastr.warning('请输入正确的重量!');
		
		}else{
		$.ajax({
			type : "GET",
			url : '../../../../../getFree.action',
			data : {
				startCity:$("#start_province>option:selected").val()+$("#start_city>option:selected").val()+$("#start_district>option:selected").val(),
				endCity:$("#end_province>option:selected").val()+$("#end_city>option:selected").val()+$("end_district>option:selected").val(),
				weight:$("#scale").val(),
				product:$("#merchandise>option:selected").val(),
			},
			success : function(response) {
				$("#pro").text($("#merchandise>option:selected").val());
			    $("#max").text($("#scale").val()+"公斤")
			    $("#free").text(response.myPrice+"元")
				$("#look").css("display","block");
			}
				
		});	
		}
		
	});
	$("#explicit").blur(function(){
		var province = $("#start_province>option:selected").val();
		var city = $("#start_city>option:selected").val();
		var district = $("#start_district>option:selected").val();
		var detailed = $("#explicit").val();
		if(province==''||province==null){
			toastr.warning('输入的原寄地的省不能为空!');
			$("#str").val('');
		}else if(city==''||city==null){
			toastr.warning('输入的原寄地的市不能为空!');
			$("#str").val('');

		}else if(district==''||district==null){
			toastr.warning('输入的原寄地的县不能为空!');
			$("#str").val('');

		}else if(detailed==null||detailed==''){
			toastr.warning('输入的原寄地的详细地址不能为空!');
			$("#str").val('');

		}else{
				var str=province+city+district+detailed;
				$("#str").val(str);
			}
		
	});
	$("#addresses").blur(function(){
		var province = $("#end_province>option:selected").val();
		var city = $("#end_city>option:selected").val();
		var district = $("#end_district>option:selected").val();
		var address = $("#addresses").val();
		if(province==''||province==null){
			toastr.warning('输入的目的地的省不能为空!');
			$("#location").val('');
		}else if(city==''||city==null){
		     toastr.warning('输入的目的地的市不能为空!');
 			$("#location").val('');
		}else if(district==''||district==null){
			toastr.warning('输入的目的地的县|区不能为空!');
			$("#location").val('');
		}else if(address==null||address==''){
			toastr.warning('输入的目的地的详细地址不能为空!');
			$("#location").val('');
		}else{
				var str=province+city+district+address;
				$("#location").val(str);
			}
	});
   $("#btn_freight").click(function(){
	  if($("#product").val()==''||$("#product").val()==null||
		 $("#fetchAddress").val()==''||$("#fetchAddress").val()==null||
		 $("#serveCity").val()==''||$("#serveCity").val()==null||
		 $("#weight").val()==''||$("#weight").val()==null){
		  toastr.warning('产品重量寄件地址和到达地址不能为空!');
	  }else{
		$("#myModalFreight").modal("show");
		$("#wares").val($("#product").val());
		$("#origin").val($("#fetchAddress").val());
		$("#point").val($("#serveCity").val());
		$("#ponderance").val($("#weight").val())
		
	  }
   });

	 $("#okey").click(function(){
		   $.ajax({
				type : "GET",
				url : '../../../../../getFree.action',
				data : {
					startCity:	$("#origin").val(),
					endCity:$("#point").val(),
					weight:$("#ponderance").val(),
					product:$("#wares").val()
				},
				success : function(response) {
					
				    $("#ss").text(response.myPrice+"元")
					
				}
					
			});	
	   });

});

function cleanFree(){
	$("#start_province").children("option").remove();
	$("#start_city").children("option").remove();
	$("#start_district").children("option").remove();
	$("#explicit").val("");
	$("#str").val("");
	$("#end_province").children("option").remove();
	$("#end_city").children("option").remove();
	$("#end_district").children("option").remove();
	$("#addresses").val("");
	$("#location").val("");
	$("#scale").val("");
	$("#look").css("display","none");
};
