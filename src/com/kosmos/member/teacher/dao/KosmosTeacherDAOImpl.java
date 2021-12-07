package com.kosmos.member.teacher.dao;

import java.util.List;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kosmos.member.teacher.dao.KosmosTeacherDAOImpl;
import com.kosmos.member.teacher.vo.KosmosTeacherVO;

@Repository
public class KosmosTeacherDAOImpl implements KosmosTeacherDAO {

	Logger logger = Logger.getLogger(KosmosTeacherDAOImpl.class);
	
	@Autowired(required=false)
	private SqlSessionTemplate sqlSession;

	@Override
	public int teacherInsert(KosmosTeacherVO mvo) {
		// TODO Auto-generated method stub
		return (Integer)sqlSession.insert("teacherInsert", mvo);
	}

	@Override
	public int teacherUpdate(KosmosTeacherVO mvo) {
		// TODO Auto-generated method stub
		return (Integer)sqlSession.update("teacherUpdate", mvo);
	}


	@Override
	public List<KosmosTeacherVO> teacherIdCheck(KosmosTeacherVO mvo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("teacherIdCheck", mvo);
	}

}
