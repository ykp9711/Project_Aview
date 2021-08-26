<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script>
//이메일 select
$('#select_email').change(function(){
	//직접입력일 경우
	$("#select_email option:selected").each(function(){if($(this).val()== '0'){
		//값 초기화
		$("#selected_email").val('@');  
		//활성화
		$("#selected_email").attr("disabled",false);
		//직접입력이 아닐경우
		}else{  
		//선택값 입력
		$("#selected_email").val($(this).val());  
		//비활성화였는데 db 안넘어가서 true를 false로
		$("#selected_email").attr("disabled",false);  
		} 
	}); 	
});


$("#find_zipcode").click(function(){
	new daum.Postcode({
		oncomplete:function(data) {
			jQuery("#a_zipcode").val(data.zonecode);
			jQuery("#a_address").val(data.address);
			jQuery("#a_address_detail").focus();
		}
	}).open();
});



//아이콘 클릭
	//플라스틱
	$("#plastic").click(function(){
		var pla = $("#a_plastic").val();
		$("#a_plastic").val(pla*1 + 1);
	});
	
	//비닐
	$("#vinyl").click(function() {
		var vi = $("#a_vinyl").val();
		$("#a_vinyl").val(vi*1 + 1);
	});
	
	//캔
	$("#can").click(function() {
		var can = $("#a_can").val();
		$("#a_can").val(can*1 + 1);
	});
	
	//유리
	$("#glass").click(function() {
		var gl = $("#a_glass").val();
		$("#a_glass").val(gl*1 + 1);
	});
	
	
	//종이
	$("#paper").click(function() {
		var pa = $("#a_paper").val();
		$("#a_paper").val(pa*1 + 1);
	});

//예상 포인트 합계
$(function(){
	//아이콘 클릭하면
	$('img.icon').on('click',function(){
			  //아이콘 개수만큼
	          var cnt = $("img.icon").length;     
	          /* console.log(cnt); */
			  
	          //반복
			  for(var i=1; i<cnt; i++){
				 // * 뒤에 숫자가 재활용품별 포인트
				 var point_pla = parseInt($("#a_plastic").val()) * 300;
				 var point_vi = parseInt($("#a_vinyl").val()) * 200;
				 var point_can = parseInt($("#a_can").val()) * 100;
				 var point_gl = parseInt($("#a_glass").val()) * 50;
				 var point_pa = parseInt($("#a_paper").val()) * 50;
				 
				 // 포인트 합계
				 var point_sum = point_pla + point_vi + point_can + point_gl + point_pa;
				 /* console.log(point_sum); */
				 
			     $("#a_point").val(point_sum)
			  			}
	        });
	});

//요청사항 직접입력 초기 안보임
$("#Requests_m").hide();
$('#a_request').change(function(){
	//직접입력
	$("#a_request option:selected").each(function(){if($(this).val()== ''){ 
		//보임
		$("#Requests_m").show();
		 var text = $("#Requests_m").val();
		$("#a_request").val('직접입력') == text; 
		}else{ 
		//안보임
		$("#Requests_m").hide();  
		} 
	});
});

$(document).ready(function(){
		var a_wdate = "${applyBean.getA_wdate()}";
		var a_wtime = "${applyBean.getA_wtime()}";
		var a_input_wdate = a_wdate.substring(0,10);
		$("#a_wdate").val(a_input_wdate);
		$("#a_wtime").val(a_wtime);
		var a_request = "${applyBean.getA_request()}";
	switch(a_request){
	case ("조심히 안전하게 와주세요 :)"):
		$("#a_request").val("조심히 안전하게 와주세요 :)");
		break;
	case ("벨 누르지 말고 노크해주세요"):
		$("#a_request").val("벨 누르지 말고 노크해주세요");
		break;
	case ("도착하기 전에 전화해주세요"):
		$("#a_request").val("도착하기 전에 전화해주세요");
		break;
	case ("요청사항 없음"):
		$("#a_request").val("요청사항 없음");
		break;
	default :
		$("#a_request").val("");
		$("#Requests_m").val(a_request);
	}
});
		
$("#button_recycle").on('click',function(){
	$("#a_plastic").val(0);
	$("#a_vinyl").val(0);
	$("#a_can").val(0);
	$("#a_glass").val(0);
	$("#a_paper").val(0);
	$("#a_point").val(0);
});


//서브밋 클릭
$(function(){
		//이름 없으면
		$("#submit").on('click',function(){
			if($("#a_name").val() == ""){
				alert("이름을 입력해 주세요");
				$("#a_name").focus();
				return false;
			}
		
		//이메일 아이디 없으면
			/* if($("#a_email").val() == ""){
				alert("이메일 아이디를 입력해 주세요");
				$("u_email").focus();
				return false;
			} */
		
		//이메일 뒷자리 없으면
			if($("#selected_email").val() == ""){
				alert("이메일 주소를 직접 입력 또는 선택해 주세요");
				$("selected_email").focus();
				return false;
			}
			
		//핸드폰 번호 없으면
			if($("#a_phone").val() == ""){
				alert("핸드폰 번호를 입력해 주세요");
				$("u_phone").focus();
				return false;
			}
			
		//주소 하나라도 없으면
			if($("#a_zipcode").val() == "" || $("#a_address").val() == "" || $("#a_address_detail").val() == ""){
				alert("주소를 입력해 주세요");
				$("u_zipcode").focus();
				return false;
			}
		
		//재활용 안골랐으면
			if($("#a_point").val() == 0){
				alert("수거할 재활용품을 골라주세요");
				return false;
			}
			
		//다 만족하면 true, 결과 페이지 이동
			/* $(location).attr("href", "apply_result.jsp"); */
			return true;
		});
	});
	
</script>