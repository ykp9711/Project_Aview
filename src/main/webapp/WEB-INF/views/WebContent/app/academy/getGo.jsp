<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<%@ include file = "../../header.jsp" %>
<html>
   <head>
      <title>ReView List</title>
      <meta charset="utf-8" />
      <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
      <link rel="stylesheet" href="../../../../../resources/assets/css/main.css" />
   </head>
   <body class="is-preload">
      <!-- Main -->
         <div id="main">
            <div class="wrapper">
               <div class="inner">

                  <!-- Elements -->
                     <section id="main" class="wrapper style1">
			            <header class="major">
			               <h2>리뷰</h2>
			            </header>
   					 
                           <!-- Table -->
                  <div class="container">   
                  	 <section id="content">

			                        
			                          
			                         <div class="container">
										
											<h2>00학원 리뷰</h2>
										<table style="border: 1px; solid; text-align: center;">
							            	<tr class="tHead" >
							            	<th >작성번호</th>
							               
							               <th class="writer">작성자</th>
							               <th class="content">내용</th>
							               <th class="area">학원 장소</th>
							
							            </tr>
							            <c:forEach var="list" items="${list}">
							               <tr style="height: 100px;">
							               	  <td>${list.rn}</td>
							                  <td style="text-align: center; width: 100px;" ><img src="/resources/FileImage/${list.academyPhoto}" style="width:200px; height:100px;"></td>
							                  <td class="title"><a href="/board/getBoard?ano=${list.ano}">${list.academyTitle}</a></td>
							                  <td class="kind">${list.academyKind}</td>
							                  <td class="area" >${list.academyArea}</td>
							               </tr>
							
							
							            </c:forEach>
							
							            </tbody>
							         </table>
									</div>
									
									</section>
									<a style="width:100%" href="javascript:void(0)" class="button primary small register">학원 리뷰 쓰기</a>
									<div class="fields register-form" style="display:none">

                  	 <section id="content">
									<form name="insertReivew" action="/board/insertReview" method="post">
										<div class="field">
										<label>작성자</label>
				                           <input type="text" maxlength="12" name="writer" value="" required>
										</div><br>
										<div class="field">
											<label>학원 리뷰</label>
				                           <input type="text" maxlength="12" name="content" value="" required>
										</div><br>
										<ul class="actions">
				                        <li style="margin:0 auto;">
				                           <input type="submit" value="작성하기" class="primary"/>
				                     </ul>
									</form>
									</section></div>
									</div>
									
			                     </section>

      <!-- Scripts -->
		<script src="//code.jquery.com/jquery-3.5.1.min.js"></script>
		<script>var contextPath = "${pageContext.request.contextPath}";</script>
		<script>
		$("#delete").on("click", function(e){
		      location.href="/serviceList/delete?bno="+${list.bno};
		   })
		</script>
		<script src="/resources/assets/js/reply.js"></script>
		<script>
			$(document).ready(function(){
				var bnoValue = "${list.bno}";
				var replyUL = $(".replies");
				
				var pageNum = 1;
				var replyPageFooter = $(".big-width");
				
				showList(pageNum);
				
				function showReplyPage(replyCnt){
					var endNum = Math.ceil(pageNum / 10.0) * 10;
					var startNum = endNum - 9;
					var realEnd = Math.ceil(replyCnt / 10.0);
					
					//현재 페이지를 기준으로 startNum이 1이 아니라면
					//이전 페이지가 있다는 뜻.
					var prev = startNum != 1;
					var next = false;
					
					if(endNum * 10 >= replyCnt){
						endNum = realEnd;
					}
					
					//현재 페이지를 기준으로 마지막 페이지까지의 댓글 개수가
					//전체 댓글 개수보다 작다면 다음 버튼을 활성화 해준다.
					//if(endNum < replyCnt / 10.0){
					if(endNum * 10 < replyCnt){
						next = true;
					}
					
					var str = "";
					//반응형(javascript)
					if(matchMedia("screen and (max-width: 900px)").matches){
						//모바일
						if(pageNum > 1){
							str += "<a class='changePage' href='" + (pageNum - 1) + "'><code>&lt;</code></a>"
						}
						str += "<code>" + pageNum + "</code>";
						if(pageNum != realEnd){
							str += "<a class='changePage' href='" + (pageNum + 1) + "'><code>&gt;</code></a>"
						}
						
					}else{
						//데스크탑
						if(prev){
							str += "<a class='changePage' href='" + (startNum - 1) + "'><code>&lt;</code></a>"
						}
						for(var i=startNum; i<=endNum; i++){
							if(pageNum == i){
								str += "<code>" + i + "</code>";
							}else{
								str += "<a class='changePage' href='" + i + "'><code>" + i + "</code></a>"
							}
						}
						if(next){
							str += "<a class='changePage' href='" + (endNum + 1) + "'><code>&gt;</code></a>"
						}
					}
					
					replyPageFooter.html(str);
					
					$(".changePage").on("click", function(e){
						e.preventDefault();
						
						pageNum = parseInt($(this).attr("href"));
						
						showList(pageNum);
					});
					
				}
				
				$(".register").on("click", function(e){
					e.preventDefault();
					
					$(".register-form").show();
					$(this).hide();
				})
				
	
				$(".cancle").on("click", function(e){
					e.preventDefault();
					
					$(".register-form").hide();
					$(".register").show();
				})
				
				$(".finish").on("click", function(e){
					e.preventDefault();
					
					//console.log("들어옴");
					
					//댓글
					var replyValue = $("textarea[name='reply']").val();
					//작성자
					var replyerValue = $("input[name='replyer']").val();
					
					replyService.add({bno:bnoValue, reply:replyValue, replyer:replyerValue},
							function(result){
							alert("등록 완료");
							pageNum = 1;
							showList(pageNum);
					});
				})
				
				function showList(page){
					replyService.getList({bno:bnoValue, page:page||1},
							function(replyCnt, listing){
							var str = "";
							if(listing == null || list.length == 0){
								replyUL.html("<li><strong>답변 대기중.</strong></li>");
								return;
							}
							
							for(var i=0, len = listing.length || 0; i<len; i++){
								str += "<li data-rno='" + listing[i].rno + "'>";
								str += "<strong>" + listing[i].replyer + "</strong>";
								str += "<p class='reply" + listing[i].rno + "'>" + listing[i].reply + "</p>";
								str += "<div style='text-align:right'><strong>";
								str += replyService.displayTime(listing[i].replyDate);
								str += "</strong><br>";
								str += "<a href='"+ listing[i].rno + "' class='modify'>수정</a>&nbsp;&nbsp;";
								str += "<a href='"+ listing[i].rno + "' class='finish' style='display:none'>수정완료</a>&nbsp;&nbsp;";
								str += "<a href='" + listing[i].rno + "' class='remove'>삭제</a></div>";
								str += "<div class='replyLine'></div></li>"
							}
							replyUL.html(str);
							
							showReplyPage(replyCnt);
					});
				}
				
				//새롭게 추가한 HTML 코드에 이벤트 처리를 할 때에는
				//같은 영역에 있도록 구현한다. 만약 다른 영역에서 구현하게 되면
				//현재 화면에 존재하는 요소에만 연결되기 때문에 아래와 같이 이벤트 위임을 해주어야 한다.
				//$("현재 존재하는 요소").on("이벤트명", "위임할 태그 및 선택자", function(e){})
				$(".replies").on("click", "a.modify", function(e){
					e.preventDefault();
					
					var rnoValue = $(this).attr("href");
					var replyTag = $(".reply" + rnoValue);
					
					replyTag.html("<textarea class='" + rnoValue + "'>" + replyTag.text() + "</textarea>");
					$(this).hide();
					
					//class가 finish인 태그를 전부다 가져온다.
					var finishs = document.getElementsByClassName("finish");
					for(var i=0; i<finishs.length; i++){
						//각 태그별로 href값을 현재 수정할 댓글번호와 비교한다.
						if(finishs[i].getAttribute("href") == rnoValue){
							//일치하는 수정완료버튼을 화면에 보여준다.
							finishs[i].style.display = "inline";
							break;
						}
					}
				});
				
				$(".replies").on("click", "a.finish", function(e){
					e.preventDefault();
					
					//댓글번호
					var rnoValue = $(this).attr("href");
					replyService.update({rno:rnoValue, bno:bnoValue, reply:$("." + rnoValue).val()},
							function(result){
							if(result == "success"){
								alert("수정 완료");
							}
							showList(pageNum);
					})
				});
				
				
				//댓글 삭제(댓글번호만 전달)
				$(".replies").on("click", "a.remove", function(e){
					e.preventDefault();
					
					replyService.remove($(this).attr("href"),
							function(result){
								if(result == "success"){
									alert("삭제 완료");
									showList(pageNum);
								}
					});
					
				});
				//console.log("======");
				//console.log("JS TEST");
				
				//JSP파일 안에 있는 <script>태그에서는 EL문을 따옴표 안에서 사용할 수 있지만,
				//외부 자바스크립트 파일에서는 EL문을 사용할 수 없다.
				//var bnoValue = "${list.bno}";
				
/* 				replyService.add({reply:"JS Test", replyer:"tester", bno:bnoValue},
						function(result){
							alert("RESULT : " + result);						
				}); */
				
/* 				replyService.remove(3, function(result){
					if(result == "success"){
						alert("REMOVED");
					}
				}, function(err){
					alert("ERROR...");
				}) */
				
				//수정테스트(3개의 값을 전달해야 한다.)
				//replyService.update({rno:6, bno:bnoValue, reply:"Modified Reply"}, function(result){alert("MODIFIED");});
				
				//댓글 목록
				//replyService.getList({bno:bnoValue}, function(data){console.log(data);})
				
				//댓글 조회
				/* replyService.get(5, function(result){
					console.log(result);
				}); */
			});
		
		</script>
        <%@ include file = "../../footer.jsp" %>
   </body>
</html>