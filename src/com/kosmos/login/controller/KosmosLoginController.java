package com.kosmos.login.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.catalina.Session;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kosmos.common.AuthenticationKey;
import com.kosmos.login.service.KosmosLoginService;
import com.kosmos.login.vo.KosmosLoginVO;
import com.kosmos.login.vo.SendEmail;

@Controller
public class KosmosLoginController {
	
	// 로거 초기화 세팅
	Logger logger = Logger.getLogger(KosmosLoginController.class);
	
	// 서비스 선언
	private KosmosLoginService kosmosLoginService;
	
	// 생성자로 서비스단 연결 : 의존성(DI) 주입
	@Autowired(required=false)
	public KosmosLoginController (KosmosLoginService kosmosLoginService) {
		this.kosmosLoginService = kosmosLoginService;
	}
	
	/* School Controller로 이전
	//==================================================================================
	//	로그인 화면으로 연결
	//==================================================================================
	
	@GetMapping("loginForm")
	public String loginForm() {
		logger.info("KosmosLoginController.loginForm() 진입 >>> : 로그인 화면으로 이동합니다.");
		return "login/loginForm";
	}
	*/
	
	//==================================================================================
	//	회원가입 링크 클릭시 회원 유형 선택화면으로 연결
	//==================================================================================
	
	@GetMapping("loginChoice")
	public String loginChoice() {
		logger.info("KosmosLoginController.loginForm() 진입 >>> : 로그인 화면으로 이동합니다.");
		return "popUp/loginChoice";
	}
	
	
	//==================================================================================
	//	회원 유형 선택화면에서 학생 선택시 회원가입 폼으로 연결
	//==================================================================================
	
	@GetMapping("joinStudent")
	public String joinStudent() {
		logger.info("KosmosLoginController.loginForm() 진입 >>> : 로그인 화면으로 이동합니다.");
		return "member/kosmosMemFormStudent";
	}
	
	
	//==================================================================================
	//	회원 유형 선택화면에서 교사 선택시 교사인증 팝업 창으로 연결
	//==================================================================================
	
	@GetMapping("joinTeacher")
	public String joinTeacher() {
		logger.info("KosmosLoginController.loginForm() 진입 >>> : 로그인 화면으로 이동합니다.");
		return "popUp/teacherAuthCheck";
	}
	
	
	//==================================================================================
	//	교사 인증키 확인
	//==================================================================================
	
	@PostMapping("checkAuth")
	@ResponseBody
	public String checkAuth (HttpServletRequest req, KosmosLoginVO lvo) {
		logger.info("KosmosLoginController.login() 진입 >>> : 로그인시 입력한 ID/PW를 확인합니다.");

		// 폼으로 받은 데이터 확인
		KosmosLoginVO.printVO(lvo);
		
		System.out.println("사용자가 입력한 인증키 >>> : " + lvo.getAuthenticationkey());
			
		String insertKey = lvo.getAuthenticationkey();
		System.out.println("객체에서 받아온 insertKey >>> : " + insertKey);
		
		String key = AuthenticationKey.TEACHER_KEY;
		System.out.println("클래스에 세팅된 key >>> : " + key);
		
		String msg = "";

		// DB로 보내기
		if(key.equals(insertKey)) {
			// if 일치하는 데이터 있으면 교사회원가입 폼으로
			msg = "correct";
			return msg;	
				
		} else {
			msg = "incorrect";
			return msg;
		}
		
	}
	
	
	//==================================================================================
	//	교사 인증 성공시 교사회원가입 창으로 연결
	//==================================================================================
	
	//@GetMapping("teacherForm")
	public String teacherForm() {
		logger.info("KosmosLoginController.loginForm() 진입 >>> : 로그인 화면으로 이동합니다.");
		return "member/kosmosMemFormTeacher";
	}
	
	
	//==================================================================================
	//	로그인 화면   >>>  아이디 찾기 화면으로 연결 
	//==================================================================================
	
	@GetMapping("findIdPage")
	public String findIdPage() {
		logger.info("KosmosLoginController.findIdPage() 진입 >>> : 아이디 찾기 화면으로 이동합니다.");
		return "popUp/findId";
	}
	
	
	//==================================================================================
	//	로그인 화면   >>>   비밀번호 찾기 화면으로 연결
	//==================================================================================
	
	@GetMapping("findPwPage")
	public String findPwPage() {
		logger.info("KosmosLoginController.findPwPage() 진입 >>> : 비밀번호 찾기 화면으로 이동합니다.");
		return "popUp/findPw";
	}
	
	
	
	
	//==================================================================================
	//	로그인 버튼 클릭시 메시지 리턴 로직 : 성공 / 실패
	//==================================================================================
	
