package com.kosmos.common.dao;


import com.kosmos.member.student.vo.KosmosMemberVO;
import com.kosmos.member.teacher.vo.KosmosTeacherVO;

public interface ChabunDAO {

	public KosmosMemberVO getMemChabun();
	public KosmosTeacherVO getTeacherChabun();
	
}
