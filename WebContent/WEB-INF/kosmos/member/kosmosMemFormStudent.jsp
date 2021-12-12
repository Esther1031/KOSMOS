<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스프링 회원가입 폼</title>

<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Sign Up Form by Colorlib</title>

<!-- Font Icon -->
<link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">
<link rel="stylesheet" href="vendor/nouislider/nouislider.min.css">

<!-- Main css -->
<link rel="stylesheet" href="css/style.css">

<style>

	@import url('https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap');

	body {
	font-family: 'IBM Plex Sans KR', sans-serif;
	width: 1400px;
	}
	.register-form {
	
	margin: 50px auto;
	}

</style>


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
		
		// 폼태그 데이터 JSP 보내기 
		$("#btn").click(function(){
			//alert("submit click() 함수 진입 >>> : ");
			console.log("btn click() 함수 진입 >>> : ");

			console.log("ms_num >>> : " + document.memForm.ms_num.value);			
			console.log("ms_name >>> : " + document.memForm.ms_name.value);
			console.log("ms_id >>> : " + document.memForm.ms_id.value);
			console.log("ms_pw >>> : " + document.memForm.ms_pw.value);
			console.log("ms_pw_r >>> : " + document.memForm.ms_pw_r.value);
			
			// 생일
			console.log("ms_birth >>> : " + document.memForm.ms_birth.value);

			// 핸드폰
			console.log("ms_cp >>> : " + document.memForm.ms_cp.value);		

			// 이메일
			console.log("ms_id >>> : " + document.memForm.ms_id.value);
		
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
			
			
			// 생일
			console.log("ms_birth >>> : " + $('input[name=ms_birth]').val());
			
			// 핸드폰
			console.log("ms_cp >>> : " + $('select[name=ms_cp]').val());
			
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
    <div class="main">
        <div class="container">
            <div class="signup-content">
                <div class="signup-img">
                    <img src="images/1.jpg" alt="">
                    <div class="signup-img-content">
                        <h2>학생 회원가입 </h2>
                    </div>
                </div>
<!--                  <div class="signup-form">-->
                    <form name="memForm" id="memForm" class="register-form">
                        <div class="form-row">
                            <div class="form-group">
                                <div class="form-input">
                                    <label for="ms_num" class="required">회원번호</label>
									<td><input type="text" name="ms_num" id="ms_num" placeholder="자동생성"readonly/></td>
                                </div>
                                <div class="form-input">
                                    <label for="ms_name" class="required">이름</label>
                                    <td><input type="text" name="ms_name" id="ms_name"/></td>
                                </div>
                                <div class="form-input">
                                    <label for="ms_id" class="required">아이디(이메일)</label>
							 		<input type="text" name="ms_id"  id="ms_id"  placeholder="아이디 체크" />
							         <input type="button" name="midbtn" id="midbtn" style="width:150px" value="아이디중복확인"  />
                                </div>
                                <div class="form-input">
                                    <label for="ms_pw" class="required">비밀번호</label>
	                              	<input type="text" name="ms_pw" id="ms_pw" placeholder="비밀번호입력 "/>	
									<input type="text" id="ms_pw_r" name="ms_pw_r" placeholder="비밀번호확인" />
									<input type="button" value="비밀번호확인" style="width:150px" id="pwCheck"/><br/>
                                </div>
                              <div class="form-input" >
                                        <label for="ms_gen" class="required">성별</label>
                                   	<input type="text" name="ms_gen" id="ms_gen"placeholder="남자/여자" maxlength="2" >
                                </div>
                              <div class="form-input" >
                                        <label for="ms_birth" class="required">생년월일</label>
                                    	<input type="text" name="ms_birth" id="ms_birth"placeholder="ex)20200101" minlength="8 "maxlength="8" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" >
         						  </div>
                              </div>                      
                            <div class="form-group">
                                <div class="form-select">
                                    <div class="label-flex">
                                        <label for="ms_admyear" class="required">입학년도</label>
                                    </div>
         								<input type="text" name="ms_admyear" id="ms_admyear" placeholder="ex)2020" style="width:100px" maxlength="4" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" >
                                </div>
                                <div class="form-input">
                                        <label for="ms_semester" class="required">학기</label>
                                   		<input type="text" name="ms_semester" id="ms_semester" placeholder="1학기/2학기" maxlength="3" >
                                </div>
                                <div class="form-input">
                                    <label for="ms_zipcode" class="required">주소</label>
                               		<input type="text" name="ms_zipcode" id="ms_zipcode" placeholder="우편번호" style="width:100px" maxlength="6" >
	                              	<input type="text" name="ms_doro" id="ms_doro" placeholder="도로명주소 "/>
									<input type="text" id="ms_dorodetail" name="ms_dorodetail" placeholder="도로명주소상세주소" />
									<input type="button" name="zonecode" value="우편번호 찾기" id="zonecode"/>
                                </div>
                                <div class="form-radio">
                                   <div class="label-flex">
                                     <label for="ms_grade" class="required">학번</label>
                                     <a href="#" class="form-link">학년,반,번호는 01~99 숫자로만 입력합니다</a>
                                   </div>
                    			  <div class="form-radio-group">   
                                    <input type="text" name="ms_grade" id="ms_grade" placeholder="학년(00)" maxlength="2" style="width:130px" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"/>
                                    <input type="text" name="ms_class" id="ms_class" placeholder="반(00)"  maxlength="2" style="width:130px" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" />
                                    <input type="text" name="ms_number" id="ms_number" placeholder="번호(00)"  maxlength="2" style="width:130px" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" />
                                 </div>
                                </div>
                                <div class="form-input">
                                    <label for="ms_cp" class="required" >핸드폰 번호</label>
                                    <input type="text" name="ms_cp" id="ms_cp" placeholder="-빼고 번호만 입력" />
                                </div>
                                 <div class="form-input">
                                    <label for="ms_photo" class="required">사진</label>
										<input type="file" name="ms_photo"  /><br>
                                </div>
                            </div>
                        </div>
                         <div class="form-submit">
                            <input type="submit" value="Submit" class="submit" id="btn" name="submit" />
                            <input type="submit" value="Reset" class="submit" id="reset" name="reset" />
                        </div>
                    </form>
                </div>
            </div>
        </div>


    <!-- JS -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/nouislider/nouislider.min.js"></script>
    <script src="vendor/wnumb/wNumb.js"></script>
    <script src="vendor/jquery-validation/dist/jquery.validate.min.js"></script>
    <script src="vendor/jquery-validation/dist/additional-methods.min.js"></script>
    <script src="js/main.js"></script>
</body><!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>