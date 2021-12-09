package com.kosmos.subject.dao;

import java.util.List;

// import com.kosmos.member.vo.KosmosMemberVO;
import com.kosmos.subject.vo.KosmosSubjectVO;

public interface KosmosSubjectDAO {

	public List<KosmosSubjectVO> subjectSelectAll(KosmosSubjectVO svo);
	public List<KosmosSubjectVO> subjectSelect(KosmosSubjectVO svo);
//	public List<KosmosSubjectVO> subjectAdminCheck(KosmosMemberVO mvo);
	public int subjectInsert(KosmosSubjectVO svo);
	public int subjectUpdate(KosmosSubjectVO svo);
	public int subjectDelete(KosmosSubjectVO svo);
	
	// 선수과목명 리스트
	public List<KosmosSubjectVO> beforeNameList();
	// 채번
	public KosmosSubjectVO subjectChabun(KosmosSubjectVO svo);
	// 코드번호 호출
	public KosmosSubjectVO subjectCallCode(KosmosSubjectVO svo);
	// 과목정보 필수 
	public List<KosmosSubjectVO> subjectSelectEssential(KosmosSubjectVO svo);
	// 과목정보 선택
	public List<KosmosSubjectVO> subjectSelectChoice(KosmosSubjectVO svo);
}
