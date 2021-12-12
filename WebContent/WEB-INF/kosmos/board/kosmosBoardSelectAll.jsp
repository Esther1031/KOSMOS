<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page import="com.kosmos.board.vo.KosmosBoardVO" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>게시판</title>

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
			/*
				CSS 선택자 우선순위 점수
				직접기입  : styl='' : 1000 점 
				id : #sbnum : 100점
				class : .sbnum : 10점
				속성 : [name="sbnum"] : 10점
			*/
			// sbnum
			$(document).on("click", "#bo_num", function(){
				//alert("chkInSbnum >>> : ");		
				if($(this).prop('checked')){			 
					//$('input[type="checkbox"][name="sbnum"]').prop('checked',false);
					$('.bo_num').prop('checked',false);
					$(this).prop('checked',true);
				}
			});
				
			// 검색버튼
			//  U
			$(document).on("click", "#searchBtn", function(){
				alert("searchBtn >>> : ");			
				$("#boardList").attr({ "method":"GET"
					                  ,"action":"boardSelectAll.k"}).submit();
			});
			// datepicker : from ~ to 기간조회
			$("#startdate").datepicker({		
				showOn: "button",    // 달력을 표시할 타이밍 (both: focus or button)
				buttonImage: "/KOSMOS/img/cal_0.gif", 
				buttonImageOnly : true,            
				buttonText: "날짜선택",             
				dateFormat: "yy-mm-dd",             
				changeMonth: true,                  			
				onClose: function(selectedDate) {    
					$("#enddate").datepicker("option", "minDate", selectedDate);
				}                
			});		
			$("#enddate").datepicker({
				showOn: "button", 
				buttonImage: "/KOSMOS/img/cal_0.gif", 
				buttonImageOnly : true,
				buttonText: "날짜선택",
				dateFormat: "yy-mm-dd",
				changeMonth: true,			
				onClose: function(selectedDate) {	
					$("#startdate").datepicker("option", "maxDate", selectedDate);
				}               
			});			
			
			//  I
			$(document).on("click", "#I", function(){
				//alert("I >>> : ");
				location.href="boardForm.k";
			});
			//  U
			$(document).on("click", "#U", function(){
				// alert("U >>> : ");	
				/* if ($('.bo_num:checked').length == 0){
					alert("수정할 글번호 하나를 선택하세요!!");
					return;
				} */
				var v1 = $("#ISUD_TYPE").val('U');
		         alert("v1 >>> : " + v1.val());
		         $("#boardList").attr({
		            "method":"POST",
		            "action":"boardSelect.k?ISUD_TYPE="+v1.val()
		         }).submit();
				
			});
			//  D
			$(document).on("click", "#D", function(){
				alert("게시글이 삭제되었습니다");	
				if ($('.bo_num:checked').length == 0){
					alert("삭제할 글번호 하나를 선택하세요!!");
					return;
				}
				$("#boardList").attr({ "method":"POST"
					                  ,"action":"boardDelete.k"}).submit();
			});
		//  댓글버튼 단건조회 S
			$(document).on("click", "#S", function(){
				alert("S >>> : ");	
				if ($('.bo_num:checked').length == 0){
					alert("댓글쓸 게시물 하나를 선택하세요!!");
					return;
				}
				var v1 = $("#ISUD_TYPE").val('S');
		         //alert("v1 >>> : " + v1.val());
		         $("#boardList").attr({
		            "method":"POST",
		            "action":"boardSelect.k?ISUD_TYPE="+v1.val()
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
            
            $("#loginbtn").click(function () {

                window.open("loginFormPop.k", "", "width=600, height=500, resizable=no, scrollbars=no, status=no");

            });

        });

    </script>
	<!-- ============================== script ============================== -->
	

    
	<!-- ============================== style ============================== -->
    <style type="text/css">
		.tt{
			text-align: center;
			font-weight: bold;
		}
		.content{
			width: 1000px;
			height: 500px;
			margin: 0px auto;
			margin-bottom: 100px;
			float: center;
			border: 1px solid white;
		}
		
		.paging{
			margin-top: 20px;
   			border-top: 1px dashed #dadada;
   			text-align: center;
		}

		@import url(style.css);
		/*font-family: Roboto*/
		@import url('https://fonts.googleapis.com/css?family=Roboto');
		/*font-family: Roboto; font-weight:100*/
		@import url('https://fonts.googleapis.com/css?family=Roboto:100');
		@charset "utf-8";
		
		/*공통부분*/
		body{font-family:Nanum Barun Gothic, Roboto, sans-serif;}
		body,h1,h2,h3,h4,h5,h6,p,ul,ol,li,dl,dt,dd,hr,button{margin:0; padding:0; list-style:none;}
		a{text-decoration:none;}
		img{border:0; }
		
		#container{margin:0 auto;width:1200px;}
		.border_inner{padding: 0px 100px 0px 0px;}
		.border_wrap{margin-right:130px;}
		
		/* 게시판 아코디언 부분 */
		.border_inner{width:910px; margin-bottom:20px;}
		
		.border_contitle{width:910px;height:30px;margin-bottom:20px;border-bottom:1px solid black;}
		.border_contitle>li{float:left;height:auto;margin-bottom:20px;}
		.border_contitle>li:nth-of-type(1){padding-right:10px;border-right:1px solid black;width:100px;text-align:center;}
		.border_contitle>li:nth-of-type(2){padding-left:10px;padding-right:10px;text-align:center;width:450px;}
		.border_contitle>li:nth-of-type(3){padding-right:9px;padding-left:10px;border-right:1px solid black;border-left:1px solid black;width:130px;text-align:center;}
		.border_contitle>li:nth-of-type(4){padding-left:10px;text-align:center;width:140px;}
		
		.border_title{height: 30px; border-bottom:1px solid black;padding-bottom:5px;}
		.border_title>h3{float:left;}
		.border_title>h3>button{border:none; background:transparent; font-size:20px; font-weight:normal;width:450px;}
		.border_title>span{font-size:20px; font-weight:normal;float:left;margin-top:3px;}
		.border_title>span:nth-of-type(1){padding-right:10px;border-right:1px solid black;width:100px;text-align:center;}
		.border_title>span:nth-of-type(2){padding-right:10px;padding-left:10px;border-right:1px solid black;border-left:1px solid black;width:130px;text-align:center;}
		.border_title>span:nth-of-type(3){padding-left:10px;text-align:center;width:140px;}
		.border_title>h3{padding-left:10px;padding-right:10px;}
		
		.border_con>ul>li{clear:both; line-height:30px; color:#666; margin-top:10px;}
		.border_con>ul>li>p{text-align:left;padding-left:10px;}
		.border_con>ul>li>button{float:left;}
		.border_con>ul>li>button:nth-of-type(1){margin-left:750px;margin-right:10px;}
		.border_con>ul>li>button:nth-of-type(2){margin-right:10px;}
	
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
	<div class="image">
	
	    <!-- <img src="/KOSMOS/img/kosmos_1.jpg" width="100%"> -->
	    <div class="text">
	       <a href="mainHome.k"><h1>KOSMOS 고등학교</h1></a>
	    </div>
    	<a href style="margin-right: 10px;" id="loginbtn">로그인</a>
    	<a href="registration.k">수강신청</a>
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
	        <!-- 보더값 적용 소스 : <div id="s_center" style="width: 69%; border:1px solid black;float:left;margin-left:5px;margin-right:5px;height:100%;">본문  -->
	        <div style="width: 100%; float:left; margin-left:5px;margin-right:5px;height:100%">
	
	<div class="contents" align="center" style="color:#043874;">
	<div id="contents">
	<% request.setCharacterEncoding("UTF-8");%> 
	<%
	
		//페이징 변수 세팅
		int pageSize = 0;
		int groupSize = 0;
		int curPage = 0;
		int totalCount = 0;	
	
		Object objPaging = request.getAttribute("pagingBVO");
		KosmosBoardVO pagingBVO = (KosmosBoardVO)objPaging;
		
		Object obj = request.getAttribute("listAll");
		List<KosmosBoardVO> list = (List)obj;
		
		int nCnt = list.size();
		System.out.println("nCnt >>> : " + nCnt);	
		
	%>

	<form name="boardList" id="boardList">
	<br>


<div id="container">
		   <h2 style="float:left;margin-left:35px;display:block;width:910px;text-align:left;">코스모스 숲</h2>
		   <br>
           <div class="container_wrap" style="margin-top:20px;">
            <div class="border_wrap">
            
           	<div style="margin-left:570px;margin-bottom:10px;">
				<input type="text" id="startdate" name="startdate" size="12" placeholder="시작일 "style="border:1px solid black;">
				~ <input type="text" id="enddate" name="enddate" size="12" placeholder="종료일"style="border:1px solid black;">
				
			</div>
               <div style="margin-left:570px;">
               	<select id="keyfilter" name="keyfilter" style="border:1px solid black;width:100px;"> 
					<option value="key1">제목</option>
					<option value="key2">내용</option>
					<option value="key3">제목+내용</option>
					<option value="key4">회원번호</option>
					<option value="key5">글번호</option>
				</select>
                <input type="text" id="keyword" name="keyword" placeholder="검색어 입력" style="border:1px solid black;">
                <button type="button" id="searchBtn">검색</button>
                </div>
            	<br>
            	
                <div class="border_inner">
                
	               
					<ul class="border_contitle">
					
						<li>번호</li>
						<li>제목</li>
						<li>회원번호</li>
						<li>등록일</li>
					</ul>
					<%
                   		for(int i=0; i<nCnt; i++){		
                   			KosmosBoardVO bvo = list.get(i);	
                   			pageSize = Integer.parseInt(pagingBVO.getPageSize());
                   			groupSize = Integer.parseInt(pagingBVO.getGroupSize());
                   			curPage = Integer.parseInt(pagingBVO.getCurPage());
                   			totalCount = Integer.parseInt(bvo.getTotalCount());
                 	%>
                    <ul>
                        <li class="border_con">                                 
                    		<div class="border_title">
                    		<input type="checkbox" name="bo_num" id="bo_num" class="bo_num" value=<%= bvo.getBo_num() %> >                    	                   	
								<span><%= bvo.getBo_num() %>1</span>
                                <h3><button><%= bvo.getBo_subject() %></button></h3>
								<span><%= bvo.getMs_num() %></span>
								<span><%= bvo.getBo_upddate() %></span>
                            </div>
                       
                            <ul>
                            
                                <li>    
                                	<p><textarea rows="5" cols="50"style="border: 1px solid black; width: 724px; height: 36px;"><%=bvo.getBo_contents() %></textarea></p>               
									<button id="U" >수정하기</button>
									<button id="D">삭제하기</button>
									<button id="S">댓글</button>
                                </li>
                            </ul>
                        </li>
                    </ul> 
                      
                    <br>
                    <br>              
                    <%
							}//end of for
					%>
					<tr>
		<td colspan="7">
			<jsp:include page="BoardPaging.jsp" flush="true">
				<jsp:param value="boardSelectAll.k" name="url"/>
				<jsp:param value="" name="str"/>
				<jsp:param value="<%=pageSize %>" name="pageSize"/>
				<jsp:param value="<%=groupSize %>" name="groupSize"/>
				<jsp:param value="<%=curPage %>" name="curPage"/>
				<jsp:param value="<%=totalCount %>" name="totalCount"/>
			</jsp:include>
		</td>
	</tr>
                </div><!-- border_inner 끝-->
                <div style="margin-left:830px;">	
					<input type="hidden" name="ISUD_TYPE" id="ISUD_TYPE" value="">	
					<input type="button" value="글쓰기" id='I'>
					<input type="button" value="댓글보기"id='S'>								
				</div>
            </div><!-- border_wrap 끝-->
           </div><!-- container_wrap 끝-->         
        </div><!-- container 끝-->

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