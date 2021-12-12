<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.kosmos.subject.vo.KosmosSubjectVO" %>
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
		    width: 400px;
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
			width: 120px;
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
	<% request.setCharacterEncoding("UTF-8"); %>
	<%
		Object obj = request.getAttribute("listUF");
		if (obj == null){
			return;
		}
	%>
	<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script type="text/javascript">
	$(document).ready(function(){
		// 오늘 날짜 바인딩 
		document.getElementById('sb_upddate').value = new Date().toISOString().substring(0, 10);
		
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
		
		// 교시 드롭박스
		<%  String t = SubjectUtils.timeFrontToDB();
			String[] tArray = t.split(",");
			for (int i=0; i < tArray.length; i++){
				String key_selectTime = tArray[i];
		%>
				$("#sb_time").append("<option value='"+"<%= key_selectTime %>"+"'>"+ "<%= key_selectTime %>교시" +"</option>");
		<%
			}
		%>
		
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
			console.log("sb_beforeyn.val() >>> : " + document.getElementsByName("sb_beforeyn")[0].value);
			if($(this).prop('checked')){
				console.log("선수과목 있음");
				$("select[id='sb_beforename1']").attr("disabled", false);
				$("#sb_beforename2").attr("readonly", false);
			}
		});
		
		// 선수 과목 없음
		$("input:radio[id='sb_beforeyn2']").click(function(){
			console.log("sb_beforeyn.val() >>> : " + document.getElementsByName("sb_beforeyn")[1].value);
			if($(this).prop('checked')){
				console.log("선수과목 없음");
				$("#sb_beforename2").val('');
				$("select[id='sb_beforename1']").attr("disabled", true);
				$("#sb_beforename2").attr("readonly", true);
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
				$("#updateBtn").attr("disabled", false);
				$("#teacher_key").css("background-color", "lightgray");
				$("#updateBtn").css("background-color", "#34558b");
			}else{
				alert("관리자 키와 일치하지 않습니다. 비밀번호를 다시 확인해주세요.");
				$("#teacher_key").val('');
				$("#teacher_key").focus();
			}
		});
		
		// 수정 완료 버튼
		$(document).on("click", "#updateBtn", function(){
			$("#subjectUpdateForm").attr({
				'action':'subjectUpdate.k',
				'method':'GET',
				'enctype':'application/x-www-form-urlencoded'
			}).submit();		
		});
		
		// 새등록 버튼
		$(document).on("click", "#insertBtn", function(){
			location.href="subjectInsertForm.k";
		});
		
		$(document).on("click", "#selectAllBtn", function(){
			location.href="subjectSelectAll.k";
		});
	});
	</script>

