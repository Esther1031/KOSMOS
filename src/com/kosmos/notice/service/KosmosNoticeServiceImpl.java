package com.kosmos.notice.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kosmos.login.vo.KosmosLoginVO;
import com.kosmos.notice.dao.KosmosNoticeDAO;
import com.kosmos.notice.vo.KosmosNoticeVO;

@Service
@Transactional
public class KosmosNoticeServiceImpl implements KosmosNoticeService {

	
	Logger logger = Logger.getLogger(KosmosNoticeServiceImpl.class);
	
	
	@Autowired(required=false)
	private KosmosNoticeDAO kosmosNoticeDAO;
	
	public KosmosNoticeServiceImpl(KosmosNoticeDAO kosmosNoticeDAO) {
		this.kosmosNoticeDAO = kosmosNoticeDAO;
	}

	// 글쓰기
	@Override
	public int noticeInsert(KosmosNoticeVO nvo) {
		logger.info("noticeInsert(nvo) Transaction");
		return kosmosNoticeDAO.noticeInsert(nvo);
	}
	
	// 목록 조회
	@Override
	public List<KosmosNoticeVO> noticeList(KosmosNoticeVO nvo) {
		logger.info("noticeList(nvo) 호출");
		return kosmosNoticeDAO.noticeList(nvo);
	}
	
	// 게시글 상세 조회
	@Override
	public KosmosNoticeVO noticeSelect(KosmosNoticeVO nvo) {
		logger.info("noticeSelect(nvo) 호출");
		return kosmosNoticeDAO.noticeSelect(nvo);
	}
	
	// 조회수 업데이트
	@Override
	public void updateCntHit(String no_num) {
		logger.info("updateCntHit() Transaction");
		kosmosNoticeDAO.updateCntHit(no_num);
	}
	
	// 수정
	@Override
	public int noticeUpdate(KosmosNoticeVO nvo) {
		logger.info("noticeUpdate(nvo) Transaction");
		return kosmosNoticeDAO.noticeUpdate(nvo);
	}

	// 삭제
	@Override
	public int noticeDelete(KosmosNoticeVO nvo) {
		logger.info("noticeDelete(nvo) Transaction");
		return kosmosNoticeDAO.noticeDelete(nvo);
	}

	
	// 교사 회원 이름 조회
	@Override
	public List<KosmosNoticeVO> checkTeacher(KosmosLoginVO lvo) {
		logger.info("checkTeacher(lvo) 호출");
		return kosmosNoticeDAO.checkTeacher(lvo);
	}
	
	// 학생 회원 이름 조회
	@Override
	public List<KosmosNoticeVO> checkStudent(KosmosLoginVO lvo) {
		logger.info("checkStudent(lvo) 호출");
		return kosmosNoticeDAO.checkStudent(lvo);
	}


}
