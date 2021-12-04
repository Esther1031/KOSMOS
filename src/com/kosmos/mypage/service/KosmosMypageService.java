package com.kosmos.mypage.service;

import java.util.List;

import com.kosmos.login.vo.KosmosLoginVO;
import com.kosmos.mypage.vo.KosmosMypageVO;

public interface KosmosMypageService {
	
	public List<KosmosMypageVO> selectStudentData(KosmosLoginVO lvo);
	public List<KosmosMypageVO> selectTeacherData(KosmosLoginVO lvo);

	public int updateStudentInfo(KosmosMypageVO mvo);
	public int updateTeacherInfo(KosmosMypageVO mvo);
	
}
