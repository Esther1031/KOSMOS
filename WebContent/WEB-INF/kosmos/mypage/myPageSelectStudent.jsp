<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.kosmos.mypage.vo.KosmosMypageVO"%>

<% Object data = request.getAttribute("data"); %>
<% 
	
	KosmosMypageVO mvo = new KosmosMypageVO(); 

	mvo = (KosmosMypageVO) data;

	String ms_name = mvo.getMs_name();
	String ms_id = mvo.getMs_id();
	String ms_cp = mvo.getMs_cp();
	String ms_zipcode = mvo.getMs_zipcode();
	String ms_doro = mvo.getMs_doro();
	String ms_whenjoin = mvo.getMs_insdate();	//admissionyear대신 회원등록한 일자를 가져옴 
	String ms_grade = mvo.getMs_grade();
	String ms_class = mvo.getMs_class();
	String ms_number = mvo.getMs_number();

	System.out.println("\n===== jsp에서 출력한 데이터 ========================\n");
	System.out.println("컨트롤러에서 가져온 데이터 ms_name >>> : " + ms_name);
	System.out.println("컨트롤러에서 가져온 데이터 ms_id >>> : " + ms_id);
	System.out.println("컨트롤러에서 가져온 데이터 ms_cp >>> : " + ms_cp);
	System.out.println("컨트롤러에서 가져온 데이터 ms_zipcode >>> : " + ms_zipcode);
	System.out.println("컨트롤러에서 가져온 데이터 ms_doro >>> : " + ms_doro);
	System.out.println("컨트롤러에서 가져온 데이터 ms_whenjoin >>> : " + ms_whenjoin);
	System.out.println("컨트롤러에서 가져온 데이터 ms_grade >>> : " + ms_grade);
	System.out.println("컨트롤러에서 가져온 데이터 ms_class >>> : " + ms_class);
	System.out.println("컨트롤러에서 가져온 데이터 ms_number >>> : " + ms_number);
	System.out.println("\n==============================================\n");

%>

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
					<br> ${ data.ms_name }<br>
				</div>
			</div>
			<div class="right" border="1">
				<div class="selectzone">
					<br>
					<h2>내 회원정보</h2>
					<br>이름 : <input type="text" name="stname" id="stname" value="${ data.ms_name }"><br>
					<br>이메일 : <input type="text" name="stmail" id="stmail" value=<%= ms_id %>><br>
					<br>핸드폰번호 : <input type="text" name="stcp" id="stcp" value="${ data.ms_cp}"><br>
					<br>
					우편번호 : <input type="text" name="me_zipcode" id="me_zipcode" style="width:50px" maxlength="6" value=<%= ms_zipcode %>>
			 		<br>
			 		<br>
			 		도로명주소 : <input type="text" name="me_doro" id="me_doro" style="width:250px" value="${ data.ms_doro }">
			 		<br>
					<br>
					가입일 : <input type="text" name="admissionyear" id="admissionyear" value="${ data.ms_insdate }"><br>
					<br>학년 :&nbsp; <input type="text" name="grade" id="grade" value=<%= ms_grade %>>
					&nbsp;반 :&nbsp; <input type="text" name="st_class" id="st_class" value="${ data.ms_class}">
					&nbsp;번호 :&nbsp; <input type="text" name="number" id="number" value=<%= ms_number %>>
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