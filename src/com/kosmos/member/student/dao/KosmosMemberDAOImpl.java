package com.kosmos.member.student.dao;

import java.util.List;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kosmos.member.student.vo.KosmosMemberVO;

@Repository
public class KosmosMemberDAOImpl implements KosmosMemberDAO {
	Logger logger = Logger.getLogger(KosmosMemberDAOImpl.class);
	
	@Autowired(required=false)
	private SqlSessionTemplate sqlSession;

	@Override
	public int memberInsert(KosmosMemberVO mvo) {
		// TODO Auto-generated method stub
		return (Integer)sqlSession.insert("memberInsert", mvo);
	}

	@Override
	public int memberUpdate(KosmosMemberVO mvo) {
		// TODO Auto-generated method stub
		return (Integer)sqlSession.update("memberUpdate", mvo);
	}


	@Override
	public List<KosmosMemberVO> memberIdCheck(KosmosMemberVO mvo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("memberIdCheck", mvo);
	}

}
