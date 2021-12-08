package com.kosmos.notice.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.kosmos.notice.service.KosmosNoticeService;
import com.kosmos.notice.vo.KosmosNoticeVO;
import com.kosmos.common.CommonUtils;
import com.kosmos.common.FileUploadUtil;
import com.kosmos.login.vo.KosmosLoginVO;


@Controller
public class KosmosNoticeController {

	Logger logger = Logger.getLogger(KosmosNoticeController.class);
	
	@Autowired(required=false)
	private KosmosNoticeService kosmosNoticeService;
	
	
	public KosmosNoticeController(KosmosNoticeService kosmosNoticeService) {
		this.kosmosNoticeService = kosmosNoticeService;
	}
	
	// ==================================================================== /
	// �������� �۾��� �� ��� 
	// ==================================================================== /	
	@GetMapping("noticeForm")
	public String noticeForm(KosmosNoticeVO nvo) {
		logger.info("noticeForm() ȣ��");
		return "notice/noticeForm";
	}



	// ==================================================================== /
	// �������� �۾���
	// ==================================================================== /
	@PostMapping("noticeInsert")
	public String noticeInsert(HttpSession hs, HttpServletRequest req) throws IOException {

		logger.info("noticeInsert() ȣ��");
 
		KosmosNoticeVO nvo = null; 
		nvo = new KosmosNoticeVO();

		// noticeList()���� �ٽ� ������ ������ ���� �̸�
		String mt_num = (String)hs.getAttribute("userName");
		logger.info("�α���-> Ȩ-> �������� ��� -> �۾��� -> �ۼ��� �̸� : " + mt_num);

		// vo�� ���ǿ��� ���� ������ �缳��.
		nvo.setMt_num(mt_num);
		logger.info("�ۼ� ������ �ִ� ���� ȸ���� �̸��� -> " + nvo.getMt_num());
		
		// ���Ͼ��ε���ƿ �ν��Ͻ�
		FileUploadUtil fu = new FileUploadUtil(CommonUtils.NOTICE_IMG_UPLOAD_PATH,
											   CommonUtils.NOTICE_IMG_FILE_SIZE,
											   CommonUtils.NOTICE_EN_CODE);
		
		boolean bool = fu.imgfileUploadSize(req);
		logger.info(bool);

		String no_subject = fu.getParameter("no_subject");
		String no_contents = fu.getParameter("no_contents");
		String no_file = fu.getFileName("no_file");
		String mt_id = fu.getParameter("mt_id");
		
		logger.info("���� is >>> : " + no_subject);
		logger.info("������ : " + no_contents);
		
		nvo.setMt_num(mt_num);							// �ۼ���
		nvo.setNo_subject(no_subject);					// ����
		nvo.setNo_contents(no_contents);				// ����
		nvo.setNo_file(no_file);						// ����
		nvo.setMt_id(mt_id);							// ���� ���̵�
		
		// noticeInsert() gogo : ������ ���������� ����.
		int nCnt = kosmosNoticeService.noticeInsert(nvo);
		logger.info("�Է� �Ϸ� >>>> : " + nCnt);
		
		if (nCnt > 0) {
		
			return "notice/noticeInsert";
		}
			

		return "notice/noticeForm"; // ?
	}
	
	
	// ==================================================================== /
	// �������� ��� ��ȸ
	// ==================================================================== /
	@GetMapping("noticeList")
	public String noticeList(HttpSession hs, Model model, KosmosNoticeVO nvo) {
		logger.info("noticeList() ȣ��");
		
		// ���ǿ� "result"�� ����� �����͵�(ȸ����ȣ, ȸ�����̵�, ȸ�� ��й�ȣ) lvo�� ��Ƶα�
		KosmosLoginVO lvo = (KosmosLoginVO) hs.getAttribute("result");
		
		// �л� ȸ�� �α���
		String ms_id = lvo.getMs_id();
		String ms_pw = lvo.getMs_pw();
		logger.info("�α����� �л� ���̵� >>> : " + ms_id);
		logger.info("�α����� �л� ��й�ȣ >>> : " + ms_pw);
		
		// ���� ȸ�� �α���
		String mt_id = lvo.getMt_id();
		String mt_pw = lvo.getMt_pw();
		logger.info("�α����� ���� ���̵� >>> : " + mt_id);
		logger.info("�α����� ���� ��й�ȣ >>> : " + mt_pw);

		String searchType = nvo.getSearchType();
		String keyword = nvo.getKeyword();
		logger.info("�˻� �ɼ��� �հ���? : " + searchType);
		logger.info("�˻���� �հ���?? : " + keyword);
		nvo.setSearchType(searchType);
		nvo.setKeyword(keyword);

		// ����¡ ���� ����
		int pageSize = CommonUtils.NOTICE_PAGE_SIZE;
		int groupSize = CommonUtils.NOTICE_GROUP_SIZE;
		int curPage = CommonUtils.BOARD_CUR_PAGE;
		int totalCount = CommonUtils.BOARD_TOTAL_COUNT;
		
		if(nvo.getCurPage() != null) {
			curPage = Integer.parseInt(nvo.getCurPage());
			logger.info("curPage >>> : " + curPage);
		}
		
		nvo.setPageSize(String.valueOf(pageSize));
		nvo.setGroupSize(String.valueOf(groupSize));
		nvo.setCurPage(String.valueOf(curPage));
		nvo.setTotalCount(String.valueOf(totalCount));
		
		logger.info("KosmosBoardController boardSelectAll bvo.getPageSize() >>> : " 
					+ nvo.getPageSize());
		logger.info("KosmosBoardController boardSelectAll bvo.getGroupSize() >>> : " 
					+ nvo.getGroupSize());
		logger.info("KosmosBoardController boardSelectAll bvo.getCurPage() >>> : " 
					+ nvo.getCurPage());
		logger.info("KosmosBoardController boardSelectAll bvo.getTotalCount() >>> : " 
					+ nvo.getTotalCount());

		
		if(keyword != null) {						// ======= �˻�� ���� ��� ======= //
			if(mt_id != null) {						// ���� �α���
				
				logger.info("nvo.getSearchType() : " + nvo.getSearchType());
				logger.info("keyword ");
				// lvo(ȸ�� ���̵�� ȸ�� ��й�ȣ��)�� ȸ�� �̸� ������
				List<KosmosNoticeVO> listTea = kosmosNoticeService.checkTeacher(lvo);
				nvo = listTea.get(0);
				String teacherName = nvo.getMt_name();
				String teacherId = nvo.getMt_id();
				logger.info("show me what ur name is : " + teacherName);
				logger.info("what's ur id : " + teacherId);
				
				// �������� ���̺� �ۼ���(mt_num)���� ���� ���̺��� ���� �̸� ����!
				nvo.setMt_num(teacherName);
				nvo.setMt_id(teacherId);
				
				// nvo�� searchType�� keyword ����
				nvo.setSearchType(searchType);
				nvo.setKeyword(keyword);
				
				// session�� ����� ���� �̸�(mt_name)�� �ۼ���(writer)�� �Ҵ��ϱ�
				hs.setAttribute("writer", teacherName);
				// session�� ����� ���� �̸�(mt_name)�� ȸ����(userName)�� �Ҵ��ϱ�
				hs.setAttribute("userName", teacherName);
				
				// ����¡ ����
				nvo.setPageSize(String.valueOf(pageSize));
				nvo.setGroupSize(String.valueOf(groupSize));
				nvo.setCurPage(String.valueOf(curPage));
				nvo.setTotalCount(String.valueOf(totalCount));
				
				List<KosmosNoticeVO> listAll = kosmosNoticeService.noticeList(nvo);
				
				if(listAll.size() > 0) {
					logger.info("Controller.listAll.size(): " + listAll.size());
					
					model.addAttribute("pagingNvo", nvo);
					model.addAttribute("listAll", listAll);
				}		
				return "notice/noticeList";
				
			} else {								// �л� �α���
	
				List<KosmosNoticeVO> listStu = kosmosNoticeService.checkStudent(lvo);
				// ����Ʈ�� ù ��° ���� nvo�� ����.
				nvo = listStu.get(0);
				String ms_name = nvo.getMs_name();
				
				nvo.setMs_name(ms_name);
				logger.info("show me what ur name is : " + ms_name);
				
				// Ű����� �˻� ���� �ٽ� ����.
				nvo.setSearchType(searchType);
				nvo.setKeyword(keyword);
				// session�� ����� �л� �̸�(ms_name)�� ȸ����(userName)�� �Ҵ��ϱ�
//				hs.setAttribute("userName", ms_name);
				logger.info("�˻� ���� Ȯ�� >>> : " + nvo.getSearchType());
				logger.info("Ű���� Ȯ�� >>> : " + nvo.getKeyword());
				
				// ����¡ ����
				nvo.setPageSize(String.valueOf(pageSize));
				nvo.setGroupSize(String.valueOf(groupSize));
				nvo.setCurPage(String.valueOf(curPage));
				nvo.setTotalCount(String.valueOf(totalCount));
				
				// nvo�� ���õ� ��� ���� ������ noticeList�� ���!
				List<KosmosNoticeVO> listAll = kosmosNoticeService.noticeList(nvo);
				
				if(listAll.size() > 0) {
					logger.info("Controller.listAll.size(): " + listAll.size());
					
					model.addAttribute("pagingNvo", nvo);
					model.addAttribute("listAll", listAll);
				}
				
				return "notice/noticeList";
			}
		
		} else {										// ======= �׳� ��� ��ȸ ======= //
			
				if(mt_id != null) {						// ���� �α���
				
				// lvo(ȸ�� ���̵�� ȸ�� ��й�ȣ��)�� ȸ�� �̸� ������
				List<KosmosNoticeVO> listTea =  kosmosNoticeService.checkTeacher(lvo);
				nvo = listTea.get(0);
				String teacherName = nvo.getMt_name();
				String teacherId = nvo.getMt_id();
				logger.info("show me what ur name is : " + teacherName);
				logger.info("what's ur id : " + teacherId);
				
				// �������� ���̺� �ۼ���(mt_num)���� ���� ���̺��� ���� �̸� ����!
				nvo.setMt_num(teacherName);	// �ۼ���
				nvo.setMt_id(teacherId);	// ���� ���̵�
				
				// () session�� ����� ���� �̸�(mt_name)�� ȸ����(userName)�� �Ҵ��ϱ�
				hs.setAttribute("userName", teacherName);
				hs.setAttribute("teacherId", teacherId);
				
				// ����¡ ����
				nvo.setPageSize(String.valueOf(pageSize));
				nvo.setGroupSize(String.valueOf(groupSize));
				nvo.setCurPage(String.valueOf(curPage));
				nvo.setTotalCount(String.valueOf(totalCount));
				
				List<KosmosNoticeVO> listAll = kosmosNoticeService.noticeList(nvo);
				
				if(listAll.size() > 0) {
					logger.info("Controller.listAll.size(): " + listAll.size());
					
					model.addAttribute("pagingNvo", nvo);
					model.addAttribute("listAll", listAll);
				}		
				return "notice/noticeList";
				
			} else {								// �л� �α���
	
				List<KosmosNoticeVO> listStu = kosmosNoticeService.checkStudent(lvo);
				
				nvo = listStu.get(0);
				String ms_name = nvo.getMs_name();
				logger.info("show me what ur name is : " + ms_name);
				
				// session�� ����� �л� �̸�(ms_name)�� ȸ����(userName)�� �Ҵ��ϱ�
				hs.setAttribute("userName", ms_name);
	
				// ����¡ ����
				nvo.setPageSize(String.valueOf(pageSize));
				nvo.setGroupSize(String.valueOf(groupSize));
				nvo.setCurPage(String.valueOf(curPage));
				nvo.setTotalCount(String.valueOf(totalCount));
				
				List<KosmosNoticeVO> listAll = kosmosNoticeService.noticeList(nvo);
				
				if(listAll.size() > 0) {
					logger.info("Controller.listAll.size(): " + listAll.size());
					
					model.addAttribute("pagingNvo", nvo);
					model.addAttribute("listAll", listAll);
				}
				
				return "notice/noticeList";
			}
		}
	}

	

