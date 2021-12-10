package com.kosmos.common.service;


import com.kosmos.board.vo.KosmosBoardVO;
import com.kosmos.member.student.vo.KosmosMemberVO;
import com.kosmos.member.teacher.vo.KosmosTeacherVO;
import com.kosmos.rboard.vo.KosmosRboardVO;

public interface ChabunService {

	public KosmosMemberVO getMemChabun();
	public KosmosTeacherVO getTeacherChabun();
	public KosmosBoardVO getBoardChabun();
	public KosmosRboardVO getRboardChabun();
	
}

