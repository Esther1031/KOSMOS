package com.kosmos.mypage.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kosmos.login.vo.KosmosLoginVO;
import com.kosmos.mypage.dao.KosmosMypageDAO;
import com.kosmos.mypage.vo.KosmosMypageVO;

@Service
@Transactional
public class KosmosMypageServiceImpl implements KosmosMypageService {

	// Logger 세팅
	Logger logger = Logger.getLogger(KosmosMypageServiceImpl.class);
	
	// DAO연결을 위해 선언
	private KosmosMypageDAO kosmosMypageDAO;
	
	// 생성자로 DAO연결
	@Autowired(required=false)
	public KosmosMypageServiceImpl(KosmosMypageDAO kosmosMypageDAO) {
		this.kosmosMypageDAO = kosmosMypageDAO;
	}
	
	@Override
	public List<KosmosMypageVO> selectStudentData(KosmosLoginVO lvo) {
		// TODO Auto-generated method stub
		logger.info("KosmosMypageServiceImpl.selectStudentData() 진입 >>> : 학생 회원 정보를 DAO로 보냅니다.");
		return kosmosMypageDAO.selectStudentData(lvo);
	}

	@Override
	public List<KosmosMypageVO> selectTeacherData(KosmosLoginVO lvo) {
		// TODO Auto-generated method stub
		logger.info("KosmosMypageServiceImpl.selectTeacherData() 진입 >>> : 교사 회원 정보를 DAO로 보냅니다.");
		return kosmosMypageDAO.selectTeacherData(lvo);
	}
	
	@Override
	public int updateStudentInfo(KosmosMypageVO mvo) {
		logger.info("KosmosMypageServiceImpl.updateStudentInfo() 진입 >>> : 학생 업데이트 요청을 DAO로 보냅니다.");
		return kosmosMypageDAO.updateStudentInfo(mvo);
	}
	
	@Override
	public int updateTeacherInfo(KosmosMypageVO mvo) {
		logger.info("KosmosMypageServiceImpl.updateTeacherInfo() 진입 >>> : 교사 업데이트 요청을 DAO로 보냅니다.");
		return 0;
	}

}