	//@PostMapping("loginMsg")
	@RequestMapping(value="loginMsg", method=RequestMethod.POST, produces="application/text; charset=UTF-8")
	@ResponseBody
	public String login (HttpSession hs, KosmosLoginVO lvo, Model model) {
		logger.info("KosmosLoginController.login() 진입 >>> : 로그인시 입력한 ID/PW를 확인합니다.");
		
		// 데이터가 바인딩된 객체에 담긴 내용 출력 
		KosmosLoginVO.printVO(lvo);
		
		// ajax 데이터 리턴에 사용할 변수 선언
		String msg = "";
		
		// 체크박스 데이터 변수에 초기화 
		String memberType = lvo.getLogin_type();
		
		System.out.println("memberType >>> : " + memberType);
		int type = Integer.parseInt(memberType);
		System.out.println("type >>> : 입력된 유형을 출력합니다. : 0" + type);
		
		// 리스트 세팅
		List<KosmosLoginVO> resultList = null;
		
		// jsp에서 체크박스 선택이 학생인지 교사인지 필터링
		// chkbox 유형 : 학생인 경우 학생 로직(함수) 실행
		if (01 == type) {
			
			System.out.println("01 >>> : 선택된 유형은 [학생]입니다.");
			
			resultList = kosmosLoginService.checkIdPwStudent(lvo);
			System.out.println("resultList(학생) >>> : DB에서 리턴된 리스트의 사이즈를 출력합니다 : " + resultList.size());

			if (resultList.size() > 0) {
				
				KosmosLoginVO lvo_ = new KosmosLoginVO();
				
				// loginVO객체에 학생 테이블에서 조회한 데이터를 담는다.
				lvo_ = resultList.get(0);
				
				System.out.println("DB에서 조회한 학생 ID >>> : " + lvo_.getMs_id());
				System.out.println("DB에서 조회한 학생 PW >>> : " + lvo_.getMs_pw());
				System.out.println("DB에서 조회한 학생 회원번호 >>> : " + lvo_.getMs_num());
				
				// 세션에 세팅
				hs.setAttribute("result", lvo_);

				msg = "successSt";

				
			} else if (resultList.size() == 0) {
				System.out.println("DB에서 받아온 데이터가 없습니다. >>> : 아이디와 비밀번호를 다시 입력해주세요.");
				
				msg = "fail";

			}
		// chkbox 유형 : 교사인경우 교사 로직(함수) 실행
		} else if (02 == type) {
			
			System.out.println("02 >>> : 선택된 유형은 [교사]입니다.");
			
		 	resultList = kosmosLoginService.checkIdPwTeacher(lvo);
			System.out.println("resultList(교사) >>> : DB에서 리턴된 리스트의 사이즈를 출력합니다 : " + resultList.size());

			if (resultList.size() > 0) {
				
				KosmosLoginVO lvo_ = new KosmosLoginVO();
				
				// loginVO객체에 교사 테이블에서 조회한 데이터를 담는다.
				lvo_ = resultList.get(0);
				
				System.out.println("DB에서 조회한 교사 ID >>> : " + lvo_.getMt_id());
				System.out.println("DB에서 조회한 교사 PW >>> : " + lvo_.getMt_pw());
				System.out.println("DB에서 조회한 교사 회원번호 >>> : " + lvo_.getMt_num());
				
				// 세션에 세팅
				hs.setAttribute("result", lvo_);
				
				msg = "successTe";
				
				
			} else if (resultList.size() == 0){
				System.out.println("DB에서 받아온 데이터가 없습니다. >>> : 아이디와 비밀번호를 다시 입력해주세요.");
				
				msg = "fail";

			}
		}
		return msg;
	}
	
	
	//==================================================================================
	// 로그인 성공시 : 접속 환경 확인 페이지로 이동
	//==================================================================================
	
	@GetMapping("checkEnvironment")
	public String checkEnvironment() {
		return "popUp/test_checkEnvironment";
	}
	
	
	//==================================================================================
	// 아이디 찾기 페이지에서 아이디 찾기 버튼 클릭시
	//==================================================================================
	
