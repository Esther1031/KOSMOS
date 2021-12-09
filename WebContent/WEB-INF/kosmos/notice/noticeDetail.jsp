<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kosmos.notice.vo.KosmosNoticeVO" %>
<%@ page import="com.kosmos.login.vo.KosmosLoginVO" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>공지사항 > 상세보기</title>
		
		<style>
			th, td {
				width: 700px;
				border: 1px solid black;
				text-align:left;
				line-height:1.5;
			}
			table {
				width:600px;
			}
			.all{
				width:1200px;
				margin : 50px 250px 50px 250px;
				
			}
			.wrap {
				width : 630px;
				align : center;
				border : 5px;
				margin : 10px auto;
			}
			.listBtn {
				width: 
				align: center;
			}
			.forWriter{
				margin: 10px auto;
			}
		
		</style>
	
		<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
		<script type="text/javascript">
		
			$(document).ready(function(){
				
				// 목록 버튼 클릭
				$("#listBtn").on("click", function(){
					$("#noticeDetail").attr({
						"action":"noticeList.k",
						"method":"GET",
						"enctype":"application/x-www-form-urlencoded"
					});
					
					$("#noticeDetail").submit();
				});
				
				// 수정 버튼 클릭
				$(document).on("click", "#updateBtn", function(){
					
					var v1 = $("#no_num").val();
					
					$("#noticeDetail").attr({
						"action":"noticeUpdateForm.k?no_num="+v1,
						"method":"POST",
						"enctype":"multipart/form-data"
					}).submit();
				});
				
				// 삭제 버튼 클릭
				$(document).on("click", "#deleteBtn", function(){
					var v1 = $("#no_num").val();
					$("#noticeDetail").attr({
						"action":"noticeDelete.k?no_num="+v1,
						"method":"POST",
						"enctype":"multipart/form-data"
					}).submit();
				});
				
			});
		</script>
	</head>

	<body>
		<% request.setCharacterEncoding("UTF-8"); %>
		<%
			KosmosNoticeVO nvo = null;
			Object obj = request.getAttribute("listS");
			
			nvo = (KosmosNoticeVO)obj;
			System.out.println("수정, 삭제에서 쓸 교사 아이디 : " + nvo.getMt_id());
			System.out.println("뷰에서 선택한 글 번호 : " + nvo.getNo_num());
		%>
		
		<form id="noticeDetail" method="POST">
			<div class="all">
				<table>
					<input type="hidden" id="no_num" name="no_num" value="<%=nvo.getNo_num() %>" />
					<input type="hidden" name="mt_num" value="<%=nvo.getMt_num() %>" />
					
					<tr>
						<td colspan="1">제목</td>
						<td colspan="3">
							<input name="no_subject" value="<%= nvo.getNo_subject() %>" size="50" readonly />
						</td>
					</tr>
					<tr>
						<td>작성자</td>
						<td>
							<input type="text" name="mt_num" value="<%= nvo.getMt_num() %>" readonly />
						</td>
						<td>작성일</td>
						<td>
							<input name="no_insdate" value="<%= nvo.getNo_insdate() %>" readonly />
						</td>
					</tr>
					<tr>
						<td colspan="1">첨부파일</td>
						<td colspan="3">
							<a href=""><%=nvo.getNo_file() %></a>
						</td>
					</tr>
					<tr>
						<td colspan="5">
							<textarea name="no_contents" id="no_contents" rows="10" cols="88" readonly>
								<%= nvo.getNo_contents() %>
							</textarea>
						</td>
					</tr>
					
				</table>

				<div class="wrap">
					<div class="listBtn">
						<button type="button" id="listBtn">목록</button>
					</div>
				<% 
					// 세션에서 받은 교사 아이디
					KosmosLoginVO lvo = (KosmosLoginVO) session.getAttribute("result");
					String mt_id = lvo.getMt_id();
					System.out.println("로그인한 교사 아이디 : " + mt_id);
					if(mt_id == null){
						return;
					}
					
					// 작성자 아이디
					nvo = (KosmosNoticeVO)obj;
					String writer_id = nvo.getMt_id();
					System.out.println("글을 쓴 작성자 아이디 : " + writer_id);
					
					// 작성자 아이디와 로그인한 회원의 아이디가 같은 경우 '수정', '삭제' 버튼 활성화
					if(mt_id.equals( nvo.getMt_id())) {
				%>	
					<div class="forWirter">
						<button type="button"id="updateBtn">수정</button>
						<button type="button"id="deleteBtn">삭제</button>
					</div>
				<%
					} else {
						return;
					}
				%>
				</div>
			</div>
		</form>
	</body>
</html>