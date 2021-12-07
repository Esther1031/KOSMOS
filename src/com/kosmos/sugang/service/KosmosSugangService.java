package com.kosmos.sugang.service;

import java.util.HashMap;
import java.util.List;



import com.kosmos.sugang.vo.KosmosSugangListVO;
import com.kosmos.sugang.vo.KosmosSugangSubjectVO;


public interface KosmosSugangService {
	
	public List<KosmosSugangSubjectVO> subjectSelectAll(KosmosSugangSubjectVO vo);
	public int sugangListInsert(KosmosSugangListVO vo);
	public List<KosmosSugangListVO>sugangListSelect(KosmosSugangListVO vo);
	public List<KosmosSugangListVO>sugangListSelectGroup(HashMap<String, String> map);
	public int sugangListUpdateOne(HashMap<String, String> map);
	public List<KosmosSugangListVO>sugangSelectAll(KosmosSugangListVO vo);
	public int sugangListUpdateList(HashMap<String, String> map); 
	public int sugangOldListInsert(KosmosSugangListVO vo);
	public List<KosmosSugangListVO>sugangOldlistSelectAll(KosmosSugangListVO vo);
	
}
