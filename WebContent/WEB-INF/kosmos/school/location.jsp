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

	<script type="text/javascript" src="http://localhost:8088/kOSMOS/naverMap/docs/js/examples-base.js"></script>
	<script type="text/javascript" src="http://localhost:8088/kOSMOS/naverMap/docs/js/highlight.min.js"></script>
	<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=3tsir1dm8e&amp;submodules=panorama"></script>
	<link rel="stylesheet" type="text/css" href="http://localhost:8088/kOSMOS/naverMap/docs/css/examples-base.css" />
	


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
			<h1><a href="">코스모스고등학교 위치<span class="hide"></span></a></h1>
				<!-- @category Map -->
					<div>
						<br><br><br>
					    <div id="map" style="width:100%;height:600px;"></div>
					</div>
					<script id="code">
					var map = new naver.maps.Map('map', {
					    center: new naver.maps.LatLng(14123607.1614161,4506046.4030327),
					    zoom: 10,
					    mapTypeId: naver.maps.MapTypeId.NORMAL
					});
					
					var infowindow = new naver.maps.InfoWindow();
					
					function onSuccessGeolocation(position) {
					    var location = new naver.maps.LatLng(position.coords.latitude,
					                                         position.coords.longitude);
					
					    map.setCenter(location); // 얻은 좌표를 지도의 중심으로 설정합니다.
					    map.setZoom(17); // 지도의 줌 레벨을 변경합니다.
					
					    infowindow.setContent('<div style="padding:20px;">' + '코스모고등학교' + '</div>');
					
					    infowindow.open(map, location);
					    console.log('Coordinates: ' + location.toString());
					}
					
					function onErrorGeolocation() {
					    var center = map.getCenter();
					
					    infowindow.setContent('<div style="padding:20px;">' +
					        '<h5 style="margin-bottom:5px;color:#f00;">Geolocation failed!</h5>'+ "latitude: "+ center.lat() +"<br />longitude: "+ center.lng() +'</div>');
					
					    infowindow.open(map, center);
					}
					
					$(window).on("load", function() {
					    if (navigator.geolocation) {
					        /**
					         * navigator.geolocation 은 Chrome 50 버젼 이후로 HTTP 환경에서 사용이 Deprecate 되어 HTTPS 환경에서만 사용 가능 합니다.
					         * http://localhost 에서는 사용이 가능하며, 테스트 목적으로, Chrome 의 바로가기를 만들어서 아래와 같이 설정하면 접속은 가능합니다.
					         * chrome.exe --unsafely-treat-insecure-origin-as-secure="http://example.com"
					         */
					    	navigator.geolocation.getCurrentPosition(onSuccessGeolocation, onErrorGeolocation);
					    } else {
					        var center = map.getCenter();
					        infowindow.setContent('<div style="padding:20px;"><h5 style="margin-bottom:5px;color:#f00;">Geolocation not supported</h5></div>');
					        infowindow.open(map, center);
					    }
					});
					</script>
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