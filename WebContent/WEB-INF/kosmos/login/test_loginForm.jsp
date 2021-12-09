<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
<style type="text/css">

    @import url('https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap');
   
    body {
		font-family: 'IBM Plex Sans KR', sans-serif;
		font-size: initial;
	    background: #eee
	} 	
	.wrap {
		width : 330px;
		align : center;
		border : 5px solid #34558B;
		margin : 100px auto;
		border-radius: 10px;
	}
	
	.text {
		border: 1px solid gray;
		font-family: 'IBM Plex Sans KR', sans-serif;
		font-size: initial;
		background-color: #eee;
	}
	 
	.button {
		font-family: 'IBM Plex Sans KR', sans-serif;
		font-size: initial;
		color: white;
		background-color: #34558b;
		height: 30px;
		width:308px; 
		border: 0px solid black;
		border-radius: 4px;
	}
	
	h1{ 
		text-align : center;
	}

</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	
	$(document).ready(function(){
	
		console.log("Welcome to Login Page!!!");

		var chkbox = '';
		
		// 학생, 교사 중복 체크 불가 로직
		$("#student").click(function(){								// 학생 체크박스 클릭시
			$("#student").prop("checked", true);					// 학생 checked 값을 true로.
			if($("#teacher").prop("checked", true)) {				// 만약 교사 체크박스의 checked 값이 true면
				$("#teacher").prop("checked", false);				// false로 바꿔준다.
				
				chkbox = $("#student").val();					// 변수 chkbox에 학생의 밸류 "01"넣기
			}
			console.log("학생이 선택되었습니다. >>> : value : [01]");	// 콘솔 출력
		});
		
		$("#teacher").click(function(){								// 교사 체크박스 클릭시
			$("#teacher").prop("checked", true);					// 교사 checked 값을 true로.
			if($("#student").prop("checked", true)){				// 만약 학생 체크박스의 checked 값이 true면
				$("#student").prop("checked", false)				// false로 바꿔준다.
				
				chkbox = $("#teacher").val();					// 변수 chkbox에 교사의 밸류 "02"넣기
				
			}
			console.log("교사이 선택되었습니다. >>> : value : [02]");	// 콘솔 출력
		});
		
		
		// 회원가입 버튼 클릭시 로직 		
		$("#join").click(function(){
			console.log("회원가입 링크가 클릭됨 >>> : 회원 유형 선택창을 띄웁니다.");
			window.open("loginChoice.k", "", "width=660, height=700, resizable=no, scrollbars=no, status=no");
		});
		
		
		// 아이디 찾기 링크를 클릭했을 경우 로직
		$("#findIdPage").click(function(){
			console.log("아이디/비밀번호 찾기 링크가 클릭됨 >>> : ");
			window.open("findIdPage.k", "", "width=600, height=500, resizable=no, scrollbars=no, status=no");
		});
		
		
		// 비밀번호 찾기 링크를 클릭했을 경우 로직
		$("#findPwPage").click(function(){
			console.log("아이디/비밀번호 찾기 링크가 클릭됨 >>> : ");
			window.open("findPwPage.k", "", "width=600, height=500, resizable=no, scrollbars=no, status=no");
		});
		
		
		// 로그인 버튼을 클릭했을 경우 로직
		$("#btn").click(function(){

			/////////////////////////////////////////////////////////////////////////
			// null check
			if ('' == $("input[name=chkbox]").val() || 
				'' == $("#mid").val() || 
				'' == $("#mpw").val()){
				$("input[name=chkbox]").prop("checked", false);
				$("#mid").val('');
				$("#mpw").val('');
				
				alert("유형 / 아이디 / 비밀번호를 입력해주세요.");
				return
			}
			
			if (01 == chkbox) {
				alert("선택하신 유형은 학생 입니다");
			} else if(02 == chkbox) {
				alert("선택하신 유형은 교사 입니다");
			}
 				
			console.log("유형 >>> : [" + chkbox +"]");
			
			var mid = $("#mid").val();
			console.log("mid >>> : " + mid);
			var mpw = $("#mpw").val();
			console.log("mpw >>> : " + mpw);
			alert("데이터 전달 >>> : " + chkbox +" : "+ mid +" : "+ mpw);
			// callAjaxLogin()함수 호출
			callAjaxLogin(chkbox, mid, mpw);
			
		});
		
		
		// callAjaxLogin() 함수
		function callAjaxLogin(chkbox, mid, mpw){
			
			alert(chkbox +" : "+ mid +" : "+ mpw)

			let loginURL = "loginMsg.k";
			let reqType = "POST";
			let dataParam = { 
					login_type : chkbox,
					login_id : mid,
					login_pw : mpw
			};
			
			$.ajax({
				url : loginURL,
				type : reqType,
				data : dataParam,
				contentType : "application/x-www-form-urlencoded; charset=UTF-8",
				success : whenSuccess,
				error : whenError
			});
				
			function whenSuccess(resData){
				alert("회원 데이터 확인 결과 >>> : " + resData);
				
				// null check 추가
				//if (resData != null) {
				//	alert("입력하신 정보에 해당하는 데이터가 없습니다.");
				//	return
					
				 if (resData == "successSt") {
					
					alert("로그인 성공!")
					location.href="mainSugang.k";
					window.open("checkEnvironment.k", "", "width=600, height=800, resizable=no, scrollbars=no, status=no");	
					return dataParam 
					
				} else if (resData == "successTe") {
					
					alert("로그인 성공!")
					location.href="mainSugang.k";
					window.open("checkEnvironment.k", "", "width=600, height=800, resizable=no, scrollbars=no, status=no");	

				} else if (resData == "fail" || resData == null) {
					
					alert("로그인 실패 : 유형 / 아이디 / 비밀번호를 다시 확인해주세요.");
				}	
			}
				
			function whenError(e){
				$("input[name=chkbox]").prop("checked", false);
				$("#id").val("");
				$("#mpw").val("");
				alert("에러가 발생했습니다. >>> : " + e.responseText);
			}
				
		}
		
	});
	
</script>
</head>
<body>
<div class="wrap">
<h1>로그인</h1>
	<form name="loginForm" id="loginForm">
		<table border="0" align="center">
			<tr>
				<td>
					<input type="checkbox" name="chkbox" id="student" value="01"><span>학생</span>
					<input type="checkbox" name="chkbox" id="teacher" value="02"><span>교사</span>
				</td>
			</tr>
			<tr>
				<td><input class="text" type="text" name="mid" id="mid" placeholder="아이디" style="width:300px;"></td>
			</tr>	
			<tr>
				<td><input class="text" type="text" name="mpw" id="mpw" placeholder="비밀번호" style="width:300px;"></td>
			</tr>
			<tr>
				<td><button class="button" type="button" name="btn" id="btn">로그인</button></td>
			</tr>
			<tr>
				<td align="center">
					<a name="join" id="join">회원가입</a>
					|
					<a name="findIdPage" id="findIdPage">아이디 찾기</a>
					|
					<a name="findPwPage" id="findPwPage">비밀번호 찾기</a>	
				</td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>