<body>

	<!-- ========================================== 헤더 ========================================== -->
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
	<!-- ========================================== 헤더 ========================================== -->
 
 
    <!-- 
        (빨간선) 
        빨간선은 마지막에 웹컨텐트 > 리소스 > css > gnb3.css 에서  
        content 찾아서 border 지워주시면 됩니다.	
    -->
    <div class="content">
    
		<!-- ========================================== 왼쪽 사이드 바 ========================================== -->
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
	                <a href="subjectSelectChoice.k">
	                    <span>선택</span>
	                </a>
	            </li>
	        </ul>
	    </nav>
	</section>
        </div>
		<!-- ========================================== 왼쪽 사이드 바 ========================================== -->
		
		
      	<!-- ========================================== 중앙(본문) ========================================== -->
        <!-- 보더값 적용 소스 : <div id="s_center" style="width: 69%; border:1px solid black;float:left;margin-left:5px;margin-right:5px;height:100%;">본문  -->
        <div style="width: 83%; float:left; margin-left:5px;margin-right:5px;height:100%">
		<form id="subjectUpdateForm" name="subjectUpdateForm">
				<table border="1">
					<thead>
						<tr>
							<th colspan="5"><h3 style="font-size:30px; margin:0px auto;" align="center">과목 수정</h3></th>
						</tr>
					</thead>
		<%
			List<KosmosSubjectVO> listUF = (List<KosmosSubjectVO>)obj;
			if (listUF != null && listUF.size() > 0){
				KosmosSubjectVO svo = listUF.get(0);
				String sb_grade = SubjectUtils.gradeDBToFront(svo.getSb_grade());
				String sb_group = SubjectUtils.groupDBToFront(svo.getSb_group());
				if (svo.getSb_beforename() == null){
					svo.setSb_beforename("");
				}
		%>
				<tbody>
					<script>
						function compCheck() {
							// 과목유형 체크 
							var type = '<%= svo.getSb_type() %>';
							if ("필수" == type){
								$("#sb_type1").prop("checked", true);
							}
							if ("선택" == type){
								$("#sb_type2").prop("checked", true);
							}
							
							// 선수과목여부 체크
							var beforeyn = '<%= svo.getSb_beforeyn() %>';
							if ("Y" == beforeyn){
								$("#sb_beforeyn1").prop("checked", true);
							}
							if ("N" == beforeyn){
								$("#sb_beforeyn2").prop("checked", true);
							}
							
							// 선수과목 있음 체크
							if ($("#sb_beforeyn1").is(':checked')){
								console.log("sb_beforeyn.val()" + document.getElementsByName("sb_beforeyn")[0].value);
								$("select[id='sb_beforename1']").attr("disabled", false);
								$("#sb_beforename2").attr("readonly", false);
							}
							
							// 선수과목 없음 체크
							if ($("#sb_beforeyn2").is(':checked')){
								console.log("sb_beforeyn.val()" + document.getElementsByName("sb_beforeyn")[1].value);
								$("select[id='sb_beforename1']").attr("disabled", true);
								$("#sb_beforename2").attr("readonly", true);
							}
							
						}	// end of function compCheck()
					</script>
					<tr>
						<td colspan="5">
						<input type="hidden" id="sb_num" name="sb_num" value="<%= svo.getSb_num() %>" readonly />
						개설년도 <input id="sb_year" name="sb_year" class="searchText" value="<%= svo.getSb_year() %>" style=width:50px; readonly>
						</td>
					</tr>
					<tr>
						<td colspan="10">
						<!-- 과목유형 -->
							<input type="radio" id="sb_type1" name="sb_type" value="필수" checked>필수
							<input type="radio" id="sb_type2" name="sb_type" value="선택">선택
							<div style="float: right; margin-right: 40px;">
								교과군 
								<select id="sb_group" name="sb_group" class="searchSelect">
									<option value="<%= svo.getSb_group() %>"><%= sb_group %></option>
								</select>
							</div>
						</td>
					</tr>
					<tr>
						<td>과목명</td>
						<td>
							<input type="text" id="sb_name" name="sb_name" class="searchText" value="<%= svo.getSb_name() %>" readonly>	
						</td>
					</tr>
					<tr>
						<td colspan="5">
							대상학년/학기
							<select id="sb_grade" name="sb_grade" class="searchSelect" style="width:80px;">
								<option value="<%= svo.getSb_grade() %>"><%= svo.getSb_grade() %>학년</option>	
							</select>
							<select id="sb_semester" name="sb_semester" class="searchSelect" style="width:80px;">
								<option value="<%= svo.getSb_semester() %>"><%= svo.getSb_semester() %>학기</option>
							</select>
							이수단위
							<select id="sb_creditunit" name="sb_creditunit" class="searchSelect" style="width:50px;">
								<option value="<%= svo.getSb_creditunit() %>"><%= svo.getSb_creditunit() %></option>
							</select>
						</td>
					</tr>
					<tr>
						<td>담당교사</td>
						<td><input type="text" id="sb_teacher" name="sb_teacher" class="searchText" value="<%= svo.getSb_teacher() %>">
	                       	<!-- 해당 과목의 모든 선생님 일단 목록 다 나와야 하고, 선택하면 그 선생님의 정보에 대해서만 수정 가능하게.. (시간남으면 수정) -->
	                   <!-- <button type="button" id="search_teacher" name="search_teacher">검색</button> -->    	
						</td>
					</tr>
					<tr>
						<td colspan="5">
							수업요일/교시
							<select id="sb_day" name="sb_day" class="searchSelect" style="width:80px;">
								<option value="<%= svo.getSb_day() %>" ><%= svo.getSb_day() %>요일</option>
							</select>
							<select id="sb_time" name="sb_time" class="searchSelect" style="width:80px;">
								<option value="<%= svo.getSb_time() %>"><%= svo.getSb_time() %>교시</option>
							</select>
							정원
							<select id="sb_maxstu" name="sb_maxstu" class="searchSelect" style="width:50px;">
								<option value="<%= svo.getSb_maxstu() %>"><%= svo.getSb_maxstu() %></option>
								<option value=""> - </option>
								<option value="20">20</option>
								<option value="25">25</option>
								<option value="30">30</option>
							</select>
						</td>
					</tr>
					<tr>
						<td colspan="5">
							선수과목 
							<input type="radio" id="sb_beforeyn1" name="sb_beforeyn" value="Y">있음
							<input type="radio" id="sb_beforeyn2" name="sb_beforeyn" value="N">없음
						</td>
					</tr>
					<tr>
						<td colspan="5">
							선수과목명
							<input type="text" id="sb_beforename2" name="sb_beforename" class="searchText" value="<%= svo.getSb_beforename() %>">
							<select id="sb_beforename1" name="sb_beforename1" class="searchSelect" style="width:80px;"></select>
						</td>					
					</tr>
					<tr>
						<td>수정일</td>
						<td><input id="sb_upddate" name="sb_upddate" class="searchText" readonly></td>	
					</tr>
				</tbody>
		<%		
			}
		%>
				<tr>
					<td colspan="5">
						과목 등록을 위한 관리자님의 비밀번호를 입력해주세요.<br>
						<input type="password" id="teacher_key" name="teacher_key" class="searchText" value="#kosmos2021!">
						<button type="button" id="keyCheck" name="keyCheck" class="searchBtn">확인</button>
						<input type="hidden" id="auth_teacher_key" name="auth_teacher_key" value=<%= AuthenticationKey.TEACHER_KEY %>>
					</td>
				</tr>
				<tr>
					<td colspan="5" align="left">
						<input type="button" id="updateBtn" class="changeBtn" value="수정완료" disabled>
						<input type="button" id="insertBtn" class="searchBtn" style="width:60px;" value="새등록">
						<input type="button" id="selectAllBtn" class="searchBtn" value="전체목록">
					</td>
				</tr>
			</table>
		</form>
        </div>
		<!-- ========================================== 중앙(본문) ========================================== -->
		
		
		
		<!-- ========================================== 오른쪽 사이드 바 ========================================== -->
        <!-- 오른쪽부분 width: 15프로 -->
        <!-- 보더값 적용 소스 : <div id="s_right" style="width:15%; float:right;height:100%;"본문  -->
        <div style=" float:right;height:100%">

            <!-- 오른쪽에서 상단 부분 : 날씨 -->
            <%--
            <div style="height: 30%; margin-top: 50px">
                <h1>오늘의 날씨</h1>
                <p>
                <p>
                    <!-- 원래 주석처리 되어있던 것 (안지움) <div class = "mainb3">Seoul<br>Current Weather</div>-->
                <div class="mainb3">서울</div>
                <div class="seicon" style="text-align:center"></div>
                <div class="setemp"> 현재 온도 :</div>
            </div>

            <!-- 오른쪽에서 하단부분 : 식단 -->
            <div style="float:top; height: 40%">

                <h1>오늘의 메뉴</h1>
                	흰쌀밥,된장국,김치,꼬마돈까스,제육볶음
                <div class="slide">
                    <ul>
                        <li><img src="img/_rice.jpg"></li>
                        <li><img src="img/_kim.jpg"></li>
                        <li><img src="img/_miso.jpg"></li>
                        <li><img src="img/_pork.jpg"></li>
                        <li><img src="img/_don.jpg"></li>
                    </ul>
                </div>
            </div>
        </div>
        --%>
		<!-- ========================================== 오른쪽 사이드 바 ========================================== -->      
    </div>
    
    
</div>


	<!-- ========================================== footer ========================================== -->
	<!-- footer 부분  -->
	<div id="footer" align="center">
	    <div class="container">
	        서울 금천구 가산동 8명로 88 코스모스고등학교 <br/>
	        교무실 02-123-4567(09:00~17:00) 행정실 02-7654-3210(09:00~24:00)<br/>
	        opyright (c) 코스모스고등학교 All Rights Reserved
	    </div>
	</div>
	<!-- ========================================== footer ========================================== -->

</body>
</html>

