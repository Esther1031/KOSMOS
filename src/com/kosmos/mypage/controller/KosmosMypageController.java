package com.kosmos.mypage.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kosmos.login.vo.KosmosLoginVO;
import com.kosmos.mypage.service.KosmosMypageService;
import com.kosmos.mypage.vo.KosmosMypageVO;

@Controller
public class KosmosMypageController {
	
	// Logger 세팅
	Logger logger = Logger.getLogger(KosmosMypageController.class);
	
	// 서비스 선언
	private KosmosMypageService kosmosMypageService;
	
	// 생성자로 서비스단 연결
	@Autowired(required=false)
	public KosmosMypageController(KosmosMypageService kosmosMypageService) {
		this.kosmosMypageService = kosmosMypageService;
	}
	
	// ========================================================================
	// 홈에서 카테고리 '마이페이지' 클릭시  >>> 학생은 학생 페이지로, 교사는 교사 페이지로 이동.
	// ========================================================================
	
	@GetMapping("mainMyPage")
	public String myPageSelectStudent(HttpSession hs, Model model) {
		logger.info("KosmosMypageController.myPageSelectStudent() 진입 >>> : 학생 회원의 데이터를 조회해 불러옵니다.");
		
		// 세션에서 로그인 정보 받아오기
		KosmosLoginVO lvo = null;
		lvo = (KosmosLoginVO) hs.getAttribute("result");
		
		// 학생 데이터를 받은 경우 바인딩할 변수
		String ms_id = lvo.getMS_ID();
		String ms_num = lvo.getMS_NUM();
		
		// 교사 데이터를 받은 경우 바인딩할 변수
		String mt_id = lvo.getMT_ID();
		String mt_num = lvo.getMT_NUM();
		
		// 받아온 데이터 출력하기
		logger.info("\n=========== 세션에서 받아온 로그인 정보 ==========\n");
		logger.info("세션에서 가져온 ms_id >>> : " + ms_id);
		logger.info("세션에서 가져온 ms_num >>> : " + ms_num);
		logger.info("세션에서 가져온 mt_id >>> : " + mt_id);
		logger.info("세션에서 가져온 mt_num >>> : " + mt_num);
		logger.info("\n==========================================\n");
		
		// 분기 로직 : 학생 / 교사
		if (mt_id == null) {									// 학생인 경우
			logger.info("현재 로그인한 회원은 [학생] 입니다.");
			
			logger.info("SQL에 이용할 회원 아이디 ms_id >>> : " + lvo.getMS_ID());
			logger.info("SQL에 이용할 회원 번호 ms_num >>> : " + lvo.getMS_NUM());
			
			// 서비스로 데이터 조회 요청 보내기 >>> : 데이터 담는 리스트 초기화
			List<KosmosMypageVO> resultList = null;
			resultList = kosmosMypageService.selectStudentData(lvo);
			
			logger.info("DB에서 가져온 데이터 resultList.size() >>> : " + resultList.size());
			
			if(resultList.size() > 0) {
				
				KosmosMypageVO mvo = new KosmosMypageVO();
				
				mvo = resultList.get(0);
				
				String student_name = mvo.getMS_NAME();
				String student_id = mvo.getMS_ID();
				String student_cp = mvo.getMS_CP();
				String student_zipcode = mvo.getMS_ZIPCODE();
				String student_doro = mvo.getMS_DORO();
				String student_doro_detail = mvo.getMS_DORODETAIL();
				String student_ad_year = mvo.getMS_INSDATE();
				String student_grade = mvo.getMS_GRADE();
				String student_class = mvo.getMS_CLASS();
				String student_number = mvo.getMS_NUMBER();
				
				logger.info("DB에서 가지고온 이름 mvo.setMS_NAME >>> : " + mvo.getMS_NAME());
				logger.info("DB에서 가지고온 이름 mvo.setMS_ID >>> : " + mvo.getMS_ID());
				logger.info("DB에서 가지고온 이름 mvo.setMS_CP >>> : " + mvo.getMS_CP());
				logger.info("DB에서 가지고온 이름 mvo.setMS_ZIPCODE >>> : " + mvo.getMS_ZIPCODE());
				logger.info("DB에서 가지고온 이름 mvo.setMS_DORO >>> : " + mvo.getMS_DORO());
				logger.info("DB에서 가지고온 이름 mvo.setMS_DORODETAIL >>> : " + mvo.getMS_DORODETAIL());
				logger.info("DB에서 가지고온 이름 mvo.setMS_INSDATE >>> : " + mvo.getMS_INSDATE());
				logger.info("DB에서 가지고온 이름 mvo.setMS_GRADE >>> : " + mvo.getMS_GRADE());
				logger.info("DB에서 가지고온 이름 mvo.setMS_CLASS >>> : " + mvo.getMS_CLASS());
				logger.info("DB에서 가지고온 이름 mvo.setMS_NUMBER >>> : " + mvo.getMS_NUMBER());
				
				model.addAttribute("data", mvo);
				
				return "mypage/myPageSelectStudent";
			}
				
		} else if (ms_id == null) {								// 교사인 경우
			logger.info("현재 로그인한 회원은 [교사] 입니다.");

			logger.info("SQL에 이용할 회원 아이디 mt_id >>> : " + lvo.getMT_ID());
			logger.info("SQL에 이용할 회원 번호 mt_num >>> : " + lvo.getMT_NUM());
			
			// 서비스로 데이터 조회 요청 보내기 >>> : 데이터 담는 리스트 초기화
			List<KosmosMypageVO> resultList = null;
			resultList = (List)kosmosMypageService.selectTeacherData(lvo);
			
			logger.info("DB에서 가져온 데이터 resultList.size() >>> : " + resultList.size());
			
			if(resultList.size() > 0) {
				
				KosmosMypageVO mvo = new KosmosMypageVO();
				
				mvo = resultList.get(0);
				
				String teacher_name = mvo.getMT_NAME();
				String teacher_id = mvo.getMT_ID();
				String teacher_cp = mvo.getMT_CP();
				String teacher_zipcode = mvo.getMT_ZIPCODE();
				String teacher_doro = mvo.getMT_DORO();
				String teacher_doro_detail = mvo.getMT_DORODETAIL();
				
				logger.info("DB에서 가지고온 이름 mvo.setMT_NAME >>> : " + mvo.getMT_NAME());
				logger.info("DB에서 가지고온 이름 mvo.setMT_ID >>> : " + mvo.getMT_ID());
				logger.info("DB에서 가지고온 이름 mvo.setMT_CP >>> : " + mvo.getMT_CP());
				logger.info("DB에서 가지고온 이름 mvo.setMT_ZIPCODE >>> : " + mvo.getMT_ZIPCODE());
				logger.info("DB에서 가지고온 이름 mvo.setMT_DORO >>> : " + mvo.getMT_DORO());
				logger.info("DB에서 가지고온 이름 mvo.setMT_DORODETAIL >>> : " + mvo.getMT_DORODETAIL());
			
				model.addAttribute("data", mvo);
				
				return "mypage/myPageSelectTeacher";
			}
		}
		return "";
	}		
	
