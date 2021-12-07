package com.kosmos.member.student.dao;

import java.util.List;

import com.kosmos.member.student.vo.KosmosMemberVO;

public interface KosmosMemberDAO {

	public int memberInsert(KosmosMemberVO mvo);
	public int memberUpdate(KosmosMemberVO mvo);
	
	// 아이디 중복 체크 
	public List<KosmosMemberVO> memberIdCheck(KosmosMemberVO mvo);
	
}