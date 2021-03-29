<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script>
			
			function checkPwd(){
				var pwd1 = $("#pwd1").val();
				var pwd2 = $("#pwd2").val();
				if(pwd1 != pwd2){
					$("#checkMsg").html("비밀번호가 일치하지 않습니다.");
				}else{
					$("#checkMsg").html("비밀번호 일치")
				}
			}
			
			 $("#find_zipcode").click(function(){
		         new daum.Postcode({
		            oncomplete:function(data) {
		               jQuery("#u_zipcode").val(data.zonecode);
		               jQuery("#u_address").val(data.address);
		               jQuery("#u_detail_address").focus();
		            }
		         }).open();
		      });
 			
		            //회원가입 막아주기
		            $("#joinSubmit").on('click',function(){
		            	//비밀번호 없으면
		               if($("#pwd1").val() == ""){
		                  alert("비밀번호를 입력해 주세요");
		                  $("#pwd1").focus();
		                  return false;
		               }
		            	//비밀번호 질문
		               if($("#u_pwd_q").val() == ""){
		                  alert("비밀번호 질문을 입력해주세요");
		                  $("#u_pwd_q").focus();
		                  return false;
		               }
		            	//비밀번호 질문 답변
		               if($("#u_pwd_a").val() == ""){
		                  alert("비밀번호질문 답변을 입력해주세요");
		                  $("#u_pwd_a").focus();
		                  return false;
		               }
		            	//이름이 없으면
		               if($("#u_last_name").val() == ""){
		                  alert("성을 입력해 주세요");
		                  $("#u_last_name").focus();
		                  return false;
		               }
		               if($("#u_first_name").val() == ""){
		                  alert("이름을 입력해 주세요");
		                  $("#u_first_name").focus();
		                  return false;
		               }
		               //성별이 없으면
		               if($("#u_gender").val() == ""){
		                  alert("성별을 입력해 주세요");
		                  $("#u_gender").focus();
		                  return false;
		               }
		            
		            //이메일 없으면
		               if($("#u_email").val() == ""){
		                  alert("이메일를 입력해 주세요");
		                  $("u_email").focus();
		                  return false;
		               }
		               
		            //핸드폰 번호 없으면
		               if($("#u_phone").val() == ""){
		                  alert("핸드폰 번호를 입력해 주세요");
		                  $("u_phone").focus();
		                  return false;
		               }
		               
		            //주소 하나라도 없으면
		               if($("#u_zipcode").val() == "" || $("#u_address").val() == "" || $("#u_address_detail").val() == ""){
		                  alert("주소를 입력해 주세요");
		                  $("u_zipcode").focus();
		                  return false;
		               }
		               if(!$("#agree").prop("checked")){
							alert("이용사항 동의부탁드립니다");
							$("#agree").focus();
							return false;
						}

		            //다 만족하면 true, 결과 페이지 이동
		               return true;
		            });
		          
		</script>