<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스프링 회원가입 폼</title>

<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">

	$(document).ready(function(){	
		
		
		// 아이디 중복체크 시작  ================================================= 		
		$("#midbtn").click(function(){	
			
			let ms_iddVal = $("#ms_id").val();
			if (ms_iddVal == '') {
				alert("중복 체크할 아이디를 입력하세요 >>> : ");
				$("#ms_id").focus();
				return false;
			}
		}); // 아이디 중복체크 끝
	
		// 아이디 중복체크 Ajax 동기 방식
		$(document).on("click", "#midbtn", function(){
	//		alert("아이디 중복확인 시작합니다 ");
			syncIdCheckData();
		});	// 아이디 중복쳄크 Ajax 동기 방식 끝		
		
		async function syncIdCheckData(){
			
			let idCheckData = "";
			console.log("start >>> : ");
			
			var vv = $("#ms_id").val();
			alert("vv >>> : " + vv);
			
			idCheckData = await ajaxIdCheckData(vv);
			alert("리턴된 데이터 >>> : " + idCheckData);
			
			if("ID_YES" == idCheckData){
				alert("아이디 사용 가능 : ID_YES.");
				
				$("#ms_id").attr("readonly", true);
				$("#ms_id").css("background-color", "lightgray");
				$("#mt_pw").focus();
			}else if("ID_NO" == idCheckData){
				alert("이미 사용 중인 아이디 : ID_NO.");
				
				$("#ms_id").val("");
				$("#ms_id").focus();
			};
		}
		
		function ajaxIdCheckData(myval){
			alert("아이디 사용이 가능합니다 : " + myval);
			
			let idCheckURL = "memIdCheck.k";
			let reqType = "POST";
			let dataParam = { ms_id: myval, };
			
			return $.ajax({							
			    url: idCheckURL
			   ,type: reqType
			   ,data: dataParam			   
			});
		} // function ajaxIdcheckData()	
		// 아이디 중복체크 끝 =================================================

			
		// 비밀번호 체크 
		$("#pwCheck").click(function(){
			console.log(" 비밀번호 중복확인 합니다 ");
			var pw = $("#ms_pw").val();
			var pw_r = $("#ms_pw_r").val();

			if(pw == pw_r) {
				alert("비밀번호가 같습니다.");
				 pw_r.val('');

				$("#ms_gen").focus();						
				return true;
			} else {
				alert("비밀번호 확인이 같지 않습니다.");
				pw.val('');
				pw_r.val('');	
				pw.focus();							
				return false;
			}
		}); // 비밀번호 체크 끝
		
		// 성별
		
		// 생년월일
		$("#ms_birth").on("input", function(){
			var m = $("#ms_birth");
			if (m.val().length > m.maxlength){
				m.value = m.value.slice(0, m.maxlength);
			}
		}); // 생년월일 체크 끝
       
		// 월 
        $("#ms_birth1").append("<option value=''>월--- </option>");
        for(var i = 1; i <= 12; i++){
        	if (i < 10){ i = '0'+i;}
            $("#ms_birth1").append("<option value='"+ i +"'>"+ i + "</option>");
        } // 월 끝
        // 일 
        $("#ms_birth2").append("<option value=''>일 ---</option>");
        for(var i = 1; i <= 31; i++){
        	if (i < 10){ i = '0'+i;}
            $("#ms_birth2").append("<option value='"+ i +"'>"+ i + "</option>");
        } // 일 끝

		
    	 // 반
        $("#ms_class").append("<option value=''>반 </option>");
        for(var i = 1; i <= 10; i++){
        	if (i < 10){ i = '0'+i;}
        	$("#ms_class").append("<option value='"+ i +"'>"+ i + "</option>");
        } // 반 끝
        // 번호
        $("#ms_number").append("<option value=''>번호</option>");
        for(var i = 1; i <= 30; i++){
        	if (i < 10){ i = '0'+i;}
        	$("#ms_number").append("<option value='"+ i +"'>"+ i + "</option>");
        } // 번호 끝

		// 우편번호	
		$("#zonecode").click(function(){
			console.log("zonecode >>> : ");
			new daum.Postcode({
				oncomplete: function(data) {
				    $("#ms_zipcode").val(data.zonecode); //5자리 새우편번호 사용
				    $("#ms_doro").val(data.roadAddress); //도로명 주소
				}
			}).open();
		}); // 우편번호 끝
		
		// 취미		
		// 소개글 		
		// 사진 
		
		// 폼태그 데이터 JSP 보내기 
		$("#btn").click(function(){
			//alert("btn click() 함수 진입 >>> : ");
			console.log("btn click() 함수 진입 >>> : ");

			console.log("ms_num >>> : " + document.memForm.ms_num.value);			
			console.log("ms_name >>> : " + document.memForm.ms_name.value);
			console.log("ms_id >>> : " + document.memForm.ms_id.value);
			console.log("ms_pw >>> : " + document.memForm.ms_pw.value);
			console.log("ms_pw_r >>> : " + document.memForm.ms_pw_r.value);
			
			// 성별
			var ms_gen_check = document.getElementsByName('ms_gen');
			for (var i=0; i < ms_gen_check.length; i++){
				if(ms_gen_check[i].checked == true){
					console.log("ms_gen_check["+i+"].value >>> : " + ms_gen_check[i].value);
				}
			} // 성별 for 끝
			
			
			// 학기
			var ms_semester_check = document.getElementsByName('ms_semester');
			for (var i=0; i < ms_semester_check.length; i++){
				if(ms_semester_check[i].checked == true){
					console.log("ms_semester_check["+i+"].value >>> : " + ms_semester_check[i].value);
				}
			} // 학기 for 끝
			
			// 생일
			console.log("ms_birth >>> : " + document.memForm.ms_birth.value);
			console.log("ms_birth1 >>> : " + document.memForm.ms_birth1.value);
			console.log("ms_birth2 >>> : " + document.memForm.ms_birth2.value);
			
			// 핸드폰
			console.log("ms_cp >>> : " + document.memForm.ms_cp.value);
			console.log("ms_cp1 >>> : " + document.memForm.ms_cp1.value);
			console.log("ms_cp2 >>> : " + document.memForm.ms_cp2.value);
			

			// 이메일
			console.log("ms_id >>> : " + document.memForm.ms_id.value);
			console.log("ms_id1 >>> : " + document.memForm.ms_id1.value);
		
			// 주소
			console.log("ms_zipcode >>> : " + document.memForm.ms_zipcode.value);
			console.log("ms_doro >>> : " + document.memForm.ms_doro.value);
			console.log("ms_dorodetail >>> : " + document.memForm.ms_dorodetail.value);
				
			// 사진
			console.log("ms_photo >>> : " + document.memForm.ms_photo.value);

			console.log("ms_num >>> : " + $('#ms_num').val());
			console.log("ms_name >>> : " + $('input[name=ms_name]').val());
			console.log("ms_id >>> : " + $('input[name=ms_id]').val());
			console.log("ms_pw >>> : " + $('input[name=ms_pw]').val());
			console.log("ms_pw_r >>> : " + $('input[name=ms_pw_r]').val());
			
			// 성별
			var ms_gen_check = $('input:radio[name=ms_gen]:checked').val();
			console.log("ms_gen_check.value >>> : " + ms_gen_check);
			
			// 학기
			var ms_semester_check = $('input:radio[name=ms_semester]:checked').val();
			console.log("ms_semester_check.value >>> : " + ms_semester_check);
			
			// 생일
			console.log("ms_birth >>> : " + $('input[name=ms_birth]').val());
			console.log("ms_birth1 >>> : " + $('select[name=ms_birth1]').val());
			console.log("ms_birth2 >>> : " + $('select[name=ms_birth2]').val());
			
			// 핸드폰
			console.log("ms_cp >>> : " + $('select[name=ms_cp]').val());
			console.log("ms_cp1 >>> : " + $('input[name=ms_cp1]').val());
			console.log("ms_cp2 >>> : " + $('input[name=ms_cp2]').val());
			
			// 주소
			console.log("mzonecode >>> : " + $('input[name=zonecode]').val());
			console.log("ms_zipcode >>> : " + $('input[name=ms_zipcode]').val());
			console.log("ms_dorodetail >>> : " + $('input[name=ms_dorodetail]').val());
			
			// 사진
			console.log("ms_photo >>> : " + $('input[name=ms_photo]').val());			
			//############################################# END
			
			$("#memForm")
			.attr({
					"action":"memInsert.k",
				    "method":"POST",
				    "enctype":"multipart/form-data"
			       })
			.submit();	
		});  // 폼테그 데이터 jsp 보내기
	});
