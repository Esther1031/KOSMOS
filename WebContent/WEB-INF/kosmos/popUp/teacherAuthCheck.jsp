<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>교사 인증키 확인창</title>
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


	.frame{
		margin : 0 auto;
		margin-top: 200px;
		border : 5px solid #34558B;
		border-radius: 15px;
		width: 500px;
	}
	h2{
		text-align : center;
	}
	.insert{
		text-align : center;
	}
	.button{
		text-align : center;		
	}
	
</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">

	$(document).ready(function(){
		
		// ajax
		$(document).on("click", "#keyCheck", function(){
			
			// null check
			if ('' == $("#authKey").val()) {
				$("#authKey").val('');
				$("#authKey").focus('');
				
				alert("인증키를 입력해주세요.");
								
				return
			}
			
			alert("인증키를 확인중입니다.");
			
			var authKey = $("#authKey").val();

			callAjaxAuth(authKey);
			
		});
		
		function callAjaxAuth(authKey){
			
			let authcheckURL = "checkAuth.k";
			let reqType = "POST";
			let dataParam = { 
					authenticationkey : authKey
			};
			
			$.ajax({
				url : authcheckURL,
				type : reqType,
				data : dataParam,
				success : whenSuccess,
				error : whenError
			});
			
			function whenSuccess(resData){
				alert("응답받은 데이터 출력 >>> : " + resData);
				
				if("correct" == resData) {
					alert("인증 확인되었습니다.!");
					location.href="teacherForm.k";
					
				} else if("incorrect" == resData) {
					alert("인증키가 올바르지 않습니다. 다시 확인해주세요.");
				}
				
			}
			
			function whenError(e){
				alert("인증키 확인 중 에러가 발생했습니다. >>> : " + e.responseText);
			}
		}
	});
	
</script>
</head>
<body>
<form name="keyData" id="keyData">
	<div class="frame">
		<div class="title">
			<h2>인증KEY 값을 입력해주세요.</h2>
		</div>
		<div class="insert">
			인증 Key : <input type="password" name="authKey" id="authKey" placeholder="인증키 입력">
		</div>
		<br>
		<div class="button">
			<button type="button" id="keyCheck" style="width:100px">확인</button>
			<button type="reset" style="width:100px">다시입력</button>
		</div>
		<br>
	</div>
</form>
</body>
</html>