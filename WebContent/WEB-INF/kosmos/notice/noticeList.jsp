<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.kosmos.notice.vo.KosmosNoticeVO" %>
<%@ page import="com.kosmos.login.vo.KosmosLoginVO" %>


<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>공지사항 > 전체</title>
		
		<style type="text/css">
			.tt {
				text-align:center;
			}

		</style>
		
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
	</head>
	
	<body>
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
		if (objList  == null) 
			return;
		
		List<KosmosNoticeVO> list = (List<KosmosNoticeVO>)objList;
		System.out.println("noticeList.jsp >>> : " + list.size());
		
		if (list.size() > 0){
	%>
		<form method="POST" id="noticeList">
		<!-- 전체를 하나의 레이아웃으로 묶음. -->
		<div style="width:1200px; margin:0 auto;">
			<h2>공지사항</h2>
		<%	String userName = (String)session.getAttribute("userName"); %>	
			<hr>
				<%=userName %>님 로그인 중입니다.
				<!-- 공지사항 게시글 목록 상단 레이아웃 -->
				<div>
					<!-- (좌) 공지사항 게시물 개수 조회-->
					<div style="float:left; width:50%;">전체 <span><%=list.size() %></span>건</div>

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
				<table id="noticeList" style="margin:0 auto; width:1200px;" summary='공지사항 첫 화면: 공지사항 목록'>
					<thead>
						<tr>
							<th class="tt" width="40" title="번호">번호</th>
							<th class="tt" width="450" title="제목">제목</th>
							<th class="tt" width="80" title="작성자">작성자</th>
							<th class="tt" width="80" title="작성일">작성일</th>
							<th class="tt" width="60" title="조회수">조회수</th>
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
							<td class="tt">
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
					<tfoot>
						<tr>
							<td colspan="10">
								<jsp:include page="noticePaging.jsp" flush="true">
									<jsp:param value="noticeList.k" name="url"/>
									<jsp:param value="" name="str"/>
									<jsp:param value="<%=pageSize %>" name="pageSize"/>
									<jsp:param value="<%=groupSize %>" name="groupSize"/>
									<jsp:param value="<%=curPage %>" name="curPage"/>
									<jsp:param value="<%=totalCount %>" name="totalCount"/>
								</jsp:include>
							</td>
						</tr>
					</tfoot>
				</table>
	
				<!-- 
					교사회원에게만 글쓰기 버튼을 활성화 
					학생회원 글쓰기 버튼 비활성화
				-->
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
	</body>
</html>