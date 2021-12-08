package com.kosmos.sugang.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kosmos.sugang.vo.KosmosSugangListVO;
import com.kosmos.sugang.vo.KosmosSugangSubjectVO;


@Repository 
public class KosmosSugangDAOImpl implements KosmosSugangDAO {
	Logger logger = Logger.getLogger(KosmosSugangDAOImpl.class);

	@Autowired(required=false)
	private SqlSessionTemplate sqlSession;


	@Override
	public List<KosmosSugangSubjectVO> subjectSelectAll(KosmosSugangSubjectVO vo) {		
		return sqlSession.selectList("subjectSelectAll", vo);
	}
 
	@Override
	public int sugangListInsert(KosmosSugangListVO vo) {
		return sqlSession.insert("sugangListInsert", vo);
	}

	@Override
	public List<KosmosSugangListVO> sugangListSelect(KosmosSugangListVO vo) {	
		return sqlSession.selectList("sugangSelect", vo);
	}

	@Override
	public List<KosmosSugangListVO> sugangOldlistSelectAll(KosmosSugangListVO vo) {	
		return sqlSession.selectList("sugangOldlistSelectAll", vo);
	}
	
	public List<KosmosSugangListVO>sugangListSelectGroup(HashMap<String, String> map) {
		return sqlSession.selectList("sugangListSelectGroup", map);
	}

	@Override
	public int sugangListUpdateOne(HashMap<String, String> map) {
		return sqlSession.update("sugangListUpdateOne");
	}

	@Override
	public List<KosmosSugangListVO> sugangSelectAll(KosmosSugangListVO vo) {
		return sqlSession.selectList("sugangSelectAll", vo);
	}

	@Override
	public int sugangListUpdateList(HashMap<String, String> map) {
		return sqlSession.update("sugangListUpdateList");
	}

	@Override
	public int sugangOldListInsert(KosmosSugangListVO vo) {
		return sqlSession.insert("sugangOldListInsert", vo);
	}
}
