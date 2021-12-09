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

	// 게시글 작성
	@Override
	public int noticeInsert(KosmosNoticeVO nvo) {
		logger.info("noticeInsert(nvo) transaction");
		return kosmosNoticeDAO.noticeInsert(nvo);
	}
	
	// 목록 조회
	@Override
	public List<KosmosNoticeVO> noticeList(KosmosNoticeVO nvo) {
		logger.info("noticeList(nvo) transaction");
		return kosmosNoticeDAO.noticeList(nvo);
	}
	
	// 게시글 상세 조회
	@Override
	public KosmosNoticeVO noticeSelect(KosmosNoticeVO nvo) {
		logger.info("noticeSelect(nvo) transaction");
		return kosmosNoticeDAO.noticeSelect(nvo);
	}
	
	// 조회수 증가 UPDATE문
	@Override
	public void updateCntHit(String no_num) {
		logger.info("updateCntHit(nvo) transaction");
		kosmosNoticeDAO.updateCntHit(no_num);
	}
	
	// 게시글 수정
	@Override
	public int noticeUpdate(KosmosNoticeVO nvo) {
		logger.info("noticeUpdate(nvo) transaction");
		return kosmosNoticeDAO.noticeUpdate(nvo);
	}

	// 게시글 삭제
	@Override
	public int noticeDelete(KosmosNoticeVO nvo) {
		logger.info("noticeDelete(nvo) transaction");
		return kosmosNoticeDAO.noticeDelete(nvo);
	}

	
	// ==================================================== //
	// REFER TO MEMSTU TABLE, MEMTEA TABLE
	// ==================================================== //
	// 교사 이름, 아이디 조회
	@Override
	public List<KosmosNoticeVO> checkTeacher(KosmosLoginVO lvo) {
		logger.info("checkTeacher(lvo) transaction");
		return kosmosNoticeDAO.checkTeacher(lvo);
	}
	
	// 학생 이름, 아이디 조회
	@Override
	public List<KosmosNoticeVO> checkStudent(KosmosLoginVO lvo) {
		logger.info("checkStudent(lvo) transaction");
		return kosmosNoticeDAO.checkStudent(lvo);
	}


}
