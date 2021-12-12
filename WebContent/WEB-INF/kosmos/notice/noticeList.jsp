<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.kosmos.notice.vo.KosmosNoticeVO" %>
<%@ page import="com.kosmos.login.vo.KosmosLoginVO" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>공지사항 > 전체</title>

    <!-- 	css랑 js 파일 경로
            WebContent/resource/css/default.css
            WebContent/resource/css/gnb3.css
            요거 두개 보시면 됩니다.
            
            default 는 본문 글자 셋팅 (맨 아랫줄 body부분)
            gnb 는 메뉴 css 및 빨간 테두리 부분 (content로 검색) 들어가 있어요. 
    -->
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
		
				// 조회 버튼 클릭.
				$(document).on("click", "#searchBtn", function(){
					alert("게시글 검색");		
					$("#noticeList").attr({"method":"GET",
						                   "action":"noticeList.k"}).submit();
				});
				
				// 글쓰기 버튼 클릭.
				$(document).on("click", "#I", function(){
					location.href="noticeForm.k";
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
		.tt{
			text-align:center;
		}
		
		.line{
			text-align:center;
			border-bottom: 1px solid #727272;
		}
		.content{
			width: 1200px;
			height: 900px;
			margin: 0px auto;
			margin-bottom: 100px;
			float: center;
			border: 1px solid red;
		}
		
		.list{
			width: 780px;
			float:right;
			margin:30px 80px 10px 20px;
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
				//페이징 변수 세팅
				int pageSize = 0;
				int groupSize = 0;
				int curPage = 0;
				int totalCount = 0;		
			
				Object objPaging = request.getAttribute("pagingNvo");
				KosmosNoticeVO pagingNvo = (KosmosNoticeVO)objPaging;
				
				Object objList = request.getAttribute("listAll");
				if (objList  == null){
					return;
				}
				
				List<KosmosNoticeVO> list = (List<KosmosNoticeVO>)objList;
				System.out.println("noticeList.jsp >>> : " + list.size());
				
				if (list.size() > 0){
			%>
			<form method="POST" id="noticeList">
				<!-- 전체를 하나의 레이아웃으로 묶음. -->
				<div class="list">
					<div style="margin::5px 0px 5px 0px;">
						<h2>공지사항</h2>
					</div>
					
					<!-- 'ㅇㅇㅇ님 로그인 중입니다' 추후 위치 조정 필요 -->
					<%	String userName = (String)session.getAttribute("userName"); %>					
						<%=userName %>님 로그인중입니다.
					<!-- 'ㅇㅇㅇ님 로그인 중입니다' 추후 위치 조정 필요 -->
					
					
						<!-- 공지사항 게시글 목록 상단 레이아웃 -->
						<div style="margin-top:10px;">
							<!-- (좌) 공지사항 게시물 개수 조회-->
							<div style="float:left; width:45%;">전체 <span><%=list.size() %></span>건</div>
		
							<!-- (우) 공지사항 게시물 조건 조회(검색)-->
							<div style="float:right; width:50%; text-align:right; margin-bottom:10px;">				
								<select name="searchType" id="searchType">
									<option value="title" selected>제목</option>
									<option value="contents">내용</option>
									<option value="writer">작성자</option>
								</select>
								<!-- 검색값을 받음 -->
								<input type="text" name="keyword" placeholder="검색어 입력" />
								<!-- 검색 버튼 -->
								<input type="button" id="searchBtn" value="조회" />
							</div>
						</div>
						

						<!-- 공지사항 목록 -->
						<table id="noticeList" style="margin: 30px 10px 20px 0px; width:780px;" summary='공지사항 첫 화면: 공지사항 목록'>
							<thead>
								<tr>
									<td class="line"></td>
									<td class="line"></td>
									<td class="line"></td>
									<td class="line"></td>
									<td class="line"></td>
								</tr>
								<tr>
									<th class="line" width="60px" title="번호">번호</th>
									<th class="line" width="250px" title="제목">제목</th>
									<th class="line" width="48px" title="작성자">작성자</th>
									<th class="line" width="68px" title="작성일">작성일</th>
									<th class="line" width="45px" title="조회수">조회수</th>
								</tr>
							</thead>
						<%
							for (int i=0; i < list.size(); i++){
								KosmosNoticeVO nvo = list.get(i);
								System.out.println("loop(ing..) index : " + (i+1));
								System.out.println("nvo.getNo_num() >>> : " + nvo.getNo_num());
								
								//페이징 
								pageSize = Integer.parseInt(pagingNvo.getPageSize());
								groupSize = Integer.parseInt(pagingNvo.getGroupSize());
								curPage = Integer.parseInt(pagingNvo.getCurPage());
								totalCount = Integer.parseInt(nvo.getTotalCount());
				
						%>		
							<tbody>
								<tr>
									<td class="tt">
										<%=nvo.getNo_num() %>
									</td>
									<td style="text-align:left;">
										<a href="noticeDetail.k?no_num=<%=nvo.getNo_num() %>">
											<%=nvo.getNo_subject() %>
										</a>
									</td>
									<td class="tt">
										<%=nvo.getMt_num() %>
									</td>
									<td class="tt">
										<%=nvo.getNo_insdate() %>
									</td>
									<td class="tt">
										<%=nvo.getNo_hit() %>
									</td>
								</tr>
							</tbody>
						<%
							} // end of for
						%>
						</table>
							<div style="margin-top:15px;">
									<div align="center">
										<jsp:include page="noticePaging.jsp" flush="true">
											<jsp:param value="noticeList.k" name="url"/>
											<jsp:param value="" name="str"/>
											<jsp:param value="<%=pageSize %>" name="pageSize"/>
											<jsp:param value="<%=groupSize %>" name="groupSize"/>
											<jsp:param value="<%=curPage %>" name="curPage"/>
											<jsp:param value="<%=totalCount %>" name="totalCount"/>
										</jsp:include>
									</div>
							</div>
					
					<%
						KosmosLoginVO lvo = (KosmosLoginVO)session.getAttribute("result");
						String mt_id = lvo.getMt_id();
						
						// 교사 회원으로 로그인한 경우에만 '글쓰기'버튼 활성화
						if(mt_id != null) {
					%>
						<div style="margin-top: 10px;">
							<input type="button" value="글쓰기" id="I" style="float:right;">
						</div>
					<%
						} // end of if
					%>
				</div>
			</form>
			<%
				} // end of if
			%>
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

