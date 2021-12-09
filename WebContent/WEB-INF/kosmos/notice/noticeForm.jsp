<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>공지사항 > 글쓰기</title>
		<style>
			table, th, td {
				border:1px solid black;
				text-align:left;
				line-height:1.5;
				margin-top:30px;
				margin:auto;
			}
		</style>
		<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
		<script type="text/javascript">
			$(document).ready(function(){
				
				// 글쓰기 버튼 입력 시
				$(document).on("click", "#writeBtn", function(){
					console.log("writeBtn");
					// notice(element)의 속성값을 가져오거나 추가 
					$('#noticeForm').attr({
						'action':'noticeInsert.k',
						'method':'POST',
						// 파일 넘길 때 필요
						'enctype':'multipart/form-data'
					}).submit();
				});

			});
		</script>	
	</head>
	<body>
		<%
			String mt_id = (String)session.getAttribute("teacherId");
			String mt_num = (String)session.getAttribute("userName");
		%>
		<form name="noticeForm" id="noticeForm">
			<table>
				<!-- 게시글이 하나 올라갈 때마다 페이징 전체 게시물 수 증가해야 함. -->
				<tr>
					<td>작성자</td>
					<td>
						<%=mt_num %>
						<input type="hidden" name="mt_num" />
						<input type="hidden" name="mt_id" value="<%=mt_id%>"/>
					</td>
				</tr>
				<tr>
					<td>제목</td>
					<td>
						<input type="text" name="no_subject" id="no_subject" size="53">
					</td>
				</tr>
				<tr>
					<td>내용</td>
					<td>
						<textarea name="no_contents" id="no_contents" cols="53" rows="10" placeholder="공지사항 양식 추가 예정"></textarea>
					</td>
				</tr>
				<tr>
					<td>첨부파일</td>
					<td>
						<input type="file" name="no_file" id="no_file">
					</td>
				</tr>
				<tr>
					<td colspan="2" align="right">
						<input type="button" value="글쓰기" id="writeBtn" style="float:right;">
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>