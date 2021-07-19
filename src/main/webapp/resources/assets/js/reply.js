/**
 * reply module
 */

console.log("Reply module");

var replyService = (function(){
	
		//자바스크립트 함수는 매개변수로 함수를 전달받을 수 있다.
		//callback, error는 외부에서 전달받을 함수이다.
		//함수의 파라미터 개수를 일치시키지 않아도 된다(callback, error는 선택사항이다)
		function add(reply, callback, error){
			$.ajax({
				type:"POST",
				url:"/replies/new",
				data:JSON.stringify(reply),	//전달받은 JSON은 문자열로 변경해주고,
				contentType:"application/json; charset=utf-8",	//전송할 때 작성한 contentType으로 변환시켜준다.
				success:function(result, status, xhr){
					if(callback){//사용자가 callback함수를 전달해주었다면 true
						callback(result);//컨트롤러에서 리턴한 값을 전달받은 callback함수의 매개변수로 전달해준다.
					}
				},
				error:function(xhr, status, er){
					if(error){//사용자가 error함수를 전달해주었다면 true.
						error(er);//오류 객체를 전달받은 error함수 매개변수로 전달해준다.
					}
				}
			})
		}
	
		
		//댓글 삭제
		function remove(rno, callback, error){
			$.ajax({
				type:"DELETE",
				url:"/replies/" + rno,
				success:function(result, status, xhr){
					if(callback){
						callback(result);
					}
				},
				error:function(xhr, status, er){
					if(error){
						error(er);
					}
				}
			});
		}
		
		function update(reply, callback, error){
			console.log("RNO : " + reply.rno);
			
			$.ajax({
				type:"PUT",
				url:"/replies/" + reply.rno,
				data:JSON.stringify(reply),
				contentType:"application/json; charset=utf-8",
				success:function(result, status, xhr){
					if(callback){
						callback(result);
					}
				},
				error:function(xhr, status, er){
					if(error){
						error(er);
					}
				}
			});
		}
		
		//댓글 목록
		function getList(param, callback, error){
			var bno = param.bno;
			//var v = a || b : a에 값이 있으면 a를 v에 할당, 없으면 b를 v에 할당.
			var page = param.page || 1;
			
			//결과를 무조건 JSON타입으로만 받을 때에는
			//Ajax에서 다양한 속성을 사용해야 하므로 불편하다.
			//이럴 때에는 getJSON을 사용하여 빠르게 결과를 JSON타입으로 가져올 수 있다.
			//하지만 세부 설정들이 필요할 때에는 Ajax를 사용해야 한다.
			
			//$.getJSON("url(반드시 json결과타입작성)", success callback 함수).fail(error callback 함수);
			$.getJSON("/replies/pages/" + bno + "/" + page + ".json", 
					function(data){
						if(callback){
							callback(data.replyCnt, data.listing);
						}
					}).fail(function(xhr, status, err){
						if(error){
							error(er);
						}
			});
			
		}
		
		//댓글 조회
		function get(rno, callback, error){
			$.get("/replies/" + rno + ".json", function(result){
				if(callback){
					callback(result);
				}
			}).fail(function(xhr, status, er){
				if(error){
					error(er);
				}
			});
		}
		
		//시간처리(당일은 시/분/초, 지난 날은 년/월/일)
		function displayTime(timeValue){
			var today = new Date();
			var date = new Date(timeValue);
			var gap = today.getTime() - date.getTime();
			
			//당일
			if(gap < 24 * 60 * 60 * 1000){
				var hh = date.getHours();
				var mi = date.getMinutes();
				var ss = date.getSeconds();
				
				//0~9는 앞에 0을 붙이고, 10이상은 0을 붙이지 않는다.
				return [(hh > 9 ? '' : '0') + hh, ':', (mi > 9 ? '' : '0') + mi, ':', (ss > 9 ? '' : '0') + ss].join(" ");
				//결과 hh : mi : ss
				
			}else{
			//지난 날
				var yy = date.getFullYear();
				var mm = date.getMonth() + 1;
				var dd = date.getDate();
				
				return [yy, '-', (mm > 9 ? '' : '0') + mm, '-', (dd > 9 ? '' : '0') + dd].join(" ");
			}
		}
		
		
		
		return {add : add, remove : remove, update : update, getList : getList, get : get, displayTime : displayTime};
//		return {name : "AAA"};
})();













