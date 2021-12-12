<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page import="com.kosmos.school.vo.KosmosSchoolVO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Arrays" %>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>time table</title>

    <!-- 	css랑 js 파일 경로
            WebContent/resource/css/default.css
            WebContent/resource/css/gnb3.css
            요거 두개 보시면 됩니다.
            
            default 는 본문 글자 셋팅 (맨 아랫줄 body부분)
            gnb 는 메뉴 css 및 빨간 테두리 부분 (content로 검색) 들어가 있어요. 
    -->
    <link rel="stylesheet" href="css/default.css">
    <link rel="stylesheet" href="css/gnb3.css">


	<!-- ============================== script ============================== -->
    <script src="js/jquery.js" charset="utf-8"></script>
    <script src="js/gnb3.js" charset="utf-8"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"
            integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<script src="js/jquery-3.2.0.js"></script>
	<script src="js/motion1.js"></script>
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="/KOSMOS/common/datepiker/jquery-ui-1.12.1/jquery-ui.min.js"></script>
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

        });

    </script>
	<!-- ============================== script ============================== -->
	

    
	<!-- ============================== style ============================== -->
    <style type="text/css">
		.tt{
			text-align: center;
			color:#043874;
		}
		th, td {
			border: 1px solid Gainsboro;
			line-height: 1.5;
		}
		.content{
			width: 1200px;
			height: 500px;
			margin: 0px auto;
			margin-bottom: 100px;
			float: center;
			border: 1px solid red;
		}
		.all {
			width: 750px;
			margin: 50px 10px 50px 350px;
		}
		
		.paging{
			margin-top: 20px;
   			border-top: 1px dashed #dadada;
   			text-align: center;
		}
	
        #footer {
            border-top: double;
            width: 100%;
            height: 70px;
            float: bottom;
            margin-top: 700px;
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

    </style>
	<!-- ============================== style ============================== -->
    
	<link rel="stylesheet" href="/KOSMOS/common/datepiker/jquery-ui-1.12.1/jquery-ui.min.css">
	
</head>


<body>

	<!-- =========================== header1 =========================== -->
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

	<!-- =========================== header1 =========================== -->


	
	<div class="container">
		<!-- =========================== header2 =========================== -->
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
		<!-- =========================== header2 =========================== -->


		<!-- =========================== 좌 + 중앙 + 우 =========================== -->
	    <!-- 
	        (빨간선) 
	        빨간선은 마지막에 웹컨텐트 > 리소스 > css > gnb3.css 에서  
	        content 찾아서 border 지워주시면 됩니다.	
	    -->
	    <div class="content">	
	        <!-- =========================== 왼쪽 사이드 바 =========================== -->
	        <!-- 보더값 적용 소스 : <div id="s_left" style="width:15%;border:1px solid black;float:left;height:100%;"> -->
	        <div style="float:left;height:100%;">
	
	        </div>
	        <!-- =========================== 왼쪽 사이드 바 =========================== -->


	
	        <!-- ============================== 본문 ============================== -->
	
			<% request.setCharacterEncoding("UTF-8"); %>
		<%
			Object obj = request.getAttribute("listall");
			List<KosmosSchoolVO> listall = (List<KosmosSchoolVO>)obj;
		%>
		<br><br>
		<div align="center">
		<table class="table table-hover">
			<thead>
		<h1 align="center">시 &nbsp;간 &nbsp;표</h1><br>
				<tr>
					<th></th>
					<th scope="col">월</th>
					<th scope="col">화</th>
					<th scope="col">수</th>
					<th scope="col">목</th>
					<th scope="col">금</th>
				</tr>
			</thead>
			<tr>
				<td>1</td>
				<td><%= listall.get(0).getMon() %></td>
				<td><%= listall.get(0).getTue() %></td>
				<td><%= listall.get(0).getWen() %></td>
				<td><%= listall.get(0).getThu() %></td>
				<td><%= listall.get(0).getFri() %></td>
			</tr>
			<tr>
				<td>2</td>
				<td><%= listall.get(1).getMon() %></td>
				<td><%= listall.get(1).getTue() %></td>
				<td><%= listall.get(1).getWen() %></td>
				<td><%= listall.get(1).getThu() %></td>
				<td><%= listall.get(1).getFri() %></td>
			</tr>
			<tr>
				<td>3</td>
				<td><%= listall.get(2).getMon() %></td>
				<td><%= listall.get(2).getTue() %></td>
				<td><%= listall.get(2).getWen() %></td>
				<td><%= listall.get(2).getThu() %></td>
				<td><%= listall.get(2).getFri() %></td>
			</tr>
			<tr>
				<td>4</td>
				<td><%= listall.get(3).getMon() %></td>
				<td><%= listall.get(3).getTue() %></td>
				<td><%= listall.get(3).getWen() %></td>
				<td><%= listall.get(3).getThu() %></td>
				<td><%= listall.get(3).getFri() %></td>
			</tr>
			<tr>
				<td>5</td>
				<td><%= listall.get(4).getMon() %></td>
				<td><%= listall.get(4).getTue() %></td>
				<td><%= listall.get(4).getWen() %></td>
				<td><%= listall.get(4).getThu() %></td>
				<td><%= listall.get(4).getFri() %></td>
			</tr>
			<tr>
				<td>6</td>
				<td><%= listall.get(5).getMon() %></td>
				<td><%= listall.get(5).getTue() %></td>
				<td><%= listall.get(5).getWen() %></td>
				<td><%= listall.get(5).getThu() %></td>
				<td><%= listall.get(5).getFri() %></td>
			</tr>
			<tr>
				<td>7</td>
				<td><%= listall.get(6).getMon() %></td>
				<td><%= listall.get(6).getTue() %></td>
				<td><%= listall.get(6).getWen() %></td>
				<td><%= listall.get(6).getThu() %></td>
				<td><%= listall.get(6).getFri() %></td>
			</tr>
		</table>
		</div>
		</div>
			<!-- ============================== 본문 ============================= -->
	
	
	
	        <!-- =========================== 오른쪽 사이드 바 =========================== -->
	        <!-- 보더값 적용 소스 : <div id="s_right" style="width:15%; float:right;height:100%;"본문  -->
	        <div style="float:right;height:100%">

	        </div>
	        <!-- =========================== 오른쪽 사이드 바 =========================== -->     
	    </div>
    	<!-- =========================== 좌 + 중앙 + 우 =========================== -->

	</div>
	


	<!-- ================================ footer ================================ -->
	<div id="footer" align="center">
	    <div class="container">
	        서울 금천구 가산동 8명로 88 코스모스고등학교 <br/>
	        교무실 02-123-4567(09:00~17:00) 행정실 02-7654-3210(09:00~24:00)<br/>
	        copyright (c) 코스모스고등학교 All Rights Reserved
	    </div>
	</div>
	<!-- ================================ footer ================================ -->
	
</body>
</html>