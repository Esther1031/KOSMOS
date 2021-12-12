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
		th, td {
			width: 680px;
			border: 1px solid Gainsboro;
			text-align:left;
			line-height:1.5;
		}
		table {
			width:750px;
			text-align:right;
		}
		.line{
			text-align:center;
			border-top: 1px solid #727272;
		}
		.content{
			width: 1200px;
			height: 900px;
			margin: 0px auto;
			margin-bottom: 100px;
			float: center;
			border: 1px solid red;
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
			padding-top: 10px;
			text-align: right;
		}	
		.paging{
			margin-top: 20px;
   			border-top: 1px dashed #dadada;
   			text-align: center;
		}
    </style>
	<!-- =============================== script =============================== -->
	
</head>


<body>

	<!-- =========================== header1 =========================== -->
	<div class="image">
	
	    <!-- <img src="/KOSMOS/img/kosmos_1.jpg" width="100%"> -->
	    <div class="text">
	        <a href=""><h1>KOSMOS 고등학교</h1></a>
	    </div>
	    <div class="right_box"><a href style="margin-right: 10px;">로그인</a><a href="">수강신청</a></div>
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
					<li><a href="kosmos_words.jsp">학교장 인사</a></li>
					<li><a href="kosmos_history.jsp">학교 연혁</a></li>
					<li><a href="kosmos_info.jsp">학교 소개</a></li>
					<li><a href="kosmos_symbol.jsp">학교 상징</a></li>
					<li><a href="kosmos_map.jsp">학교 위치</a></li>
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
				    <a href="#">코스모스숲</a>
				</li>
		
				<!-- 마이페이지 링크 -->
				<li>
				    <a href="#">마이페이지</a>
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
	
	            <!-- 왼쪽 상단 : 공모전 -->
	            <div>
	            </div>
	
	            <div>
	                <!-- 왼쪽 하단 : 공모전 이미지 아래 빈칸부분 만약 넣고 싶은거 있으면 요기다가-->
	            </div>
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
									<td class="line"></td>
									<td class="line"></td>
									<td class="line"></td>
									<td class="line"></td>
								</tr>
								<tr>
									<td colspan="1">제목</td>
									<td colspan="3">
										<input type="text" name="no_subject" size="60" value="<%= nvo.getNo_subject() %>" />
									</td>
								</tr>
								<tr>
									<td>작성자</td>
									<td>
										<input type="text" name="mt_num" id="mt_num" style="text-align:center;"  value="<%= nvo.getMt_num() %>" readonly />
									</td>
									<th class="tt">작성일</th>
								<td>
									<input name="no_insdate" value="<%= nvo.getNo_insdate() %>" style="text-align:center;" readonly />
								</td>
								</tr>
								<tr>
									<td colspan="1">첨부파일</td>
									<td colspan="3">
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
								<input type="button" id="updBtn" value="수정" />
								<input type="button" id="listBtn" value="목록" />
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

