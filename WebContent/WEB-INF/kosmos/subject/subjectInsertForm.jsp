<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kosmos.common.AuthenticationKey" %>
<%@ page import="com.kosmos.common.SubjectUtils" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>과목입력 폼</title>
  <link rel="stylesheet" href="default.css">
  <link rel="stylesheet" href="gnb3.css">
  <script src="js/jquery.js" charset="utf-8"></script>
  <script src="js/gnb3.js" charset="utf-8"></script>
</head>
<style type="text/css">
		tr, td {
			text-align: center;
		}
		
		.content-top{
			height: 60px;
		}
		
		#s_left{
			border: 1px solid black;
			width:20%;
			height:700px;
			float:left;
		}
		
		#s_right{
			border: 1px solid black;
			width:20%;
			height:700px;
			float:left;
		}
		
		#contents{
			border: 1px solid black;
			width: 59.5%;
			float:left;
		}
		
		#footer{
			border-top:double;
			width:100%;
			height:70px;
			float:bottom;
		}
		
		table {
		    width: 500px;
		    height: 200px;
		  }
		
	</style>
	<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			// 오늘 날짜 바인딩 
			document.getElementById('sb_insdate').value = new Date().toISOString().substring(0, 10);
		
			// 선수과목명 select박스 선택에 따라 text박스 활성화 or 비활성화 설정
			$("#sb_beforename1").change(function(){
				$("#sb_beforename1 option:selected").each(function(){
					console.log("$(this).val() >>> : " + $(this).val());
					if($(this).val() == '직접입력'){	// 직접입력일 경우
						var aa = $("#sb_beforename2").val();	
						console.log("aa >>> : " + aa);					// 텍스트박스 직접입력되는 값 확인
						$("#sb_beforename2").val('');					// 값 초기화
						$("#sb_beforename2").attr("readonly", false);	// 텍스트박스 활성화
					}else{							// 직접입력이 아닐 경우
						$("#sb_beforename2").val($(this).text());		// 선택값 입력
						$("#sb_beforename2").attr("readonly", true);	// 텍스트박스 비활성화
					}
				});
			});
			
			// 개설년도 드롭박스
			var thisDate = new Date();
			var thisYear = thisDate.getFullYear();	
			for (var i = (thisYear-5); i < (thisYear+5); i++){
				if (i < thisYear){
					$("#key_sbyear").append("<option value='"+i+"'>"+i+"</option>");	
				}
			}
			$("#key_sbyear").append("<option value='"+thisYear+"' selected>"+thisYear+"</option>");	
			for (var i = (thisYear-5); i < (thisYear+5); i++){
				if (i > thisYear){
					$("#key_sbyear").append("<option value='"+i+"'>"+i+"</option>");	
				}
			}
			
			// 학년 드롭박스
			<%  String g = SubjectUtils.gradeFrontToDB();
				String[] gArray = g.split(",");
				for (int i=0; i < gArray.length; i++){
					String key_selectGrade = gArray[i];
			%>
					$("#sb_grade").append("<option value='"+"<%= i %>"+"'>"+ "<%= key_selectGrade %>학년" +"</option>");
			<%
				}
			%>
			
			// 이수단위 드롭박스
			$("#sb_creditunit").append("<option value=''>"+" - "+"</option>");	
			for (var i=1; i < 4; i++){
				$("#sb_creditunit").append("<option value='"+i+"'>"+i+"</option>");	
			}
			
			// 학기 드롭박스
			<%  String s = SubjectUtils.semesterFrontToDB();
				String[] sArray = s.split(",");
				for (int i=0; i < sArray.length; i++){
					String key_selectSemester = sArray[i];
			%>
					$("#sb_semester").append("<option value='"+"<%= i %>"+"'>"+ "<%= key_selectSemester %>학기" +"</option>");
			<%
				}
			%>
			
			// 수업요일 드롭박스
			<%  String d = SubjectUtils.dayFrontToDB();
				String[] dArray = d.split(",");
				for (int i=0; i < dArray.length; i++){
					String key_selectDay = dArray[i];
					if (i == 0){
			%>
					$("#sb_day").append("<option value=''>"+ "<%= key_selectDay %>요일" +"</option>");
			<%
					}else{
			%>
					$("#sb_day").append("<option value='"+"<%= key_selectDay %>"+"'>"+ "<%= key_selectDay %>요일" +"</option>");
			<%
					}
				}
			%>
			
			// 수업교시 (1 ~ 8교시)
			for (var i=1; i <= 8; i++){
				$("#sb_time").append("<option value='"+i+"'>"+i+"교시</option>");
			}
			
			// 선수과목명
			<% 
			String b = SubjectUtils.beforenameFrontToDB();
			String[] bArray = b.split(",");
			for (int i=0; i < bArray.length; i++){
				String key_beforename = bArray[i];
			%>
				$("#sb_beforename1").append("<option value='"+"<%= key_beforename %>"+"'>"+ "<%= key_beforename %>" +"</option>");		
			<%
			}	
			%>
			
			// 교과군
			<% 
			String r = SubjectUtils.groupFrontToDB();
			String[] rArray = r.split(",");
			for (int i=0; i < rArray.length; i++){
				String key_group = rArray[i];
				String intToString = String.format("%02d", i);
			%>
				$("#sb_group").append("<option value='"+"<%= intToString %>"+"'>"+ "<%= key_group %>" +"</option>");
			<%
			}	
			%>
			
			// 선수 과목 있음
			$("input:radio[id='sb_beforeyn1']").click(function(){
				console.log("sb_beforeyn.val()" + document.getElementsByName("sb_beforeyn")[0].value);
				if($(this).prop('checked')){
					console.log("선수과목 있음");
					$("select[id='sb_beforename1']").attr("disabled", false);
					$("#sb_beforename2").attr("disabled", false);
				}
			});
			
			// 선수 과목 없음
			$("input:radio[id='sb_beforeyn2']").click(function(){
				console.log("sb_beforeyn.val()" + document.getElementsByName("sb_beforeyn")[1].value);
				if($(this).prop('checked')){
					console.log("선수과목 없음");
					$("select[id='sb_beforename1']").attr("disabled", true);
					$("#sb_beforename2").attr("disabled", true);
				}
			});
			
			// 관리자 키 확인
			$("#keyCheck").click(function(){
				var key = $("#teacher_key").val();
				var key_auth = $("#auth_teacher_key").val();
				
				alert("key : key_auth " + key + " : " + key_auth);
				
				if (key == key_auth){
					alert("관리자 키와 일치합니다. 과목정보를 수정하실 수 있습니다.");
					key = '';
					
					$("#teacher_key").attr("disabled", true);
					$("#insertBtn").attr("disabled", false);
					$("#teacher_key").css("background-color", "lightgray");
				}else{
					alert("관리자 키와 일치하지 않습니다. 비밀번호를 다시 확인해주세요.");
					$("#teacher_key").val('');
					$("#teacher_key").focus();
				}
			});
			
			// border 색 바꾸는 함수 만드는 중 (수정 중)
			function changeBorderToRed(myval){
				var test = $("#myval");
				alert("myval >>> : " + myval);
				if (test.val() == 0){
					alert(test.id + "을(를) 선택해주세요.");
					$("#myval").focus();
					$("#myval").css("border", "1px solid red");
				}
			}
				
			// 등록 버튼 누르면
			$(document).on("click", "#insertBtn", function(){
				alert("(확인용) insertBtn >>> : ");				
			
				if ($("#sb_grade").val() == 0){
					alert("학년을 선택해주세요.");
					$("#sb_grade").focus();
					$("#sb_grade").css("border", "1px solid red");
					return;
				}else if($("#sb_semester").val() == 0){
					alert("학기를 선택해주세요.");
					$("#sb_semester").focus();
					$("#sb_semester").css("border", "1px solid red");
					return;
				} else if ($("#sb_day").val() == ''){
					alert("요일을 선택해주세요.");
					$("#sb_day").css("border", "1px solid red");
					$("#sb_day").focus();
					return;
				} else if ($("#sb_time").val() == ''){
					alert("교시를 선택해주세요.");
					$("#sb_time").css("border", "1px solid red");
					$("#sb_time").focus();
					return;
				} else if ($("#sb_name").val() == 0){
					alert("과목명을 선택해주세요.");
					$("#sb_name").focus();
					$("#sb_name").css("border", "1px solid red");
					return;
				} else if (document.getElementsByName("sb_beforeyn")[0].checked == true){
					if ($("#sb_beforename1").val() == "없음" && $("#sb_beforename2").val() == ''){
						alert("선수과목이 있는 과목입니다. 선수과목명을 입력해주세요.");
						console.log("sb_beforename1.val() >>> : " + $("#sb_beforename1").val());
						console.log("sb_beforename2.val() >>> : " + $("#sb_beforename2").val());
						$("#sb_beforename1").focus();
						$("#sb_beforename2").focus();
						$("#sb_beforename1").css("border", "1px solid red");
						$("#sb_beforename2").css("border", "1px solid red");
						return;	
					}
				} else if ($("#sb_teacher").val() == ''){
					alert("담당교사명을 입력해주세요.");
					$("#sb_teacher").css("border", "1px solid red");
					$("#sb_teacher").focus();
					return;
				} 
				
				// 등록 버튼 클릭하면
				// 로그인한 아이디가 T로 시작하는 아이디인지 확인 필요.
				$("#subjectInsertForm").attr({
					'action':'subjectInsert.k',
					'method':'GET',
					'enctype':'application/x-www-urlencoded'
				}).submit();
			});
			
			$(document).on("click", "#selectAllBtn", function(){
				location.href="subjectSelectAll.k";
			});
		});
	</script>
