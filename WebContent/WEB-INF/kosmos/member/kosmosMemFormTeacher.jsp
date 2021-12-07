<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스프링 회원가입 폼</title>

<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
	//alert("자바스크립트 블럭 시작 >>> : ")

	$(document).ready(function(){	
	
		
		// 아이디 중복체크 시작  ================================================= 		
		$("#midbtn").click(function(){	
			
			let mt_iddVal = $("#mt_id").val();
			if (mt_iddVal == '') {
				alert("중복 체크할 아이디를 입력하세요 >>> : ");
				$("#mt_id").focus();
				return false;
			}
		}); // 아이디 중복체크 끝
	
		// 아이디 중복체크 Ajax 동기 방식
		$(document).on("click", "#midbtn", function(){
//			alert("아이디 중복확인 시작합니다 ");
			syncIdCheckData();
		});	// 아이디 중복쳄크 Ajax 동기 방식 끝		
		
		async function syncIdCheckData(){
			
			let idCheckData = "";
			console.log("start >>> : ");
			
			var vv = $("#mt_id").val();
			alert("vv >>> : " + vv);
			
			idCheckData = await ajaxIdCheckData(vv);
			alert("리턴된 데이터 >>> : " + idCheckData);
			
			if("ID_YES" == idCheckData){
				alert("아이디 사용 가능 : ID_YES.");
				
				$("#mt_id").attr("readonly", true);
				$("#mt_id").css("background-color", "lightgray");
				$("#mt_pw").focus();
			}else if("ID_NO" == idCheckData){
				alert("이미 사용 중인 아이디 : ID_NO.");
				
				$("#mt_id").val("");
				$("#mt_id").focus();
			};
		}
		
		function ajaxIdCheckData(myval){
			alert("아이디 사용이 가능합니다 : " + myval);
			
			let idCheckURL = "teacherIdCheck.k";
			let reqType = "POST";
			let dataParam = { mt_id: myval, };
			
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
			var pw = $("#mt_pw").val();
			var pw_r = $("#mt_pw_r").val();

			if(pw == pw_r) {
				alert("비밀번호가 같습니다.");
				 pw_r.val('');

				$("#mt_gen").focus();						
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
		$("#mt_birth").on("input", function(){
			var m = $("#mt_birth");
			if (m.val().length > m.maxlength){
				m.value = m.value.slice(0, m.maxlength);
			}
		}); // 생년월일 체크 끝
       
		// 월 
        $("#mt_birth1").append("<option value=''>월--- </option>");
        for(var i = 1; i <= 12; i++){
        	if (i < 10){ i = '0'+i;}
            $("#mt_birth1").append("<option value='"+ i +"'>"+ i + "</option>");
        } // 월 끝
        // 일 
        $("#mt_birth2").append("<option value=''>일 ---</option>");
        for(var i = 1; i <= 31; i++){
        	if (i < 10){ i = '0'+i;}
            $("#mt_birth2").append("<option value='"+ i +"'>"+ i + "</option>");
        } // 일 끝

		
		// 핸드폰		
		// 전화번호
		
		// 우편번호	
		$("#zonecode").click(function(){
			console.log("zonecode >>> : ");
			new daum.Postcode({
				oncomplete: function(data) {
				    $("#mt_zipcode").val(data.zonecode); //5자리 새우편번호 사용
				    $("#mt_doro").val(data.roadAddress); //도로명 주소
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

			console.log("mt_num >>> : " + document.teacherForm.mt_num.value);			
			console.log("mt_name >>> : " + document.teacherForm.mt_name.value);
			console.log("mt_id >>> : " + document.teacherForm.mt_id.value);
			console.log("mt_pw >>> : " + document.teacherForm.mt_pw.value);
			console.log("mt_pw_r >>> : " + document.teacherForm.mt_pw_r.value);
			
			// 성별
			var mt_gen_check = document.getElementsByName('mt_gen');
			for (var i=0; i < mt_gen_check.length; i++){
				if(mt_gen_check[i].checked == true){
					console.log("mt_gen_check["+i+"].value >>> : " + mt_gen_check[i].value);
				}
			} // 성별 for 끝
			
			// 생일
			console.log("mt_birth >>> : " + document.teacherForm.mt_birth.value);
			console.log("mt_birth1 >>> : " + document.teacherForm.mt_birth1.value);
			console.log("mt_birth2 >>> : " + document.teacherForm.mt_birth2.value);
			
			// 핸드폰
			console.log("mt_cp >>> : " + document.teacherForm.mt_cp.value);
			console.log("mt_cp1 >>> : " + document.teacherForm.mt_cp1.value);
			console.log("mt_cp2 >>> : " + document.teacherForm.mt_cp2.value);
			

			// 이메일
			console.log("mt_id >>> : " + document.teacherForm.mt_id.value);
			console.log("mt_id1 >>> : " + document.teacherForm.mt_id1.value);
		
			// 주소
			console.log("mt_zipcode >>> : " + document.teacherForm.mt_zipcode.value);
			console.log("mt_doro >>> : " + document.teacherForm.mt_doro.value);
			console.log("mt_dorodetail >>> : " + document.teacherForm.mt_dorodetail.value);
			
			// 사진
			console.log("mt_photo >>> : " + document.teacherForm.mt_photo.value);
			
			// 성별
			var mt_gen_check = $('input:radio[name=mt_gen]:checked').val();
			console.log("mt_gen_check.value >>> : " + mt_gen_check);
			
			// 생일
			console.log("mt_birth >>> : " + $('input[name=mt_birth]').val());
			console.log("mt_birth1 >>> : " + $('select[name=mt_birth1]').val());
			console.log("mt_birth2 >>> : " + $('select[name=mt_birth2]').val());
			
			// 핸드폰
			console.log("mt_cp >>> : " + $('select[name=mt_cp]').val());
			console.log("mt_cp1 >>> : " + $('input[name=mt_cp1]').val());
			console.log("mt_cp2 >>> : " + $('input[name=mt_cp2]').val());
			
			// 주소
			console.log("mzonecode >>> : " + $('input[name=zonecode]').val());
			console.log("mt_zipcode >>> : " + $('input[name=mt_zipcode]').val());
			console.log("mt_dorodetail >>> : " + $('input[name=mt_dorodetail]').val());
			
			
			// 사진
			console.log("mt_photo >>> : " + $('input[name=mt_photo]').val());									
			//############################################# END
			
			$("#teacherForm")
			.attr({
					"action":"teacherInsert.k",
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
<form name="teacherForm" id="teacherForm">
<table border="1" align="center">
<tr>
	<td colspan="2" align="center">					
		<font size="4" style="color:blue;">선생님(관리자)</font> 
	</td>
</tr>
<tr>
	<td>회원번호</td>
	<td><input type="text" name="mt_num" id="mt_num" readonly/></td>
 </tr>
<tr>
	<td>이름</td>
	<td><input type="text" name="mt_name" id="mt_name"/></td>
</tr>
<div id="mt_iddiv">
<tr>
	<td>아이디(이메일)</td>
	<td>		
		<input type="text" name="mt_id"  id="mt_id" style="width:100px" placeholder="아이디 체크" />
        <input type="button" name="midbtn" id="midbtn" value="아이디중복확인"  />
	</td>
</tr>
<tr>
	<td>패스워드</td>
	<td>
		<input type="text" name="mt_pw" id="mt_pw" /><br/>	
		<input type="text" id="mt_pw_r" name="mt_pw_r" placeholder="비밀번호확인" />
		<input type="button" value="비밀번호확인" id="pwCheck"/><br/>
	</td>
</tr>
<tr>
	<td>성별</td>
	<td> 
		<input type="radio" name="mt_gen" id="mt_gen" value="01" checked /> 여자
      	<input type="radio" name="mt_gen" id="mt_gen" value="02" /> 남자
    </td>
</tr>
<tr>
	<td>생년월일</td>
	<td>		
		<input type="text" name="mt_birth" id=mt_birth 
		       placeholder="년(4자)" maxlength="4" style="width:50px"/>
		<select name="mt_birth1" id="mt_birth1"></select>
        <select name="mt_birth2" id="mt_birth2"></select>
	</td>
</tr>
<tr>
	<td>핸드폰</td>
	<td>
		<select name="mt_cp" id="mt_cp">
        	<option value="010">010</option>
        	<option value="011">011</option>
        	<option value="016">016</option>
        	<option value="017">017</option>		        	
         </select>
         - <input type="text" name="mt_cp1" id="mt_cp1" size="2" maxlength="4" />
         - <input type="text" name="mt_cp2" id="mt_cp2" size="2" maxlength="4" />
	</td>
</tr>
<tr>
 	<td>주소</td>
 	<td>
 		<input type="text" name="mt_zipcode" id="mt_zipcode" placeholder="우편번호" style="width:50px" maxlength="6" >
 		<input type="button" name="zonecode" id="zonecode" value="우편번호 찾기"><br>	 	
 		<input type="text" name="mt_doro" id="mt_doro" placeholder="도로명주소" style="width:250px"><br>	 	
 		<input type="text" name="mt_dorodetail" id="mt_dorodetail" placeholder="도로명주소 상세주소" style="width:250px"><br>
 	</td>
</tr>
<tr>
	<td>사진</td>
	<td> 
		<input type="file" name="mt_photo"  /><br>
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