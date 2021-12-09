package com.kosmos.subject.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kosmos.subject.dao.KosmosSubjectDAO;
import com.kosmos.subject.dao.KosmosSubjectDAOImpl;
import com.kosmos.subject.vo.KosmosSubjectVO;

@Service
@Transactional
public class KosmosSubjectServiceImpl implements KosmosSubjectService {
	private Logger logger = Logger.getLogger(KosmosSubjectDAOImpl.class);
	
	private KosmosSubjectDAO kosmosSubjectDAO;
	
	@Autowired(required=false)
	public KosmosSubjectServiceImpl(KosmosSubjectDAO kosmosSubjectDAO) {
		this.kosmosSubjectDAO = kosmosSubjectDAO;
	}

	@Override
	public List<KosmosSubjectVO> subjectSelectAll(KosmosSubjectVO svo) {
		// TODO Auto-generated method stub
		logger.info("KosmosSubjectServiceImpl subjectSelectAll() >>> : ");
		return kosmosSubjectDAO.subjectSelectAll(svo);
	}
	
	@Override
	public List<KosmosSubjectVO> subjectSelect(KosmosSubjectVO svo) {
		// TODO Auto-generated method stub
		logger.info("KosmosSubjectServiceImpl subjectSelect() >>> : ");
		return kosmosSubjectDAO.subjectSelect(svo);
	}

	@Override
	public int subjectInsert(KosmosSubjectVO svo) {
		// TODO Auto-generated method stub
		logger.info("KosmosSubjectServiceImpl : subjectInsert() >>> : ");
		return kosmosSubjectDAO.subjectInsert(svo);
	}

	@Override
	public int subjectUpdate(KosmosSubjectVO svo) {
		// TODO Auto-generated method stub
		logger.info("KosmosSubjectServiceImpl : subjectUpdate() >>> : ");
		return kosmosSubjectDAO.subjectUpdate(svo);
	}

	@Override
	public int subjectDelete(KosmosSubjectVO svo) {
		// TODO Auto-generated method stub
		logger.info("KosmosSubjectServiceImpl : subjectDelete() >>> : ");
		return kosmosSubjectDAO.subjectDelete(svo);
	}

	@Override
	public List<KosmosSubjectVO> beforeNameList() {
		// TODO Auto-generated method stub
		logger.info("KosmosSubjectServiceImpl : beforeNameList() >>> : ");
		return kosmosSubjectDAO.beforeNameList();
	}

	@Override
	public KosmosSubjectVO subjectChabun(KosmosSubjectVO svo) {
		// TODO Auto-generated method stub
		logger.info("KosmosSubjectServiceImpl : subjectChabun() >>> : ");
		return kosmosSubjectDAO.subjectChabun(svo);
	}

	@Override
	public KosmosSubjectVO subjectCallCode(KosmosSubjectVO svo) {
		// TODO Auto-generated method stub
		logger.info("KosmosSubjectServiceImpl : subjectCallCode() >>> : ");
		return kosmosSubjectDAO.subjectCallCode(svo);
	}

	@Override
	public List<KosmosSubjectVO> subjectSelectEssential(KosmosSubjectVO svo) {
		// TODO Auto-generated method stub
		logger.info("KosmosSubjectServiceImpl : subjectSelectEssential() >>> : ");
		return kosmosSubjectDAO.subjectSelectEssential(svo);
	}

	@Override
	public List<KosmosSubjectVO> subjectSelectChoice(KosmosSubjectVO svo) {
		// TODO Auto-generated method stub
		logger.info("KosmosSubjectServiceImpl : subjectSelectChoice() >>> : ");
		return kosmosSubjectDAO.subjectSelectChoice(svo);
	}

}	