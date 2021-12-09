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

	
	private Logger logger = Logger.getLogger(KosmosNoticeDAOImpl.class);

	@Autowired(required=false)
	private SqlSessionTemplate sqlSession;

	// Notice Article INSERT
	@Override
	public int noticeInsert(KosmosNoticeVO nvo) {
		logger.info("DAOImpl.noticeInsert() CALL");
		return (Integer)sqlSession.insert("noticeInsert", nvo);
	}
	
	// SELECT Notice List
	@Override
	public List<KosmosNoticeVO> noticeList(KosmosNoticeVO nvo){
		logger.info("DAOImpl.noticeList() CALL");

		String searchType = nvo.getSearchType();
		String keyword = nvo.getKeyword();
		Map<String, String> map = new HashMap<String, String>();
		map.put("searchType", searchType);
		map.put("keyword", keyword);
		return sqlSession.selectList("noticeList", nvo);
	}
	
	// SELECT One Notice Article
	@Override
	public KosmosNoticeVO noticeSelect(KosmosNoticeVO nvo) {
		logger.info("DAOImpl.noticeSelect() CALL");
		return sqlSession.selectOne("noticeSelect", nvo);
	}

	// UPDATE HIT +1 When SELECT One Notice Article
	@Override
	public void updateCntHit(String no_num) {
		logger.info("DAOImpl.updateCntHit() CALL");
		sqlSession.update("updateCntHit", no_num);
	}
	
	// UPDATE One Notice Article
	@Override
	public int noticeUpdate(KosmosNoticeVO nvo) {
		// TODO Auto-generated method stub
		return sqlSession.update("noticeUpdate", nvo);
	}
	
	// UPDATE One Notice Article
	@Override
	public int noticeDelete(KosmosNoticeVO nvo) {
		// TODO Auto-generated method stub
		return sqlSession.update("noticeDelete", nvo);
	}

	
	// SELECT MT_ID, MT_NAME
	@Override
	public List<KosmosNoticeVO> checkTeacher(KosmosLoginVO lvo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("checkTeacher", lvo);
	}

	// SELECT MS_ID, MS_NAME
	@Override
	public List<KosmosNoticeVO> checkStudent(KosmosLoginVO lvo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("checkStudent", lvo);
	}
	

}
