<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.kosmos.mypage.vo.KosmosMypageVO"%>

<% Object data = request.getAttribute("data"); %>
<% 
	
	KosmosMypageVO mvo = new KosmosMypageVO(); 

	mvo = (KosmosMypageVO) data;

	String mt_name = mvo.getMt_name();
	String mt_id = mvo.getMt_id();
	String mt_cp = mvo.getMt_cp();
	String mt_zipcode = mvo.getMt_zipcode();
	String mt_doro = mvo.getMt_doro();


	System.out.println("\n===== jsp에서 출력한 데이터 ========================\n");
	System.out.println("컨트롤러에서 가져온 데이터 mt_name >>> : " + mt_name);
	System.out.println("컨트롤러에서 가져온 데이터 mt_id >>> : " + mt_id);
	System.out.println("컨트롤러에서 가져온 데이터 mt_cp >>> : " + mt_cp);
	System.out.println("컨트롤러에서 가져온 데이터 mt_zipcode >>> : " + mt_zipcode);
	System.out.println("컨트롤러에서 가져온 데이터 mt_doro >>> : " + mt_doro);
	System.out.println("\n==============================================\n");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 (교사)</title>
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
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">

	$(document).ready(function(){
		
		$("#updateForm").click(function(){
			console.log("회원정보 수정 버튼이 클릭됨 >>> : 회원 정보수정 팝업창을 띄웁니다.");
			window.open("myPageUpdateTeacher.k", "", "width=680, height=800, resizable=no, scrollbars=no, status=no");
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
					<br> ${ data.mt_name }<br>
				</div>
			</div>
			<div class="right" border="1">
				<div class="selectzone">
					<br>
					<h2>내 회원정보</h2>
					<br>이름 : <input type="text" name="tename" id="tename" value="${ data.mt_name }"><br>
					<br>이메일 : <input type="text" name="temail" id="temail" value="${ data.mt_id }"><br>
					<br>핸드폰번호 : <input type="text" name="tecp" id="tecp" value="${ data.mt_cp }"><br>
					<br>
					우편번호 : <input type="text" name="me_zipcode" id="me_zipcode" style="width:50px" maxlength="6"  value="${ data.mt_zipcode }">
			 		<br>
			 		<br>
			 		도로명주소 : <input type="text" name="me_doro" id="me_doro" style="width:250px" value="${ data.mt_doro }">
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