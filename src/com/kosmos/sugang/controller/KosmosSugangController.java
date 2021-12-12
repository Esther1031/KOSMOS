package com.kosmos.sugang.controller;

import java.util.ArrayList;
import java.util.HashMap;
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
import com.kosmos.login.vo.KosmosLoginVO;
import com.kosmos.school.service.KosmosSchoolService;
import com.kosmos.school.vo.KosmosSchoolVO;
import com.kosmos.sugang.service.KosmosSugangService;
import com.kosmos.sugang.vo.KosmosSugangListVO;
import com.kosmos.sugang.vo.KosmosSugangSubjectVO;

@Controller
public class KosmosSugangController {

    /* 선언부  */
    KosmosLoginVO lvo = new KosmosLoginVO();
    String user = lvo.getMname();


    Logger logger = Logger.getLogger(KosmosSugangController.class);
    private KosmosSugangService kosmosSugangService;

    @Autowired(required = false)
    public KosmosSugangController(KosmosSugangService kosmosSugangService) {
        this.kosmosSugangService = kosmosSugangService;
    }

    /* testing 용 컨트롤러  */
    @GetMapping(value = "testing")
    public String testing(Model model, HttpServletRequest req) {

        logger.info("sb_groupNum : " + req.getParameter("sb_groupNum"));
        String sb_groupNum = req.getParameter("sb_groupNum");
        model.addAttribute("sb_groupNum", sb_groupNum);
        return "sugang/error";
    }
    
 
    /* 다음페이지용 */
    @GetMapping("nextPage")
    public String indexPage(KosmosSugangListVO vo, Model model, HttpServletRequest req, HttpSession hs) {
    	List<KosmosSugangListVO> listAll = kosmosSugangService.sugangSelectAll(vo);
    	KosmosLoginVO lvo_data = (KosmosLoginVO) hs.getAttribute("result");
    	logger.info("-----[NextPage]");
    	logger.info("lvo_data : " + lvo_data);
    	int count = 0;
    	for(int i=0; i < listAll.size(); i++) {
	        vo.setSb_group(listAll.get(i).getSb_group());
	        vo.setSb_name(listAll.get(i).getSb_name());
	        vo.setSb_grade(listAll.get(i).getSb_grade());
	        vo.setSb_creditunit(listAll.get(i).getSb_creditunit());
	        vo.setSb_day(listAll.get(i).getSb_day());
	        vo.setSb_timetable(listAll.get(i).getSb_timetable());
	        vo.setSb_beforeyn(listAll.get(i).getSb_beforeyn());
	        vo.setSb_beforename(listAll.get(i).getSb_beforename());
	        vo.setSb_maxstu(listAll.get(i).getSb_maxstu());
	        vo.setMs_num(lvo_data.getMs_num());
	        
	        logger.info("[for] > vo.ms_num 		: (" + i + ")" + vo.getMs_num());
	        logger.info("[for] > vo.sb_group 		: (" + i + ")" + vo.getSb_group());
	        logger.info("[for] > vo.sb_name 		: (" + i + ")" + vo.getSb_name());
	        logger.info("[for] > vo.sb_creditunit		: (" + i + ")" + vo.getSb_creditunit());
	        logger.info("[for] > vo.sb_day			: (" + i + ")" + vo.getSb_day());
	        logger.info("[for] > vo.sb_timetable 		: (" + i + ")" + vo.getSb_timetable());
	
	        count = kosmosSugangService.sugangOldListInsert(vo);
	        logger.info("[for] > Insert 수 			: " + count);
	        logger.info("[for] > listAll.size() 	: " + listAll.size());	        
    	}
    	model.addAttribute("listAll", listAll);
    	hs.setAttribute("timeTableList", listAll);
    	
    	return "school/sugangtime";
    }
    
    /* 최종 수강신청한 내역 확인 (Delyn으로 체크)  */

	@GetMapping(value = "sugangListAll")
    public String sugangSelectAll(HttpSession hs, KosmosSugangListVO vo, Model model, HttpServletRequest req) {
    	logger.info("-----[최종 수강신청 확인시]");
    	KosmosLoginVO lvo_data = (KosmosLoginVO) hs.getAttribute("result");
        user = lvo_data.getMs_num();
        logger.info("-----[lvo_data.getMs_num()] : "+lvo_data.getMs_num());
        model.addAttribute("user", user);
        logger.info("-----[user] : "+user);
    	
    	String name = req.getParameter("name");
    	req.getParameter("name");
    	model.addAttribute("name", name);

    	List<KosmosSugangListVO> listAll = kosmosSugangService.sugangSelectAll(vo); 
    	model.addAttribute("listAll", listAll);
 
        return "sugang/sg_result";
    }

