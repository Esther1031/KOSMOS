<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
		<title>코스모스고등학교 위치</title>
		<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	    <script type="text/javascript" src="http://localhost:8088/kOSMOS/naverMap/docs/js/examples-base.js"></script>
	    <script type="text/javascript" src="http://localhost:8088/kOSMOS/naverMap/docs/js/highlight.min.js"></script>
	    <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=3tsir1dm8e&amp;submodules=panorama"></script>
	    <link rel="stylesheet" type="text/css" href="http://localhost:8088/kOSMOS/naverMap/docs/css/examples-base.css" />
	    <link rel="stylesheet" type="text/css" href="http://localhost:8088/main_page.html" />
    
    <title>메인 페이지</title>

  <link rel="stylesheet" href="resource/css/default.css">
  <link rel="stylesheet" href="resource/css/gnb3.css">
  <script src="js/jquery.js" charset="utf-8"></script>
  <script src="js/gnb3.js" charset="utf-8"></script>

    <style type="text/css">

        .content {
            width: 1000px;
            height: 700px;
            margin: 0px auto;
            margin-bottom: 100px;
            float: center;
        }

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
            height: 250px;
            background-position: center;
        }

        .text {
            padding-top: 20px;
            margin-left: 20px;
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
                        <li><a href="kosmos_map.jsp">학교 위치</a></li>
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

	
	<!-- @category Map -->
	
	<div>
		<h2>코스모스고등학교 위치</h2>
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
	
	    infowindow.setContent('<div style="padding:20px;">' + '코스모스 고등학교' + '</div>');
	
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