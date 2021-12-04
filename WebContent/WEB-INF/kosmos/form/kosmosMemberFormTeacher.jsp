<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 폼</title>
</head>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
	//alert("자바스크립트 블럭 시작 >>> : ")

	$(document).ready(function(){	
	
		// 아이디 중복체크 시작  ================================================= 		
		$("#midbtn").click(function(){	
			
			let midVal = $("#me_id").val();
			if (midVal == '') {
				alert("중복 체크할 아이디를 입력하세요 >>> : ");
				$("#me_id").focus();
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
			
			var vv = $("#me_id").val();
			alert("vv >>> : " + vv);
			
			idCheckData = await ajaxIdCheckData(vv);
			alert("리턴된 데이터 >>> : " + idCheckData);
			
			if("ID_YES" == idCheckData){
				alert("아이디 사용 가능 : ID_YES.");
				
				$("#me_id").attr("readonly", true);
				$("#me_id").css("background-color", "lightgray");
				$("#me_pw").focus();
			}else if("ID_NO" == idCheckData){
				alert("이미 사용 중인 아이디 : ID_NO.");
				
				$("#me_id").val("");
				$("#me_id").focus();
			};
		}
		
		function ajaxIdCheckData(myval){
			alert("아이디 사용이 가능합니다 : " + myval);
			
			let idCheckURL = "memIdCheck.k";
			let reqType = "POST";
			let dataParam = { me_id: myval, };
			
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
			var pw = $("#me_pw").val();
			var pw_r = $("#me_pw_r").val();

			if(pw == pw_r) {
				alert("비밀번호가 같습니다.");
				 pw_r.val('');

				$("#me_gen").focus();						
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
		$("#me_birth").on("input", function(){
			var m = $("#me_birth");
			if (m.val().length > m.maxlength){
				m.value = m.value.slice(0, m.maxlength);
			}
		}); // 생년월일 체크 끝
       
		// 월 
        $("#me_birth1").append("<option value=''>월--- </option>");
        for(var i = 1; i <= 12; i++){
        	if (i < 10){ i = '0'+i;}
            $("#me_birth1").append("<option value='"+ i +"'>"+ i + "</option>");
        } // 월 끝
        // 일 
        $("#me_birth2").append("<option value=''>일 ---</option>");
        for(var i = 1; i <= 31; i++){
        	if (i < 10){ i = '0'+i;}
            $("#me_birth2").append("<option value='"+ i +"'>"+ i + "</option>");
        } // 일 끝

		
		// 핸드폰		
		// 전화번호
		
		// 이메일 
		$('#me_id2').change(function(){	
		$("#me_id2 option:selected").each(function () {
			if($(this).val()== '1'){ //직접입력일 경우 
					var aa = $("#me_id1").val();
					//alert("aa >>> : " + aa);
					$("#me_id1").val(''); //값 초기화 
					$("#me_id1").attr("readonly",false); //활성화 				
			}else{ //직접입력이 아닐경우 
					$("#me_id1").val($(this).text()); //선택값 입력 
					$("#me_id1").attr("readonly",true); //비활성화 
			}}); 
		}); // me_id change 끝	
		
		// 우편번호	
		$("#zonecode").click(function(){
			console.log("zonecode >>> : ");
			new daum.Postcode({
				oncomplete: function(data) {
				    $("#me_zipcode").val(data.zonecode); //5자리 새우편번호 사용
				    $("#me_doro").val(data.roadAddress); //도로명 주소
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

			console.log("me_num >>> : " + document.memForm.me_num.value);			
			console.log("me_name >>> : " + document.memForm.me_name.value);
			console.log("me_id >>> : " + document.memForm.me_id.value);
			console.log("me_pw >>> : " + document.memForm.me_pw.value);
			console.log("me_pw_r >>> : " + document.memForm.me_pw_r.value);
			
			// 성별
			var me_gen_check = document.getElementsByName('me_gen');
			for (var i=0; i < me_gen_check.length; i++){
				if(me_gen_check[i].checked == true){
					console.log("me_gen_check["+i+"].value >>> : " + me_gen_check[i].value);
				}
			} // 성별 for 끝
			
			// 생일
			console.log("me_birth >>> : " + document.memForm.me_birth.value);
			console.log("me_birth1 >>> : " + document.memForm.me_birth1.value);
			console.log("me_birth2 >>> : " + document.memForm.me_birth2.value);
			
			// 핸드폰
			console.log("me_cp >>> : " + document.memForm.me_cp.value);
			console.log("me_cp1 >>> : " + document.memForm.me_cp1.value);
			console.log("me_cp2 >>> : " + document.memForm.me_cp2.value);
			

			// 이메일
			console.log("me_id >>> : " + document.memForm.me_id.value);
			console.log("me_id1 >>> : " + document.memForm.me_id1.value);
		
			// 주소
			console.log("me_zipcode >>> : " + document.memForm.me_zipcode.value);
			console.log("me_doro >>> : " + document.memForm.me_doro.value);
			console.log("me_dorodetail >>> : " + document.memForm.me_dorodetail.value);
				
			// 사진
			console.log("me_photo >>> : " + document.memForm.me_photo.value);

			console.log("me_num >>> : " + $('#me_num').val());
			console.log("me_name >>> : " + $('input[name=me_name]').val());
			console.log("me_id >>> : " + $('input[name=me_id]').val());
			console.log("me_pw >>> : " + $('input[name=me_pw]').val());
			console.log("me_pw_r >>> : " + $('input[name=me_pw_r]').val());
			
			// 성별
			var me_gen_check = $('input:radio[name=me_gen]:checked').val();
			console.log("me_gen_check.value >>> : " + me_gen_check);
			
			// 생일
			console.log("me_birth >>> : " + $('input[name=me_birth]').val());
			console.log("me_birth1 >>> : " + $('select[name=me_birth1]').val());
			console.log("me_birth2 >>> : " + $('select[name=me_birth2]').val());
			
			// 핸드폰
			console.log("me_cp >>> : " + $('select[name=me_cp]').val());
			console.log("me_cp1 >>> : " + $('input[name=me_cp1]').val());
			console.log("me_cp2 >>> : " + $('input[name=me_cp2]').val());
			
			// 주소
			console.log("mzonecode >>> : " + $('input[name=zonecode]').val());
			console.log("me_zipcode >>> : " + $('input[name=me_zipcode]').val());
			console.log("me_dorodetail >>> : " + $('input[name=me_dorodetail]').val());
			
			// 사진
			console.log("me_photo >>> : " + $('input[name=me_photo]').val());			
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

<body>
<h3 align="center">회원 가입(교사)</h3>
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
	<td><input type="text" name="me_num" id="me_num" readonly/></td>
 </tr>
<tr>
	<td>이름</td>
	<td><input type="text" name="me_name" id="me_name"/></td>
</tr>
<div id="me_iddiv">
<tr>
	<td>아이디(이메일)</td>
	<td>		
		<input type="text" name="me_id"  id="me_id" style="width:100px" placeholder="아이디 체크" />
		@ <input type="text" name="me_id1" id="me_id1" style="width:100px" placeholder="직접입력" />
		<select name="me_id2" id="me_id2">
        	 <option value="1" selected>직접입력</option>
       		 <option value="naver.com">naver.com</option>	       	   
      		 <option value="gmail.com">gmail.com</option>
      		 <option value="daum.net">daum.net</option>	       	   
         </select>
         <input type="button" name="midbtn" id="midbtn" value="아이디중복확인"  />
	</td>
</tr>
<tr>
	<td>패스워드</td>
	<td>
		<input type="text" name="me_pw" id="me_pw" /><br/>	
		<input type="text" id="me_pw_r" name="me_pw_r" placeholder="비밀번호확인" />
		<input type="button" value="비밀번호확인" id="pwCheck"/><br/>
	</td>
</tr>
<tr>
	<td>성별</td>
	<td> 
		<input type="radio" name="me_gen" id="me_gen" value="01" checked /> 여자
      	<input type="radio" name="me_gen" id="me_gen" value="02" /> 남자
    </td>
</tr>
<tr>
	<td>생년월일</td>
	<td>		
		<input type="text" name="me_birth" id=me_birth 
		       placeholder="년(4자)" maxlength="4" style="width:50px"/>
		<select name="me_birth1" id="me_birth1"></select>
        <select name="me_birth2" id="me_birth2"></select>
	</td>
</tr>
<tr>
	<td>핸드폰</td>
	<td>
		<select name="me_cp" id="me_cp">
        	<option value="010">010</option>
        	<option value="011">011</option>
        	<option value="016">016</option>
        	<option value="017">017</option>		        	
         </select>
         - <input type="text" name="me_cp1" id="me_cp1" size="2" maxlength="4" />
         - <input type="text" name="me_cp2" id="me_cp2" size="2" maxlength="4" />
	</td>
</tr>
<tr>
 	<td>주소</td>
 	<td>
 		<input type="text" name="me_zipcode" id="me_zipcode" placeholder="우편번호" style="width:50px" maxlength="6" >
 		<input type="button" name="zonecode" id="zonecode" value="우편번호 찾기"><br>	 	
 		<input type="text" name="me_doro" id="me_doro" placeholder="도로명주소" style="width:250px"><br>	 	
 		<input type="text" name="me_dorodetail" id="me_dorodetail" placeholder="도로명주소 상세주소" style="width:250px"><br>
 	</td>
</tr> 
 <tr>
	<td>사진</td>
	<td> 
		<input type="file" name="me_photo"  /><br>
    </td>
</tr>
<tr>
	<td>입학년도</td>
	<td> 
		<select id="st_admyear" name="st_admyear">
			<option value="2022">선택</option>
			<option value="2022">2022</option>
			<option value="2021">2021</option>
        	<option value="2020">2020</option>
        	<option value="2019">2019</option>
        </select>
    </td>
</tr>
</div>
<tr>
	<td>학번</td>
	<td>
		<select id="st_grade" name="st_grade">
			<option value="1학년">학년</option>
			<option value="1학년">1학년</option>
        	<option value="2학년">2학년</option>
        	<option value="3학년">3학년</option>
        </select>
		&nbsp;
		반&nbsp;<input type="text" id="st_class" name="st_class">
		&nbsp;	
		번호&nbsp;<input type="text" id="st_number" name="st_number">
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