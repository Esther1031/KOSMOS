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
 <!--  
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
					
					$('.seicon').html(wiconUrl);
			});
			$.getJSON(Gyourl,function(result){		
				// result 변수는 getJSON 안에서 선언되었기때문에 안에서 사용되어야 한다.
				$('.gytemp').append(result.main.temp + ' º');
				
				
				$('.gyicon').html(wiconUrl);
			});
			
			$.getJSON(Gyourl,function(result){		
			// result 변수는 getJSON 안에서 선언되었기때문에 안에서 사용되어야 한다.
			$('.butemp').append(result.main.temp + ' º');
			
			
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
			 -->
  
</head>
<style type="text/css">

	.content{
		width: 1000px;
		height: 500px;
		margin: 0px auto;
		margin-bottom: 100px;
		float: center;
		border: 1px solid red;
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
	.image{
      position: relative;
      background:url(img/kosmos_1.jpg);no-repeat;height:250px; background-position: center;
	}
	.text{
		padding-top:20px; margin-left:20px;
	}
	
	#nav_menu ul {
		list-style-type:none;
		padding-left:30px;
		float:bottom;
		height:150px;
		}
		
	#nav_menu ul li {
		display:inline;
		border-left: 1px solid #c0c0c0;
		padding: 0px 10px 0px 10px;
		margin: 5px 0px 5px 0px;
		}
		
	#nav_menu ul li:first-child {
		border-left: none;
		}

	.setemp{
		  position: absolute;
  		  top: 8px;
  		  right: 16px;
  		  font-size: 18px;
	}   
	

</style>
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
        <a href="kosmos_main_page.html">Home</a>
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

<div class="content">


<!-- 요기에 넣으면 됩니다 크기 1000px인데 작으면 말해줘요  -->

<!-- 요기까지 -->

</div>
<div id="footer" align="center">
	<div class="container">
		서울 금천구 가산동 8명로 88 코스모스고등학교 <br/>
		교무실 02-123-4567(09:00~17:00) 행정실 02-7654-3210(09:00~24:00)<br/>
		Copyright (c) 코스모스고등학교 All Rights Reseved
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