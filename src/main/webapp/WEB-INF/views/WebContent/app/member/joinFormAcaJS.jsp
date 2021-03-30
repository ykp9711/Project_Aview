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
                     jQuery("#Azipcode").val(data.zonecode);
                     jQuery("#Aaddress").val(data.address);
                     jQuery("#Aaddressdetail").focus();
                  }
               }).open();
            });
          
                  //회원가입 막아주기
                  $("#joinSubmit").on('click',function(){
                	  //학원이름 없으면
                      if($("#Aname").val() == ""){
                         alert("학원 이름을 입력해주세요");
                         $("#Aname").focus();
                         return false;
                      }
                      //사업자 등록번호
                      if($("#Acorporate").val() == ""){
                         alert("사업자 등록번호를 인증해주세요");
                         $("#Acorporate").focus();
                         return false;
                      }
                	  //아이디 없으면
                      if($("#Aid").val() == ""){
                         alert("아이디를 입력해 주세요");
                         $("#Aid").focus();
                         return false;
                      }
                     //비밀번호 없으면
                     if($("#pwd1").val() == ""){
                        alert("비밀번호를 입력해 주세요");
                        $("#pwd1").focus();
                        return false;
                     }
                     //비밀번호 질문
                     if($("#Apwdq").val() == ""){
                        alert("비밀번호 질문을 입력해주세요");
                        $("#Apwdq").focus();
                        return false;
                     }
                     //비밀번호 질문 답변
                     if($("#Apwda").val() == ""){
                        alert("비밀번호질문 답변을 입력해주세요");
                        $("#Apwda").focus();
                        return false;
                     }
                     //생년월일 없으면
                     if($("#year").val() == ""){
                        alert("년도를 입력하세요");
                        $("#year").focus();
                        return false;
                     }
                     
                     //월 없으면
                     if($("#year").val() == ""){
                           alert("월를 입력하세요");
                           $("#month").focus();
                           return false;
                        }
                     //일 없으면
                     if($("#year").val() == ""){
                           alert("일를 입력하세요");
                           $("#date").focus();
                           return false;
                        }
                  
                  //이메일 없으면
                     if($("#Aemail").val() == ""){
                        alert("이메일를 입력해 주세요");
                        $("Aemail").focus();
                        return false;
                     }
                     
                  //핸드폰 번호 없으면
                     if($("#Aphone").val() == ""){
                        alert("핸드폰 번호를 입력해 주세요");
                        $("Aphone").focus();
                        return false;
                     }
                     
                  //주소 하나라도 없으면
                     if($("#Azipcode").val() == "" || $("#Aaddress").val() == "" || $("#Aaddressdetail").val() == ""){
                        alert("주소를 입력해 주세요");
                        $("Azipcode").focus();
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