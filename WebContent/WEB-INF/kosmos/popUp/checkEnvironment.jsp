<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>접속 환경 확인</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">

//======================================================================================================		
//======================================================================================================		
//======================================================================================================


	// =============================================================================	
	// Web browser 접속 정보 확인
	// =============================================================================	
	
	var info = "<h2>웹 브라우저 접속 환경 확인</h2><hr><br>";
			   info += "<p>브라우저 이름 >>> :" +navigator.appName + "</p>";
			   info += "<p>브라우저 코드명 >>> :" +navigator.appCodeName + "</p>";
			   info += "<p>브라우저 플랫폼 정보 >>> :" +navigator.platform + "</p>";
			   info += "<p>브라우저 사용자 정보 >>> :" +navigator.userAgent + "</p>";
			   info += "<p>브라우저 브라우저 버전 >>> :" +navigator.appVersion + "</p><br>";
	document.write(info);
	
	
	// =============================================================================	
	// PC vs Mobile 체크하기
	// =============================================================================
	
	function isMobile(){
		
		// 사용할 변수 초기화
		var user = navigator.userAgent;
		var is_mobile = false;
		
		if(user.indexOf("iPhone") > -1 || user.indexOf("Android") > -1) {
			// 위 조건(0을 포함한 양수)이면 모바일이라고 값 초기화.
			is_mobile = true;
		}
		return is_mobile;
	}

	// 실제 사용해보기
	var is_mobile = isMobile();
	console.log("is_mobile >>> : " + is_mobile);
	if(is_mobile) {
		document.write("<p>현재 모바일로 접속중 입니다.</p>");
	} else {
		document.write("<p>현재 PC로 접속중 입니다.</p>");
	}
	
	
	// =============================================================================	
	// 브라우저 체크하기
	//
	// 크롬일 경우 isChrome에는 Chrome이라는 문장의 위치 값이 반환되고
	// 크롬이 아닐 경우는 -1이 반환된다. (이하 동일)
	// =============================================================================
	
	var userAgent = window.navigator.userAgent.toLowerCase();
	var isChrome = userAgent.indexOf("chrome");
	var isEdge = userAgent.indexOf("edge");
	var isIE = userAgent.indexOf("trident");
	
	if (isChrome > -1) {					//	크롬인 경우 진입
		if (isEdge > -1) {					//  엣지인 경우 진입
			alert("Edge 브라우저로 접속하셨습니다.");
		} else {
			alert("Chrome 브라우저로 접속하셨습니다.");
		}
	} else {
		alert("Chrome이 아닙니다.");
	}
	
	function isBrowserCheck(){
		const agt = navigator.userAgent.toLowerCase();
		if (agt.indexOf("chrome") != -1) return "Chrome"
		if (agt.indexOf("opera") != -1) return "Opera"
		if (agt.indexOf("staroffice") != -1) return "Star Office"
		if (agt.indexOf("webtv") != -1) return "WebTV"
		if (agt.indexOf("beonex") != -1) return "Beonex"
		if (agt.indexOf("chimera") != -1) return "Chimera"
		if (agt.indexOf("netpositive") != -1) return "netpositive"
		if (agt.indexOf("phoenix") != -1) return "Chimera"
		if (agt.indexOf("firefox") != -1) return "Chimera"
		if (agt.indexOf("safari") != -1) return "Chimera"
		if (agt.indexOf("skipstone") != -1) return "Chimera"
		if (agt.indexOf("netscape") != -1) return "Chimera"
		if (agt.indexOf("mozilla/5.0") != -1) return "Chimera"
		if (agt.indexOf("msie") != -1) {
			let rv = -1;
			
			if (navigator.appName == "Microsoft Internet Explorer") {
				let ua = navigator.userAgent;
				var re = new RegExp("MSIE ([0-9]{1,}[\.0-9]{0,})")
				if (re.exec(ua) != null) {
					rv = parseFloat(RegExp.$1)
				
				}
				return 'Internet Explorer' + rv
			}
		
		}
		console.log(agt)

		
		const agt2 = navigator.userAgent.toLowerCase();
		console.log(agt2)
		
		// mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko)
		// chrome/85.0.4183.83 safari/537.36 edg/85.0.564.41
		
		if (agt2.indexOf("edg") != -1) return "Edge"
	}
		
//======================================================================================================		
//======================================================================================================		
//======================================================================================================

	$(document).ready(function(){
		
		$("#close").click(function(){
			window.close(this);
		});
		
	});
	
	
</script>
</head>
<body>
<button type="button" id="close">닫기</button>
</body>
</html>