<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.kosmos.subject.vo.KosmosSubjectVO" %>
<%@ page import="com.kosmos.common.SubjectUtils" %> 
<%@ page import="com.kosmos.login.vo.KosmosLoginVO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>전체목록 + 개설강좌검색</title>
  <link rel="stylesheet" href="default.css">
  <link rel="stylesheet" href="gnb3.css">
  <script src="js/jquery.js" charset="utf-8"></script>
  <script src="js/gnb3.js" charset="utf-8"></script>
</head>
<style type="text/css">
		.btnclr{
			border: 0;
			background: 0;
		}
		
		/*
		table{
			display:inline-block;
		}
		*/
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
		
		.tableSearch{
			width: 600px;
			height: 80px;
		}
				
		.tableSA{
			width: 800px;
		}
		
		#sub_menu {
			width: 234px;
			float: right;
			margin-top: 25px;
			border: solid 1px blue;
		} 

		#sub_menu li {
			font-size: 18px;
			padding: 10px;
			border-bottom: dotted 1px #cccccc;
		}
	</style>
	<%
		request.setCharacterEncoding("UTF-8");
	%>
	<%
		// 페이징 변수 세팅
			int pageSize = 0;
			int groupSize = 0;
			int curPage = 0;
			int totalCount = 0;
			
			Object objPaging = request.getAttribute("pagingSVO");
			KosmosSubjectVO pagingSVO = (KosmosSubjectVO)objPaging;
			
			Object obj = request.getAttribute("listSA");
			if (obj == null){
		System.out.println("obj가 null");
			}
			ArrayList<KosmosSubjectVO> listSA = (ArrayList<KosmosSubjectVO>)obj;
	%>
	<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script type="text/javascript">
	$(document).ready(function(){
		
		$(document).on("click", "#sb_num", function(){
			if($(this).prop('checked')){
				alert("체크박스 체크 확인 >>> : " + $(this).val());
				$("input:checkbox[name='sb_num']").prop('checked', false);		// 다른 체크박스 해제
				$(this).prop('checked', true);									// 선택한 체크박스 선택
			}
		});
		
		// 개설년도 드롭박스
		var thisDate = new Date();
		var thisYear = thisDate.getFullYear();
		$("#key_sbyear").append("<option value=''>"+"전체"+"</option>");	
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
		<%String g = SubjectUtils.gradeFrontToDB();
			String[] gArray = g.split(",");
			for (int i=0; i < gArray.length; i++){
				String key_selectGrade = gArray[i];%>
				$("#key_sbgrade").append("<option value='"+"<%= i %>"+"'>"+ "<%=key_selectGrade%>학년" +"</option>");
		<%}%>
		
		// 학기 드롭박스
		<%String s = SubjectUtils.semesterFrontToDB();
			String[] sArray = s.split(",");
			for (int i=0; i < sArray.length; i++){
				String key_selectSemester = sArray[i];%>
				$("#key_sbsemester").append("<option value='"+"<%= i %>"+"'>"+ "<%=key_selectSemester%>학기" +"</option>");
		<%}%>
		
		// 요일 드롭박스
		<%String d = SubjectUtils.dayFrontToDB();
			String[] dArray = d.split(",");
			for (int i=0; i < dArray.length; i++){
				String key_selectDay = dArray[i];%>
				$("#key_sbday").append("<option value='"+"<%= key_selectDay %>"+"'>"+ "<%=key_selectDay%>요일" +"</option>");
		<%}%>
		
		// 교시 드롭박스
		<%String t = SubjectUtils.timeFrontToDB();
			String[] tArray = t.split(",");
			for (int i=0; i < tArray.length; i++){
				String key_selectTime = tArray[i];%>
				$("#key_sbtime").append("<option value='"+"<%= key_selectTime %>"+"'>"+ "<%=key_selectTime%>교시" +"</option>");
		<%}%>
		
		// 과목명 클릭 후 단일 조회
		$(document).on("click", "#searchBtn", function(){
			$("#subjectSelectAll").attr({
				'action':'subjectSelectAll.k',
				'method':'GET',
				'enctype':'application/x-www-form-urlencoded'
			}).submit();
		});
		
		$(document).on("click", "#selectBtn", function(){
			$("#subjectSelectAll").attr({
				'action':'subjectSelect.k',
				'method':'GET',
				'enctype':'application/x-www-form-urlencoded'
			}).submit();
		});
		
		$(document).on("click", "#updateBtn", function(){
			$("#subjectSelectAll").attr({
				'action':'subjectUpdateForm.k',
				'method':'GET',
				'enctype':'application/x-www-form-urlencoded'
			}).submit();
		});
		
		$(document).on("click", "#insertBtn", function(){
			location.href="subjectInsertForm.k";
		});
		
		$(document).on("click", "#deleteBtn", function(){
			$("#subjectSelectAll").attr({
				'action':'subjectDelete.k',
				'method':'GET',
				'enctype':'application/x-www-form-urlencoded'
			}).submit();
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
          <li><a href="#subjectSelectAll.k">과목정보</a></li>
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
	<div id="s_left"></div>
	<div id="contents">
	<hr>
	<hr>
	<h3 style="font-size:30px;">개설 강좌 목록</h3>
		<form id="subjectSelectAll" name="subjectSelectAll">
			<table border="1" align="center" class="tableSearch">
				<thead>
					<tr>
						<th>개설년도</th>
						<td><select id="key_sbyear" name="key_sbyear"></select></td>
					</tr>
					<tr>
						<th>대상학년</th>		<!-- 드롭박스 -->
						<td><select id="key_sbgrade" name="key_sbgrade"></select></td>
						<th>대상학기</th>		<!-- 드롭박스 -->
						<td><select id="key_sbsemester" name="key_sbsemester"></select></td>
						<td rowspan="5" align="center">
							<button type="button" id="searchBtn">검색</button>	
						</td>
					</tr>
					<tr>
						<th>과목명</th>	<!-- 텍스트 -->
						<td><input type="text" id="key_sbname" name="key_sbname" placeholder="직접입력" /></td>	
						<th>담당교사명</th>	<!-- 텍스트 -->
						<td><input type="text" id="key_sbteacher" name="key_sbteacher" placeholder="직접입력" /></td>
					</tr>
					<tr>
						<th>수업요일</th>		<!-- 드롭박스 -->
						<td><select id="key_sbday" name="key_sbday"></select></td>
						<th>수업교시</th>		<!-- 드롭박스 -->
						<td><select id="key_sbtime" name="key_sbtime"></select></td>		
					</tr>
				</thead>
			</table>
			<br>
			<table border="1" class="tableSA">
				<thead>
					<tr>
						<th><input type="checkbox" id="chkTop" name="chkTop"></th>
						<th>개설년도</th>
						<th>교과군</th>	<!-- 국어, 영어, 수학, 사회, 과학 -->
						<th>과목코드</th>
						<th>과목유형</th>	<!-- 필수/선택 -->
						<th>과목명</th>
						<th>이수단위</th>	<!-- 1, 2, 3 -->
						<th>대상학년</th>	<!-- 1, 2, 3, 4(전) 학년 --> 
						<th>대상학기</th>
						<th>담당교사명</th>
						<th>정원</th>
						<th>수업요일</th>	
						<th>수업교시</th> 
						<th>선수과목명</th>
					</tr>
				</thead>
			<%
				if (listSA != null && listSA.size() >= 0){
					for (int i=0; i < listSA.size(); i++){
						KosmosSubjectVO svo = listSA.get(i);
						// 패이징 새팅
						pageSize = Integer.parseInt(pagingSVO.getPageSize());
						groupSize = Integer.parseInt(pagingSVO.getGroupSize());
						curPage = Integer.parseInt(pagingSVO.getCurPage());
						totalCount = Integer.parseInt(svo.getTotalCount());
						
						String sb_grade = SubjectUtils.gradeDBToFront(svo.getSb_grade());
						String sb_group = SubjectUtils.groupDBToFront(svo.getSb_group());
						String sb_semester = SubjectUtils.semesterDBToFront(svo.getSb_semester());
						if (svo.getSb_beforename() == null){
							svo.setSb_beforename("(없음)");
						}
			%>
					<tbody>
						<tr>
							<th><input type="checkbox" id="sb_num" name="sb_num" value="<%= svo.getSb_num() %>"></th>
							<td><%= svo.getSb_year() %></td>
							<td><%= sb_group %></td>	<!-- 국어, 영어, 수학, 사회, 과학 -->
							<td><%= svo.getSb_code() %></td>
							<td><%= svo.getSb_type() %></td>	<!-- 필수/선택 -->
							<td><a href="subjectSelect.k"><input type="hidden" id="sb_name" name ="sb_name" value="<%= svo.getSb_num() %>"><%= svo.getSb_name()%></a></td>
							<td><%= svo.getSb_creditunit() %></td>	<!-- 1, 2, 3 -->
							<td><%= sb_grade %>학년</td>	<!-- 1, 2, 3 학년 -->
							<td><%= sb_semester %>학기</td>
							<td><%= svo.getSb_teacher() %></td>
							<td><%= svo.getSb_maxstu() %> 명</td>
							<td><%= svo.getSb_day() %>요일</td>	
							<td><%= svo.getSb_time() %>교시</td>
							<td><%= svo.getSb_beforename() %></td>
						</tr>
					</tbody>	
			<%
				}	// end of for
			}
			%>
				<tr>
					<td colspan="20" align="center">
						<input type="button" id="selectBtn" value="조회">
			<%
				Object obj1 = session.getAttribute("result");
				KosmosLoginVO lvo = (KosmosLoginVO)obj1;
				String mt_id = lvo.getMt_id();
				if (mt_id != null){
			%>
						<input type="button" id="insertBtn" value="새등록">
						<input type="button" id="updateBtn" value="수정">
						<input type="button" id="deleteBtn" value="삭제">
			<%
				};
			 %>
					</td>
				</tr>
				<tr>
					<td colspan="20">
						<jsp:include page ="subjectPaging.jsp" flush="true">
							<jsp:param value="subjectSelectAll.k" name="url"/>
							<jsp:param value="" name="str"/>
							<jsp:param value="<%= pageSize %>" name="pageSize"/>
							<jsp:param value="<%= groupSize %>"	name="groupSize"/>
							<jsp:param value="<%= curPage %>" name="curPage"/>
							<jsp:param value="<%= totalCount %>" name="totalCount"/>
						</jsp:include>
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