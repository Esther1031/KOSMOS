package com.kosmos.member.student.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kosmos.member.student.dao.KosmosMemberDAO;
import com.kosmos.member.student.vo.KosmosMemberVO;

@Service
@Transactional
public class KosmosMemberServiceImpl implements KosmosMemberService {
	Logger logger = Logger.getLogger(KosmosMemberServiceImpl.class);
	
	private KosmosMemberDAO kosmosMemberDAO;
	
	@Autowired(required=false)
	public KosmosMemberServiceImpl(KosmosMemberDAO kosmosMemberDAO) {
		this.kosmosMemberDAO = kosmosMemberDAO;
	}


	@Override
	public int memberInsert(KosmosMemberVO mvo) {
		// TODO Auto-generated method stub
		logger.info("KosmoMemberServiceImpl memberInsert() 함수 진입 >>> : ");
		return kosmosMemberDAO.memberInsert(mvo);
	}

	@Override
	public int memberUpdate(KosmosMemberVO mvo) {
		// TODO Auto-generated method stub
		logger.info("KosmoMemberServiceImpl memberUpdate() 함수 진입 >>> : ");
		return kosmosMemberDAO.memberUpdate(mvo);
	}

	@Override
	public List<KosmosMemberVO> memberIdCheck(KosmosMemberVO mvo) {
		// TODO Auto-generated method stub
		logger.info("KosmoMemberServiceImpl memberIdCheck() 함수 진입 >>> : ");
		return kosmosMemberDAO.memberIdCheck(mvo);
	}
}
