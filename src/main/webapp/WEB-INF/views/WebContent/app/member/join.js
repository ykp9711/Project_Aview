/**
 * 회원가입
 */
var check = false;

function formSubmit(){
	var form = document.joinForm;

	//아이디 검사
	if(form.sid.value == "" || !check){
		alert("아이디를 확인해주세요.");
		form.sid.focus();
		return false;
	}
	
	form.submit();
}

function checkId(id){
	check = false;
	if(id == ""){
		$("#idCheck_text").text("아이디를 작성해주세요");
	}else{
		$.ajax({
			//받아온 var contextPath를 여기서 사용한다. AJAX는절대경로로 사용한다.
			url:contextPath + "/member/MemberCheckIdOk.me?id="+id,
			type:"get",
			dataType:"text",
			//통신에 성공했을시 MemberCheckId에서 뿌린 "not ok"나 "ok"가 result자리로 대신 들어간다.
			success:function(result){
				if(result.trim() == "ok"){
					check = true;
					$("#idCheck_text").text("사용할 수 있는 아이디입니다.");
				}else{
					$("#idCheck_text").text("중복된 아이디입니다.");
				}
			},
			error:function(){
				console.log("오류");
			}
		});
	}
}
//아이디 중복확인 없이 키가 하나하나 입력됬을때 체크를 한다.
$("input[name='sid']").keyup(function(event){
	var id = $("input[name='sid']").val();
	checkId(id);
});

