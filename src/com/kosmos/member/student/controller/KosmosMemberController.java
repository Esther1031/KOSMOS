package com.kosmos.member.student.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kosmos.common.ChabunUtil;
import com.kosmos.common.CommonUtils;
import com.kosmos.common.FileUploadUtil;
import com.kosmos.common.service.ChabunService;
import com.kosmos.member.student.service.KosmosMemberService;
import com.kosmos.member.student.vo.KosmosMemberVO;

@Controller
public class KosmosMemberController {
	Logger logger = Logger.getLogger(KosmosMemberController.class);
	
	private KosmosMemberService kosmosMemberService;
	private ChabunService chabunService;
	
	// 생성자 오토와이어드 
	@Autowired(required=false)	
	public KosmosMemberController( KosmosMemberService kosmosMemberService
			               		 ,ChabunService chabunService) {
		this.kosmosMemberService = kosmosMemberService;
		this.chabunService = chabunService;
	}	
	
	// 회원가입 입력  폼
	@RequestMapping(value="memForm", method=RequestMethod.GET)
	//@GetMapping("memForm")
	public String memForm() {	
		logger.info("KosmosMemberController memForm() 함수 진입 >>> : ");
		return "member/kosmosMemFormStudent";
	}
	
	// 회원가입 
	@RequestMapping(value="memInsert", method=RequestMethod.POST)
	//@PostMapping("memInsert")
	public String memInsert(HttpServletRequest req) {
		logger.info("KosmosMemberController memInsert() 함수 진입 >>> : ");
		
		// 채번 구하기
		String ms_num = ChabunUtil.getMemChabun("D", chabunService.getMemChabun().getMs_num());
		logger.info("KosmosMemberController memInsert ms_num >>> : " + ms_num);
		
		// 이미지 업로드 
		FileUploadUtil fu = new FileUploadUtil(	 CommonUtils.MEMBER_IMG_UPLOAD_PATH
									           	,CommonUtils.MEMBER_IMG_FILE_SIZE
									           	,CommonUtils.MEMBER_EN_CODE);
		
		// 이미지 파일 원본 사이즈 
		// boolean bool = fu.imgfileUpload(req);
		// 이미지 파일 원본 사이즈 크기 조절 하기 
		boolean bool = fu.imgfileUploadSize(req);
		logger.info("KosmosMemberController memInsert bool >>> : " + bool);
		
		// 채번, 이미지 업로드 성공하면 VO 세팅하기 
		KosmosMemberVO mvo = null;
		mvo = new KosmosMemberVO();
		
		// 회원번호
		mvo.setMs_num(ms_num);
		// 회원이름
		mvo.setMs_name(fu.getParameter("ms_name"));
		// 이메일(아이디)
		// 아이디
		mvo.setMs_id(fu.getParameter("ms_id"));
		// 패스워드
		mvo.setMs_pw(fu.getParameter("ms_pw"));
		// 성별
		mvo.setMs_gen(fu.getParameter("ms_gen"));
		// 생년월일
		mvo.setMs_birth(fu.getParameter("ms_birth"));	
		// 핸드폰
		mvo.setMs_cp(fu.getParameter("ms_cp"));
		// 주소 : 우편번호
		mvo.setMs_zipcode(fu.getParameter("ms_zipcode"));	
		// 주소 : 도로명 주소
		String ms_doro = fu.getParameter("ms_doro");
		String ms_dorodetail = fu.getParameter("ms_dorodetail");						
		ms_doro = ms_doro.concat("@").concat(ms_dorodetail);
		mvo.setMs_doro(ms_doro);
		//학년
		mvo.setMs_semester(fu.getParameter("ms_semester"));
		//반
		mvo.setMs_class(fu.getParameter("ms_class"));
		//번호
		mvo.setMs_number(fu.getParameter("ms_number"));
		// 학번
		mvo.setMs_grade(fu.getParameter("ms_grade"));
		// 반
		mvo.setMs_class(fu.getParameter("ms_class"));
		// 입학년도
		mvo.setMs_admyear(fu.getParameter("ms_admyear"));
		// 학생학기
		mvo.setMs_joinyn(fu.getParameter("ms_joinyn"));

		// 사진
		ArrayList<String> aFileName = fu.getFileNames();
		String ms_photo = aFileName.get(0);				
		mvo.setMs_photo(ms_photo);		

		int nCnt = kosmosMemberService.memberInsert(mvo);
			
		if (nCnt > 0) { return "login/loginForm";}
		return "login/loginForm";
	}
	
	// 아이디 중복 체크하기
	@RequestMapping(value="memIdCheck", method=RequestMethod.POST)
	@ResponseBody
	public Object memIdCheck(KosmosMemberVO mvo) {
		logger.info("KosmosMemberController memIdCheck 함수 진입  >>> :");		
		logger.info("KosmosMemberController memIdCheck mvo.getms_id() >>> : " + mvo.getMs_id());			
		

		List<KosmosMemberVO> list = kosmosMemberService.memberIdCheck(mvo);			
		logger.info("KosmosMemberController memIdCheck list.size() >>> : " + list.size());
		
		String msg = "";		
		if (list.size() == 0) {msg = "ID_YES";}  
		else { msg = "ID_NO";}  
		
		return msg;		
	}
}
