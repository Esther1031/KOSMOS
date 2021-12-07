package com.kosmos.subject.service;

import java.util.List;

import com.kosmos.subject.vo.KosmosSubjectVO;

public interface KosmosSubjectService {

	public List<KosmosSubjectVO> subjectSelectAll(KosmosSubjectVO svo);
	public List<KosmosSubjectVO> subjectSelect(KosmosSubjectVO svo);
	public int subjectInsert(KosmosSubjectVO svo);
	public int subjectUpdate(KosmosSubjectVO svo);
	public int subjectDelete(KosmosSubjectVO svo);
	
	// 선수과목명 리스트
	public List<KosmosSubjectVO> beforeNameList();
	// 채번
	public KosmosSubjectVO subjectChabun(KosmosSubjectVO svo);
}
