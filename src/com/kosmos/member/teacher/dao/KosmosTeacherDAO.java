package com.kosmos.member.teacher.dao;

import java.util.List;

import com.kosmos.member.teacher.vo.KosmosTeacherVO;

public interface KosmosTeacherDAO {

	public int teacherInsert(KosmosTeacherVO mvo);
	public int teacherUpdate(KosmosTeacherVO mvo);

	// 아이디 중복 체크 
	public List<KosmosTeacherVO> teacherIdCheck(KosmosTeacherVO mvo);
}