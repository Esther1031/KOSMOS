package com.kosmos.login.dao;

import java.util.List;

import com.kosmos.login.vo.KosmosLoginVO;

public interface KosmosLoginDAO {

	// 로그인
	public List<KosmosLoginVO> checkIdPwStudent(KosmosLoginVO lvo);
	public List<KosmosLoginVO> checkIdPwTeacher(KosmosLoginVO lvo);
	// 로그아웃

	// 회원가입
	
	// 아이디 / 비밀번호 찾기 (loginForm.jsp)
	
	// 아이디 찾기 (학생, 교사)
	public List<KosmosLoginVO> findIdStudent(KosmosLoginVO lvo);
	public List<KosmosLoginVO> findIdTeacher(KosmosLoginVO lvo);

	
	// 비밀번호 찾기 (학생, 교사)
	public List<KosmosLoginVO> findPwStudent(KosmosLoginVO lvo);
	public List<KosmosLoginVO> findPwTeacher(KosmosLoginVO lvo);

	
	
}
