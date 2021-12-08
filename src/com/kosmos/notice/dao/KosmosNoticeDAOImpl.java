package com.kosmos.notice.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kosmos.login.vo.KosmosLoginVO;
import com.kosmos.notice.vo.KosmosNoticeVO;

@Repository
public class KosmosNoticeDAOImpl implements KosmosNoticeDAO {

	// KosmosNoticeDAO에 관한 로그 출력
	private Logger logger = Logger.getLogger(KosmosNoticeDAOImpl.class);

	@Autowired(required=false)
	private SqlSessionTemplate sqlSession;

	// 공지사항 게시글 입력 
	@Override
	public int noticeInsert(KosmosNoticeVO nvo) {
		logger.info("DAOImpl.noticeInsert()");
		return (Integer)sqlSession.insert("noticeInsert", nvo);
	}
	
	// 목록 조회
	@Override
	public List<KosmosNoticeVO> noticeList(KosmosNoticeVO nvo){
		logger.info("DAOImpl.noticeList() 호출");

		String searchType = nvo.getSearchType();
		String keyword = nvo.getKeyword();
		Map<String, String> map = new HashMap<String, String>();
		map.put("searchType", searchType);
		map.put("keyword", keyword);
		return sqlSession.selectList("noticeList", nvo);
	}
	
	// 공지사항 게시글 상세 조회
	@Override
	public KosmosNoticeVO noticeSelect(KosmosNoticeVO nvo) {
		logger.info("DAOImpl.noticeSelect() 호출");
		return sqlSession.selectOne("noticeSelect", nvo);
	}

	// 조회수 카운트(update문)
	@Override
	public void updateCntHit(String no_num) {
		logger.info("DAOImpl.updateCntHit() ");
		sqlSession.update("updateCntHit", no_num);
	}
	
	// 게시글 수정(update문)
	@Override
	public int noticeUpdate(KosmosNoticeVO nvo) {
		// TODO Auto-generated method stub
		return sqlSession.update("noticeUpdate", nvo);
	}
	
	// 게시글 삭제(update문)
	@Override
	public int noticeDelete(KosmosNoticeVO nvo) {
		// TODO Auto-generated method stub
		return sqlSession.update("noticeDelete", nvo);
	}

	
	// 교사 회원 이름 조회
	@Override
	public List<KosmosNoticeVO> checkTeacher(KosmosLoginVO lvo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("checkTeacher", lvo);
	}

	// 학생 회원 이름 조회
	@Override
	public List<KosmosNoticeVO> checkStudent(KosmosLoginVO lvo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("checkStudent", lvo);
	}
	

}
