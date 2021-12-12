<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kosmos.common.AuthenticationKey" %>
<%@ page import="com.kosmos.common.SubjectUtils" %>   
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
		    width: 500px;
		    height: 200px;
		   	margin-left: 497px;
		  }
		  
		tr, td {
			text-align: center;
		}
		
		th, td {
			padding-top:10px; 
			padding-bottom:10px;
			border: 1px solid Gainsboro;
		}
		
		.searchText {
			border: 1px solid #c1c1c1;
			font-family: 'IBM Plex Sans KR', sans-serif;
			font-size: 15px;
			width: 180px;
			background-color: #eee;	
			text-align-last: center;
			text-align: center;
			-ms-text-align-last: center;
			-moz-text-align-last: center;
			}
			
		.searchSelect {
			border: 1px solid #c1c1c1;
			font-family: 'IBM Plex Sans KR', sans-serif;
			font-size: 15px;
			width: 120px;
			background-color: #fff;	
			text-align-last: center;
			text-align: center;
			-ms-text-align-last: center;
			-moz-text-align-last: center;
			}
			
		.searchBtn {
			font-family: 'IBM Plex Sans KR', sans-serif;
			font-size: initial;
			color: white;
			background-color: #34558b;
			height: 30px;
			border: 0px solid black;
			border-radius: 4px;
		}
		
		.changeBtn {
			font-family: 'IBM Plex Sans KR', sans-serif;
			font-size: initial;
			color: white;
			background-color: lightgray;
			border-radius: 4px;
			height: 30px;
			border: 0px solid black;
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
			height: 200px;
			font-size: inherit;
		}
		.line1{
			border-top: 1px dashed Gainsboro;
			width: 190px;
		}
    </style>

