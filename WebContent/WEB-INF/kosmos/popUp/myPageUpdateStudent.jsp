<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
<title>회원정보수정(학생)</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
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
		
		$("#U").click(function(){
			console.log("회원정보 수정 버튼이 클릭됨 >>> : 회원이 수정요청한 정보를 DB에 보냅니다. ");
			
			// null check
			// 1. 변경 사항이 있는 경우 : 값에 공백이 있는 경우
			// 2. 정상 업데이트
			// 3. 미구현) 이미 입력되어있는 데이터와 현재 입력된 데이터가 같은 경우 >>> : 로직을 생각할 시간이 부족해서 PASS
			if('' == $("#stname").val() || '' == $("#stmail").val() ||
			   '' == $("#stcp").val() || '' == $("#me_zipcode").val() ||
			   '' == $("#me_doro").val() ||
			   '' == $("#admissionyear").val() || '' == $("#grade").val() ||
			   '' == $("#class").val() || '' == $("#number").val()) {
			   
				alert("입력하신 정보를 확인해주세요. (공백불가)");
				return
				
			} else {
				console.log("==== 정보 업데이트 실행합니다. ====");
				
				var stname = $("#stname").val();
				var stmail = $("#stmail").val();
				var stcp = $("#stcp").val();
				var me_zipcode = $("#me_zipcode").val();
				var me_doro = $("#me_doro").val();
				var admissionyear = $("#admissionyear").val();
				var grade = $("#grade").val();
				var st_class = $("#class").val();
				var number = $("#number").val();
				
				console.log("====== 업데이트 요청 데이터 출력해보기 =======");
				console.log("stname >>> :" + stname);
				console.log("stmail >>> :" + stmail);
				console.log("stcp >>> :" + stcp);
				console.log("me_zipcode >>> :" + me_zipcode);
				console.log("me_doro >>> :" + me_doro);
				console.log("admissionyear >>> :" + admissionyear);
				console.log("grade >>> :" + grade);
				console.log("st_class >>> :" + st_class);
				console.log("number >>> :" + number);
				console.log("====================================");

				callAjaxUpdate( stname, stmail, stcp,
								me_zipcode, me_doro,
								admissionyear, grade, st_class,
								number);
				
			}
		});

		function callAjaxUpdate( stname, stmail, stcp,
								 me_zipcode, me_doro,
								 admissionyear, grade, st_class,
								 number ) {
			
			console.log("====== Ajax로 넘어온 데이터 확인 ======");
			console.log("stname >>> :" + stname);
			console.log("stmail >>> :" + stmail);
			console.log("stcp >>> :" + stcp);
			console.log("me_zipcode >>> :" + me_zipcode);
			console.log("me_doro >>> :" + me_doro);
			console.log("admissionyear >>> :" + admissionyear);
			console.log("grade >>> :" + grade);
			console.log("st_class >>> :" + st_class);
			console.log("number >>> :" + number);
			console.log("================================");
			
			alert("Ajax 데이터 통신 시작 >>> : 요청 데이터를 보냅니다.");
			
			let updateURL = "myPageUpdateRequestStudent.k"
			let reqType = "POST";
			let dataParam = {
					stname : stname,
					stmail : stmail,
					stcp : stcp,
					me_zipcode : me_zipcode,
					me_doro : me_doro,
					admissionyear : admissionyear,
					grade : grade,
					st_class : st_class,
					number : number
			};
			
			$.ajax({
				url : updateURL,
				type : reqType,
				data : dataParam,
				contentType : "application/x-www-form-urlencoded; charset=UTF-8",
				success : whenSuccess,
				error : whenError
			});
			
			function whenSuccess (resData) {
				console.log("받은 데이터 >>> : " + resData);
				
				if (resData == "success") {
					
					alert("업데이트가 완료되었습니다.");
					window.close();
					location.href="mainMyPage.k";
				} else if (redData == "fail") {
					alert("업데이트를 수행할 수 없습니다.");
				}
			}
			
			function whenError (e) {
				alert("에러가 발생했습니다. >>> : " + e.responseText);
			}
			
		}
		
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
	<br>이름 : <input type="text" name="stname" id="stname" value="${ data.ms_name }"><br>
	<br>이메일 : <input type="text" name="stmail" id="stmail" value=<%= ms_id %>><br>
	<br>핸드폰번호 : <input type="text" name="stcp" id="stcp" value="${ data.ms_cp }"><br>
	<br>
	우편번호 : <input type="text" name="me_zipcode" id="me_zipcode" style="width:50px" maxlength="6" value="${ data.ms_zipcode }">
	<br>
	<br>
	도로명주소 : <input type="text" name="me_doro" id="me_doro" style="width:250px" value=<%= ms_doro %>>
	<br>
	<br>
	입학년도 : <input type="text" name="admissionyear" id="admissionyear" value=<%= ms_whenjoin %>><br>
	<br>학년 :&nbsp; <input type="text" name="grade" id="grade" value="${ data.ms_grade }">
	&nbsp;반 :&nbsp; <input type="text" name="class" id="class" value=<%= ms_class %>>
	&nbsp;번호 :&nbsp; <input type="text" name="number" id="number" value="${ data.ms_number }">
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