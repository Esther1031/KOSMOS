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
	
	.signup-form {
	    width: 1015px;
	    margin-left: 100px;
	}

</style>


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
		
		
		// 폼태그 데이터 JSP 보내기 
		$("#btn").click(function(){
			//alert("btn click() 함수 진입 >>> : ");
			console.log("btn click() 함수 진입 >>> : ");

			console.log("mt_num >>> : " + document.teacherForm.mt_num.value);			
			console.log("mt_name >>> : " + document.teacherForm.mt_name.value);
			console.log("mt_id >>> : " + document.teacherForm.mt_id.value);
			console.log("mt_pw >>> : " + document.teacherForm.mt_pw.value);
			console.log("mt_pw_r >>> : " + document.teacherForm.mt_pw_r.value);
			
			
			// 생일
			console.log("mt_birth >>> : " + document.teacherForm.mt_birth.value);
			
			// 핸드폰
			console.log("mt_cp >>> : " + document.teacherForm.mt_cp.value);
			
			// 이메일
			console.log("mt_id >>> : " + document.teacherForm.mt_id.value);
		
			// 주소
			console.log("mt_zipcode >>> : " + document.teacherForm.mt_zipcode.value);
			console.log("mt_doro >>> : " + document.teacherForm.mt_doro.value);
			console.log("mt_dorodetail >>> : " + document.teacherForm.mt_dorodetail.value);
			
			// 사진
			console.log("mt_photo >>> : " + document.teacherForm.mt_photo.value);
			
			// 생일
			console.log("mt_birth >>> : " + $('input[name=mt_birth]').val());
			
			// 핸드폰
			console.log("mt_cp >>> : " + $('select[name=mt_cp]').val());
			
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

    <div class="main">

        <div class="container">
            <div class="signup-content">
                <div class="signup-img">
                    <img src="images/1.jpg" alt="">
                    <div class="signup-img-content">
                        <h2>선생님 회원가입 </h2>
                    </div>
                </div>
                <div class="signup-form">
                    <form class="register-form" name="teacherForm" id="teacherForm">
                        <div class="form-row">
                            <div class="form-group">
                                 <div class="form-input">
                                    <label for="mt_num" class="required">회원번호</label>
									<td><input type="text" name="ms_num" id="ms_num" placeholder="자동생성"readonly/></td>
                                 </div>
                                <div class="form-input">
                                    <label for="mt_name" class="required">이름</label>
                                    <td><input type="text" name="mt_name" id="mt_name"/></td>
                                </div>
                                <div class="form-input">
                                    <label for="mt_id" class="required">아이디(이메일)</label>
							 		<input type="text" name="mt_id"  id="mt_id"  placeholder="아이디 체크" />
							         <input type="button" name="midbtn" id="midbtn" style="width:150px" value="아이디중복확인"  />
                                </div>
                                <div class="form-input">
                                    <label for="mt_pw" class="required">비밀번호</label>
	                              	<input type="text" name="mt_pw" id="mt_pw" placeholder="비밀번호입력 "/>	
									<input type="text" id="mt_pw_r" name="mt_pw_r" placeholder="비밀번호확인" />
									<input type="button" value="비밀번호확인" style="width:150px" id="pwCheck"/><br/>
                                </div>
                                <div class="form-input" >
                                        <label for="mt_gen" class="required">성별</label>
                                   	<input type="text" name="mt_gen" id="mt_gen"placeholder="남자/여자" maxlength="2" >
                                </div>
                              <div class="form-input" >
                                      <label for="mt_birth" class="required">생년월일</label>
                                  	<input type="text" name="mt_birth" id="mt_birth"placeholder="ex)20200101" maxlength="8" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" >
       						  </div>   
       						 </div>        
                           <div class="form-group">
                                <div class="form-input">
                                    <label for="mt_zipcode" class="required">주소</label>
                               		<input type="text" name="mt_zipcode" id="mt_zipcode" placeholder="우편번호" style="width:100px" maxlength="6" >
	                              	<input type="text" name="mt_doro" id="mt_doro" placeholder="도로명주소 "/>
									<input type="text" id="mt_dorodetail" name="mt_dorodetail" placeholder="도로명주소상세주소" />
									<input type="button" name="zonecode" value="우편번호 찾기" id="zonecode"/>
                                </div>
                                <div class="form-input">
                                    <label for="mt_cp" class="required" >핸드폰 번호</label>
                                    <input type="text" name="mt_cp" id="mt_cp" placeholder="-빼고 번호만 입력" />
                                </div>
                                 <div class="form-input">
                                    <label for="mt_photo">사진</label>
										<input type="file" name="mt_photo"  /><br>
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