</script>	
</head>
<body>
<h3 align="center">회원 가입</h3>
<hr>
<form name="memForm" id="memForm">
<table border="1" align="center">
<tr>
	<td colspan="2" align="center">					
		<font size="4" style="color:blue;">학생</font> 
	</td>
</tr>
<tr>
	<td>회원번호</td>
	<td><input type="text" name="ms_num" id="ms_num" readonly/></td>
 </tr>
<tr>
	<td>이름</td>
	<td><input type="text" name="ms_name" id="ms_name"/></td>
</tr>
<div id="ms_iddiv">
<tr>
	<td>아이디(이메일)</td>
	<td>		
		<input type="text" name="ms_id"  id="ms_id" style="width:100px" placeholder="아이디 체크" />
         <input type="button" name="midbtn" id="midbtn" value="아이디중복확인"  />
	</td>
</tr>
<tr>
	<td>패스워드</td>
	<td>
		<input type="text" name="ms_pw" id="ms_pw" /><br/>	
		<input type="text" id="ms_pw_r" name="ms_pw_r" placeholder="비밀번호확인" />
		<input type="button" value="비밀번호확인" id="pwCheck"/><br/>
	</td>
</tr>
<tr>
	<td>성별</td>
	<td> 
		<input type="radio" name="ms_gen" id="ms_gen" value="01" checked /> 여자
      	<input type="radio" name="ms_gen" id="ms_gen" value="02" /> 남자
    </td>
