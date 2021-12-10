<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="resource/css/front.css"></script>

<style type="text/css">
	
	body{
		background: #eee;
	}
	table {
		border: 5px solid #34558B;
		padding: 10px;
		margin: 0px auto;
		margin-top: 80px;
		border-radius: 10px;
	}
	 
	button {
		font-family: 'IBM Plex Sans KR', sans-serif;
		font-size: initial;
		color: white;
		background-color: #34558b;
		height: 30px;
		width:308px; 
		border: 0px solid black;
		border-radius: 4px;
	}

</style>

<script type="text/javascript">
	$(document).ready(function(){

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
			console.log("교사가 선택되었습니다. >>> : value : [02]");	// 콘솔 출력
		});
		
		
		$("#findId").click(function(){
			
			// null check
			if ('' == $("input[name=chkbox]").val() || 
				'' == $("#mname").val() || 
				'' == $("#mbirthId").val()){
				$("input[name=chkbox]").prop("checked", false);
				$("#mname").val('');
				$("#mbirthId").val('');
				
				alert("유형 / 이름 / 생년월일을 입력해주세요.");
				return
			}
			
			if (01 == chkbox) {
				alert("선택하신 유형은 학생 입니다");
			} else if(02 == chkbox) {
				alert("선택하신 유형은 교사 입니다");
			}
 				
			console.log("유형 >>> : [" + chkbox +"]");

			var mname = $("#mname").val();
			var mbirthId = $("#mbirthId").val();
			
			alert("아이디 조회중..." + chkbox +" : "+ mname +" : "+ mbirthId);
			// callAjaxId()함수 호출
			callAjaxId(chkbox, mname, mbirthId);
			
		});
		
		// callAjaxId() 함수
		function callAjaxId(chkbox, mname, mbirthId){
			
			alert(chkbox +" : "+ mname +" : "+ mbirthId)

			let findIdURL = "findId.k";
			let reqType = "POST";
			let dataParam = { 
					login_type : chkbox,
					mname : mname,
					mbirthId : mbirthId
			};
				
			$.ajax({
				url : findIdURL,
				type : reqType,
				data : dataParam,
				contentType : "application/x-www-form-urlencoded; charset=UTF-8",
				success : whenSuccess,
				error : whenError
			});
				
			function whenSuccess(resData){
				// if문으로 null check 추가
				alert(resData);
			}
				
			function whenError(e){
				$("input[name=chkbox]").prop("checked", false);
				$("#mname").val("");
				$("#mbirthId").val("");
				alert("에러가 발생했습니다. >>> : " + e.responseText);
			}
				
		}

	});

</script>
</head>
<body>
로그인페이지에서 아이디/비밀번호 찾기 링크를 클릭한 경우 나오는 페이지입니다.
<hr>
<p>
<br>
<form name="findForm" id="findForm">
	<table border="1">
		<tr>
			<td>
				<h2>
					<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;아이디 찾기</b>
				</h2>
			</td>
		</tr>
	
		<tr>
			<td>유형선택 : &nbsp;&nbsp;
				<input type="checkbox" name="chkbox" id="student" value="01"><span>학생</span>&nbsp;
				<input type="checkbox" name="chkbox" id="teacher" value="02"><span>교사</span>
			</td>
		</tr>
		
		<tr>
			<td>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;이름 : <input type="text" width="108" name="mname" id="mname" placeholder="김찬기">
			</td>
		</tr>
		<tr>
			<td>
			생년월일 : <input type="text" width="108" name="mbirthId" id="mbirthId" placeholder="19881215">
			</td>
		</tr>
		<tr>
			<td>
			
			<button type="button" id="findId">아이디찾기</button>
			</td>
		</tr>	
	</table>
</form>
</body>
</html>