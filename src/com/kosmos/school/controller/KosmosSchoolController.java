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
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.kosmos.login.service.KosmosLoginService;
import com.kosmos.login.vo.KosmosLoginVO;
import com.kosmos.mypage.service.KosmosMypageService;
import com.kosmos.mypage.vo.KosmosMypageVO;
import com.kosmos.school.service.KosmosSchoolService;
import com.kosmos.school.vo.KosmosSchoolVO;
import com.kosmos.sugang.controller.KosmosSugangController;

@Controller
public class KosmosSchoolController {
	
	// Logger 세팅
	Logger logger = Logger.getLogger(KosmosSchoolController.class);
	
	// 컨트롤러에서 연결해 사용할 Service 선언
	private KosmosLoginService kosmosLoginService;
	private KosmosMypageService kosmosMypageService;
	private KosmosSchoolService kosmosSchoolService;
	
	@Autowired(required=false)
	public KosmosSchoolController(KosmosSchoolService kosmosSchoolService) {
		this.kosmosSchoolService = kosmosSchoolService;
	}
	
	//==================================================================================
	//	로그인 화면으로 연결
	//==================================================================================
	
	@GetMapping("loginForm")
	public String loginForm() {
		logger.info("KosmosLoginController.loginForm() 진입 >>> : 로그인 화면으로 이동합니다.");
		return "login/test_loginForm";
	}
	
	
	// =======================================================================================
	// 로그인 화면에서 로그인 성공시 수강신청 화면 연결 로직 학생/선생 분기
	// =======================================================================================
	
	@GetMapping("mainSugang")
	public String mainSugang(HttpSession hs, KosmosLoginVO lvo) {
		
		logger.info("KosmosSchoolController.mainSugang()진입 >>> : 학생/교사를 구분해 유형에 따라 수강신청/수강관리 페이지로 이동시킵니다.");
		
		// 세션에서 가지고 온 데이터 객체에 담기 
		KosmosLoginVO lvo_data = (KosmosLoginVO) hs.getAttribute("result");
		
		String ms_id = lvo_data.getMs_id();
		String ms_pw = lvo_data.getMs_pw();
		String ms_num = lvo_data.getMs_num();
		String mt_id = lvo_data.getMt_id();
		String mt_pw = lvo_data.getMt_pw();
		String mt_num = lvo_data.getMt_num();
		
		System.out.println("ms_id >>> : " + ms_id);
		System.out.println("ms_pw >>> : " + ms_pw);
		System.out.println("ms_num >>> : " + ms_num);
		System.out.println("mt_id >>> : " + mt_id);
		System.out.println("mt_pw >>> : " + mt_pw);
		System.out.println("mt_num >>> : " + mt_num);	
		
		if(ms_id != null) {								// 학생인 경우 수강 컨트롤러 -> 수강신청 페이지로 이동
			// #솔잎 이 만들어준 페이지 미적용 상태
			// 현재 더미페이지
			return "sugang/sugangLanding";
			
		} else {										// 교사인 경우 수강 관리 페이지로 -> 교사 관리 페이지는 구현 보류 상태
			// #미구현 : 홀딩 : 교수가 로그인한 경우 수강신청관리페이지로 이동해야 함.
			return "sugang/sgManagement";
		}
		
	}
	
	
	// =======================================================================================
	// 학교 메인 홈페이지(case1 : 수강신청에서 학교홈페이지 '링크' 클릭시 / case2 : 학교 홈페이지에서 '홈' 클릭시)
	// =======================================================================================
	
	@GetMapping("mainHome")
	public String home() {
		
		return "school/kosmos_main_page";
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
	
	
	// 시간표
	@GetMapping("mainTimeTable")
	public String timetable(KosmosSchoolVO svo, Model model, HttpSession hs, KosmosLoginVO lvo) {
		logger.info("KosmosSchoolController timetable() 함수 진입 >>> : ");
		
		KosmosLoginVO lvo_data = (KosmosLoginVO) hs.getAttribute("result");
		String ms_num = lvo_data.getMs_num();

		svo.setMs_num(ms_num);
		
		// 1교시 세팅
		List<KosmosSchoolVO> list1 = kosmosSchoolService.timetable1(svo);
		// 2교시 세팅
		List<KosmosSchoolVO> list2 = kosmosSchoolService.timetable2(svo);
		// 3교시 세팅
		List<KosmosSchoolVO> list3 = kosmosSchoolService.timetable3(svo);
		// 4교시 세팅
		List<KosmosSchoolVO> list4 = kosmosSchoolService.timetable4(svo);
		// 5교시 세팅
		List<KosmosSchoolVO> list5 = kosmosSchoolService.timetable5(svo);
		// 6교시 세팅
		List<KosmosSchoolVO> list6 = kosmosSchoolService.timetable6(svo);
		// 7교시 세팅
		List<KosmosSchoolVO> list7 = kosmosSchoolService.timetable7(svo);
		
		// 리스트 하나로 합치기
		List<KosmosSchoolVO> listall = Stream.of(list1, list2, list3, list4, list5, list6, list7)
										.flatMap(x -> x.stream())
										.collect(Collectors.toList());
		
		model.addAttribute("listall", listall);
		
		// 7교시까지 셀렉트 성공하면 school_timetable로
		if(list1.size() > 0 && list2.size() > 0 && list3.size() > 0 && 
				list4.size() > 0 && list5.size() > 0 && list6.size() > 0
				&& list7.size() > 0) {
			return "../../kosmos_timetable";
		}
		return "school/checkfail";
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
	
}
