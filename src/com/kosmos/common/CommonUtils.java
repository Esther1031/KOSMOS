package com.kosmos.common;

public abstract class CommonUtils {
	
	
	// 회원가입 학생
	public static final String MEMBER_IMG_UPLOAD_PATH = "C:\\00.KOSMO93_JJH\\a";	//
	public static final int MEMBER_IMG_FILE_SIZE = 2*1024*1024; // 2MB
	public static final String MEMBER_EN_CODE = "UTF-8";
	
	// 회원가입 선생님
	public static final String TEACHER_IMG_UPLOAD_PATH = "C:\\00.KOSMO93_JJH\\a";	//
	public static final int TEACHER_IMG_FILE_SIZE = 2*1024*1024; // 2MB
	public static final String TEACHER_EN_CODE = "UTF-8";

	// 게시판 목록 페이징
	public static final int BOARD_PAGE_SIZE = 5;
	public static final int BOARD_GROUP_SIZE = 3;
	public static final int BOARD_CUR_PAGE = 0;
	public static final int BOARD_TOTAL_COUNT = 0;

	// 과목정보 게시판 페이징 
	public static final int SUBJECT_PAGE_SIZE = 5;
	public static final int SUBJECT_GROUP_SIZE = 3;
	public static final int SUBJECT_CUR_PAGE = 1;
	public static final int SUBJECT_TOTAL_COUNT = 0;
}