<body>
<div style="width:1400px; margin:0 auto;"></div>
<header>
  <h1><a href="">코스모스고등학교<span class="hide"></span></a></h1>
  <nav>
    <ul class="gnb">
      <li>
        <a href="kosmos_main_page.html">Home</a>
      </li>
      <li>
          <a href="#">Login</a>
      </li>
      <li>
        <a href="#">학교 소개</a>
        <ul>
          <li><a href="kosmos_words.html">학교장 인사</a></li>
          <li><a href="kosmos_history.html">학교 연혁</a></li>
          <li><a href="kosmos_info.html">학교 소개</a></li>
          <li><a href="kosmos_symbol.html">학교 상징</a></li>
          <li> <a href="kosmos_map.html">학교 위치</a></li>
        </ul>
      </li>
      <li>
        <a href="#">수강신청</a>
      </li>
      <li>
        <a href="#">수업정보</a>
        <ul>
          <li><a href="#">과목정보</a></li>
          <li><a href="#">시간표</a></li>
        </ul>
      </li>
      <li>
        <a href="#">공지사항</a>
      </li>
      <li>
      	<a href="#">코스모스숲</a>
      </li>
      <li>
      	<a href="#">마이페이지</a>
      </li>
    </ul>
  </nav>
</header>
<div class="bg_gnb"></div>
<div class="content-top">제일 위</div>
<div class="content" align="center">
	<div id="s_left">사이드바 왼쪽</div>
	<div id="contents">
	
	<hr>
	<form id="subjectInsertForm" name="subjectInsertForm">
		과목코드, 과목명, 담당교사 Ajax ㄱㄱ<br>
		(테스트 시 편의를 위해 임시로 관리자 비밀번호 입력해두었습니다.)
		<br><br>
		<table border="1">
			<thead>
				<tr>
					<th colspan="10" style="font-size: 20px;">과목 등록</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td colspan="5">
						개설년도<select id="key_sbyear" name="key_sbyear"></select>
						대상학년/개설학기
						<select id="sb_grade" name="sb_grade"></select>
						<select id="sb_semester" name="sb_semester"></select>
					</td>
				</tr>
				<tr>
					<td colspan="5">
					교과군 <select id="sb_group" name="sb_group"></select>
					<!-- 각 과목마다 순번이 있고, 저장된 값이 있으면, 저장되지 않은 값이 있음. DB와 연결하여 찾아야 함. 
						 ID 찾기 코드 사용하기 -->
					과목코드
						<input type="text" id="sb_code" name="sb_code" value="" style="width:20px">
					<!-- 과목유형 -->
						<input type="radio" id="sb_type1" name="sb_type" value="필수" checked>필수
						<input type="radio" id="sb_type2" name="sb_type" value="선택">선택
					</td>
				</tr>
				<tr>
					<td colspan="5">
						수업요일/교시
						<select id="sb_day" name="sb_day"></select>
						<select id="sb_time" name="sb_time"></select>
						이수단위
						<select id="sb_creditunit" name="sb_creditunit"></select>
						정원
						<select id="sb_maxstu" name="sb_maxstu">
							<option value="20">20</option>
							<option value="25">25</option>
							<option value="30">30</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>과목명</td>
					<td>
						<div>
							<!-- db에 있는 정보와 일치하면 검색 / db에 있는 정보와 일치하지 않으면 색 변하면서 (새로 입력) 메시지 보이게 -->
							<input type="text" id="sb_name" name="sb_name" placeholder="직접입력">
							<!-- <button type="button">검색</button> -->
						</div>
						<div>
							선수과목 
							<input type="radio" id="sb_beforeyn1" name="sb_beforeyn" value="Y" checked>있음
							<input type="radio" id="sb_beforeyn2" name="sb_beforeyn" value="N">없음
						</div>
					</td>
				</tr>
				<tr>
					<td>선수과목명</td>
					<td>
						<input type="text" id="sb_beforename2" name="sb_beforename" placeholder="직접입력">
						<select id="sb_beforename1" name="sb_beforename1"></select>
					</td>					
				</tr>
				<tr>
					<td>담당교사</td>
					<td>
                        <input type="text" id="sb_teacher" name="sb_teacher">
					</td>
				</tr>
				<tr>
					<td>등록일</td>
					<td>
						<input type="date" id="sb_insdate" name="sb_insdate" readonly>
					</td>	
				</tr>
			</tbody>
			<tr>
				<td colspan="5">
					과목 등록을 위한 관리자님의 비밀번호를 입력해주세요.<br>
					<input type="password" id="teacher_key" name="teacher_key" value="#kosmos2021!">
					<button type="button" id="keyCheck" name="keyCheck">확인</button>
					<input type="hidden" id="auth_teacher_key" name="auth_teacher_key" value=<%= AuthenticationKey.TEACHER_KEY %>>
				</td>
			</tr>
			<tr>
				<td colspan="5" align="right">
					<input type="button" id="insertBtn" value="등록" disabled >
					<input type="button" id="selectAllBtn" value="전체목록">
				</td>
			</tr>
		</table>
	</form>
	
	</div>
	<div id="s_right">사이드바 오른쪽</div>
	<div id="footer" align="center">
		<div class="container">
			서울 금천구 가산동 8명로 88 코스모스고등학교 <br/>
			교무실 02-123-4567(09:00~17:00) 행정실 02-7654-3210(09:00~24:00)<br/>
			Copyright (c) 코스모스고등학교 All Rights Reseved
		</div>
	</div>
</div>
</body>
</html>