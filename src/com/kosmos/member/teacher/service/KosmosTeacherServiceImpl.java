package com.kosmos.member.teacher.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kosmos.member.teacher.dao.KosmosTeacherDAO;
import com.kosmos.member.teacher.vo.KosmosTeacherVO;


@Service
@Transactional
public class KosmosTeacherServiceImpl implements KosmosTeacherService {
	Logger logger = Logger.getLogger(KosmosTeacherServiceImpl.class);
	
	private KosmosTeacherDAO kosmosTeacherDAO;
	
	@Autowired(required=false)
	public KosmosTeacherServiceImpl(KosmosTeacherDAO kosmosTeacherDAO) {
		this.kosmosTeacherDAO = kosmosTeacherDAO;
	}


	@Override
	public int teacherInsert(KosmosTeacherVO mvo) {
		// TODO Auto-generated method stub
		logger.info("KosmoTeacherServiceImpl teacherInsert() 함수 진입 >>> : ");
		return kosmosTeacherDAO.teacherInsert(mvo);
	}

	@Override
	public int teacherUpdate(KosmosTeacherVO mvo) {
		// TODO Auto-generated method stub
		logger.info("KosmoTeacherServiceImpl teacherUpdate() 함수 진입 >>> : ");
		return kosmosTeacherDAO.teacherUpdate(mvo);
	}

	@Override
	public List<KosmosTeacherVO> teacherIdCheck(KosmosTeacherVO mvo) {
		// TODO Auto-generated method stub
		logger.info("KosmoTeacherServiceImpl teacherIdCheck() 함수 진입 >>> : ");
		return kosmosTeacherDAO.teacherIdCheck(mvo);
	}
}
