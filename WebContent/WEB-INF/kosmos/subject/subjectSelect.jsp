<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.kosmos.subject.vo.KosmosSubjectVO" %>
<%@ page import="java.util.List" %>
<%@ page import="com.kosmos.common.SubjectUtils" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>과목 단일 조회</title>
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
		
		.div1{
			width: 300px;
			height: 400px;
			margin: 100px auto;
		}
		
		.div2{
			align:center;
			margin: 10px 90px;
		}
		
		h3{
			margin: 0px 80px;
		}
		
		table {
			margin: 10px auto;
		}
	</style>
	<% request.setCharacterEncoding("UTF-8"); %>	
	<%
		Object objS = request.getAttribute("listS");
		
		if (objS == null){
			System.out.println("subjectSelect.jsp : obj가 null");
			return;
		}
		
		List<KosmosSubjectVO> listS = (List<KosmosSubjectVO>)objS;
		KosmosSubjectVO svo = null;
		svo = new KosmosSubjectVO();
		svo = listS.get(0);
	%>
	<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			$(document).on("click", "#updateBtn", function(){
				
				$("#subjectUpdate").attr({
					'action':'subjectUpdate.k',
					'method':'GET',
					'enctype':'application/x-www-form-urlencoded'
				}).submit();
			});
			
			$(document).on("click", "#selectAllBtn", function(){
				$("#subjectSelect").attr({
					'action':'subjectSelectAll.k',
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
	<%	
		String sb_group = SubjectUtils.groupDBToFront(svo.getSb_group());
		String sb_grade = SubjectUtils.gradeDBToFront(svo.getSb_grade());
		String sb_semester = SubjectUtils.semesterDBToFront(svo.getSb_semester());
		if (svo.getSb_beforename() == null){
			svo.setSb_beforename("(없음)");
		}
	%>
	<div class="div1">
		<form id="subjectSelect" name="subjectSelect">
			<table>
				<thead>
					<h3>과목정보</h3>
				</thead>
				<tbody>
					<tr>
						<td>개설년도</td>
						<td><%= svo.getSb_year() %>년도</td>		
					</tr>
					<tr>
						<td>교과군</td>
						<td><%= sb_group %></td>	<!-- 번호 > 한글명으로 바꿔주기 -->
					</tr>
					<tr>
						<td>과목유형</td>
						<td><%= svo.getSb_type() %></td>
					</tr>
					<tr>
						<td>과목명</td>
						<td><%= svo.getSb_name() %></td>
					</tr>
					<tr>
						<td>이수단위</td>
						<td><%= svo.getSb_creditunit() %></td>
					</tr>
					<tr>
						<td>대상학년</td>
						<td><%= sb_grade %>학년</td>
					</tr>
					<tr>
						<td>대상학기</td>
						<td><%= sb_semester %>학기</td>	
					</tr>
					<tr>
						<td>담당교사</td>
						<td><%= svo.getSb_teacher() %></td>
					</tr>
					<tr>
						<td>정원</td>
						<td><%= svo.getSb_maxstu() %> 명</td>
					</tr>
					<tr>
						<td>수업요일</td>
						<td><%= svo.getSb_day() %>요일</td>		
					</tr>
					<tr>
						<td>수업교시</td>
						<td><%= svo.getSb_time() %>교시</td>		
					</tr>
					<tr>
						<td>선수과목명</td>
						<td><%= svo.getSb_beforename() %></td>				
					</tr>
					<tr>
						<td>등록일</td>
						<td><%= svo.getSb_insdate() %></td>		
					</tr>	
				</tbody>
			</table>
			<div class="div2">
				<input type="button" id="selectAllBtn" value="전체목록">
			</div>
		</form>
	</div>
	
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