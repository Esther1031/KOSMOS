<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kosmos.school.vo.KosmosSchoolVO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Arrays" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>time table</title>
  <link rel="stylesheet" href="default.css">
  <link rel="stylesheet" href="gnb3.css">
  <script src="js/jquery.js" charset="utf-8"></script>
  <script src="js/gnb3.js" charset="utf-8"></script>
</head>
<style type="text/css">

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
		height:700px;
	}
	
	#footer{
		border-top:double;
		width:100%;
		height:70px;
		float:bottom;
	}
	
	table {
	  border-collapse: collapse;
	  text-align: center;
	  line-height: 1.5;
	  border-top: 1px solid #ccc;
	  border-bottom: 2px solid #036;
	  margin : 0px;
	  width:550px;
	  font-weight:bold;
	  font-family:Monospace;
	  box-shadow:4px 4px 10px gray;
	}
	
	table th {
	  width: 200px;
	  padding: 10px;
	  font-weight: bold;
	  vertical-align: top;
	  color: #153d73;
	  border-right: 1px solid #ccc;
	  border-bottom: 3px solid #036;
	  background-color:#D2E1FF;
	}
	
	table td {
	  width: 200px;
	  padding: 10px;
	  vertical-align: top;
	  border-right: 1px solid #ccc;
	  border-bottom: 1px solid #ccc;
	  font-size:13px;
	}
	
	.time{
		 background-color:#EBF5FF;
		 font-size: 17px;
	}
	
	.hd{
		font-size:50px;
		text-shadow:4px 4px 6px gray; 
		font-family:Monospace;
		color:#5A78AF;
		margin-top:40px;
	}
	
	.day{
		font-size: 17px;
	}
</style>
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
          <li><a href="subjectSelectAll.k">과목정보</a></li>
          <li><a href="mainTimeTable.k">시간표</a></li>
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
	<% request.setCharacterEncoding("UTF-8"); %>
	<%
		Object obj = request.getAttribute("listall");
		List<KosmosSchoolVO> listall = (List<KosmosSchoolVO>)obj;
	%>
	<br>
	<div class="hd" align="center">시 &nbsp;간 &nbsp;표</div><br>
	<div align="center">
	<table>
		<tr>
			<th></th>
			<th class="day">월</th>
			<th class="day">화</th>
			<th class="day">수</th>
			<th class="day">목</th>
			<th class="day">금</th>
		</tr>
		<tr>
			<td class="time">1</td>
			<td><%= listall.get(0).getMon() %></td>
			<td><%= listall.get(0).getTue() %></td>
			<td><%= listall.get(0).getWen() %></td>
			<td><%= listall.get(0).getThu() %></td>
			<td><%= listall.get(0).getFri() %></td>
		</tr>
		<tr>
			<td class="time">2</td>
			<td><%= listall.get(1).getMon() %></td>
			<td><%= listall.get(1).getTue() %></td>
			<td><%= listall.get(1).getWen() %></td>
			<td><%= listall.get(1).getThu() %></td>
			<td><%= listall.get(1).getFri() %></td>
		</tr>
		<tr>
			<td class="time">3</td>
			<td><%= listall.get(2).getMon() %></td>
			<td><%= listall.get(2).getTue() %></td>
			<td><%= listall.get(2).getWen() %></td>
			<td><%= listall.get(2).getThu() %></td>
			<td><%= listall.get(2).getFri() %></td>
		</tr>
		<tr>
			<td class="time">4</td>
			<td><%= listall.get(3).getMon() %></td>
			<td><%= listall.get(3).getTue() %></td>
			<td><%= listall.get(3).getWen() %></td>
			<td><%= listall.get(3).getThu() %></td>
			<td><%= listall.get(3).getFri() %></td>
		</tr>
		<tr>
			<td class="time">5</td>
			<td><%= listall.get(4).getMon() %></td>
			<td><%= listall.get(4).getTue() %></td>
			<td><%= listall.get(4).getWen() %></td>
			<td><%= listall.get(4).getThu() %></td>
			<td><%= listall.get(4).getFri() %></td>
		</tr>
		<tr>
			<td class="time">6</td>
			<td><%= listall.get(5).getMon() %></td>
			<td><%= listall.get(5).getTue() %></td>
			<td><%= listall.get(5).getWen() %></td>
			<td><%= listall.get(5).getThu() %></td>
			<td><%= listall.get(5).getFri() %></td>
		</tr>
		<tr>
			<td class="time">7</td>
			<td><%= listall.get(6).getMon() %></td>
			<td><%= listall.get(6).getTue() %></td>
			<td><%= listall.get(6).getWen() %></td>
			<td><%= listall.get(6).getThu() %></td>
			<td><%= listall.get(6).getFri() %></td>
		</tr>
	</table>
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