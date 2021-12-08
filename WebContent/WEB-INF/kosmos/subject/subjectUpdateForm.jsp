<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.kosmos.subject.vo.KosmosSubjectVO" %>
<%@ page import="com.kosmos.common.AuthenticationKey" %>
<%@ page import="com.kosmos.common.SubjectUtils" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>과목 수정 페이지</title>
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
	<% request.setCharacterEncoding("UTF-8"); %>
	<%
		Object obj = request.getAttribute("listUF");
		if (obj == null){
			return;
		}
	%>
	<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script type="text/javascript">
	$(document).ready(function(){
		// 오늘 날짜 바인딩 
		document.getElementById('sb_upddate').value = new Date().toISOString().substring(0, 10);
		
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
		%>
				$("#sb_day").append("<option value='"+"<%= key_selectDay %>"+"'>"+ "<%= key_selectDay %>요일" +"</option>");
		<%
			}
		%>
		
		// 교시 드롭박스
		<%  String t = SubjectUtils.timeFrontToDB();
			String[] tArray = t.split(",");
			for (int i=0; i < tArray.length; i++){
				String key_selectTime = tArray[i];
		%>
				$("#sb_time").append("<option value='"+"<%= key_selectTime %>"+"'>"+ "<%= key_selectTime %>교시" +"</option>");
		<%
			}
		%>
		
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
			console.log("sb_beforeyn.val() >>> : " + document.getElementsByName("sb_beforeyn")[0].value);
			if($(this).prop('checked')){
				console.log("선수과목 있음");
				$("select[id='sb_beforename1']").attr("disabled", false);
				$("#sb_beforename2").attr("readonly", false);
			}
		});
		
		// 선수 과목 없음
		$("input:radio[id='sb_beforeyn2']").click(function(){
			console.log("sb_beforeyn.val() >>> : " + document.getElementsByName("sb_beforeyn")[1].value);
			if($(this).prop('checked')){
				console.log("선수과목 없음");
				$("#sb_beforename2").val('');
				$("select[id='sb_beforename1']").attr("disabled", true);
				$("#sb_beforename2").attr("readonly", true);
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
				$("#updateBtn").attr("disabled", false);
				$("#teacher_key").css("background-color", "lightgray");
			}else{
				alert("관리자 키와 일치하지 않습니다. 비밀번호를 다시 확인해주세요.");
				$("#teacher_key").val('');
				$("#teacher_key").focus();
			}
		});
		
		// 수정 완료 버튼
		$(document).on("click", "#updateBtn", function(){
			$("#subjectUpdateForm").attr({
				'action':'subjectUpdate.k',
				'method':'GET',
				'enctype':'application/x-www-form-urlencoded'
			}).submit();		
		});
		
		// 새등록 버튼
		$(document).on("click", "#insertBtn", function(){
			location.href="subjectInsertForm.k";
		});
		
		$(document).on("click", "#selectAllBtn", function(){
			location.href="subjectSelectAll.k";
		});
	});
	</script>