	// ========================================================================
	// 학생이 마이페이지에서 회원정보수정 버튼을 누른 경우   >>> 정보 수정을 위한 팝업창 오픈 
	// ========================================================================

	@GetMapping("myPageUpdateStudent")
	public String myPageUpdateStudent(HttpSession hs, Model model) {
		logger.info("KosmosMypageController.myPageUpdateStudent() 진입 >>> : 학생 회원의 정보수정을 위해 팝업창을 불러옵니다.");
		
		// 세션에서 로그인 정보 받아오기
		KosmosLoginVO lvo = null;
		lvo = (KosmosLoginVO) hs.getAttribute("result");
				
		// 학생 데이터를 받은 경우 바인딩할 변수
		String ms_id = lvo.getMS_ID();
		String ms_num = lvo.getMS_NUM();
				
		// 교사 데이터를 받은 경우 바인딩할 변수
		String mt_id = lvo.getMT_ID();
		String mt_num = lvo.getMT_NUM();
				
		logger.info("\n=========== 세션에서 받아온 로그인 정보 ==========\n");
		logger.info("세션에서 가져온 ms_id >>> : " + ms_id);
		logger.info("세션에서 가져온 ms_num >>> : " + ms_num);
		logger.info("세션에서 가져온 mt_id >>> : " + mt_id);
		logger.info("세션에서 가져온 mt_num >>> : " + mt_num);
		logger.info("\n==========================================\n");
				
		// 분기 로직 : 학생 / 교사
		if (mt_id == null) {									// 학생인 경우
		logger.info("현재 로그인한 회원은 [학생] 입니다.");
					
		logger.info("SQL에 이용할 회원 아이디 ms_id >>> : " + lvo.getMS_ID());
		logger.info("SQL에 이용할 회원 번호 ms_num >>> : " + lvo.getMS_NUM());
					
		// 서비스로 데이터 조회 요청 보내기 >>> : 데이터 담는 리스트 초기화
		List<KosmosMypageVO> resultList = null;
		resultList = kosmosMypageService.selectStudentData(lvo);
					
		logger.info("DB에서 가져온 데이터 resultList.size() >>> : " + resultList.size());
					
			if(resultList.size() > 0) {
						
				KosmosMypageVO mvo = new KosmosMypageVO();
							
				mvo = resultList.get(0);
							
				String student_name = mvo.getMS_NAME();
				String student_id = mvo.getMS_ID();
				String student_cp = mvo.getMS_CP();
				String student_zipcode = mvo.getMS_ZIPCODE();
				String student_doro = mvo.getMS_DORO();
				String student_doro_detail = mvo.getMS_DORODETAIL();
				String student_ad_year = mvo.getMS_INSDATE();
				String student_grade = mvo.getMS_GRADE();
				String student_class = mvo.getMS_CLASS();
				String student_number = mvo.getMS_NUMBER();
							
				logger.info("DB에서 가지고온 이름 mvo.setMS_NAME >>> : " + mvo.getMS_NAME());
				logger.info("DB에서 가지고온 이름 mvo.setMS_ID >>> : " + mvo.getMS_ID());
				logger.info("DB에서 가지고온 이름 mvo.setMS_CP >>> : " + mvo.getMS_CP());
				logger.info("DB에서 가지고온 이름 mvo.setMS_ZIPCODE >>> : " + mvo.getMS_ZIPCODE());
				logger.info("DB에서 가지고온 이름 mvo.setMS_DORO >>> : " + mvo.getMS_DORO());
				logger.info("DB에서 가지고온 이름 mvo.setMS_DORODETAIL >>> : " + mvo.getMS_DORODETAIL());
				logger.info("DB에서 가지고온 이름 mvo.setMS_INSDATE >>> : " + mvo.getMS_INSDATE());
				logger.info("DB에서 가지고온 이름 mvo.setMS_GRADE >>> : " + mvo.getMS_GRADE());
				logger.info("DB에서 가지고온 이름 mvo.setMS_CLASS >>> : " + mvo.getMS_CLASS());
				logger.info("DB에서 가지고온 이름 mvo.setMS_NUMBER >>> : " + mvo.getMS_NUMBER());
				
				model.addAttribute("data", mvo);
			
			}
		}
		return "popUp/myPageUpdateStudent";

	}
	
	
	// ========================================================================
	// 학생이 팝업창에서 회원정보수정 버튼을 누른 경우   >>> DB에 업데이트 요청  >>> msg리턴
	// ========================================================================

