<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>메인 페이지</title>
  <link rel="stylesheet" href="resource/css/default.css">
  <link rel="stylesheet" href="resource/css/gnb3.css">
  <script src="js/jquery.js" charset="utf-8"></script>
  <script src="js/gnb3.js" charset="utf-8"></script>
  <style type="text/css">
	
	#footer{
		border-top:double;
		width:100%;
		height:70px;
		float:bottom;
	}
	.image{
      position: relative;
      background:url(img/kosmos_1.jpg);no-repeat;height:250px; background-position: center;
	}
	.text{
		padding-top:20px; margin-left:20px;
	}
</style>
</head>

<body>
<div class="image">
    <!-- <img src="/KOSMOS/img/kosmos_1.jpg" width="100%"> -->
    <div class="text">
        <a href=""><h1>KOSMOS 고등학교</h1></a>
    </div>
</div>
<div class="container">
<header>
  <nav>
    <ul class="gnb">
      <li>
        <a href="kosmos_main_page.jsp">Home</a>
      </li>
      <li>
          <a href="#">Login</a>
      </li>
      <li>
        <a href="#">학교 소개</a>
        <ul>
          <li><a href="kosmos_words.jsp">학교장 인사</a></li>
          <li><a href="kosmos_history.jsp">학교 연혁</a></li>
          <li><a href="kosmos_info.jsp">학교 소개</a></li>
          <li><a href="kosmos_symbol.jsp">학교 상징</a></li>
          <li> <a href="kosmos_map.jsp">학교 위치</a></li>
        </ul>
      </li>
      <li>
        <a href="#">수강신청</a>
      </li>
      <li>
        <a href="#">수업정보</a>
        <ul>
          <li><a href="subjectSelectAll.k">과목정보</a></li>
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

<div class="content">

<!-- 요기에 넣으면 됩니다 크기 1000px인데 작으면 말해줘요  -->

<div class="info"> 
 <section>

		<div class="type03"> 
			<br><br>
			<div class="col_1" style="width: 30%; float: left; margin: 0px auto;">
				상징 동물 : &nbsp;&nbsp;<img src="img/eagle-gd324f6b8c_640.jpg"><br><br>
				&nbsp;&nbsp;&nbsp;&nbsp;교&nbsp;&nbsp;&nbsp;&nbsp;화 : &nbsp;&nbsp;<img src="img/plant-g3d753001b_640.jpg"><br><br>
				&nbsp;&nbsp;&nbsp;&nbsp;교&nbsp;&nbsp;&nbsp;&nbsp;목 : &nbsp;&nbsp;<img src="img/bamboo-g12406259d_640.jpg">			
			</div>
			<div class="col2_container" style="float: left;">
				<div class="col2" style="height: 234px;"> 내용! </div>
				<div class="col2" style="height: 132px;"> 내용! </div>
				<div class="col2" style="height: 132px;"> 내용! </div>
			</div>
		</div>
	</tbody>
</section>

<!-- 요기까지 -->

</div>

</div>
</body>
</html>





<!-- 
<div class="bg_gnb"></div>
<div class="content-top">제일 위</div>
<div class="content" align="center">
	<div id="s_left">사이드바 왼쪽</div>
	<div id="contents">본문</div>
	<div id="s_right">사이드바 오른쪽</div>
<div id="footer" align="center">
	<div class="container">
		서울 금천구 가산동 8명로 88 코스모스고등학교 <br/>
		교무실 02-123-4567(09:00~17:00) 행정실 02-7654-3210(09:00~24:00)<br/>
		Copyright (c) 코스모스고등학교 All Rights Reseved
	</div>
	 -->