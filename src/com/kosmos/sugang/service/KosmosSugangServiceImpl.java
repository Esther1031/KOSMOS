package com.kosmos.sugang.service;

import java.util.HashMap;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.kosmos.sugang.dao.KosmosSugangDAO;
import com.kosmos.sugang.vo.KosmosSugangListVO;
import com.kosmos.sugang.vo.KosmosSugangSubjectVO;
 

@Service
@Transactional
public class KosmosSugangServiceImpl implements KosmosSugangService {
	
	Logger logger = Logger.getLogger(KosmosSugangServiceImpl.class);
	
	private KosmosSugangDAO kosmosSugangDAO;
	
	@Autowired(required=false)
	public KosmosSugangServiceImpl(KosmosSugangDAO kosmosSugangDAO) {
		this.kosmosSugangDAO = kosmosSugangDAO;
	}
	
	@Override
	public List<KosmosSugangSubjectVO> subjectSelectAll(KosmosSugangSubjectVO vo) {
		return kosmosSugangDAO.subjectSelectAll(vo);
	}
	
	@Override
	public int sugangListInsert(KosmosSugangListVO vo) {
		return kosmosSugangDAO.sugangListInsert(vo);
	}
	
	@Override
	public List<KosmosSugangListVO> sugangListSelect(KosmosSugangListVO vo) {
		return kosmosSugangDAO.sugangListSelect(vo);
	}
	
	@Override
	public List<KosmosSugangListVO> sugangOldlistSelectAll(KosmosSugangListVO vo) {	
		return kosmosSugangDAO.sugangListSelect(vo);
	}
	
	@Override
	public List<KosmosSugangListVO> sugangListSelectGroup(HashMap<String, String> map) {
		return kosmosSugangDAO.sugangListSelectGroup(map);
	}
	
	@Override
	public int sugangListUpdateOne(HashMap<String, String> map) {	
		return kosmosSugangDAO.sugangListUpdateOne(map);
	}

	@Override
	public List<KosmosSugangListVO> sugangSelectAll(KosmosSugangListVO vo) {
		return kosmosSugangDAO.sugangSelectAll(vo);
	}

	@Override
	public int sugangListUpdateList(HashMap<String, String> map) {
		return kosmosSugangDAO.sugangListUpdateList(map);
	}

	@Override
	public int sugangOldListInsert(KosmosSugangListVO vo) {
		return kosmosSugangDAO.sugangOldListInsert(vo);
	}
}