	//@GetMapping("myPageUpdateRequestStudent")
	@RequestMapping(value="myPageUpdateRequestStudent", method=RequestMethod.POST, produces="application/text; charset=UTF-8")
	@ResponseBody
	public String myPageUpdateRequestStudent(HttpSession hs, KosmosMypageVO mvo) { 
		logger.info("KosmosMypageController.myPageUpdateRequestStudent()진입 >>> : DB에 회원 정보 업데이트를 요청합니다.");
		
		// 세션에서 로그인 정보 받아오기
		KosmosLoginVO lvo = null;
		lvo = (KosmosLoginVO) hs.getAttribute("result");
				
		// 리턴에 사용할 변수 초기화
		String msg = "";
		
		// 학생 데이터를 받은 경우 바인딩할 변수
		String ms_id = lvo.getMS_ID();
		String ms_num = lvo.getMS_NUM();
				
		// 교사 데이터를 받은 경우 바인딩할 변수
		String mt_id = lvo.getMT_ID();
		String mt_num = lvo.getMT_NUM();
				
		logger.info("\n=========== 세션에서 받아온 로그인 정보 ==========\n");
		logger.info("세션에서 가져온 ms_id >>> : " + ms_id);
		logger.info("세션에서 가져온 ms_num >>> : " + ms_num);
		logger.info("세션에서 가져온 mt_id >>> : " + mt_id);
		logger.info("세션에서 가져온 mt_num >>> : " + mt_num);
		logger.info("\n==========================================\n");
		
		// form 태그로부터 받은 데이터 체크하기
		String st_name = mvo.getStname();
		String st_mail = mvo.getStmail();
		String st_cp = mvo.getStcp();
		String me_zipcode = mvo.getMe_zipcode();
		String me_doro = mvo.getMe_doro();
		String me_dorodetail = mvo.getMe_dorodetail();
		String admissionyear = mvo.getAdmissionyear();
		String st_grade = mvo.getGrade();
		String st_class = mvo.getSt_class();
		String st_number = mvo.getNumber();
		
		logger.info("\n============== jsp에서 받은 데이터 출력 ============\n");
		logger.info("학생 이름 st_name >>> : " + st_name);
		logger.info("학생 아이디 st_mail >>> : " + st_mail);
		logger.info("학생 핸드폰번호 st_cp >>> : " + st_cp);
		logger.info("학생 우편번호 me_zipcode >>> : " + me_zipcode);
		logger.info("학생 도로명주소 st_doro >>> : " + me_doro);
		logger.info("학생 상세주소 st_dorodetail >>> : " + me_dorodetail);
		logger.info("학생 가입일 admissionyear >>> : " + admissionyear);
		logger.info("학생 학년 st_grade >>> : " + st_grade);
		logger.info("학생 반 st_class >>> : " + st_class);
		logger.info("학생 번호 st_number >>> : " + st_number);
		logger.info("\n=============================================\n");

		// 분기 로직 : 학생 / 교사
		if (mt_id == null) {									// 학생인 경우
		logger.info("현재 로그인한 회원은 [학생] 입니다.");
					
		logger.info("SQL에 이용할 회원 아이디 ms_id >>> : " + lvo.getMS_ID());
		logger.info("SQL에 이용할 회원 번호 ms_num >>> : " + lvo.getMS_NUM());
					
		// 서비스로 데이터 조회 요청 보내기 >>> : 데이터 담는 리스트 초기화
		List<KosmosMypageVO> resultList = null;
		resultList = kosmosMypageService.selectStudentData(lvo);
					
		logger.info("DB에서 가져온 데이터 resultList.size() >>> : " + resultList.size());
					
			if(resultList.size() > 0) {							// 학생인경우
						
				KosmosMypageVO _mvo = new KosmosMypageVO();
				
				// mvo에 데이터 세팅해서 업데이트 요청보내기
				_mvo.setMid(ms_id);					// 현재 로그인한 회원의 아이디
				_mvo.setMnum(ms_num);				// 현재 로그인한 회원의 회원번호
				
				_mvo.setMS_ID(st_mail);
				_mvo.setMS_NAME(st_name);
				_mvo.setMS_CP(st_cp);
				_mvo.setMS_ZIPCODE(me_zipcode);
				_mvo.setMS_DORO(me_doro);
				_mvo.setMS_DORODETAIL(me_dorodetail);
				_mvo.setMS_GRADE(st_grade);
				_mvo.setMS_CLASS(st_class);
				_mvo.setMS_NUMBER(st_number);
				
				int nCnt = kosmosMypageService.updateStudentInfo(_mvo);
			
				logger.info("업데이트 건 수 nCnt >>> : " + nCnt + "건");
				
				if (nCnt > 0) {
					msg = "success";
				} else {
					msg = "fail";
				}
				
			}
			
		}
		return msg;
	}


