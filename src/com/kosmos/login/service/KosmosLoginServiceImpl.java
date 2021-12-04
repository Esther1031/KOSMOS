package com.kosmos.login.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kosmos.login.dao.KosmosLoginDAO;
import com.kosmos.login.vo.KosmosLoginVO;

@Service
@Transactional
public class KosmosLoginServiceImpl implements KosmosLoginService {

	// Logger Set
	Logger logger = Logger.getLogger(KosmosLoginServiceImpl.class);
	
	// DAO 선언
	private KosmosLoginDAO kosmosLoginDAO;
	
	// 생성자로 DAO 연결
	@Autowired(required=false)
	public KosmosLoginServiceImpl(KosmosLoginDAO kosmosLoginDAO) {
		this.kosmosLoginDAO = kosmosLoginDAO;
	}
	
	// 로그인시 아이디&비밀번호 확인 로직
	@Override
	public List<KosmosLoginVO> checkIdPwStudent(KosmosLoginVO lvo) {
		// TODO Auto-generated method stub
		logger.info("KosmosLoginServiceImpl.checkIdPwStudent()진입 >>> : 학생의 아이디와 비밀번호 확인을 위해 DAO로 진입합니다.");
		return kosmosLoginDAO.checkIdPwStudent(lvo);
		
	}
	@Override
	public List<KosmosLoginVO> checkIdPwTeacher(KosmosLoginVO lvo){
		logger.info("KosmosLoginServiceImpl.checkIdPwTeacher()진입 >>> : 교사의 아이디와 비밀번호 확인을 위해 DAO로 진입합니다.");
		return kosmosLoginDAO.checkIdPwTeacher(lvo);
	}

	@Override
	public List<KosmosLoginVO> findIdStudent(KosmosLoginVO lvo){
		logger.info("KosmosLoginServiceImpl.findIdStudent()진입 >>> : 학생의 아이디 확인을 위해 DAO로 진입합니다.");
		return kosmosLoginDAO.findIdStudent(lvo);

	}
	
	@Override
	public List<KosmosLoginVO> findIdTeacher(KosmosLoginVO lvo){
		logger.info("KosmosLoginServiceImpl.findIdTeacher()진입 >>> : 교사의 아이디 확인을 위해 DAO로 진입합니다.");
		return kosmosLoginDAO.findIdTeacher(lvo);
	}
	
	
	@Override
	public List<KosmosLoginVO> findPwStudent(KosmosLoginVO lvo){
		logger.info("KosmosLoginServiceImpl.findPwStudent()진입 >>> : 학생의 비밀번호 확인을 위해 DAO로 진입합니다.");
		return kosmosLoginDAO.findPwStudent(lvo);
	}
	
	@Override
	public List<KosmosLoginVO> findPwTeacher(KosmosLoginVO lvo){
		logger.info("KosmosLoginServiceImpl.findPwTeacher()진입 >>> : 교사의 비밀번호 확인을 위해 DAO로 진입합니다.");
		return kosmosLoginDAO.findPwTeacher(lvo);
	}
	
	
	
}