    /* 업데이트용  */
    @GetMapping("update")
    public String update(HashMap<String, String> map, Model model, HttpServletRequest req) {
        logger.info("-----[update] ");
        model.addAttribute("user", user);
        String name = req.getParameter("name");
        logger.info("name : " + name);
        model.addAttribute("name", name);
   
        kosmosSugangService.sugangListUpdateList(map);

        int count = kosmosSugangService.sugangListUpdateOne(map);

        String code = req.getParameter("code");
        model.addAttribute("code", code);

        List<KosmosSugangListVO> groupList = kosmosSugangService.sugangListSelectGroup(map);
        model.addAttribute("groupList", groupList);

        String groupRowNum = String.valueOf(groupList.size());
        logger.info("groupRowNum : " + groupRowNum);
        model.addAttribute("groupRowNum", groupRowNum);
        model.addAttribute("selectedName", name);
        
        return "sugang/group_page";
    }


    /*  프론트에서 교과목(변수) 선택하면 디비에서 검색해서 
         교과목(변수)에 따른 하위 과목 리스트 돌려주는 컨트롤러 		*/
    @GetMapping("subjectGroup")
    public String subject_group(HttpSession hs, HashMap<String, String> map, Model model, HttpServletRequest req) {
    	hs.getAttribute("result");
    	user = lvo.getMs_num();
    	
    	logger.info("-----[교과목 선택함] ");
        model.addAttribute("user", user);

        String code = req.getParameter("code");
        logger.info("[교과목] code : " + code);
        model.addAttribute("code", code);

        List<KosmosSugangListVO> groupList = kosmosSugangService.sugangListSelectGroup(map);
        logger.info("groupList : " + groupList);
        model.addAttribute("groupList", groupList);

        String groupRowNum = String.valueOf(groupList.size());
        logger.info("[교과목 내 하위 과목수] groupRowNum : " + groupRowNum);
        model.addAttribute("groupRowNum", groupRowNum);

        return "sugang/group_page";
    }

    List<KosmosSugangListVO> sugangList = null;