<body onload="compCheck()">
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
	
	<form id="subjectUpdateForm" name="subjectUpdateForm">
		<table border="1">
			<thead>
				<tr>
					<th colspan="5">과목 수정</th>
				</tr>
			</thead>
	<%
		List<KosmosSubjectVO> listUF = (List<KosmosSubjectVO>)obj;
		if (listUF != null && listUF.size() > 0){
			KosmosSubjectVO svo = listUF.get(0);
			String sb_grade = SubjectUtils.gradeDBToFront(svo.getSb_grade());
			String sb_group = SubjectUtils.groupDBToFront(svo.getSb_group());
			if (svo.getSb_beforename() == null){
				svo.setSb_beforename("");
			}
	%>
			<tbody>
				<script>
					function compCheck() {
						// 과목유형 체크 
						var type = '<%= svo.getSb_type() %>';
						if ("필수" == type){
							$("#sb_type1").prop("checked", true);
						}
						if ("선택" == type){
							$("#sb_type2").prop("checked", true);
						}
						
						// 선수과목여부 체크
						var beforeyn = '<%= svo.getSb_beforeyn() %>';
						if ("Y" == beforeyn){
							$("#sb_beforeyn1").prop("checked", true);
						}
						if ("N" == beforeyn){
							$("#sb_beforeyn2").prop("checked", true);
						}
						
						// 선수과목 있음 체크
						if ($("#sb_beforeyn1").is(':checked')){
							console.log("sb_beforeyn.val()" + document.getElementsByName("sb_beforeyn")[0].value);
							$("select[id='sb_beforename1']").attr("disabled", false);
							$("#sb_beforename2").attr("readonly", false);
						}
						
						// 선수과목 없음 체크
						if ($("#sb_beforeyn2").is(':checked')){
							console.log("sb_beforeyn.val()" + document.getElementsByName("sb_beforeyn")[1].value);
							$("select[id='sb_beforename1']").attr("disabled", true);
							$("#sb_beforename2").attr("readonly", true);
						}
						
					}	// end of function compCheck()
				</script>
				<tr>
					<td colspan="5">
					<input type="hidden" id="sb_num" name="sb_num" value="<%= svo.getSb_num() %>" readonly />
					개설년도<input id="sb_year" name="sb_year" value="<%= svo.getSb_year() %>" style=width:30px; readonly>
					교과군 
					<select id="sb_group" name="sb_group">
						<option value="<%= svo.getSb_group() %>"><%= sb_group %></option>
					</select>
				</tr>
				<tr>
				<td>
					<!-- 과목유형 -->
						<input type="radio" id="sb_type1" name="sb_type" value="필수" checked>필수
						<input type="radio" id="sb_type2" name="sb_type" value="선택">선택
					</td>
				</tr>
				<tr>
					<td>과목명</td>
					<td>
						<input type="text" id="sb_name" name="sb_name" value="<%= svo.getSb_name() %>" readonly>	
					</td>
				</tr>
				<tr>
					<td colspan="5">
						대상학년/학기
						<select id="sb_grade" name="sb_grade">
							<option value="<%= svo.getSb_grade() %>"><%= svo.getSb_grade() %>학년</option>	
						</select>
						<select id="sb_semester" name="sb_semester">
							<option value="<%= svo.getSb_semester() %>"><%= svo.getSb_semester() %>학기</option>
						</select>
						이수단위
						<select id="sb_creditunit" name="sb_creditunit">
							<option value="<%= svo.getSb_creditunit() %>"><%= svo.getSb_creditunit() %></option>
						</select>
					</td>
				</tr>
				<tr>
					<td>담당교사</td>
					<td><input type="text" id="sb_teacher" name="sb_teacher" value="<%= svo.getSb_teacher() %>">
                       	<!-- 해당 과목의 모든 선생님 일단 목록 다 나와야 하고, 선택하면 그 선생님의 정보에 대해서만 수정 가능하게.. (시간남으면 수정) -->
                   <!-- <button type="button" id="search_teacher" name="search_teacher">검색</button> -->    	
					</td>
				</tr>
				<tr>
					<td colspan="5">
						수업요일/교시
						<select id="sb_day" name="sb_day">
							<option value="<%= svo.getSb_day() %>"><%= svo.getSb_day() %>요일</option>
						</select>
						<select id="sb_time" name="sb_time">
							<option value="<%= svo.getSb_time() %>"><%= svo.getSb_time() %>교시</option>
						</select>
						정원
						<select id="sb_maxstu" name="sb_maxstu">
							<option value="<%= svo.getSb_maxstu() %>"><%= svo.getSb_maxstu() %></option>
							<option value=""> - </option>
							<option value="20">20</option>
							<option value="25">25</option>
							<option value="30">30</option>
						</select>
					</td>
				</tr>
				<tr>
					<td colspan="5">
						선수과목 
						<input type="radio" id="sb_beforeyn1" name="sb_beforeyn" value="Y">있음
						<input type="radio" id="sb_beforeyn2" name="sb_beforeyn" value="N">없음
					</td>
				</tr>
				<tr>
					<td colspan="5">
						선수과목명
						<input type="text" id="sb_beforename2" name="sb_beforename" value="<%= svo.getSb_beforename() %>">
						<select id="sb_beforename1" name="sb_beforename1"></select>
					</td>					
				</tr>
				<tr>
					<td>수정일</td>
					<td><input id="sb_upddate" name="sb_upddate" readonly></td>	
				</tr>
			</tbody>
	<%		
		}
	%>
			<tr>
				<td colspan="5">
					과목 등록을 위한 관리자님의 비밀번호를 입력해주세요.<br>
					<input type="password" id="teacher_key" name="teacher_key" value="#kosmos2021!">
					<button type="button" id="keyCheck" name="keyCheck">확인</button>
					<input type="hidden" id="auth_teacher_key" name="auth_teacher_key" value=<%= AuthenticationKey.TEACHER_KEY %>>
				</td>
			</tr>
			<tr>
				<td colspan="5" align="left">
					<input type="button" id="updateBtn" value="수정완료" disabled>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="button" id="insertBtn" value="새등록">
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