	// ========================================================================
	// 교사가 마이페이지에서 회원정보수정 버튼을 누른 경우   >>> 정보 수정을 위한 팝업창 오픈 
	// ========================================================================
	
	@GetMapping("myPageUpdateTeacher")
	public String myPageUpdateTeacher(HttpSession hs, Model model) {
		logger.info("KosmosMypageController.myPageUpdateTeacher() 진입 >>> : 교사 회원의 데이터를 조회해 불러옵니다.");
		
		// 세션에서 로그인 정보 받아오기
		KosmosLoginVO lvo = null;
		lvo = (KosmosLoginVO) hs.getAttribute("result");
				
		// 학생 데이터를 받은 경우 바인딩할 변수
		String ms_id = lvo.getMS_ID();
		String ms_num = lvo.getMS_NUM();
				
		// 교사 데이터를 받은 경우 바인딩할 변수
		String mt_id = lvo.getMT_ID();
		String mt_num = lvo.getMT_NUM();
				
		logger.info("\n=========== 세션에서 받아온 로그인 정보 ==========\n");
		logger.info("세션에서 가져온 ms_id >>> : " + ms_id);
		logger.info("세션에서 가져온 ms_num >>> : " + ms_num);
		logger.info("세션에서 가져온 mt_id >>> : " + mt_id);
		logger.info("세션에서 가져온 mt_num >>> : " + mt_num);
		logger.info("\n==========================================\n");
				
		// 분기 로직 : 학생 / 교사
		if (ms_id == null) {									// 학생인 경우
		logger.info("현재 로그인한 회원은 [교사] 입니다.");
					
		logger.info("SQL에 이용할 회원 아이디 mt_id >>> : " + lvo.getMT_ID());
		logger.info("SQL에 이용할 회원 번호 mt_num >>> : " + lvo.getMT_NUM());
					
		// 서비스로 데이터 조회 요청 보내기 >>> : 데이터 담는 리스트 초기화
		List<KosmosMypageVO> resultList = null;
		resultList = kosmosMypageService.selectTeacherData(lvo);
					
		logger.info("DB에서 가져온 데이터 resultList.size() >>> : " + resultList.size());
					
			if(resultList.size() > 0) {
						
				KosmosMypageVO mvo = new KosmosMypageVO();
							
				mvo = resultList.get(0);
							
				String teacher_name = mvo.getMT_NAME();
				String teacher_id = mvo.getMT_ID();
				String teacher_cp = mvo.getMT_CP();
				String teacher_zipcode = mvo.getMT_ZIPCODE();
				String teacher_doro = mvo.getMT_DORO();
				String teacher_doro_detail = mvo.getMT_DORODETAIL();

				logger.info("DB에서 가지고온 이름 mvo.setMT_NAME >>> : " + mvo.getMT_NAME());
				logger.info("DB에서 가지고온 이름 mvo.setMT_ID >>> : " + mvo.getMT_ID());
				logger.info("DB에서 가지고온 이름 mvo.setMT_CP >>> : " + mvo.getMT_CP());
				logger.info("DB에서 가지고온 이름 mvo.setMT_ZIPCODE >>> : " + mvo.getMT_ZIPCODE());
				logger.info("DB에서 가지고온 이름 mvo.setMT_DORO >>> : " + mvo.getMT_DORO());
				logger.info("DB에서 가지고온 이름 mvo.setMT_DORODETAIL >>> : " + mvo.getMT_DORODETAIL());
				
				model.addAttribute("data", mvo);
			
			}
		}
		
		return "popUp/myPageUpdateTeacher";
	}

	
	
	
	
	
	// ========================================================================
	// 교사가 팝업창에서 회원정보수정 버튼을 누른 경우   >>> DB에 업데이트 요청   >>>   msg리턴
	// ========================================================================
	