	// ==================================================================== /
	// �Խñ� �� ��ȸ
	// ==================================================================== /
	@GetMapping("noticeDetail")
	public String noticeSelect(KosmosNoticeVO nvo, HttpServletRequest req, Model model, HttpSession hs) {
		logger.info("noticeSelect() ȣ��");
		
		// noticeList()���� �ҷ��� ���� �̸�
		String myName = (String)hs.getAttribute("userName");
		logger.info("�α���-> Ȩ-> �������� ��� -> ��ȸ -> �� �̸� : " + myName);
		String mt_id = (String) hs.getAttribute("teacherId");
		logger.info("���� ���̵� : " + mt_id);
		
		if(nvo.getMs_name() != null) {		// �л� �α���
			
			nvo.setMs_name(myName);
			logger.info("�л��ΰ� : �� �̸��� : " + nvo.getMs_name());
			
			String no_num = req.getParameter("no_num");
			logger.info("������ �������� �� ��ȣ: " + no_num);
			
			KosmosNoticeVO listS = kosmosNoticeService.noticeSelect(nvo);

			// ��ȸ�� ���� �Լ��� �Բ� ����
			kosmosNoticeService.updateCntHit(no_num);

			model.addAttribute("listS", listS);
			
			return "notice/noticeDetail";
		
		
		} else {							// ���� �α���
			
			nvo.setMt_name(myName);
			logger.info("�����ΰ� : �� �̸��� : " + nvo.getMt_name());

			String no_num = req.getParameter("no_num");
			logger.info("������ �������� �� ��ȣ: " + no_num);

			nvo.setMt_id(mt_id);
			logger.info("�� ���̵� : " + nvo.getMt_id());
			
			KosmosNoticeVO listS = kosmosNoticeService.noticeSelect(nvo);

			// ��ȸ�� ���� �Լ��� �Բ� ����
			kosmosNoticeService.updateCntHit(no_num);

			model.addAttribute("listS", listS);
			
			return "notice/noticeDetail";
		}

	}

