<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<%@ page import="com.kosmos.board.vo.KosmosBoardVO" %> 
<%@ page import="java.util.List" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>댓글</title>
<link rel="stylesheet" href="default.css">
  <link rel="stylesheet" href="gnb3.css">
  <script src="js/jquery.js" charset="utf-8"></script>
  <script src="js/gnb3.js" charset="utf-8"></script>
<style type="text/css">

</style>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">

	$(document).ready(function(){
		
		// 비밀번호 확인
		$(document).on("click", "#pwbtn", function(){
			alert("pwbtn >>> : ");

			let pwcheckURL = "boardPwCheck.k";
			let reqType = "POST";
			let dataParam = {
				sbnum: $("#bo_num").val(),
				sbpw: $("#bo_pw").val(),
			};
			//dataParam = $("#boardUpdateForm").serialize();
			//alert("dataParam >>> : " + dataParam);
			
			$.ajax({
				url: pwcheckURL,
				type: reqType,								
				data: dataParam,	            
				success: whenSuccess,
				error: whenError
			});
			
			function whenSuccess(resData){	
				alert("resData >>> : " + resData);
				if ("PW_GOOD" == resData){
					alert("비밀번호 GOOD.");
					$("#sbpw").attr("readonly", true);										
					$("#U").css('background-color','yellow');
					$("#D").css('color','red');
				}else if ("PW_GOOD" == resData){
					alert("비밀번호 BAD.");
					$("#bo_pw").val('');
					$("#bo_pw").focus();
				};				
			}
			function whenError(e){
				alert("e >>> : " + e.responseText);
			}
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
	
	BOARD SELECT
<hr>
<% request.setCharacterEncoding("UTF-8");%> 
<%
	Object obj = request.getAttribute("listS");
	List<KosmosBoardVO> list = (List)obj;
	KosmosBoardVO bvo = null;
	if (list.size() == 1) {
		bvo = list.get(0);
	};
%>
<div>
<form name="boardUpdateForm" id="boardUpdateForm">
<table border=1>
<tr>
<td colspan="2" align="center">코스모스숲</td>
</tr>
<tr>
<td class="mem">게시글번호</td>
<td><input type="text" name="bo_num" id="bo_num" value="<%= bvo.getBo_num() %>" readonly/></td>
</tr>
<tr>
<td class="mem">게시판말머리</td>
<td><input type="text" name="bo_header" id="bo_header" value="<%=  bvo.getBo_header() %>" readonly/></td>
</tr>
<tr>
<td class="mem">게시판제목</td>
<td>
<input type="text" name="bo_subject" id="bo_subject" value="<%= bvo.getBo_subject() %>" style="width:100px"  readonly/>
</td>
</tr>
<tr>
<td class="mem">회원번호</td>
<td><input type="text" name="ms_num" id="ms_num" value="<%=  bvo.getMs_num() %>" readonly/></td>
</tr>

</tr>	 
<tr>
<td class="mem">게시판내용</td>
<td>
<input type="bo_contents" name="bo_contents" id="bo_contents" value="<%=  bvo.getBo_contents() %>" readonly/>
</td>
</tr>
<tr>
<td class="mem">게시판첨부파일</td>
<td> 
<img src="/KOSMOS/fileupload/board/sm_<%= bvo.getBo_file() %>" border="1" width="40" height="50" alt="image">
</td>
</tr>
</tr>
<td class="mem">게시글 등록일</td>
<td> 
<input type="text" name="bo_insdate" id="bo_insdate" value="<%= bvo.getBo_insdate() %>" readonly />		      
</td>
</tr>	 
<td class="mem">게시글 수정일</td>
<td> 
<input type="text" name="bo_upddate" id="bo_upddate" value="<%= bvo.getBo_upddate() %>" readonly />		      
</td>
</tr>
<!--
<tr>
<td class="mem">게시판비밀번호</td>
<td>
<input type="text" name="bo_pw" id="bo_pw"  />
<button type="button" id="pwbtn">게시판비밀번호</button>

</td>	 	 
<tr>
<td colspan="2" align="right"> 		
<button type="button" id="U">수정</button>
<button type="button" id="D">삭제</button>
</td>				
</tr>
 -->
</table>
</form>
</div>
<c:import url="/rboardForm.k">
	<c:param name="ms_num" value="<%=bvo.getMs_num()%>"></c:param>
</c:import>
<!-- 
<jsp:include page="/rboardForm.k">
	<jsp:param value="<%=bvo.getMs_num()%>" name="ms_num"/>
</jsp:include>
 -->	
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