	//@GetMapping("myPageUpdateRequestTeacher")
	@RequestMapping(value="myPageUpdateRequestTeacher", method=RequestMethod.POST, produces="application/text; charset=UTF-8")
	@ResponseBody
	public String myPageUpdateRequestTeacher(HttpSession hs, KosmosMypageVO mvo) { 
		logger.info("KosmosMypageController.myPageUpdateRequestTeacher()진입 >>> : DB에 회원 정보 업데이트를 요청합니다.");
		
		// 세션에서 로그인 정보 받아오기
		KosmosLoginVO lvo = null;
		lvo = (KosmosLoginVO) hs.getAttribute("result");
				
		// 리턴에 사용할 변수 초기화
		String msg = "";
		
		// 학생 데이터를 받은 경우 바인딩할 변수
		String ms_id = lvo.getMS_ID();
		String ms_num = lvo.getMS_NUM();
				
		// 교사 데이터를 받은 경우 바인딩할 변수
		String mt_id = lvo.getMT_ID();
		String mt_num = lvo.getMT_NUM();
				
		logger.info("\n=========== 세션에서 받아온 로그인 정보 ==========\n");
		logger.info("세션에서 가져온 ms_id >>> : " + ms_id);
		logger.info("세션에서 가져온 ms_num >>> : " + ms_num);
		logger.info("세션에서 가져온 mt_id >>> : " + mt_id);
		logger.info("세션에서 가져온 mt_num >>> : " + mt_num);
		logger.info("\n==========================================\n");
		
		// form 태그로부터 받은 데이터 체크하기
		String te_name = mvo.getTename();
		String te_mail = mvo.getTemail();
		String te_cp = mvo.getTecp();
		String me_zipcode = mvo.getMe_zipcode();
		String me_doro = mvo.getMe_doro();
		String me_dorodetail = mvo.getMe_dorodetail();
		
		logger.info("\n============== jsp에서 받은 데이터 출력 ============\n");
		logger.info("교사 이름 te_name >>> : " + te_name);
		logger.info("교사 아이디 te_mail >>> : " + te_mail);
		logger.info("교사 핸드폰번호 te_cp >>> : " + te_cp);
		logger.info("교사 우편번호 me_zipcode >>> : " + me_zipcode);
		logger.info("교사 도로명주소 me_doro >>> : " + me_doro);
		logger.info("교사 상세주소 me_dorodetail >>> : " + me_dorodetail);
		logger.info("\n=============================================\n");

		// 분기 로직 : 학생 / 교사
		if (ms_id == null) {									// 교사인 경우
		logger.info("현재 로그인한 회원은 [교사] 입니다.");
					
		logger.info("SQL에 이용할 회원 아이디 mt_id >>> : " + lvo.getMT_ID());
		logger.info("SQL에 이용할 회원 번호 mt_num >>> : " + lvo.getMT_NUM());
					
		// 서비스로 데이터 조회 요청 보내기 >>> : 데이터 담는 리스트 초기화
		List<KosmosMypageVO> resultList = null;
		resultList = kosmosMypageService.selectTeacherData(lvo);
					
		logger.info("DB에서 가져온 데이터 resultList.size() >>> : " + resultList.size());
					
			if(resultList.size() > 0) {							// 교사인경우
						
				KosmosMypageVO _mvo = new KosmosMypageVO();
				
				// mvo에 데이터 세팅해서 업데이트 요청보내기
				_mvo.setMid(mt_id);					// 현재 로그인한 회원의 아이디
				_mvo.setMnum(mt_num);				// 현재 로그인한 회원의 회원번호
				
				_mvo.setMT_ID(te_mail);
				_mvo.setMT_NAME(te_name);
				_mvo.setMT_CP(te_cp);
				_mvo.setMT_ZIPCODE(me_zipcode);
				_mvo.setMT_DORO(me_doro);
				_mvo.setMT_DORODETAIL(me_dorodetail);
				
				int nCnt = kosmosMypageService.updateStudentInfo(_mvo);
			
				logger.info("업데이트 건 수 nCnt >>> : " + nCnt + "건");
				
				if (nCnt > 0) {
					msg = "success";
				} else {
					msg = "fail";
				}
				
			}
			
		}
		return msg;
	}
	
}
