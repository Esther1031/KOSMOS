package com.kosmos.subject.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kosmos.common.CommonUtils;
import com.kosmos.login.vo.KosmosLoginVO;
import com.kosmos.subject.service.KosmosSubjectService;
import com.kosmos.subject.vo.KosmosSubjectVO;

@Controller
public class KosmosSubjectController {
	private Logger logger = Logger.getLogger(KosmosSubjectController.class);
	private KosmosSubjectService kosmosSubjectService;
	
	// 생성자 오토와이어드
	@Autowired(required=false)
	public KosmosSubjectController(KosmosSubjectService kosmosSubjectService) {
		this.kosmosSubjectService = kosmosSubjectService;
	}
	
	@Autowired(required=false)
	public KosmosSubjectController() {
		// TODO Auto-generated constructor stub
	}

	@GetMapping("subjectInsertForm")
	public String subjectForm() {
		return "subject/subjectInsertForm";
	}
	
	@GetMapping("subjectSelectAll")
	public String subjectSelectAll(KosmosSubjectVO svo, Model model, HttpSession hs, KosmosLoginVO lvo){
		logger.info("SubjectController : subjectSelectAll() >>> : ");
		KosmosLoginVO lvo_data = (KosmosLoginVO)hs.getAttribute("result");
		
		String mt_id = lvo_data.getMt_id();
		String ms_id = lvo_data.getMs_id();
		logger.info("mt_id >>> : " + lvo_data.getMt_id());
		logger.info("ms_id >>> : " + lvo_data.getMs_id());
		
		List<KosmosSubjectVO> listSA = kosmosSubjectService.subjectSelectAll(svo);
		logger.info("subjectSelectAll() 다녀온 후 >>> : ");
		KosmosSubjectVO.subjectKeyPrintVO(svo);
		logger.info("SubjectController : subjectSelectAll() listSA.size() >>> : " + listSA.size());
		if (mt_id != null || ms_id != null) {
			if (listSA != null && listSA.size() > 0) {
				model.addAttribute("listSA", listSA);
				return "subject/subjectSelectAll";
			}
		}
		return "subject/subjectSelectAll";
	}
	
	@GetMapping("subjectSelect")
	public String subjectSelect(KosmosSubjectVO svo, Model model) {
		logger.info("SubjectController : subjectSelect() >>> : ");
		
		logger.info("subjectSelect() : svo.getSb_num() >>> : " + svo.getSb_num());
		List<KosmosSubjectVO> listS = kosmosSubjectService.subjectSelect(svo);
		logger.info("subjectSelect() : svo.getSb_num() >>> : " + listS.size());
		if (listS.size() == 1) {
			model.addAttribute("listS", listS);
			return "subject/subjectSelect";
		}
		return "subject/subjectSelectAll";
	}
			
	@GetMapping("subjectInsert")
	public String subjectInsert(HttpServletRequest req, KosmosSubjectVO svo, Model model) {
		logger.info("KosmosSubjectController : subjectInsert() >>> : ");
		
		String sb_group = req.getParameter("sb_group");
		String sb_code = req.getParameter("sb_code");
		String sb_type = req.getParameter("sb_type");
		String sb_name = req.getParameter("sb_name");
		
		String sb_creditunit = req.getParameter("sb_creditunit");
		String sb_grade = req.getParameter("sb_grade");
		String sb_year = req.getParameter("sb_year");
		String sb_semester = req.getParameter("sb_semester");
		String sb_teacher = req.getParameter("sb_teacher");
		
		String sb_maxstu = req.getParameter("sb_maxstu");
		String sb_day = req.getParameter("sb_day");
		String sb_time = req.getParameter("sb_time");
		String sb_beforeyn = req.getParameter("sb_beforeyn");
		String sb_beforename = req.getParameter("sb_beforename");
		
		svo.setSb_group(sb_group);
		svo.setSb_code(sb_code);
		svo.setSb_type(sb_type);
		svo.setSb_name(sb_name);
		
		svo.setSb_creditunit(sb_creditunit);
		svo.setSb_grade(sb_grade);
		svo.setSb_year(sb_year);
		svo.setSb_semester(sb_semester);
		svo.setSb_teacher(sb_teacher);
		
		svo.setSb_maxstu(sb_maxstu);
		svo.setSb_day(sb_day);
		svo.setSb_time(sb_time);
		svo.setSb_beforeyn(sb_beforeyn);
		svo.setSb_beforename(sb_beforename);
		
		/*	채번으로 sb_num(과목번호) 구하기
			과목번호 채번 자료규칙 : SB + 학년(0)+교과군번호(00)+과목코드(000)+순번(001)
			학년, 교과군번호, 과목코드 subjectInsertForm.jsp 에서 입력받기			*/
		String sb_num = kosmosSubjectService.subjectChabun(svo).getSb_num();					
		logger.info("채번 추가한 sb_num >>> : " + sb_num);
		svo.setSb_num(sb_num);
		KosmosSubjectVO.subjectPrintVO(svo);
		
		int nCntI = kosmosSubjectService.subjectInsert(svo);
		logger.info("KosmosSubjectController : subjectInsert() svo >>> : " + svo);
		logger.info("KosmosSubjectController : subjectInsert() nCntI >>> : " + nCntI);
		if (nCntI > 0) {
			logger.info("KosmosSubjectController : subjectInsert() 과목 등록 완료 >>> : ");
			model.addAttribute("nCntI", svo);
			return "subject/subjectPass";
		}
		return "subject/subjectCheckFail";		// 일단은 나중에 subjectSelectAll 페이지로 이동
	}
	
	@GetMapping("subjectUpdateForm")
	public String subjectUpdateForm(KosmosSubjectVO svo, Model model) {
		logger.info("KosmosSubjectController : subjectUpdateForm() >>> : ");
		logger.info("subjectUpdateForm() : svo.getSb_num() >>> : " + svo.getSb_num());
		List<KosmosSubjectVO> listUF = kosmosSubjectService.subjectSelect(svo);
		if(listUF.size() > 0) {
			model.addAttribute("listUF", listUF);
			return "subject/subjectUpdateForm";
		}
		return "subject/subjectUpdateForm";
	}
	
	@GetMapping("subjectUpdate")
	public String subjectUpdate(KosmosSubjectVO svo) {
		logger.info("KosmosSubjectController : subjectUpdate() >>> : ");
		
		KosmosSubjectVO.subjectPrintVO(svo);
		int nCntU = kosmosSubjectService.subjectUpdate(svo);
		logger.info("KosmosSubjectController : subjectUpdate() nCntU >>> : " + nCntU);
		if (nCntU > 0) {
			return "subject/subjectPass";
		}
		return "subject/subjectCheckFail";
	}
	
	@GetMapping("subjectDelete")
	public String subjectDelete(KosmosSubjectVO svo) {
		logger.info("KosmosSubjectController : subjectDelete() >>> : ");
		logger.info("KosmosSubjectController : subjectDelete() svo >>> : " + svo);
				
		int nCntD = kosmosSubjectService.subjectDelete(svo);
		logger.info("KosmosSubjectController : subjectDelete() nCntD >>> : " + nCntD);
		if (nCntD > 0) {
			return "subject/subjectDelete";
		}
		return "subject/subjectCheckFail";
	}
	
	
}