	//@PostMapping("findId") -> 한글 깨짐
	@RequestMapping(value="findId", method=RequestMethod.POST, produces="application/text; charset=UTF-8")
	@ResponseBody
	public String findId (HttpServletRequest req, KosmosLoginVO lvo) {
		logger.info("KosmosLoginController.findId() 진입 >>> : 아이디 찾기 로직을 실행합니다.");
		
		logger.info(lvo.getLogin_type());
		logger.info(lvo.getMname());
		logger.info(lvo.getMbirthId());
		
		// 데이터가 바인딩된 객체에 담긴 내용 출력 
		KosmosLoginVO.printVO(lvo);
		
		// return에 사용할 변수 초기화
		String msg = "";
		String id = "";
		
		// 체크박스 데이터 변수에 초기화 
		String memberType = lvo.getLogin_type();
		int type = Integer.parseInt(memberType);
		System.out.println("type >>> : 입력된 유형을 출력합니다. : 0" + type);
		
		// 리스트 세팅
		List<KosmosLoginVO> resultList = null;
		
		// jsp에서 체크박스 선택이 학생인지 교사인지 필터링
		// chkbox 유형 : 학생인 경우 학생 로직(함수) 실행
		if (01 == type) {
			
			System.out.println("01 >>> : 선택된 유형은 [학생]입니다.");
			
			resultList = kosmosLoginService.findIdStudent(lvo);
			System.out.println("resultList(학생) >>> : DB에서 리턴된 리스트의 사이즈를 출력합니다 : " + resultList.size());
		
			if (resultList.size() > 0) {
				
				KosmosLoginVO lvo_ = new KosmosLoginVO();

				lvo_ = resultList.get(0);
				id = lvo_.getMs_id();
				System.out.println("DB에서 조회한 학생 ID >>> : " + id);

				msg = "회원님의 아이디는  "+ id + "입니다.";
								
				return msg;
				
			} else if (resultList.size() == 0) {
				System.out.println("입력한 정보와 일치하는 데이터가 없습니다 >>> : 입력 정보를 다시 확인해주세요.");
				
				msg = "입력하신 정보와 일치하는 데이터가 없습니다";
				
				return msg;
			}
		
		} else if(02 == type) {
			
			System.out.println("02 >>> : 선택된 유형은 [교사]입니다.");
			
			resultList = kosmosLoginService.findIdTeacher(lvo);
			System.out.println("resultList(교사) >>> : DB에서 리턴된 리스트의 사이즈를 출력합니다 : " + resultList.size());
			
			if (resultList.size() > 0) {
				
				KosmosLoginVO lvo_ = new KosmosLoginVO();

				lvo_ = resultList.get(0);
				id = lvo_.getMt_id();
				System.out.println("DB에서 조회한 교사 ID >>> : " + id);

				msg = "회원님의 아이디는  "+ id + "입니다.";
		
				return msg;
				
			} else if (resultList.size() == 0) {
				System.out.println("입력한 정보와 일치하는 데이터가 없습니다 >>> : 입력 정보를 다시 확인해주세요.");
				
				msg = "입력하신 정보와 일치하는 데이터가 없습니다";
				
				return msg;
			}
		}
		// 휴대폰인증 API사용여부 추후 검토
		return "";
	}
	
	
	//==================================================================================
	//	비밀번호 찾기 화면에서 비밀번호 찾기 버튼 클릭시
	//==================================================================================
	
	//@PostMapping("findPw")
	@RequestMapping(value="findPw", method=RequestMethod.POST, produces="application/text; charset=UTF-8")
	@ResponseBody
	public String findPw(HttpServletRequest req, KosmosLoginVO lvo) {
		logger.info("KosmosLoginController.findPw() 진입 >>> : 비밀번호 찾기 로직을 실행합니다.");
		
		// 데이터가 바인딩된 객체에 담긴 내용 출력 
		KosmosLoginVO.printVO(lvo);
				
		// return에 사용할 변수 초기화
		String msg = "";
		String id = "";
		String pw = "";
		
		
		// 체크박스 데이터 변수에 초기화 
		String memberType = lvo.getLogin_type();
		int type = Integer.parseInt(memberType);
		System.out.println("type >>> : 입력된 유형을 출력합니다. : 0" + type);
				
		// 리스트 세팅
		List<KosmosLoginVO> resultList = null;

		// jsp에서 체크박스 선택이 학생인지 교사인지 필터링
		// chkbox 유형 : 학생인 경우 학생 로직(함수) 실행
		if (01 == type) {
					
			System.out.println("01 >>> : 선택된 유형은 [학생]입니다.");
					
			resultList = kosmosLoginService.findPwStudent(lvo);
			System.out.println("resultList(학생) >>> : DB에서 리턴된 리스트의 사이즈를 출력합니다 : " + resultList.size());
				
			if (resultList.size() > 0) {
						
				KosmosLoginVO lvo_ = new KosmosLoginVO();

				lvo_ = resultList.get(0);
				id = lvo_.getMs_id();
				System.out.println("DB에서 조회한 ID >>> : " + id);

				pw = lvo_.getMs_pw();
				System.out.println("DB에서 조회한 PW >>> : " + pw);

				msg = SendEmail.sendEmail(id, pw);
				
				return msg;
				
			} else if (resultList.size() < 1) {
				System.out.println("입력한 정보와 일치하는 데이터가 없습니다 >>> : 입력 정보를 다시 확인해주세요.");
				msg = "입력하신 정보와 일치하는 데이터가 없습니다.";
				
				return msg;
			}
				
		} else if(02 == type) {
					
			System.out.println("02 >>> : 선택된 유형은 [교사]입니다.");
					
			resultList = kosmosLoginService.findPwTeacher(lvo);
			System.out.println("resultList(교사) >>> : DB에서 리턴된 리스트의 사이즈를 출력합니다 : " + resultList.size());
					
			if (resultList.size() > 0) {
						
				KosmosLoginVO lvo_ = new KosmosLoginVO();

				lvo_ = resultList.get(0);
				id = lvo_.getMt_id();
				System.out.println("DB에서 조회한 ID >>> : " + id);
				pw = lvo_.getMt_pw();
				System.out.println("DB에서 조회한 PW >>> : " + pw);

				msg = SendEmail.sendEmail(id, pw);
				
				return msg;
				
			} else if (resultList.size() == 0) {
				System.out.println("입력한 정보와 일치하는 데이터가 없습니다 >>> : 입력 정보를 다시 확인해주세요.");
				msg = "입력하신 정보와 일치하는 데이터가 없습니다.";
				
				return msg;
			}
		}
		return "";
	}
}
