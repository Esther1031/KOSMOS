<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.kosmos.subject.vo.KosmosSubjectVO" %>
<%@ page import="com.kosmos.common.SubjectUtils" %> 
<%@ page import="com.kosmos.login.vo.KosmosLoginVO" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>선택 목록 + 개설강좌검색</title>

    <!-- 	css랑 js 파일 경로
            WebContent/resource/css/default.css
            WebContent/resource/css/gnb3.css
            요거 두개 보시면 됩니다.
            
            default 는 본문 글자 셋팅 (맨 아랫줄 body부분)
            gnb 는 메뉴 css 및 빨간 테두리 부분 (content로 검색) 들어가 있어요. 
    -->
    <link rel="stylesheet" href="resource/css/default.css">
    <link rel="stylesheet" href="resource/css/gnb3.css">
    <link rel="stylesheet" href="resource/css/subjectSelectAll.css">
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
        
        .thTop{
        	padding-top:10px; 
        	padding-bottom:10px; 
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
	<%
		request.setCharacterEncoding("UTF-8");
	%>
	<%
		// 페이징 변수 세팅
		int pageSize = 0;
		int groupSize = 0;
		int curPage = 0;
		int totalCount = 0;
			
		Object objPaging = request.getAttribute("pagingSVO");
		KosmosSubjectVO pagingSVO_C = (KosmosSubjectVO)objPaging;
		
		Object obj1 = session.getAttribute("result");
		KosmosLoginVO lvo = (KosmosLoginVO)obj1;
		String mt_id = lvo.getMt_id();
		
		Object obj = request.getAttribute("listSA");
		if (obj == null){
		System.out.println("obj가 null");
		}
		ArrayList<KosmosSubjectVO> listSA = (ArrayList<KosmosSubjectVO>)obj;
	%>
	<script type="text/javascript">
	$(document).ready(function(){
		
		$(document).on("click", "#sb_num", function(){
			if($(this).prop('checked')){
				alert("체크박스 체크 확인 >>> : " + $(this).val());
				$("input:checkbox[name='sb_num']").prop('checked', false);		// 다른 체크박스 해제
				$(this).prop('checked', true);									// 선택한 체크박스 선택
			}
		});
		
		// 개설년도 드롭박스
		var thisDate = new Date();
		var thisYear = thisDate.getFullYear();
		$("#key_sbyear").append("<option value=''>"+"전체"+"</option>");	
		for (var i = (thisYear-5); i < (thisYear+5); i++){
			if (i < thisYear){
				$("#key_sbyear").append("<option value='"+i+"'>"+i+"</option>");	
			}
		}
		$("#key_sbyear").append("<option value='"+thisYear+"' selected>"+thisYear+"</option>");	
		for (var i = (thisYear-5); i < (thisYear+5); i++){
			if (i > thisYear){
				$("#key_sbyear").append("<option value='"+i+"'>"+i+"</option>");	
			}
		}
		
		// 학년 드롭박스
		<%String g = SubjectUtils.gradeFrontToDB();
			String[] gArray = g.split(",");
			for (int i=0; i < gArray.length; i++){
				String key_selectGrade = gArray[i];%>
				$("#key_sbgrade").append("<option value='"+"<%= i %>"+"'>"+ "<%=key_selectGrade%>학년" +"</option>");
		<%}%>
		
		// 학기 드롭박스
		<%String s = SubjectUtils.semesterFrontToDB();
			String[] sArray = s.split(",");
			for (int i=0; i < sArray.length; i++){
				String key_selectSemester = sArray[i];%>
				$("#key_sbsemester").append("<option value='"+"<%= i %>"+"'>"+ "<%=key_selectSemester%>학기" +"</option>");
		<%}%>
		
		// 요일 드롭박스
		<%String d = SubjectUtils.dayFrontToDB();
			String[] dArray = d.split(",");
			for (int i=0; i < dArray.length; i++){
				String key_selectDay = dArray[i];%>
				$("#key_sbday").append("<option value='"+"<%= key_selectDay %>"+"'>"+ "<%=key_selectDay%>요일" +"</option>");
		<%}%>
		
		// 교시 드롭박스
		<%String t = SubjectUtils.timeFrontToDB();
			String[] tArray = t.split(",");
			for (int i=0; i < tArray.length; i++){
				String key_selectTime = tArray[i];%>
				$("#key_sbtime").append("<option value='"+"<%= key_selectTime %>"+"'>"+ "<%=key_selectTime%>교시" +"</option>");
		<%}%>
		
		// 과목명 클릭 후 단일 조회
		$(document).on("click", "#searchBtn", function(){
			$("#subjectSelectAll").attr({
				'action':'subjectSelectAll.k',
				'method':'GET',
				'enctype':'application/x-www-form-urlencoded'
			}).submit();
		});
		
		$(document).on("click", "#selectBtn", function(){
			$("#subjectSelectAll").attr({
				'action':'subjectSelect.k',
				'method':'GET',
				'enctype':'application/x-www-form-urlencoded'
			}).submit();
		});
		
		$(document).on("click", "#updateBtn", function(){
			if ($('.sbnum:checked').length == 0){
				alert("수정할 글번호 하나를 선택하세요!!");
				return;
			}
			$("#subjectSelectAll").attr({
				'action':'subjectUpdateForm.k',
				'method':'GET',
				'enctype':'application/x-www-form-urlencoded'
			}).submit();
		});
		
		$(document).on("click", "#insertBtn", function(){
			location.href="subjectInsertForm.k";
		});
		
		$(document).on("click", "#deleteBtn", function(){
			if ($('.sbnum:checked').length == 0){
				alert("삭제할 글번호 하나를 선택하세요!!");
				return;
			}
			$("#subjectSelectAll").attr({
				'action':'subjectDelete.k',
				'method':'GET',
				'enctype':'application/x-www-form-urlencoded'
			}).submit();
		});
	});
	</script>
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
    	<a href="suGang">수강신청</a>
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
			                <a href="subjectSelectChoice.k">
			                    <span>선택</span>
			                </a>
			            </li>
			        </ul>
			    </nav>
			</section>
        </div>

        <!-- 가운데부분 width: 69프로 -->
        <!-- 보더값 적용 소스 : <div id="s_center" style="width: 69%; border:1px solid black;float:left;margin-left:5px;margin-right:5px;height:100%;">본문  -->
        <div style="width: 83%; float:left; margin-left:5px;margin-right:5px;height:100%">

             <h3 style="font-size:30px; margin:0px auto;" align="center">개설 강좌 전체 목록</h3>
		<form id="subjectSelectAll" name="subjectSelectAll">
		<div align="center">
		<div class="serchwrap">
				<table border="1" class="tableSearch" style="border: 1px solid Gainsboro;">
					<thead>
						<tr>
							<th>개설년도</th>
							<td><select class="searchSelect" id="key_sbyear" name="key_sbyear"></select></td>
						</tr>
						<tr>
							<th>대상학년</th>		<!-- 드롭박스 -->
							<td><select class="searchSelect" id="key_sbgrade" name="key_sbgrade"></select></td>
							<th>대상학기</th>		<!-- 드롭박스 -->
							<td><select class="searchSelect" align="center" id="key_sbsemester" name="key_sbsemester"></select></td>
						</tr>
						<tr>
							<th>수업요일</th>		<!-- 드롭박스 -->
							<td><select class="searchSelect" id="key_sbday" name="key_sbday"></select></td>
							<th>수업교시</th>		<!-- 드롭박스 -->
							<td><select class="searchSelect" id="key_sbtime" name="key_sbtime"></select></td>		
						</tr>
						<tr>
							<th>과목명</th>	<!-- 텍스트 -->
							<td><input type="text" class="searchText" id="key_sbname" name="key_sbname" placeholder="직접입력" /></td>	
							<th>담당교사명</th>	<!-- 텍스트 -->
							<td><input type="text" class="searchText" id="key_sbteacher" name="key_sbteacher" placeholder="직접입력" /></td>
						</tr>
					</thead>
				</table>
			<button type="button" id="searchBtn" class="searchBtn">검색</button>
			</div>
			</div>
			<table border="1" class="tableSA" align="center">
				<thead>
					<tr>
						<th class="thTop"><input type="checkbox" id="chkTop" name="chkTop"></th>
						<th>개설년도</th>
						<th>교과군</th>	<!-- 국어, 영어, 수학, 사회, 과학 -->
						<th>과목코드</th>
						<th>과목유형</th>	<!-- 필수/선택 -->
						<th>과목명</th>
						<th>이수단위</th>	<!-- 1, 2, 3 -->
						<th>대상학년</th>	<!-- 1, 2, 3, 4(전) 학년 --> 
						<th>대상학기</th>
						<th>담당교사명</th>
						<th>정원</th>
						<th>수업요일/교시</th> 
						<th>선수과목명</th>
					</tr>
				</thead>
			<%
				if (listSA != null && listSA.size() >= 0){
					for (int i=0; i < listSA.size(); i++){
						KosmosSubjectVO svo = listSA.get(i);
						// 패이징 세팅
						pageSize = Integer.parseInt(pagingSVO_C.getPageSize());
						groupSize = Integer.parseInt(pagingSVO_C.getGroupSize());
						curPage = Integer.parseInt(pagingSVO_C.getCurPage());
						totalCount = Integer.parseInt(svo.getTotalCount());
						
						// 과목 세팅
						String sb_grade = SubjectUtils.gradeDBToFront(svo.getSb_grade());
						String sb_group = SubjectUtils.groupDBToFront(svo.getSb_group());
						String sb_semester = SubjectUtils.semesterDBToFront(svo.getSb_semester());
						if (svo.getSb_beforename() == null){
							svo.setSb_beforename("(없음)");
						}
			%>
					<tbody>
						<tr>
							<th><input type="checkbox" id="sb_num" name="sb_num" class="sbnum" value="<%= svo.getSb_num() %>"></th>
							<td><%= svo.getSb_year() %></td>
							<td><%= sb_group %></td>	<!-- 국어, 영어, 수학, 사회, 과학 -->
							<td><%= svo.getSb_code() %></td>
							<td><%= svo.getSb_type() %></td>	<!-- 필수/선택 -->
							<td><%= svo.getSb_name()%></td>
							<td><%= svo.getSb_creditunit() %></td>	<!-- 1, 2, 3 -->
							<td><%= sb_grade %>학년</td>	<!-- 1, 2, 3 학년 -->
							<td><%= sb_semester %>학기</td>
							<td><%= svo.getSb_teacher() %></td>
							<td><%= svo.getSb_maxstu() %> 명</td>
							<td><%= svo.getSb_day() %>요일<br><%= svo.getSb_time() %>교시</td>
							<td><%= svo.getSb_beforename() %></td>
						</tr>
					</tbody>	
			<%
				}	// end of for
			}
			%>
				<tr>
					<td colspan="20" style="padding-top:10px; padding-bottom:10px; padding-left:80px;">
						<input type="button" id="selectBtn" class="btn" value="조회">
			<%
				if (mt_id != null){
			%>
						<input type="button" id="updateBtn" class="btn" value="수정">
						<input type="button" id="deleteBtn" class="btn" value="삭제">
						<input type="button" id="insertBtn" class="btn" value="과목 새등록" style="float:right;">
			<%
				};
			 %>
					</td>
				</tr>
				<tr>
					<td colspan="20">
						<jsp:include page ="subjectPaging.jsp" flush="true">
							<jsp:param value="subjectSelectAll.k" name="url"/>
							<jsp:param value="" name="str"/>
							<jsp:param value="<%= pageSize %>" name="pageSize"/>
							<jsp:param value="<%= groupSize %>"	name="groupSize"/>
							<jsp:param value="<%= curPage %>" name="curPage"/>
							<jsp:param value="<%= totalCount %>" name="totalCount"/>
						</jsp:include>
					</td>
				</tr>
			</table>
		</form>

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
        copyright (c) 코스모스고등학교 All Rights Reserved
    </div>
</div>

</body>
</html>