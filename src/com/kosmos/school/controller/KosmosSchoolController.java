/*  
 * 	"수강신청" 페이지 영역에서 학교 홈페이지로 이동하는 링크를 클릭한 경우
 *  학교 홈페이지로 이동시키는 중개 역할의 컨트롤러
 *  
 *  학교 홈페이지 내 여러 카테고리 이동을 관장하는 컨트롤러이다.
 *  
 *  ====== 리스트 ======
 *  
 *  홈
 *  학교 소개 (학교연혁, 학교상징, 주소약도)
 *  수강 신청
 *  수업 정보 (과목 정보, 시간표)
 *  공지사항
 *  코스모스숲
 *  마이페이지
 *  
 *  ==================
 */

package com.kosmos.school.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.kosmos.login.service.KosmosLoginService;
import com.kosmos.login.vo.KosmosLoginVO;
import com.kosmos.mypage.service.KosmosMypageService;
import com.kosmos.mypage.vo.KosmosMypageVO;
import com.kosmos.sugang.controller.KosmosSugangController;

@Controller
public class KosmosSchoolController {
	
	// Logger 세팅
	Logger logger = Logger.getLogger(KosmosSchoolController.class);
	
	// 컨트롤러에서 연결해 사용할 Service 선언
	private KosmosLoginService kosmosLoginService;
	private KosmosMypageService kosmosMypageService;
	
	
	// =======================================================================================
	// 로그인 화면에서 로그인 성공시 수강신청 화면 연결 로직 학생/선생 분기
	// =======================================================================================
	
	@GetMapping("mainSugang")
	public String mainSugang(HttpSession hs, KosmosLoginVO lvo) {
		
		logger.info("KosmosSchoolController.mainSugang()진입 >>> : 학생/교사를 구분해 유형에 따라 수강신청/수강관리 페이지로 이동시킵니다.");
		
		// 세션에서 가지고 온 데이터 객체에 담기 
		KosmosLoginVO lvo_data = (KosmosLoginVO) hs.getAttribute("result");
		
		String ms_id = lvo_data.getMS_ID();
		String ms_pw = lvo_data.getMS_PW();
		String ms_num = lvo_data.getMS_NUM();
		String mt_id = lvo_data.getMT_ID();
		String mt_pw = lvo_data.getMT_PW();
		String mt_num = lvo_data.getMT_NUM();
		
		System.out.println("ms_id >>> : " + ms_id);
		System.out.println("ms_pw >>> : " + ms_pw);
		System.out.println("ms_num >>> : " + ms_num);
		System.out.println("mt_id >>> : " + mt_id);
		System.out.println("mt_pw >>> : " + mt_pw);
		System.out.println("mt_num >>> : " + mt_num);	
		
		if(ms_id != null) {								// 학생인 경우 수강 컨트롤러 -> 수강신청 페이지로 이동
			return "sugang/sugangLanding";
		} else {										// 교사인 경우 수강 관리 페이지로 -> 교사 관리 페이지는 구현 보류 상태
			return "sugang/sgManagement";
		}
		
	}
	
	
	// =======================================================================================
	// 학교 메인 홈페이지(case1 : 수강신청에서 학교홈페이지 '링크' 클릭시 / case2 : 학교 홈페이지에서 '홈' 클릭시)
	// =======================================================================================
	
	@GetMapping("mainHome")
	public String home() {
		
		return "school/home";
	}
	
	
	
	// =======================================================================================
	// 학교 소개 : 학교 연혁 클릭
	// =======================================================================================
	
	@GetMapping("mainHistory")
	public String history() {
		
		return "";
	}
	
	// =======================================================================================
	// 학교 소개 : 학교 상징 클릭
	// =======================================================================================
	
	@GetMapping("symbol")
	public String symbol() {
		
		return "";
	}
	
	// =======================================================================================
	// 학교 소개 : 주소 약도 클릭
	// =======================================================================================
	
	@GetMapping("mainLocation")
	public String location() {
		
		return "";
	}
	
	
	// =======================================================================================
	// 수강 신청 클릭(학교 홈페이지 내의 수강신청 메뉴)
	// =======================================================================================
	
	@GetMapping("mainApply")
	public String apply() {
		
		return "";
	}
	
	
	// =======================================================================================
	// 수업 정보 : 과목 정보 클릭
	// =======================================================================================
	
	@GetMapping("mainSubject")
	public String subject() {
		
		return "";
	}
	
	// =======================================================================================
	// 수업 정보 : 시간표 클릭
	// =======================================================================================
	
	@GetMapping("mainTimeTable")
	public String timeTable() {
		
		return "";
	}
	
	// =======================================================================================
	// 공지사항 클릭
	// =======================================================================================
	
	@GetMapping("mainNotice")
	public String notice() {
		
		return "";
	}
	
	
	// =======================================================================================
	// 코스모스숲 클릭
	// =======================================================================================
	
	@GetMapping("mainForest")
	public String forest() {
		
		return "";
	}
	
	// =======================================================================================
	// 마이페이지 클릭 -> KosmosMypageController로 이관
	// =======================================================================================
	/*
	@GetMapping("mainMyPage")
	public String myPage(HttpSession hs, KosmosLoginVO lvo, Model model) {
		
		
		// 세션에서 가지고 온 데이터 객체에 담기
		KosmosLoginVO lvo_data = (KosmosLoginVO) hs.getAttribute("result");
		
		
		// 가지고 온 데이터 출력
		String ms_id = lvo_data.getMS_ID();				// 학생
		String ms_pw = lvo_data.getMS_PW();
		String ms_num = lvo_data.getMS_NUM();
		
		System.out.println("ms_id >>> : " + ms_id);
		System.out.println("ms_pw >>> : " + ms_pw);
		System.out.println("ms_num >>> : " + ms_num);
		
		String mt_id = lvo_data.getMT_ID();				// 교사
		String mt_pw = lvo_data.getMT_PW();
		String mt_num = lvo_data.getMT_NUM();
	
		System.out.println("mt_id >>> : " + mt_id);
		System.out.println("mt_pw >>> : " + mt_pw);
		System.out.println("mt_num >>> : " + mt_num);	
		
		
		// 유형(학생/교사)에 따라 테이블에 보낼 데이터 조회해오기
		
			if (ms_id != null) {						// 학생인 경우
				
				KosmosMypageVO mvo = new KosmosMypageVO();
				
				//mvo = kosmosMypageVO.
				// Service -> DAO -> XML -> DB
				// DB로 조회할 데이터 리스트
				// 이름, 이메일, 핸드폰번호, 우편번호, 도로명주소, 상세주소, 가입일, 학년, 반, 번호
				
				// 조회한 데이터 출력
				KosmosMypageVO.printVO(mvo);
				
				// model.addAttribute(arg0);
				return "mypage/myPageSelectStudent";
			} else {									// 교사인 경우
			
				return "mypage/myPageSelectTeacher";

			}
	}
	*/
}