</tr>

<tr>
	<td>생년월일</td>
	<td>		
		<input type="text" name="ms_birth" id=ms_birth 
		       placeholder="년(4자)" maxlength="4" style="width:50px"/>
		<select name="ms_birth1" id="ms_birth1"></select>
        <select name="ms_birth2" id="ms_birth2"></select>
	</td>
</tr>
<tr>
	<td>핸드폰</td>
	<td>
		<select name="ms_cp" id="ms_cp">
        	<option value="010">010</option>
        	<option value="011">011</option>
        	<option value="016">016</option>
        	<option value="017">017</option>		        	
         </select>
         - <input type="text" name="ms_cp1" id="ms_cp1" size="2" maxlength="4" />
         - <input type="text" name="ms_cp2" id="ms_cp2" size="2" maxlength="4" />
	</td>
</tr>
<tr>
 	<td>주소</td>
 	<td>
 		<input type="text" name="ms_zipcode" id="ms_zipcode" placeholder="우편번호" style="width:50px" maxlength="6" >
 		<input type="button" name="zonecode" id="zonecode" value="우편번호 찾기"><br>	 	
 		<input type="text" name="ms_doro" id="ms_doro" placeholder="도로명주소" style="width:250px"><br>	 	
 		<input type="text" name="ms_dorodetail" id="ms_dorodetail" placeholder="도로명주소 상세주소" style="width:250px"><br>
 	</td>
</tr> 
 <tr>
	<td>사진</td>
	<td> 
		<input type="file" name="ms_photo"  /><br>
    </td>
</tr>
<tr>
	<td>입학년도</td>
	<td> 
		<select id="ms_admyear" name="ms_admyear">
			<option value="선택">선택</option>
			<option value="2022">2022</option>
			<option value="2021">2021</option>
        	<option value="2020">2020</option>
        	<option value="2019">2019</option>
        </select>
    </td>
</tr>
<tr>
	<td>학기</td>
	<td> 
		<input type="radio" name="ms_semester" id="ms_semester" value="01" checked /> 1학기
      	<input type="radio" name="ms_semester" id="ms_semester" value="02" /> 2학기
    </td>
</tr>
</div>
<tr>
	<td>학번</td>
	<td>
학년&nbsp;<select id="ms_grade" name="ms_grade"> 
			<option value="선택">선택</option>
			<option value="1학년">1</option>
        	<option value="2학년">2</option>
        	<option value="3학년">3</option>
        </select>
    <select name="ms_class" id="ms_class"></select>
	<select name="ms_number" id="ms_number"></select>
	</td>
</tr>
<tr>
	<td colspan="2"> 			
		<button type="button" id="btn">보내기</button>
		<button type="reset">다시 </button>	
	</td>				
</tr>
</table>				 		        		     
</form>	
</body>
</html>