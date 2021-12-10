<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>메인 페이지</title>
  <script type = "text/javascript" src="http://code.jquery.com/jquery-latest.js"></script> 
  <link rel="stylesheet" href="default.css">
  <link rel="stylesheet" href="gnb3.css">
  <script src="js/jquery.js" charset="utf-8"></script>
  <script src="js/gnb3.js" charset="utf-8"></script>
</head>
<style type="text/css">

	.content-top{
		height: 60px;
	}
	/* 
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
	*/
	/*식단돌아가는것*/
		 .slide{width:100%; height:70%; overflow:hidden; margin-top:88px;}
    .slide ul{position:relative;height:100%;}
    .slide li{position:absolute;left:0;right:0;top:0;bottom:0;opacity:0;animation:fade 8s infinite;}
    .slide li:nth-child(1){animation-delay:0s}
    .slide li:nth-child(2){animation-delay:2s}
    .slide li:nth-child(3){animation-delay:4s}
    .slide li:nth-child(4){animation-delay:6s}
    .slide li:nth-child(5){animation-delay:8s}
     /* 100 / 8 = 12.5 */
    @keyframes fade {
      0% {opacity:0;}
      5% {opacity:1;}
      25% {opacity:1;}
      30% {opacity:0;}
      100% {opacity:0;}
</style>
<body>
<div style="margin:0 auto; ">
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
	
	<div id="contents" style="margin:0 auto; width:1400px;" >
		<div id="s_left" style="width:280px;border:1px solid black;float:left;height:500px;"><img style="width:282px;height:251px; onclick="2021년 고교학점제UCC공모전 개최 안내" src="img/img8.png">
		<a href:"http://localhost:8088/kosmos/notice1.jsp">
		
		>
		
		</div>
		<div id="s_center" style="width:800px;border:1px solid black;float:left;margin-left:5px;margin-right:5px;height:500px;">본문</div>
		<div id="s_right" style="width:280px;border:1px solid black;float:left;height:500px;">
		<!-- 날씨 시작-->
		<h1>오늘의 날씨</h1>
		<!-- <div class = "mainb3">Seoul<br>Current Weather</div>-->

<div class = "mainb3">서울</div>
<div class="seicon", style = "text-align:center"></div>
<div class="setemp"> 현재 온도 : </div>

<!--  <div class="lowtemp">최저 온도 : </div>-->
<!--  <div class="hightemp">최고 온도 : </div>-->
<!--  <div class="lowtemp">최저 온도 : </div>-->
<!--  <div class="hightemp">최고 온도 : </div>-->

<!-- <img src="http://openweathermap.org/img/wn/10d@2x.png" alt="">
 	  아이콘 출력 : http://openweathermap.org/img/wn/10d@2x.png  끝에 @2x는 모바일용에만 적용한다. (2배키우라는 뜻)
 -->

<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	
	<script>
		var Seourl = 'http://api.openweathermap.org/data/2.5/weather?q=Seoul&appid=58ae7970b66bd66c1602a8cd4c2ca3f4&units=metric';
		
		$.getJSON(Seourl,function(result){		
			// result 변수는 getJSON 안에서 선언되었기때문에 안에서 사용되어야 한다.
			$('.setemp').append(result.main.temp + ' º');
			//$('.lowtemp').append(result.main.temp_min);
			//$('.hightemp').append(result.main.temp_max);

			/*아이콘					
			$('.icon').append(result.weather[0].icon);					
			->					
			var wiconUrl = '<img src="http://openweathermap.org/img/wn/10d@2x.png" alt="">'// 이렇게하면 고정적인 img 가 나오기때문에 					
			->
			'<img src="http://openweathermap.org/img/wn/'+result.weather[0].icon +'.png" alt="'+ result.weather[0].description +'">'
			로 수정					
		    -
			*/
			//(result.weather[0].icon
			var wiconUrl = '<img src="http://openweathermap.org/img/wn/'+result.weather[0].icon +'.png" alt="'+ result.weather[0].description +'">'
			$('.seicon').html(wiconUrl);
});
$.getJSON(Gyourl,function(result){		
	// result 변수는 getJSON 안에서 선언되었기때문에 안에서 사용되어야 한다.
	$('.gytemp').append(result.main.temp + ' º');
	
	var wiconUrl = '<img src="http://openweathermap.org/img/wn/'+result.weather[0].icon +'.png" alt="'+ result.weather[0].description +'">'
	$('.gyicon').html(wiconUrl);
});

$.getJSON(Gyourl,function(result){		
// result 변수는 getJSON 안에서 선언되었기때문에 안에서 사용되어야 한다.
$('.butemp').append(result.main.temp + ' º');

var wiconUrl = '<img src="http://openweathermap.org/img/wn/'+result.weather[0].icon +'.png" alt="'+ result.weather[0].description +'">'
$('.buicon').html(wiconUrl);
});
</script>



<script>
	function openNav() {	
	  document.getElementById("mySidenav").style.width = "250px";
	}
	
	function closeNav() {
	  document.getElementById("mySidenav").style.width = "0";
	}
</script>
<!-- 날씨 끝-->
<h2>이달의 일정</h2>
<img style="width:282px;height:380px; onclick="2021년 고교학점제UCC공모전 개최 안내" src="img/img40.png">
		</div>
		
	</div>
	<div id="contents1" style="margin:0 auto; width:1400px;" >
		<div id="s_left" style="width:280px;border:1px solid black;float:left;height:500px;">사이드바 왼쪽</div>
		<div id="s_center" style="width:800px;border:1px solid black;float:left;margin-left:5px;margin-right:5px;height:500px;">본문</div>
		<div id="s_right" style="width:280px;border:1px solid black;float:left;height:500px;">
		<br>
		<div class="s_left_1">=오늘의 메뉴=</div>
		<h3>흰쌀밥,된장국,김치,꼬마돈까스,제육볶음</h3>
		<div class="slide">
    		<ul>
    		 <li><img src="img/rice.png"></li>
		      <li><img src="img/kim.jpg"></li>
		      <li><img src="img/miso.jpg"></li>
		      <li><img src="img/pork.jfif"></li>
		      <li><img src="img/don.jfif"></li>
		    </ul>
  		</div>
	</div>
		
		</div>
	</div>	

</div>

<footer>
	<div id="footer" style="margin-top:1080px;">
		<div class="container" style="text-align:center;">
			서울 금천구 가산동 8명로 88 코스모스고등학교 <br/>
			교무실 02-123-4567(09:00~17:00) 행정실 02-7654-3210(09:00~24:00)<br/>
			Copyright (c) 코스모스고등학교 All Rights Reseved
		</div>
	</div>
</footer>
</div>
</body>
</html>