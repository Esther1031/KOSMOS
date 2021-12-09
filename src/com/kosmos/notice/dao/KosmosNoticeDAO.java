package com.kosmos.notice.dao;

import java.util.List;

import com.kosmos.login.vo.KosmosLoginVO;
import com.kosmos.notice.vo.KosmosNoticeVO;

public interface KosmosNoticeDAO {

	// 게시글 작성
	public int noticeInsert(KosmosNoticeVO nvo);
	// 목록 조회
	public List<KosmosNoticeVO> noticeList(KosmosNoticeVO nvo);
	

	// 게시글 상세 조회
	public KosmosNoticeVO noticeSelect(KosmosNoticeVO nvo);
	// 조회수 증가
	public void updateCntHit(String no_num);


	// 게시글 수정
	public int noticeUpdate(KosmosNoticeVO nvo);
	// 게시글 삭제
	public int noticeDelete(KosmosNoticeVO nvo);
	
	
	// 회원 테이블에서 회원 정보 조회 =================================== //	
	// 교사 회원 이름, 아이디 조회
	public List<KosmosNoticeVO> checkTeacher(KosmosLoginVO lvo);
	// 학생 회원 이름, 아이디 조회
	public List<KosmosNoticeVO> checkStudent(KosmosLoginVO lvo);

	
}
