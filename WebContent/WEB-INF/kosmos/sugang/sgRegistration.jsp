<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="com.kosmos.sugang.vo.SugangVO" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수강신청</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<style type="text/css">

	#wrapper{
		width:940px;
		height:400px;
		margin:0;
		overflow: hidden;
	}
	
	header{
		float:lfet;
	}
	aside{
		float:left;
		border-right:solid;
		width:120px;
		height:500px;
		text-align:center;
		margin:0px 10px 0px 0px;
	}
	
	article{
		padding:10px;
		float:reft;
		
		position:static;
	}
	
	footer{
		
	}
	
	#tb{
		float:right;
	}
</style>
<script>
	
	/*
	function sapply(sb_num){
		alert("sb_num >>> : " + sb_num);
		
		location.href="beforeyn.k?sb_num="+sb_num;
	}
	
	
	$(document).ready(function(){
		
		// 신청
		$(document).on("click", "#rbtn", function(){
			
			$("#sgRegistrationForm").attr({
				"action":"beforeyn.k",
				"method":"GET"
			}).submit();
		});
	});
	*/

</script>
</head>
<div id="wrapper">
<body>
<% request.setCharacterEncoding("UTF-8"); %>
<%
	Object obj1 = request.getAttribute("creselect");
	if(obj1 == null) return;
	
	// 총 이수학점
	List<SugangVO> creselect = (List<SugangVO>)obj1;
	SugangVO svo1 = creselect.get(0);

	// 과목 데이터
	Object obj = request.getAttribute("listAll");
	if(obj == null) return;
	
	ArrayList<SugangVO> aList = (ArrayList<SugangVO>)obj;
	
	int nCnt = aList.size();
	SugangVO svo = new SugangVO();
%>

<header>
<table id="tb">
	<tr>
		<td colspan="2">
			<a href="sgRegistration.k">수강희망과목</a> ||
			<a href="selectSb.k">개설강좌검색</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			현재 신청한 이수학점 : <%= svo1.getSb_ncreditunit() %>
		</td>
	</tr>
	<hr>
	<hr>
</table>
</header>
<aside>
	<a href=#>수강신청</a><br>
	<a href=#></a><br>
	<a href=#>희망과목내역</a>
</aside>
<article>
<form name="sgRegistrationForm" id="sgRegistrationForm">
<table border="1">
<thead>
	<tr align="center">
		<td>수강신청</td>
		<td>과목유형</td>
		<td>과목번호</td>
		<td>교과군번호</td>
		<td>과목</td>
		<td>대상학년</td>
		<td>정원</td>
		<td>잔여인원</td>
		<td>교수명</td>
		<td>학점</td>
		<td>수업요일</td>
		<td>수업교시</td>
	</tr>
</thead>
<%
	for(int i=0; i < nCnt; i++){

		svo = aList.get(i);
%>

<tbody>
	<tr align="center">
		<td>
			<input type="button" value="신청" id="rbtn" name="rbtn">
		</td>
		<td>필수</td>
		<td><%= svo.getSb_num() %></td>
		<td><%= svo.getSb_group() %></td>
		<td><%= svo.getSb_name() %></td>
		<td><%= svo.getSb_grade() %></td>
		<td><%= svo.getSb_maxstu() %></td>
		<td>15</td>
		<td>현병은</td>
		<td><%= svo.getSb_creditunit() %></td>
		<td><%= svo.getSb_day() %></td>
		<td><%= svo.getSb_time() %></td>
	</tr>
<%
	} // end of for
%>
<script type="text/javascript">
	
	$(document).ready(function(){
		$(document).on("click", "#rbtn", function(){
			location.href="Check2.k?sb_num=<%= svo.getSb_num()%>&me_num=<%= svo1.getMe_num() %>";
		});
	});
</script>
</tbody>
</table>
</form>
</article>
</div>
</body>
</html>