<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kosmos.common.SubjectUtils" %>        
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script>
		$(document).ready(function(){
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
			
			$("#codeBtn").click(function(){
				alert("btn 진입 >>> : ");
				callAjax();
			});
			
			function callAjax(){
				alert("callAjax() 함수 호출 성공 >>> : ");

				let codeURL = "subjectCallCode.k";
				let groupVal = $("#sb_group").val();
				let nameVal = $("#sb_name").val();
				let dataParam = {
						group : groupVal,
						name : nameVal
				}
				console.log("groupVal >>> : " + groupVal);
				console.log("nameVal >>> : " + nameVal);
				
				$.ajax({
					url : codeURL,
					type : "POST",
					data : dataParam,
					contentType : "application/x-www-form-urlencoded; charset=UTF-8",
					success : whenSuccess,
					error : whenError
				});
				
				// 성공했을 때 실행되는 함수
				function whenSuccess(resData){
					console.log("코드 data >>> : " + resData);
					
					// 코드 받아오면 sb_code에 바로 입력하기
					if (resData != null){
						$("#sb_code").val(resData);
					}
				}
				
				// 실패했을 때 실행되는 함수
				function whenError(e) {
					console.log("에러가 >>> : " + e.responseText);
				}
			}	// end of callAjax()
		});
		
	</script>
</head>
<body>
	<% request.setCharacterEncoding("UTF-8"); %>
	<form>
		<table>
			<tr>
				<td>SB_GROUP : 교과군 <select id="sb_group" name="sb_group"></select></td>
			</tr>
			<tr>
				<td>SB_NAME(과목명) : <input type="text" id="sb_name" name="sb_name" placeholder="직접입력"></td>
				<td><button type="button" id="codeBtn" name="codeBtn">코드받아오기버튼</button></td>
			</tr>
			<tr>	
				<td>코드 받아오기 : <input type="text" id="sb_code" name="sb_code" value="" style="width:20px"></td>
			</tr>
		</table>
	</form>
	
</body>
</html>