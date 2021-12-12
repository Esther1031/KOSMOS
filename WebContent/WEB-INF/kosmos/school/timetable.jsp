<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page import="com.kosmos.school.vo.KosmosSchoolVO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Arrays" %>

<!DOCTYPE html>
<html>
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
 *		로그인 팝업창도 추가함 _211211_David
 *
 */
        $(document).ready(function () {

            $("#img_ucc").click(function () {

                window.open("noticePop.k", "", "width=800, height=800, resizable=no, scrollbars=no, status=no");

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

		table {
		  border-collapse: collapse;
		  text-align: center;
		  line-height: 2.5;
		  border-top: 1px solid #ccc;
		  border-bottom: 2px solid #036;
		  margin : 0px;
		  width:750px;
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
		  font-size:16px;
		}
		
		.time{
			 background-color:#EBF5FF;
			 font-size: 20px;
		}
		
		.hd{
			font-size:50px;
			text-shadow:4px 4px 6px gray; 
			font-family:Monospace;
			color:#5A78AF;
			margin-top:40px;
		}
		
		.day{
			font-size: 20px;
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


<!-- 학교소개 링크  : 더미 페이지와 연결해둔 상태_211211_David-->


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

            <!-- 왼쪽 상단 : 공모전 -->
            <div>
            </div>

            <div>
                <!-- 왼쪽 하단 : 공모전 이미지 아래 빈칸부분 만약 넣고 싶은거 있으면 요기다가-->
            </div>
        </div>

        <!-- 가운데부분 width: 69프로 -->
        <!-- 보더값 적용 소스 : <div id="s_center" style="width: 69%; border:1px solid black;float:left;margin-left:5px;margin-right:5px;height:100%;">본문  -->
        <div style="width: 69%; float:left; margin-left:5px;margin-right:5px;height:100%">

		<% request.setCharacterEncoding("UTF-8"); %>
		<%
			Object obj = request.getAttribute("listall");
			List<KosmosSchoolVO> listall = (List<KosmosSchoolVO>)obj;
		%>
		<br><br>
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

        <!-- 오른쪽부분 width: 15프로 -->
        <!-- 보더값 적용 소스 : <div id="s_right" style="width:15%; float:right;height:100%;"본문  -->
        <div style="width:15%; float:right;height:100%">

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
        opyright (c) 코스모스고등학교 All Rights Reserved
    </div>
</div>

</body>
</html>