	// ==================================================================== /
	// �Խñ� ���� ȭ�� ���
	// ==================================================================== /
	@PostMapping("noticeUpdateForm")
	public String noticeUpdateForm(KosmosNoticeVO nvo, HttpServletRequest req, Model model) {
		logger.info("noticeUpdateForm() ȣ��");
		String no_num = req.getParameter("no_num");
		nvo.setNo_num(no_num);
		KosmosNoticeVO listS = kosmosNoticeService.noticeSelect(nvo);
		model.addAttribute("listS", listS);
		return "notice/noticeUpdateForm";
	}
	
	
	// ==================================================================== /
	// �Խñ� ����
	// ==================================================================== /
	@PostMapping("noticeUpdate")
	public String noticeUpdate(KosmosNoticeVO nvo, HttpSession hs, HttpServletRequest req) {
		logger.info("noticeUpdate() ȣ��");
		
		// noticeList()���� �ҷ��� ���� �̸�
		String myName = (String)hs.getAttribute("userName");
		logger.info("�α���-> Ȩ-> �������� ��� -> ��ȸ -> ���� -> �� �̸� : " + myName);
		String mt_id = (String) hs.getAttribute("teacherId");
		logger.info("���� ���̵� : " + mt_id);
		
		// ���Ͼ��ε���ƿ �ν��Ͻ�
		FileUploadUtil fu = new FileUploadUtil(CommonUtils.NOTICE_IMG_UPLOAD_PATH,
											   CommonUtils.NOTICE_IMG_FILE_SIZE,
											   CommonUtils.NOTICE_EN_CODE);
		
		boolean bool = fu.imgfileUploadSize(req);
		logger.info(bool);

		String no_num = fu.getParameter("no_num");
		String no_subject = fu.getParameter("no_subject");
		String no_contents = fu.getParameter("no_contents");
		String no_file = fu.getFileName("no_file");

		logger.info("�۹�ȣ          >>>>>>>>>>>>>>> :" + no_num);
		logger.info("���� is >>> : " + no_subject);
		logger.info("������ : " + no_contents);
		logger.info("����         >>>>>>>>>>>>>>> :" + no_file);
		
		nvo.setNo_num(no_num);
		nvo.setNo_subject(no_subject);					// ����
		nvo.setNo_contents(no_contents);				// ����
		nvo.setNo_file(no_file);						// ����
		
		if(nvo.getMs_name() != null) {		// �л� �α���
			
			nvo.setMs_name(myName);
			logger.info("�л� �α��� : �� �̸��� : " + nvo.getMs_name());
			
			logger.info("������ �������� �� ��ȣ: " + no_num);
			
			// noticeUpdate() gogo
			int nCnt = kosmosNoticeService.noticeUpdate(nvo);

			if(nCnt == 1) {
				return "notice/noticeUpdate";
			} else {
				return "notice/noticeUpdateForm";
			}
			
		} else {							// ���� �α���
			nvo.setMt_name(myName);
			logger.info("���� �α��� : �� �̸��� : " + nvo.getMt_name());


			logger.info("������ �������� �� ��ȣ: " + no_num);

			nvo.setMt_id(mt_id);
			logger.info("�� ���̵� : " + nvo.getMt_id());
			
			// noticeUpdate() gogo
			int nCnt = kosmosNoticeService.noticeUpdate(nvo);

			if(nCnt == 1) {
				return "notice/noticeUpdate";
			} else {
				return "notice/noticeUpdateForm";
			}
			
		}
	}

	// ==================================================================== /
	// �Խñ� ����
	// ==================================================================== /	
	@PostMapping("noticeDelete")
	public String noticeDelete(KosmosNoticeVO nvo, HttpServletRequest req) {
		logger.info("noticeDelete() ȣ��");
		
		String no_num = req.getParameter("no_num");
		
		logger.info("������ �������� �� ��ȣ: " + no_num);
		nvo.setNo_num(no_num);
		logger.info("recheck! ������ �������� �� ��ȣ: " + no_num);
		
		// noticeDelete() gogo
		int nCnt = kosmosNoticeService.noticeDelete(nvo);
		
		if(nCnt == 1) {
			return "notice/noticeDelete";
		}
		return "notice/noticeList";
	}
	
}
