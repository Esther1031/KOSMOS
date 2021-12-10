<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원유형 선택(팝업창)</title>
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
	img {
		border: 1px solid gray;
	}
	
</style>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">

	$(document).ready(function(){
		
		$("#stImg").click(function(){
			
			location.href="joinStudent.k";
			
		});
		
		$("#teImg").click(function(){
			
			window.open("joinTeacher.k", "", "width=1500, height=800, resizable=no, scrollbars=no, status=no");

		});
		
	});
	
</script>
</head>
<body>
<h1 align="center">회원 유형을 선택해주세요!</h1>
<hr>
<br>
<br>
<div class="frame">

	<table>
			<tr style="border-bottom: 5px solid #34558B">
				<td align="center"><h2>학생</h2></td>
				<td align="center"><h2>교사</h2></td>
			</tr>
			<tr>
				<td><img src="/KOSMOS/img/Student.png" width="150" height="150" name="stImg" id="stImg"></td>
				<td><img src="/KOSMOS/img/Teacher.png" width="150" height="150" name="teImg" id="teImg"></td>
			</tr>

	</table>
</div>
</body>
</html>