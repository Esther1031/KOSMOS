<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page import="com.kosmos.notice.vo.KosmosNoticeVO" %>
<%@ page import="com.kosmos.login.vo.KosmosLoginVO" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>공지사항 > 수정</title>

    <link rel="stylesheet" href="resource/css/default.css">
    <link rel="stylesheet" href="resource/css/gnb3.css">

	<!-- =============================== script =============================== -->
    <script src="resource/js/jquery.js" charset="utf-8"></script>
    <script src="resource/js/gnb3.js" charset="utf-8"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"
            integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script>
        function openNav() {
            document.getElementById("mySidenav").style.width = "250px";
        }

        function closeNav() {
            document.getElementById("mySidenav").style.width = "0";
        }
        
        $(document).ready(function () {

            $("#img_ucc").click(function () {

                window.open("notice.jsp", "", "width=800, height=800, resizable=no, scrollbars=no, status=no");

            });
            
            $("#loginbtn").click(function () {

                window.open("loginFormPop.k", "", "width=600, height=500, resizable=no, scrollbars=no, status=no");

            });

        });
    </script>
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script> 
	<script type="text/javascript">
		
		$(document).ready(function(){
			
			// 수정 버튼 클릭.
			$(document).on("click", "#updBtn", function(){
				
				var no_num = $("#no_num").val();
				console.log("updBtn");
				// notice(element)의 속성값을 가져오거나 추가 
				$('#noticeUpdateForm').attr({
					'action':'noticeUpdate.k?no_num='+no_num,
					'method':'POST',
					// 파일 넘길 때 필요
					'enctype':'multipart/form-data'
				}).submit();
			});
			
			// 목록 버튼 클릭.
			$("#listBtn").on("click", function(){
				$("#noticeUpdateForm").attr({
					'action':'noticeList.k',
					'method':'GET',
					'enctype':'application/x-www-form-urlencoded'
				});
				
				$("#noticeUpdateForm").submit();
			});
			
		});
			
	</script>
	<!-- =============================== script =============================== -->
    

	<!-- =============================== style =============================== -->
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
		.tt {
			text-align:center;
		}
		td {
			width: 160px;
			border: 1px solid Gainsboro;
			text-align:center;
			line-height:1.5;
			color: #34558b;
		}
		table {
			width:750px;
			text-align:right;
		}
		.line{
			text-align:center;
			border-top: 2px solid #34558b;
			color: #34558b;
		}
		.content{
			width: 1200px;
			height: 900px;
			margin: 0px auto;
			margin-bottom: 100px;
			float: center;
			border: 1px solid red;
		}
		.line1{
			border-top: 1px dashed Gainsboro;
			width: 190px;
		}
		.all{
			width: 750px;
			margin: 50px 10px 50px 180px;
		}
		.wrap {
			width : 660px;
			align : center;
			border : 5px;
			margin : 10px auto;
		}
		.forWriter{
			width: 750px;
			padding-top: 10px;
			float: right;
			
		}
		.listBtn{
			color: white;
			background-color: #34558b;
			height: 25px;
			width: 55px;
			border: 0px solid black;
			border-radius: 4px;
			display: block;
			float: right;
		}
		.updBtn{
			color: white;
			background-color: #34558b;
			height: 25px;
			width: 55px;
			border: 0px solid black;
			border-radius: 4px;
			display: block;
			float: right;
			margin-right: 5px;
		}
		.paging{
			margin-top: 20px;
   			border-top: 1px dashed #dadada;
   			text-align: center;
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
    </style>
	<!-- =============================== script =============================== -->
	
</head>


<body>

	<!-- =========================== header1 =========================== -->
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
	        <div style="width:15%; float:left;height:100%;">
				<section class="section">
					<br>
					<h2>공지사항</h2>
					<nav class="nav">
						<br>
						<ul style="padding-left: 20px;">
							<li style="margin-bottom: 15px;">
								
									<span></span>
								
							</li>
							<li class="line1">
							</li>
							<li style="margin-top: 15px;">
								
									<span></span>
								
							</li>
						</ul>
					</nav>
				</section>
	        </div>
	        <!-- =========================== 왼쪽 사이드 바 =========================== -->


	
	        <!-- ============================== 본문 ============================== -->
	        <!-- 보더값 적용 소스 : <div id="s_center" style="width: 69%; border:1px solid black;float:left;margin-left:5px;margin-right:5px;height:100%;">본문  -->
	        <div style="width:84%; float:right; margin-left:5px; margin-right:5px; height:100%">
			<% request.setCharacterEncoding("UTF-8"); %>
			<%
				KosmosNoticeVO nvo = null;
				Object obj = request.getAttribute("listS");
				nvo = (KosmosNoticeVO)obj;
				System.out.println("뷰에서 선택한 글 번호 : " + nvo.getNo_num());
			%>
				<div class="all">
					<div style="margin::5px 0px 5px 0px;">
						<h2>공지사항</h2>
					</div>
					<form name="noticeUpdateForm" id="noticeUpdateForm" method="POST">
							<input type="hidden" id="no_num" name="no_num" value="<%=nvo.getNo_num() %>">
							<table>
								<tr>
									<td class="line" colspan="1">제목</td>
									<td class="line" colspan="3">
										<input type="text" name="no_subject" size="60" value="<%= nvo.getNo_subject() %>" />
									</td>
								</tr>
								<tr>
									<td>작성자</td>
									<td>
										<input type="text" name="mt_num" id="mt_num" style="text-align:center;"  value="<%= nvo.getMt_num() %>" readonly />
									</td>
									<td class="tt">작성일</th>
								<td>
									<input name="no_insdate" value="<%= nvo.getNo_insdate() %>" style="text-align:center;" readonly />
								</td>
								</tr>
								<tr>
									<td colspan="1">첨부파일</td>
									<td style="text-align: left; padding-left:8px;" colspan="3">
										<input type="file" name="no_file" id="no_file" value="<%= nvo.getNo_file() %>" />
									</td>
								</tr>
								<!-- 내용 -->
								<tr>
									<td colspan="4">
										<textarea name="no_contents" id="no_contents" cols="104" rows="28"><%= nvo.getNo_contents() %></textarea>
									</td>
								</tr>
							</table>
							
							<div class="forWriter">
								<button class="listBtn" type="button" id="listBtn">목록</button>
								<button class="updBtn" type="button" id="updBtn">수정</button>
							</div>

					</form>
				</div>
	        </div>
			<!-- ============================== 본문 ============================= -->

	
	
	        <!-- =========================== 오른쪽 사이드 바 =========================== -->
	        <!-- 보더값 적용 소스 : <div id="s_right" style="width:15%; float:right;height:100%;"본문  -->
	        <div style="float:right;height:100%">
	
	            <!-- 오른쪽에서 상단 부분 : 날씨 -->
	            <div style="height: 30%; margin-top: 50px">
	                
	            </div>
	
	            <!-- 오른쪽에서 하단부분 : 식단 -->
	            <div style="float:top; height: 40%">
	
	            </div>
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