    /* 과목정보 불러와서 학생 회원에 따른 수강리스트를 출력   */
    @RequestMapping(value = "registration", method = RequestMethod.GET)
    //@GetMapping("registration")
    public String Select(KosmosSugangSubjectVO svo, Model model, HttpServletRequest req, HttpSession hs) {
        logger.info("-----[수강가능한 리스트 뽑기 시작] ");

        /* 세션에서 로그인 넘버 가져오기 */
        KosmosLoginVO lvo_data = (KosmosLoginVO) hs.getAttribute("result");
        user = lvo_data.getMs_num();
        logger.info("-----[lvo_data.getMs_num()] : "+lvo_data.getMs_num());
        logger.info("-----[user] : "+user);
        model.addAttribute("user", user);
        
        /* 필요한 VO 및 리스트 선언 */
        KosmosSugangListVO vo = new KosmosSugangListVO();
        List<KosmosSugangSubjectVO> afterList1 = new ArrayList<KosmosSugangSubjectVO>();
        List<KosmosSugangSubjectVO> afterList2 = new ArrayList<KosmosSugangSubjectVO>();
        /* 과목 리스트 전체 조회해서 VO 저장 (겹치는 부분) */
        List<KosmosSugangSubjectVO> listAll = kosmosSugangService.subjectSelectAll(svo);
        
        /* 들은 과목들 문자열로 저장된 값 (선수과목 테이블에서 받아와야함) */
        List<KosmosSugangListVO> oldListAll = null;
        String subjectBefore = "";
        //req.getParameter("subjectBefore");
        logger.info("subjectBefore >>>" + subjectBefore);
        
        if (oldListAll==null) {
        	oldListAll = kosmosSugangService.sugangOldlistSelectAll(vo);
        	for (int o =0; o < oldListAll.size(); o++) {
        		subjectBefore += oldListAll.get(o).getSb_name();
        	}
        }


        /* [1차 정제] eg. 1학년 > 1학년 과목들만 */
        for (int i = 0; i < listAll.size(); i++) {
            logger.info("[for] > [조건 : listAll.size] : (" + i + ")" + listAll.size());

            int year = Integer.parseInt(listAll.get(i).getSb_grade());
            int selectedYear = 2;

            if (year == selectedYear) {
                logger.info("[if] > [조건 : year==selectedYear] : " + selectedYear);
                model.addAttribute("Selectedyear", selectedYear);

                /* [2차 정제] eg. 1학년 전체-과거에 들은 선수과목 빼기 */
                if (!(subjectBefore.contains(listAll.get(i).getSb_name()))) {
                    logger.info("[if] > 안들은 과목						: " + listAll.get(i).getSb_name());
                    afterList1.add(listAll.get(i));
                }
                else if ((subjectBefore.contains(listAll.get(i).getSb_name()))){
                	ArrayList<String> subjectBeforeList = new ArrayList<>();
                	subjectBeforeList.add(listAll.get(i).getSb_name());
                	//logger.info("[else if] >  : " + listAll.get(i).getSb_name());
                	model.addAttribute("subjectBeforeList", subjectBeforeList);
                }
            }
        }
		
		/*  전에 들은 과목이 없을 경우 국어1, 국어2 다나오는데..
			선수과목이거나 (sprevYN이 N eg. 국어1, 국어2에서 국어1이거나) 
			선수과목을 들었을 때 과목만 나오게함 (국어1을 들었을 때 국어2 나오게)	*/
        for (int i = 0; i < afterList1.size(); i++) {
            logger.info("[for] > [조건 : afterList1.size] : (" + i + ")" + afterList1.size());
            if (afterList1.get(i).getSb_beforeyn().equals("N") ||
                    subjectBefore.contains(afterList1.get(i).getSb_beforename())) {
                logger.info("[for] > [if] > 선택된 과목			: " + afterList1.get(i).getSb_name());
                logger.info("getSb_beforeyn() 				: " + afterList1.get(i).getSb_beforeyn());
                logger.info("[for] > [if] > 겹치는 과목			: " + afterList1.get(i).getSb_beforename());
                afterList2.add(afterList1.get(i));
            }
        }
        if (sugangList==null) {
        	sugangList = new ArrayList<>(); 
	        for (int i = 0; i < afterList2.size(); i++) {
	            logger.info("[for] > [조건 : afterList2.size]	: (" + i + ")" + afterList2.size());
	            int count = 0;
	            // 과목 값 수강리스트 vo에 설정
	            vo.setSb_group(afterList2.get(i).getSb_group());
	            vo.setSb_name(afterList2.get(i).getSb_name());
	            vo.setSb_grade(afterList2.get(i).getSb_grade());
	            vo.setSb_creditunit(afterList2.get(i).getSb_creditunit());
	            vo.setSb_day(afterList2.get(i).getSb_day());
	            vo.setSb_timetable(afterList2.get(i).getSb_timetable());
	            vo.setSb_beforeyn(afterList2.get(i).getSb_beforeyn());
	            vo.setSb_beforename(afterList2.get(i).getSb_beforename());	            
	            vo.setSb_maxstu(afterList2.get(i).getSb_maxstu());
		        vo.setMs_num(lvo_data.getMs_num());
	
	            // 수강리스트테이블 저장 (DB) 
		        logger.info("[for] > vo.ms_num 		: (" + i + ")" + vo.getMs_num());
	            logger.info("[for] > vo.sb_group 		: (" + i + ")" + vo.getSb_group());
	            logger.info("[for] > vo.sb_name 		: (" + i + ")" + vo.getSb_name());
	            logger.info("[for] > vo.sb_creditunit		: (" + i + ")" + vo.getSb_creditunit());
	            logger.info("[for] > vo.sb_day			: (" + i + ")" + vo.getSb_day());
	            logger.info("[for] > vo.sb_timetable 		: (" + i + ")" + vo.getSb_timetable());

	            count = kosmosSugangService.sugangListInsert(vo);
	            logger.info("[for] > Insert 수 			: " + count);
	            logger.info("[for] > afterList2.size() 	: " + afterList2.size());
	        }
        // 완성된 그룹
        sugangList = kosmosSugangService.sugangListSelect(vo);
        logger.info("-----[sugangList에 옮기기 완료] 		: " + sugangList.size());
        }
        logger.info("-----[sugangList에 새로 안돎] 		: " + sugangList.size());

        model.addAttribute("sugangList", sugangList);

        return "sugang/sg_index";
       
    }
    
}


		