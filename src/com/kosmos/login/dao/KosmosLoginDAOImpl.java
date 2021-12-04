package com.kosmos.login.dao;

import java.util.List;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kosmos.login.service.KosmosLoginServiceImpl;
import com.kosmos.login.vo.KosmosLoginVO;

@Repository
public class KosmosLoginDAOImpl implements KosmosLoginDAO {
	
	// Logger Set
	Logger logger = Logger.getLogger(KosmosLoginDAOImpl.class);
	
	// Mybatis - SqlSessionTemplate 연결
	@Autowired(required=false)
	private SqlSessionTemplate sqlSession;
	
	// 로그인시 아이디&비밀번호 확인 로직
	@Override
	public List<KosmosLoginVO> checkIdPwStudent(KosmosLoginVO lvo) {
		// TODO Auto-generated method stub
		logger.info("KosmosLoginDAOImpl.checkIdPwStudent()진입 >>> : 학생의 아이디와 비밀번호 확인을 위해 XML을 체크합니다.");
		return sqlSession.selectOne("checkIdPwStudent", lvo);
	}
	
	@Override
	public List<KosmosLoginVO> checkIdPwTeacher(KosmosLoginVO lvo){
		logger.info("KosmosLoginDAOImpl.checkIdPwTeacher()진입 >>> : 교사의 아이디와 비밀번호 확인을 위해 XML을 체크합니다.");
		return sqlSession.selectOne("checkIdPwTeacher", lvo);
	}

	@Override
	public List<KosmosLoginVO> findIdStudent(KosmosLoginVO lvo){
		logger.info("KosmosLoginDAOImpl.findIdStudent()진입 >>> : 학생의 아이디 확인을 위해 XML을 체크합니다.");
		return sqlSession.selectOne("findIdStudent", lvo);

	}
	
	@Override
	public List<KosmosLoginVO> findIdTeacher(KosmosLoginVO lvo){
		logger.info("KosmosLoginDAOImpl.findIdTeacher()진입 >>> : 교사의 아이디 확인을 위해 XML을 체크합니다.");
		return sqlSession.selectOne("findIdTeacher", lvo);
	}
	
	@Override
	public List<KosmosLoginVO> findPwStudent(KosmosLoginVO lvo){
		logger.info("KosmosLoginDAOImpl.findPwStudent()진입 >>> : 학생의 비밀번호 확인을 위해 XML을 체크합니다.");
		return sqlSession.selectOne("findPwStudent", lvo);

	}
	
	@Override
	public List<KosmosLoginVO> findPwTeacher(KosmosLoginVO lvo){
		logger.info("KosmosLoginDAOImpl.findPwTeacher()진입 >>> : 교사의 비밀번호 확인을 위해 XML을 체크합니다.");
		return sqlSession.selectOne("findPwTeacher", lvo);
	}
	
	
	
	
}