</head>
	<script type="text/javascript">
		$(document).ready(function(){
			// 오늘 날짜 바인딩 
			document.getElementById('sb_insdate').value = new Date().toISOString().substring(0, 10);
		
			// 선수과목명 select박스 선택에 따라 text박스 활성화 or 비활성화 설정
			$("#sb_beforename1").change(function(){
				$("#sb_beforename1 option:selected").each(function(){
					console.log("$(this).val() >>> : " + $(this).val());
					if($(this).val() == '직접입력'){	// 직접입력일 경우
						var aa = $("#sb_beforename2").val();	
						console.log("aa >>> : " + aa);					// 텍스트박스 직접입력되는 값 확인
						$("#sb_beforename2").val('');					// 값 초기화
						$("#sb_beforename2").attr("readonly", false);	// 텍스트박스 활성화
					}else{							// 직접입력이 아닐 경우
						$("#sb_beforename2").val($(this).text());		// 선택값 입력
						$("#sb_beforename2").attr("readonly", true);	// 텍스트박스 비활성화
					}
				});
			});
			
			// 개설년도 드롭박스
			var thisDate = new Date();
			var thisYear = thisDate.getFullYear();	
			for (var i = (thisYear-5); i < (thisYear+5); i++){
				if (i < thisYear){
					$("#sb_year").append("<option value='"+i+"'>"+i+"</option>");	
				}
			}
			$("#sb_year").append("<option value='"+thisYear+"' selected>"+thisYear+"</option>");	
			for (var i = (thisYear-5); i < (thisYear+5); i++){
				if (i > thisYear){
					$("#sb_year").append("<option value='"+i+"'>"+i+"</option>");	
				}
			}
			
			// 학년 드롭박스
			<%  String g = SubjectUtils.gradeFrontToDB();
				String[] gArray = g.split(",");
				for (int i=0; i < gArray.length; i++){
					String key_selectGrade = gArray[i];
			%>
					$("#sb_grade").append("<option value='"+"<%= i %>"+"'>"+ "<%= key_selectGrade %>학년" +"</option>");
			<%
				}
			%>
			
			// 이수단위 드롭박스
			$("#sb_creditunit").append("<option value=''>"+" - "+"</option>");	
			for (var i=1; i < 4; i++){
				$("#sb_creditunit").append("<option value='"+i+"'>"+i+"</option>");	
			}
			
			// 학기 드롭박스
			<%  String s = SubjectUtils.semesterFrontToDB();
				String[] sArray = s.split(",");
				for (int i=0; i < sArray.length; i++){
					String key_selectSemester = sArray[i];
			%>
					$("#sb_semester").append("<option value='"+"<%= i %>"+"'>"+ "<%= key_selectSemester %>학기" +"</option>");
			<%
				}
			%>
			
			// 수업요일 드롭박스
			<%  String d = SubjectUtils.dayFrontToDB();
				String[] dArray = d.split(",");
				for (int i=0; i < dArray.length; i++){
					String key_selectDay = dArray[i];
					if (i == 0){
			%>
					$("#sb_day").append("<option value=''>"+ "<%= key_selectDay %>요일" +"</option>");
			<%
					}else{
			%>
					$("#sb_day").append("<option value='"+"<%= key_selectDay %>"+"'>"+ "<%= key_selectDay %>요일" +"</option>");
			<%
					}
				}
			%>
			
			// 수업교시 (1 ~ 8교시)
			for (var i=1; i <= 8; i++){
				$("#sb_time").append("<option value='"+i+"'>"+i+"교시</option>");
			}
			
			// 선수과목명
			<% 
				String b = SubjectUtils.beforenameFrontToDB();
				String[] bArray = b.split(",");
				for (int i=0; i < bArray.length; i++){
					String key_beforename = bArray[i];
			%>
				$("#sb_beforename1").append("<option value='"+"<%= key_beforename %>"+"'>"+ "<%= key_beforename %>" +"</option>");		
			<%
			}	
			%>
			
			// 교과군
			<% 
			String r = SubjectUtils.groupFrontToDB();
			String[] rArray = r.split(",");
			for (int i=0; i < rArray.length; i++){
				String key_group = rArray[i];
				String intToString = String.format("%02d", i);
			%>
				$("#sb_group").append("<option value='"+"<%= intToString %>"+"'>"+ "<%= key_group %>" +"</option>");
			<%
			}	
			%>
			
			// 선수 과목 있음
			$("input:radio[id='sb_beforeyn1']").click(function(){
				console.log("sb_beforeyn.val()" + document.getElementsByName("sb_beforeyn")[0].value);
				if($(this).prop('checked')){
					console.log("선수과목 있음");
					$("select[id='sb_beforename1']").attr("disabled", false);
					$("#sb_beforename2").attr("disabled", false);
				}
			});
			
			// 선수 과목 없음
			$("input:radio[id='sb_beforeyn2']").click(function(){
				console.log("sb_beforeyn.val()" + document.getElementsByName("sb_beforeyn")[1].value);
				if($(this).prop('checked')){
					console.log("선수과목 없음");
					$("select[id='sb_beforename1']").attr("disabled", true);
					$("#sb_beforename2").attr("disabled", true);
				}
			});
			
			// 관리자 키 확인
			$("#keyCheck").click(function(){
				var key = $("#teacher_key").val();
				var key_auth = $("#auth_teacher_key").val();
				
				alert("key : key_auth " + key + " : " + key_auth);
				
				if (key == key_auth){
					alert("관리자 키와 일치합니다. 과목정보를 수정하실 수 있습니다.");
					key = '';
					
					$("#teacher_key").attr("disabled", true);
					$("#insertBtn").attr("disabled", false);
					$("#teacher_key").css("background-color", "lightgray");
					$("#insertBtn").css("background-color", "#34558b");
				}else{
					alert("관리자 키와 일치하지 않습니다. 비밀번호를 다시 확인해주세요.");
					$("#teacher_key").val('');
					$("#teacher_key").focus();
				}
			});
						
			//########## sb_Code 불러오는 Ajax 시작 ##########
			$("#codeBtn").click(function(){
			//	alert("btn 진입 >>> : ");
				callAjax();
			});
			
			function callAjax(){
				alert("과목코드를 입력합니다.");

				let codeURL = "subjectCallCode.k";
				let groupVal = $("#sb_group").val();
				let nameVal = $("#sb_name").val();
				let dataParam = {
						group : groupVal,
						name : nameVal
				}
				console.log("groupVal >>> : " + groupVal);
				console.log("nameVal >>> : " + nameVal);
				
				$.ajax({
					url : codeURL,
					type : "POST",
					data : dataParam,
					contentType : "application/x-www-form-urlencoded; charset=UTF-8",
					success : whenSuccess,
					error : whenError
				});
				
				// 성공했을 때 실행되는 함수
				function whenSuccess(resData){
					console.log("코드 data >>> : " + resData);
					
					// 코드 받아오면 sb_code에 바로 입력하기
					if (resData != null){
						$("#sb_code").val(resData);
					}
				}
				
				// 실패했을 때 실행되는 함수
				function whenError(e) {
					console.log("에러가 >>> : " + e.responseText);
				}
			}	// end of callAjax()
			//########## sb_Code 불러오는 Ajax 끝 ##########
			
			// 등록 버튼 누르면
			$(document).on("click", "#insertBtn", function(){
			//	alert("(확인용) insertBtn >>> : ");				
			
				if ($("#sb_grade").val() == 0){
					alert("학년을 선택해주세요.");
					$("#sb_grade").focus();
					$("#sb_grade").css("border", "1px solid red");
					return;
				}else if($("#sb_semester").val() == 0){
					alert("학기를 선택해주세요.");
					$("#sb_semester").focus();
					$("#sb_semester").css("border", "1px solid red");
					return;
				} else if ($("#sb_day").val() == ''){
					alert("요일을 선택해주세요.");
					$("#sb_day").css("border", "1px solid red");
					$("#sb_day").focus();
					return;
				} else if ($("#sb_creditunit").val() == ''){
					alert("이수단위를 선택해주세요.");
					$("#sb_creditunit").css("border", "1px solid red");
					$("#sb_creditunit").focus();
					return;
				} else if ($("#sb_group").val() == '00'){
					alert("교과군을 선택해주세요.");
					$("#sb_group").css("border", "1px solid red");
					$("#sb_group").focus();
					return;
				} else if ($("#sb_time").val() == ''){
					alert("교시를 선택해주세요.");
					$("#sb_time").css("border", "1px solid red");
					$("#sb_time").focus();
					return;
				} else if ($("#sb_name").val() == 0){
					alert("과목명을 선택해주세요.");
					$("#sb_name").focus();
					$("#sb_name").css("border", "1px solid red");
					return;
				} else if ($("#sb_code").val() == ''){
					alert("과목코드를 확인해주세요.");
					$("#sb_code").focus();
					$("#sb_code").css("border", "1px solid red");
					return;
				} else if (document.getElementsByName("sb_beforeyn")[0].checked == true){
					if ($("#sb_beforename1").val() == "없음" && $("#sb_beforename2").val() == ''){
						alert("선수과목이 있는 과목입니다. 선수과목명을 입력해주세요.");
						console.log("sb_beforename1.val() >>> : " + $("#sb_beforename1").val());
						console.log("sb_beforename2.val() >>> : " + $("#sb_beforename2").val());
						$("#sb_beforename1").focus();
						$("#sb_beforename2").focus();
						$("#sb_beforename1").css("border", "1px solid red");
						$("#sb_beforename2").css("border", "1px solid red");
						return;	
					}
				} else if ($("#sb_teacher").val() == ''){
					alert("담당교사명을 입력해주세요.");
					$("#sb_teacher").css("border", "1px solid red");
					$("#sb_teacher").focus();
					return;
				} 
				
				// 등록 버튼 클릭하면
				// 로그인한 아이디가 T로 시작하는 아이디인지 확인 필요.
				$("#subjectInsertForm").attr({
					'action':'subjectInsert.k',
					'method':'GET',
					'enctype':'application/x-www-urlencoded'
				}).submit();
			});
			
			$(document).on("click", "#selectAllBtn", function(){
				location.href="subjectSelectAll.k";
			});
		});
	</script>
