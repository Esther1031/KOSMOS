<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!-- 스크립틀릿 또는 EL로 데이터 받아와야 함 -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정(학생)</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">

	$(document).ready(function(){
		
		$("#U").click(function(){
			console.log("회원정보 수정 버튼이 클릭됨 >>> : 회원 정보수정 팝업창을 띄웁니다.");
			
			// ajax로 수정로직 실행 후
			// 결과 받아와서 alert 띄우기
			
		});
		
		$("#close").click(function(){
			console.log("창 닫기 버튼이 클릭됨 >>> : 회원 정보수정 팝업창을 닫습니다.");
			window.close();
			// ajax로 수정로직 실행 후
			// 결과 받아와서 alert 띄우기
			
		});
		
	});

</script>
</head>
<body>
	<br>
	<h2>내 회원정보 수정하기</h2>
	<hr>
	<br>
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
	<hr>
	<br>
	<p align="center">
	<input type="button" name="U" id="U" value="회원정보 수정하기">
	<input type="button" name="close" id="close" value="닫기">	
</body>
</html>