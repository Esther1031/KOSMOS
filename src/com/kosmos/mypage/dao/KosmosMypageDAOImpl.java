package com.kosmos.mypage.dao;

import java.util.List;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kosmos.login.dao.KosmosLoginDAOImpl;
import com.kosmos.login.vo.KosmosLoginVO;
import com.kosmos.mypage.vo.KosmosMypageVO;

@Repository
public class KosmosMypageDAOImpl implements KosmosMypageDAO {

	// Logger Set
	Logger logger = Logger.getLogger(KosmosLoginDAOImpl.class);
	
	// Mybatis - SqlSessionTemplate 연결
	@Autowired(required=false)
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<KosmosMypageVO> selectStudentData(KosmosLoginVO lvo) {
		// TODO Auto-generated method stub
		logger.info("KosmosMypageDAOImpl.selectStudentData() 진입 >>> : 회원 정보를 sqlSession으로 보냅니다.");
		return sqlSession.selectOne("selectStudentData", lvo);
	}

	@Override
	public List<KosmosMypageVO> selectTeacherData(KosmosLoginVO lvo) {
		// TODO Auto-generated method stub
		logger.info("KosmosMypageDAOImpl.selectTeacherData() 진입 >>> : 회원 정보를 sqlSession으로 보냅니다.");
		return sqlSession.selectOne("selectTeacherData", lvo);
	}

	@Override
	public int updateStudentInfo(KosmosMypageVO mvo) {
		logger.info("KosmosMypageDAOImpl.updateStudentInfo() 진입 >>> : 회원 정보를 sqlSession으로 보냅니다.");
		return sqlSession.update("updateStudentInfo", mvo);
	}
	
	@Override
	public int updateTeacherInfo(KosmosMypageVO mvo) {
		logger.info("KosmosMypageDAOImpl.updateTeacherInfo() 진입 >>> : 회원 정보를 sqlSession으로 보냅니다.");
		return sqlSession.update("updateTeacherInfo", mvo);	}
	
}
