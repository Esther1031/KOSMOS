package com.kosmos.member.teacher.controller;

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
import com.kosmos.member.teacher.controller.KosmosTeacherController;
import com.kosmos.member.teacher.service.KosmosTeacherService;
import com.kosmos.member.teacher.vo.KosmosTeacherVO;
@Controller
public class KosmosTeacherController {

	Logger logger = Logger.getLogger(KosmosTeacherController.class);
	
	private KosmosTeacherService KosmosTeacherService;
	private ChabunService chabunService;
	
	// 생성자 오토와이어드 
	@Autowired(required=false)	
	public KosmosTeacherController( KosmosTeacherService KosmosTeacherService
			               		 ,ChabunService chabunService) {
		this.KosmosTeacherService = KosmosTeacherService;
		this.chabunService = chabunService;
	}	
	
	// 회원가입 입력  폼
	@RequestMapping(value="teacherForm", method=RequestMethod.GET)
	//@GetMapping("/teacherForm")
	public String teacherForm() {	
		logger.info("KosmosTeacherController teacherForm() 함수 진입 >>> : ");
		return "member/kosmosMemFormTeacher";
	}

	// 회원가입 
	@RequestMapping(value="teacherInsert", method=RequestMethod.POST)
	//@PostMapping("/teacherInsert")
	public String teacherInsert(HttpServletRequest req) {
		logger.info("KosmosTeacherController teacherInsert() 함수 진입 >>> : ");
		
		// 채번 구하기
		String mt_num = ChabunUtil.getTeacherChabun("D", chabunService.getTeacherChabun().getMt_num());
		logger.info("KosmosTeacherController teacherInsert mt_num >>> : " + mt_num);
		
		// 이미지 업로드 
		FileUploadUtil fu = new FileUploadUtil(	 CommonUtils.TEACHER_IMG_UPLOAD_PATH
									           	,CommonUtils.TEACHER_IMG_FILE_SIZE
									           	,CommonUtils.TEACHER_EN_CODE);
		
		// 이미지 파일 원본 사이즈 
		// boolean bool = fu.imgfileUpload(req);
		// 이미지 파일 원본 사이즈 크기 조절 하기 
		boolean bool = fu.imgfileUploadSize(req);
		logger.info("KosmosTeacherController teacherInsert bool >>> : " + bool);
		
		// 채번, 이미지 업로드 성공하면 VO 세팅하기 
		KosmosTeacherVO mvo = null;
		mvo = new KosmosTeacherVO();
		
		// 회원번호
		mvo.setMt_num(mt_num);
		// 회원이름
		mvo.setMt_name(fu.getParameter("mt_name"));
		// 이메일(아이디)
		mvo.setMt_id(fu.getParameter("mt_id"));
		// 패스워드
		mvo.setMt_pw(fu.getParameter("mt_pw"));
		// 성별
		mvo.setMt_gen(fu.getParameter("mt_gen"));
		// 생년월일
		mvo.setMt_birth(fu.getParameter("mt_birth"));	
		// 핸드폰
		mvo.setMt_cp(fu.getParameter("mt_cp"));
		// 주소 : 우편번호
		mvo.setMt_zipcode(fu.getParameter("mt_zipcode"));	
		// 주소 : 도로명 주소						
		String mt_doro = fu.getParameter("mt_doro");
		String mt_dorodetail = fu.getParameter("mt_dorodetail");						
		mt_doro = mt_doro.concat("@").concat(mt_dorodetail);
		mvo.setMt_doro(mt_doro);
		// 사진
		ArrayList<String> aFileName = fu.getFileNames();
		String mt_photo = aFileName.get(0);				
		mvo.setMt_photo(mt_photo);
		
		int nCnt = KosmosTeacherService.teacherInsert(mvo);
			
		if (nCnt > 0) { return "login/loginForm";}
		return "login/loginForm";
	}
	
	// 아이디 중복 체크하기
	@RequestMapping(value="teacherIdCheck", method=RequestMethod.POST)
	@ResponseBody
	public Object teacherIdCheck(KosmosTeacherVO mvo) {
		logger.info("KosmosTeacherController teacherIdCheck 함수 진입  >>> :");		
		logger.info("KosmosTeacherController teacherIdCheck mvo.getmt_id() >>> : " + mvo.getMt_id());			
		
		List<KosmosTeacherVO> list = KosmosTeacherService.teacherIdCheck(mvo);			
		logger.info("KosmosTeacherController teacherIdCheck list.size() >>> : " + list.size());
		
		String msg = "";		
		if (list.size() == 0) {msg = "ID_YES";}  
		else { msg = "ID_NO";}  
		
		return msg;		
	}
}
