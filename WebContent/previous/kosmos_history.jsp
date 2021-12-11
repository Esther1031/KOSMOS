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

<section>
				<table width="700px;" cellpadding="0" cellspacing="0" border="0" class="type03" summary="학교 연혁표" style="margin:0 auto;margin-bottom:30px;">
	<thead>
		<tr>
			<th colspan="2">학교 연혁</th>
		</tr>
	</thead>
	<colgroup>
	<col width="5%">
	<col width="">
	</colgroup>
	<tbody>
		<tr>
			<td colspan="2"><div class="year">2020년대</div></td>
		</tr>
		<tr>
			<td class="month">2020.10.29.</td>
			<td class="desc">체육관 완공</td>
		</tr>
		<tr>
			<td class="month">2020.12.31.</td>
			<td class="desc">원격수업 선도학교<br>
				혁신학교 운영 종합 평가교</td>
		</tr>
		<tr>
			<td class="month">2021.01.13.</td>
			<td class="desc">제18회 150명 졸업 총 5,000명</td>
		</tr>
		<tr>
			<td class="month">2021.01.15.</td>
			<td class="desc">장애인 승강기 완공</td>
		</tr>
		<tr>
			<td colspan="2"><div class="year">2010년대</div></td>
		</tr>
		<tr>
			<td class="month">2014.12.20.</td>
			<td class="desc">학생자치법정</td>
		</tr>
		<tr>
			<td class="month">2014.12.24.</td>
			<td class="desc">수능시행관리교</td>
		</tr>
		<tr>
			<td class="month">2015.11.05.</td>
			<td class="desc">학업성취도평가 학력향상도 우수학교</td>
		</tr>
		<tr>
			<td class="month">2016.12.31.</td>
			<td class="desc">혁신학교 종합평가 재지정(우수교 표창)</td>
		</tr>
		<tr>
			<td class="month">2017.05.31.</td>
			<td class="desc">대학수학능력시험운영 우수학교</td>
		</tr>
		<tr>
			<td class="month">2017.11.30.</td>
			<td class="desc">인터넷 윤리 기여교 </td>
		</tr>
		<tr>
			<td class="month">2019.03.01.</td>
			<td class="desc">제8대 교장 유재석 선생님 취임</td>
		</tr>
		<tr>
			<td colspan="2"><div class="year">2000년대</div></td>
		</tr>
		<tr>
			<td class="month">2004.09.22.</td>
			<td class="desc">도서관 준공식</td>
		</tr>
		<tr>
			<td class="month">2007.05.19.</td>
			<td class="desc">기숙사 준공식</td>
		</tr>
		<tr>
			<td colspan="2"><div class="year">1900년대</div></td>
		</tr>
		<tr>
			<td class="month">1994.02.05.</td>
			<td class="desc">코스모스고등학교 개교(4학급). 초대교장 이광수 선생님 취임</td>
		</tr>
		<tr>
			<td class="month">1993.02.11.</td>
			<td class="desc">코스모스고등학교 제1회 졸업(257명)</td>
		</tr>
		<tr>
			<td class="month">1993.08.10.</td>
			<td class="desc">코스모스고등학교 개교</td>
		</tr>
	</tbody>
	</table>
		</div>
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