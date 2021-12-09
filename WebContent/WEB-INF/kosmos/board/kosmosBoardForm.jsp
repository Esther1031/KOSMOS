<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>BOARD : 게시판 : 글쓰기 </title>
<link rel="stylesheet" href="default.css">
  <link rel="stylesheet" href="gnb3.css">
  <script src="js/jquery.js" charset="utf-8"></script>
  <script src="js/gnb3.js" charset="utf-8"></script>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">

	$(document).ready(function(){
		$(document).on("click", "#sbbtn", function(){
			console.log("sbbtn >>> : ");								
			$('#boardForm').attr({
				'action':'boardInsert.k',
				'method':'POST',
				'enctype':'multipart/form-data'
			}).submit();
		});
	});	
</script>
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
	}
	
	#footer{
		border-top:double;
		width:100%;
		height:70px;
		float:bottom;
	}
	
</style>
<body><div style="width:1400px; margin:0 auto;"></div>
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
	<form name="boardForm" id="boardForm">
<table border="1" align="center">
	<tr>
		<td colspan="2" align="center">게시판 글쓰기</td>				
	</tr>
	<tr>
		<td align="center">게시글번호</td>
		<!-- readonly을 사용해서 bo_num를 사용할 수 없게 만든다.-->
		<td><input type="text" name="bo_num" id="bo_num" size="20" readonly></td>
	</tr>
	<tr>
		<td align="center">게시판말머리</td>
		<td><input type="text" name="bo_header" id="bo_header" size="53"></td>
	</tr>
	<tr>
		<td align="center">제목</td>
		<td><input type="text" name="bo_subject" id="bo_subject" size="53"></td>
	</tr>
	<tr>
		<td  align="center">회원번호</td>.
		<td><input type="text" name="ms_num" id="ms_num" size="53"></td>
	</tr>
	<tr>
		<td  align="center">게시판비밀번호</td>
		<td><input type="password" name="bo_pw" id="bo_pw" size="20"></td>
	</tr>
	<tr>
		<td  align="center">게시글 내용</td>
		<td>
		<textarea name="bo_contents" id="bo_contents" cols="50" rows="10"></textarea>
	</td>
	</tr>
	<tr>
		<td  align="center">게시판첨부파일</td>
		<td>
		<input type="file" name="bo_file" id="bo_file">
	</td>
	</tr>
	<tr>
		<td colspan="2" align="right">				
		<input type="button" value="글쓰기" id="sbbtn">		
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