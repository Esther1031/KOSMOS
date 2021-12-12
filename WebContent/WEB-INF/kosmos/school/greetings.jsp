<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>코스모스 고등학교</title>

    <!-- 	css랑 js 파일 경로
            WebContent/resource/css/default.css
            WebContent/resource/css/gnb3.css
            요거 두개 보시면 됩니다.
            
            default 는 본문 글자 셋팅 (맨 아랫줄 body부분)
            gnb 는 메뉴 css 및 빨간 테두리 부분 (content로 검색) 들어가 있어요. 
    -->
    <link rel="stylesheet" href="resource/css/default.css">
    <link rel="stylesheet" href="resource/css/gnb3.css">
    <script src="resource/js/jquery.js" charset="utf-8"></script>
    <script src="resource/js/gnb3.js" charset="utf-8"></script>


    <!-- 
        script 정리해보려고 했는데 공모전 ucc 링크가 풀려서 일단 다 합쳐뒀어요 
    -->

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"
            integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

    <script>
        var Seourl = 'http://api.openweathermap.org/data/2.5/weather?q=Seoul&appid=58ae7970b66bd66c1602a8cd4c2ca3f4&units=metric';

        $.getJSON(Seourl, function (result) {
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
            var wiconUrl = '<img src="http://openweathermap.org/img/wn/' + result.weather[0].icon + '.png" alt="' + result.weather[0].description + '">'
            $('.seicon').html(wiconUrl);
        });
        $.getJSON(Gyourl, function (result) {
            // result 변수는 getJSON 안에서 선언되었기때문에 안에서 사용되어야 한다.
            $('.gytemp').append(result.main.temp + ' º');

            var wiconUrl = '<img src="http://openweathermap.org/img/wn/' + result.weather[0].icon + '.png" alt="' + result.weather[0].description + '">'
            $('.gyicon').html(wiconUrl);
        });

        $.getJSON(Gyourl, function (result) {
// result 변수는 getJSON 안에서 선언되었기때문에 안에서 사용되어야 한다.
            $('.butemp').append(result.main.temp + ' º');

            var wiconUrl = '<img src="http://openweathermap.org/img/wn/' + result.weather[0].icon + '.png" alt="' + result.weather[0].description + '">'
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

/*
 * 		
 *		요기만 추가 : 팝업용
 */
        $(document).ready(function () {

            $("#img_ucc").click(function () {

                window.open("notice.jsp", "", "width=800, height=800, resizable=no, scrollbars=no, status=no");

            });
            
            $("#loginbtn").click(function () {

                window.open("loginFormPop.k", "", "width=600, height=500, resizable=no, scrollbars=no, status=no");

            });

        });

    </script>

    <!-- 
        css파일 공유하는 다른페이지들이랑 겹치거나 
        다른이유로 적용 안되는 애들 문서에 적용시켜서 우선순위로 넣었어요.
    -->

    <style type="text/css">

        #footer {
            border-top: double;
            width: 100%;
            height: 70px;
            float: bottom;
        }

        .image {
            position: relative;
            background: url(img/kosmos_1.jpg);
            no-repeat;
            height: 280px;
            background-position: center;
        }

        .text {
            padding-top: 20px;
            margin-left: 20px;
            width: 200px;
        }

        img {
            max-width: 100%;
            height: auto;
            border: 1px solid gray;
        }
        .section{
			background-color: #34558b;
			color: white;	
			text-align: center;
			width: 230px;
			height: 150px;
			border-radius: 20px;
			display:block;
			margin: 5px 0px 0px 40px;
		}
		.nav{
			background-color: #fafafa;
			color: black;
			margin-top: 40px;
			border-radius: 0px 0px 10px 10px;
			text-align:left;
			height: 300px;
			font-size: inherit;
		}
           .line1{
			border-top: 1px dashed Gainsboro;
			width: 190px;
		}
    </style>

</head>

<!-- 본문 -->
<body>

<!-- 상단 이미지 위에 글씨 오버랩 되는 부분 -->
<div class="image">

    <!-- <img src="/KOSMOS/img/kosmos_1.jpg" width="100%"> -->
    <div class="text">
        <a href="mainHome.k"><h1>KOSMOS 고등학교</h1></a>
    </div>
    <div class="right_box">
    	<a href style="margin-right: 10px;" id="loginbtn">로그인</a>
    	<a href="registration.k">수강신청</a>
    </div>
</div>

<!-- 메뉴포함 제일 외곽에 있는 틀 시작-->
<div class="container">

    <header>
        <nav>
        	<!-- 메뉴 css 클래스명 gnb -->
            <ul class="gnb">
            
                <li>
<!-- 학교소개 링크 -->
                    <a href="#">학교 소개</a>
                    <ul>
                        <li><a href="schoolGreetings.k">학교장 인사</a></li>
                        <li><a href="schoolHistory.k">학교 연혁</a></li>
                        <li><a href="schoolIntroduce.k">학교 소개</a></li>
                        <li><a href="schoolSymbol.k">학교 상징</a></li>
                        <li><a href="schoolLocation.k">학교 위치</a></li>
                    </ul>
                </li>
                
<!-- 수업정보 링크 -->
                <li>
                    <a href="#">수업정보</a>
                    <ul>
                        <li><a href="subjectSelectAll.k">과목정보</a></li>
                        <li><a href="mainTimeTable.k">시간표</a></li>
                    </ul>
                </li>

<!-- 공지사항 링크 -->
                <li>
                    <a href="noticeList.k">공지사항</a>
                </li>


                <li>
                    <a href="boardSelectAll.k">코스모스숲</a>
                </li>

<!-- 마이페이지 링크 -->
                <li>
                    <a href="mainMyPage.k">마이페이지</a>
                </li>
            </ul>
        </nav>

    </header>

    <!-- 
        (빨간선) 
        빨간선은 마지막에 웹컨텐트 > 리소스 > css > gnb3.css 에서  
        content 찾아서 border 지워주시면 됩니다.	
    -->
    <div class="content">

        <!-- 왼쪽부분  width 15프로  -->
        <!-- 보더값 적용 소스 : <div id="s_left" style="width:15%;border:1px solid black;float:left;height:100%;"> -->
        <div style="width:15%; float:left;height:100%;">
			<section class="section">
			    <br>
			    <h2>학교소개</h2>
			    <nav class="nav">
			        <br>
			        <ul style="padding-left: 20px;">
			            <li style="margin-bottom: 15px;">
			                <a href="schoolGreetings.k">
			                    <span>학교장 인사</span>
			                </a>
			            </li>
			            <li class="line1">
			            </li>
			            <li style="margin-top: 15px;">
			                <a href="schoolHistory.k">
			                    <span>학교 연혁</span>
			                </a>
			            </li>
			            <li class="line1">
			            </li>
			            <li style="margin-top: 15px;">
			                <a href="schoolIntroduce.k">
			                    <span>학교 소개</span>
			                </a>
			            </li>
			            <li class="line1">
			            </li>
			            <li style="margin-top: 15px;">
			                <a href="schoolSymbol.k">
			                    <span>학교 상징</span>
			                </a>
			            </li>
			            <li class="line1">
			            </li>
			            <li style="margin-top: 15px;">
			                <a href="schoolLocation.k">
			                    <span>학교 위치</span>
			                </a>
			            </li>
			        </ul>
			    </nav>
			</section>
        </div>

        <!-- 가운데부분 width: 69프로 -->
        <!-- 보더값 적용 소스 : <div id="s_center" style="width: 69%; border:1px solid black;float:left;margin-left:5px;margin-right:5px;height:100%;">본문  -->
        <div style="width: 83%; float:left; margin-left:5px;margin-right:5px;height:100%">

            <!-- 본문 요기다가 넣어주세요 빨간테두리에서 가운데 부분 입니다. -->
			<div class="type03" style="width:700px; margin-left:350px; margin-bottom:30px;"> 
			<ul>
				<br><br><br>
				<li><span><img src="img/KakaoTalk_20211128_143447619.jpg" alt="학교장 사진"></span><br>
				<strong>코스모스고등학교장 </strong><em>ㅇㅇㅇ</em></li><br> 
				<li style="text-align:left"><p>우리 학교는 1993년 개교하여 30여 년 동안 5천여 인재를 배출한 공립 명문 일반계고등학교로 ‘바른 인성과 실력으로 자신의 삶을 만들어가는 자주적인 사람’, 
				‘다양한 발상으로 새로움에 도전하는 창의적인 사람’, 
				‘문화를 이해하고 누릴 수 있는 교양 있는 사람’, 
				‘타인을 생각하고 배려하는 더불어 사는 사람’을 양성하기 위해 최선을 다하고 있습니다.</p>
				<p>특히 ‘휴대폰’, ‘흡연’, ‘학교 폭력’이 없는 '3무(三無) 학교'로 안정적이고 즐거운 학습 분위기 조성을 위해 최선을 다하고 있으며, 
				‘나의 꿈 갖기, 먼저 인사하기, 고운 말 쓰기, 서로 칭찬하기’의 ‘4실천 운동’을 생활화하고 있습니다.</p>
				<p>학생은 다양한 교육·체험 활동을 통하여 자아를 형성하고 교사는 솔선수범하고 학생지도에 애정을 쏟으며, 
				학교장은 투명하고 민주적인 학교를 만들기 위해 노력함으로써 가고 싶은 학교, 
				근무하고 싶은 학교, 
				보내고 싶은 학교를 만들어 나가는 데 노력을 기울이겠습니다.</p>
				<p>학생들이 즐겁고 깨끗한 공간에서 꿈을 키워나갈 수 있도록 구성원 모두가 힘쓸 것을 다짐합니다.</p> 
				<p>29년 동안 이어진 코스모스고등학교의 전통과 명성이 향후 50년 이상 미래에도 계속될 수 있도록 코스모스고를 사랑하시는 모든 분들께서 더욱 깊은 애정을 갖고 응원해 주시기 바랍니다.</p>
				<p>우리 학교 홈페이지에 자주 방문하시어 좋은 의견 나누어 주시면 감사하겠습니다.</p></li> 
			</ul> 
		</div>
            <!-- 본문 끝 -->

        </div>

        <!-- 오른쪽부분 width: 15프로 -->
        <!-- 보더값 적용 소스 : <div id="s_right" style="width:15%; float:right;height:100%;"본문  -->
        <div style="float:right;height:100%">

            <!-- 오른쪽에서 상단 부분 : 날씨 -->
            <div style="height: 30%; margin-top: 50px">
                
            </div>

            <!-- 오른쪽에서 하단부분 : 식단 -->
            <div style="float:top; height: 40%">

               
            </div>
        </div>
    </div>
</div>

<!-- footer 부분  -->
<div id="footer" align="center">
    <div class="container">
        서울 금천구 가산동 8명로 88 코스모스고등학교 <br/>
        교무실 02-123-4567(09:00~17:00) 행정실 02-7654-3210(09:00~24:00)<br/>
        Copyright (c) 코스모스고등학교 All Rights Reserved
    </div>
</div>

</body>
</html>