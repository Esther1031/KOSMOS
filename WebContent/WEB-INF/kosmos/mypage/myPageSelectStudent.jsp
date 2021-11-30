<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- 선행과정
     Controller에서 
     set.addAttribute("member", mvo); 해서 회원정보를 모델에 세팅한다.
-->

<!-- 데이터 바인딩 로직 구현
	 스크립틀릿 문법 <%%>또는 EL {mvo.mname} 을 이용해 
	 모델 객체에 담긴 데이터를 꺼내 텍스트박스에 바인딩하기.  
-->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 (학생)</title>
<style type="text/css">
	.wrap{
		width:1200px; 
		margin:0 auto;
	}
	.container{
		margin:0 auto; 
		width:100%;
	}
	.left{
		float:left;
		float:left;
		width:18%;
		height:800px;
		margin-right:15px;
		border-right:1px solid black;
	}
	.right{
		float:left;
		float:left;
		width:80%;te
	}
	.photozone{
		margin: 0 auto;
		 
		border:1px solid black; 
		width:"200";
		height:"240";
	}
	.selectzone{
		margin:0 auto; 
		border:1px solid black; 
		width:88%;
	}
</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">

	$(document).ready(function(){
		
		$("#updateForm").click(function(){
			console.log("회원정보 수정 버튼이 클릭됨 >>> : 회원 정보수정 팝업창을 띄웁니다.");
			window.open("myPageUpdateStudent.k", "", "width=680, height=800, resizable=no, scrollbars=no, status=no");
		});
		
	});


</script>
</head>
<body>
<h1>마이페이지 조회화면입니다!</h1>
<hr>
	<div class="wrap" color="blue">
		<div class="container" border="1" color="pink">
			<div class="left" border="1">
				<div class="photozone">
					<img src="img/profile.jpg" width="200" height="240">
					<br> 최현준 / (29)
					<br> 풀스택개발자
				</div>
			</div>
			<div class="right" border="1">
				<div class="selectzone">
					<br>
					<h2>내 회원정보</h2>
					<br>이름 : <input type="text" name="stname" id="stname"><br>
					<br>이메일 : <input type="text" name="stmail" id="stmail"><br>
					<br>핸드폰번호 : <input type="text" name="stcp" id="stcp"><br>
					<br>
					우편번호 : <input type="text" name="me_zipcode" id="me_zipcode" style="width:50px" maxlength="6" >
			 		<br>
			 		<br>
			 		도로명주소 : <input type="text" name="me_doro" id="me_doro" style="width:250px">
			 		<br>
			 		<br>
			 		상세주소 : <input type="text" name="me_dorodetail" id="me_dorodetail" style="width:250px">
			 		<br>
					<br>입학년도 : <input type="text" name="admissionyear" id="admissionyear"><br>
					<br>학년 :&nbsp; <input type="text" name="grade" id="grade">
					&nbsp;반 :&nbsp; <input type="text" name="class" id="class">
					&nbsp;번호 :&nbsp; <input type="text" name="number" id="number">
					<br>
					<br>
					<br>
					<br>
					<p align="center">
					<input type="button" name="updateForm" id="updateForm" value="회원정보 수정하기">
				</div>
			</div>
		</div>
	</div>
</body>
</html>