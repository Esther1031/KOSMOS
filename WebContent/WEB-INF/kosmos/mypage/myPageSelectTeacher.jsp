<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page import="com.kosmos.mypage.vo.KosmosMypageVO"%>

<% Object data = request.getAttribute("data"); %>
<% 
	
	KosmosMypageVO mvo = new KosmosMypageVO(); 

	mvo = (KosmosMypageVO) data;

	String ms_name = mvo.getMs_name();
	String ms_id = mvo.getMs_id();
	String ms_cp = mvo.getMs_cp();
	String ms_zipcode = mvo.getMs_zipcode();
	String ms_doro = mvo.getMs_doro();
	String ms_whenjoin = mvo.getMs_insdate();	//admissionyear대신 회원등록한 일자를 가져옴 
	String ms_grade = mvo.getMs_grade();
	String ms_class = mvo.getMs_class();
	String ms_number = mvo.getMs_number();

	System.out.println("\n===== jsp에서 출력한 데이터 ========================\n");
	System.out.println("컨트롤러에서 가져온 데이터 ms_name >>> : " + ms_name);
	System.out.println("컨트롤러에서 가져온 데이터 ms_id >>> : " + ms_id);
	System.out.println("컨트롤러에서 가져온 데이터 ms_cp >>> : " + ms_cp);
	System.out.println("컨트롤러에서 가져온 데이터 ms_zipcode >>> : " + ms_zipcode);
	System.out.println("컨트롤러에서 가져온 데이터 ms_doro >>> : " + ms_doro);
	System.out.println("컨트롤러에서 가져온 데이터 ms_whenjoin >>> : " + ms_whenjoin);
	System.out.println("컨트롤러에서 가져온 데이터 ms_grade >>> : " + ms_grade);
	System.out.println("컨트롤러에서 가져온 데이터 ms_class >>> : " + ms_class);
	System.out.println("컨트롤러에서 가져온 데이터 ms_number >>> : " + ms_number);
	System.out.println("\n==============================================\n");

%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>마이페이지</title>

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
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script type="text/javascript">

		$(document).ready(function(){
			
			$("#updateForm").click(function(){
				console.log("회원정보 수정 버튼이 클릭됨 >>> : 회원 정보수정 팝업창을 띄웁니다.");
				window.open("myPageUpdateTeacher.k", "", "width=680, height=800, resizable=no, scrollbars=no, status=no");
			});
			
			 $("#loginbtn").click(function () {

	                window.open("loginFormPop.k", "", "width=600, height=500, resizable=no, scrollbars=no, status=no");

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
		th{
			color: #34558b;
			text-align: center;
			width: 160px;
			border: 1px solid Gainsboro;
		}
		td {
			width: 200px;
			border: 1px solid Gainsboro;
			text-align:left;
			line-height:2;
			padding-left:8px;
		}
		table {
			width:750px;
			text-align:right;
		}
		.line{
			text-align: center;
			border-top: 2px solid #34558b;
			color: #34558b;
		}
		.line2{
			border-top: 2px solid #34558b;
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

		.paging{
			margin-top: 20px;
   			border-top: 1px dashed #dadada;
   			text-align: center;
		}
		.wrap{
			width:750px; 
			margin-top: 50px;
			margin-left: 160px;
		}
		.container{
			margin:0 auto; 
			width:98%;
		}
		.left{
			float:left;
			float:left;
			width:18%;
			height:800px;
			margin-right:15px;
			border-right:1px solid black;
		}
		.photozone{
			margin: 0 auto;
			 
			border:1px solid black; 
			width:"200";
			height:"240";
		}
		.btn {
			float: right;
			color: white;
			background-color: #34558b;
			height: 25px;
			width: 100px;
			border: 0px solid black;
			border-radius: 4px;
			display: block;
			margin-top: 10px;
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
	        <div style="width:15%; margin-left:10px; float:left; height:100%;">
				<section class="section">
					<br>
					<h2>마이 페이지</h2>
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
	        <div style="width:83%; float:right; margin-left:5px; margin-right:5px; height:100%">
				<div class="wrap" color="blue">
					<h2>마이 페이지</h2>
						<div class="container">
							<table>
								<tr>
									<th class="line" colspan="1">이름</th>
									<td class="line2" colspan="3">
										<input type="text" name="tename" id="tename" value="${ data.mt_name }">
									</td>
								</tr>
								<tr>
									<th colspan="1">이메일</th>
									<td colspan="3">
										<input type="text" name="temail" id="temail" value="${ data.mt_id }">
									</td>
								</tr>
								<tr>
									<th colspan="1">핸드폰 번호</th>
									<td colspan="3">
										<input type="text" name="tecp" id="tecp" value="${ data.mt_cp }">
									</td>
								</tr>	
								<tr>
									<th>우편번호</th>
									<td>
										<input type="text" name="me_zipcode" id="me_zipcode" style="width:50px" maxlength="6"  value="${ data.mt_zipcode }">
									</td>
									<th>도로명 주소</th>
									<td>
										<input type="text" name="me_doro" id="me_doro" style="width:250px" value="${ data.mt_doro }">
									</td>
								</tr>
							</table>
							<button class="btn" type="button" name="updateForm" id="updateForm">회원정보 수정</button>
						</div>
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