<!-- 본문 -->
<body>

<!-- 상단 이미지 위에 글씨 오버랩 되는 부분 -->
<div class="image">

    <!-- <img src="/KOSMOS/img/kosmos_1.jpg" width="100%"> -->
    <div class="text">
        <a href=""><h1>KOSMOS 고등학교</h1></a>
    </div>
    <div class="right_box">
    	<a href style="margin-right: 10px;" id="loginbtn">로그인</a>
    	<a href="">수강신청</a>
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
			<section class="section">
			    <br>
			    <h2>과목 정보</h2>
			    <nav class="nav">
			        <br>
			        <ul style="padding-left: 20px;">
			            <li style="margin-bottom: 15px;">
			                <a href="subjectSelectEssential.k">
			                    <span>필수</span>
			                </a>
			            </li>
			            <li class="line1">
			            </li>
			            <li style="margin-top: 15px;">
			                <a href="subjectSelectEssential.k">
			                    <span>선택</span>
			                </a>
			            </li>
			        </ul>
			    </nav>
			</section>
        </div>

        <!-- 가운데부분 width: 69프로 -->
        <!-- 보더값 적용 소스 : <div id="s_center" style="width: 69%; border:1px solid black;float:left;margin-left:5px;margin-right:5px;height:100%;">본문  -->
        <div style="width: 84%; float:left; margin-left:5px;margin-right:5px;height:100%">

            <form id="subjectInsertForm" name="subjectInsertForm">
				<table border="1">
					
					<thead>
						<tr>
							<th colspan="10"><h3 style="font-size: 20px;">새과목 등록</h3>
								<h5 align="center">교과군과 과목명을 입력하고 코드확인 버튼을 누르면 과목코드가 입력됩니다.</h5>
							</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td colspan="5">
								개설년도<select id="sb_year" name="sb_year" class="searchSelect" style="width:60px;"></select>
							</td>
						</tr>
						<tr>
							<td colspan="5">
								대상학년/개설학기
								<select id="sb_grade" name="sb_grade" class="searchSelect" style="width:60px;"></select>
								<select id="sb_semester" name="sb_semester" class="searchSelect" style="width:60px;"></select>
							</td>
						</tr>
						<tr>
							<td colspan="5">
								수업요일/교시
								<select id="sb_day" name="sb_day" class="searchSelect" style="width:80px;"></select>
								<select id="sb_time" name="sb_time" class="searchSelect" style="width:60px;"></select>
							</td>
						</tr>
						<tr>
							<td colspan="5">
								이수단위
								<select id="sb_creditunit" name="sb_creditunit" class="searchSelect" style="width:50px;"></select>
								정원
								<select id="sb_maxstu" name="sb_maxstu" class="searchSelect" style="width:50px;">
									<option value="20">20</option>
									<option value="25">25</option>
									<option value="30">30</option>
								</select>
							</td>
						</tr>
						<tr>
							<td colspan="5">
								교과군 <select id="sb_group" name="sb_group" class="searchSelect" style="width:70px;"></select>
								<!-- 과목유형 -->
								<input type="radio" id="sb_type1" name="sb_type" value="필수" checked>필수
								<input type="radio" id="sb_type2" name="sb_type" value="선택">선택
							</td>
						</tr>
						<tr>
							<td colspan="5">
								선수과목 
								<input type="radio" id="sb_beforeyn1" name="sb_beforeyn" value="Y" checked>있음
								<input type="radio" id="sb_beforeyn2" name="sb_beforeyn" value="N">없음
							</td>
						</tr>
						<tr>
							<td>과목명</td>
							<td>
								<input type="text" id="sb_name" name="sb_name" class="searchText" placeholder="직접입력">
							</td>
							<td>
								<button type="button" id="codeBtn" name="codeBtn" class="searchBtn">코드확인</button>
								과목코드
								<input type="text"  id="sb_code" name="sb_code" value="" class="searchText" style="width:30px" readonly />
							</td>
						</tr>
						<tr>
							<td>선수과목명</td>
							<td colspan="5">
								<input type="text" id="sb_beforename2" name="sb_beforename" class="searchText" placeholder="직접입력">
								<select id="sb_beforename1" name="sb_beforename1" class="searchSelect"></select>
							</td>					
						</tr>
						<tr>
							<td>담당교사</td>
							<td colspan="5">
		                        <input type="text" id="sb_teacher" name="sb_teacher" class="searchText">
							</td>
						</tr>
						<tr>
							<td>등록일</td>
							<td colspan="5">
								<input type="date" id="sb_insdate" name="sb_insdate" class="searchText" readonly>
							</td>	
						</tr>
					</tbody>
					<tr>
						<td colspan="5">
							과목 등록을 위한 관리자님의 비밀번호를 입력해주세요.<br>
							<input type="password" id="teacher_key" name="teacher_key" class="searchText" value="#kosmos2021!">
							<button type="button" id="keyCheck" name="keyCheck" class="searchBtn">확인</button>
							<input type="hidden" id="auth_teacher_key" name="auth_teacher_key" value=<%= AuthenticationKey.TEACHER_KEY %>>
						</td>
					</tr>
					<tr>
						<td colspan="5" align="right">
							<input type="button" id="insertBtn" class="changeBtn" value="등록" disabled >
							<input type="button" id="selectAllBtn" class="searchBtn" value="전체목록">
						</td>
					</tr>
				</table>
			</form>
		
        </div>

        <!-- 오른쪽부분 width: 15프로 -->
        <!-- 보더값 적용 소스 : <div id="s_right" style="width:15%; float:right;height:100%;"본문  -->
        <div style="float:right;height:100%">

            <!-- 오른쪽에서 하단부분 : 식단 -->
            
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

