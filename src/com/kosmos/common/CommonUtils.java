package com.kosmos.common;

public abstract class CommonUtils {
	

	// ================================================================================ //
	// 회원가입 MEMBER
	// ================================================================================ //
	// 회원가입 학생
	public static final String MEMBER_IMG_UPLOAD_PATH = "C:\\Users\\user\\Desktop\\el_finish_work\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\KOSMOS\\fileupload\\member";	// 접속 환경에서 개별 세팅
	public static final int MEMBER_IMG_FILE_SIZE = 2*1024*1024; // 2MB
	public static final String MEMBER_EN_CODE = "UTF-8";
	
	// 회원가입 선생님
	public static final String TEACHER_IMG_UPLOAD_PATH = "C:\\Users\\user\\Desktop\\el_finish_work\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\KOSMOS\\fileupload\\member";	// 접속 환경에서 개별 세팅
	public static final int TEACHER_IMG_FILE_SIZE = 2*1024*1024; // 2MB
	public static final String TEACHER_EN_CODE = "UTF-8";


	// ================================================================================ //
	// 과목 정보 SUBJECT
	// ================================================================================ //
	// 과목정보 게시판 페이징 
	public static final int SUBJECT_PAGE_SIZE = 10;
	public static final int SUBJECT_GROUP_SIZE = 5;
	public static final int SUBJECT_CUR_PAGE = 1;
	public static final int SUBJECT_TOTAL_COUNT = 0;


	private static final String[] grade_value = {" - ", "1", "2", "3", "전"};
	private static final String[] day_value = {" - ", "월", "화", "수", "목", "금"};
	private static final String[] time_value = {" - ", "1", "2", "3", "4", "5", "6", "7", "8"};
	private static final String[] semester_value = {" - ", "1", "2", "전"};
	private static final String[] beforename_value = {"직접입력", "물리학1", "생명과학1", "수학1", "영어1", "일본어1", "중국어1", "화학1", "한문1"};
	private static final String[] group_value = {" - ", "국어", "수학", "영어", "한국사", "사회", "과학", "체육", "교양", "생활", "진로"};
	
	// 화면에 표현하는 역할
	public static String frontToDB(String[] arrayS) {
		String resultF = "";
		int arraySlen = arrayS.length;
		
		for (int i=0; i < arraySlen; i++) {
			if (i < arraySlen) {
				resultF += arrayS[i] + ",";
			}
		}
//		System.out.println("CommonUtils : resultF >>> " + resultF);
		return resultF;
	}	
	
	// DB에서 불러오는 역할
	public static String dBToFront(String s, String[] arrayS) {
		String resultD = "";
		int i = 0;
		i = Integer.parseInt(s);
		
		if (i > 0) {
			resultD += arrayS[i];
		}
//		System.out.println("CommonUtils : resultD >>> " + resultD);
		return resultD;
	}
	
	// 학년들 : 화면에 표현하는 역할
	public static String gradeFrontToDB() {
		return CommonUtils.frontToDB(grade_value);
	}
	
	// 요일 : 화면에 표현하는 역할
	public static String dayFrontToDB() {
		return CommonUtils.frontToDB(day_value);
	}
	
	// 수업교시들 : 화면에 표현하는 역할
	public static String timeFrontToDB() {
		return CommonUtils.frontToDB(time_value);
	}
	
	// 학기들 : 화면에 표현하는 역할
	public static String semesterFrontToDB() {
		return CommonUtils.frontToDB(semester_value);
	}
	
	// 선수과목명 : 화면에 표현하는 역할
	public static String beforenameFrontToDB() {
		return CommonUtils.frontToDB(beforename_value);
	}
	
	// 교과군 : 화면에 표현하는 역할
	public static String groupFrontToDB() {
		return CommonUtils.frontToDB(group_value);
	}
	
	//	  학년 : DB에서 data 1개를 숫자로 받았을 때, 화면에 표현되는 값으로 바꿔주기 위한 과정
	//		s = 4 > g = grade_value[4-1]
	public static String gradeDBToFront(String s) {
		return CommonUtils.dBToFront(s, grade_value);
	}
	
	public static String groupDBToFront(String s) {
		return CommonUtils.dBToFront(s, group_value);
	}
	
	public static String semesterDBToFront(String s) {
		return CommonUtils.dBToFront(s, semester_value);
	}
	
	public static void main(String[] args) {
//		CommonUtils.gradeFrontToDB();
//		CommonUtils.gradeDBToFront("4");
//		CommonUtils.dBToFront("03", group_value);
		CommonUtils.semesterDBToFront("3");
//		CommonUtils.beforenameFrontToDB();
//		CommonUtils.dayFrontToDB();
//		CommonUtils.timeFrontToDB();
//		CommonUtils.consDBToFront("4", grade_value);
	}
	
	
	// ================================================================================ //
	// 코스모스 숲 BOARD
	// ================================================================================ //
	// 경로 확인 
	// C:\00.KOSMO93\30.Web\el_kosmos_work\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\kosmos\fileupload\board
	//public static final String BOARD_IMG_UPLOAD_PATH = "C:\\00.KOSMO93_LJH\\30.Web\\el_kosmos_work\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\kosmos\\fileupload\\board";
	public static final String BOARD_IMG_UPLOAD_PATH = "C:\\Users\\user\\Desktop\\el_finish_work\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\KOSMOS\\fileupload\\board";
	public static final int BOARD_IMG_FILE_SIZE = 2*1024*1024; // 2MB
	public static final String BOARD_EN_CODE = "UTF-8";
	
	// 게시판 목록 페이징 
	public static final int BOARD_PAGE_SIZE = 5;
	public static final int BOARD_GROUP_SIZE = 5;
	public static final int BOARD_CUR_PAGE = 1;
	public static final int BOARD_TOTAL_COUNT = 0;

	
	// ================================================================================ //
	// 공지사항 NOTICE
	// ================================================================================ //

	// 파일(이미지) 업로드(경로 다시 설정해야 함.)
	public static final String NOTICE_IMG_UPLOAD_PATH = "C:\\Users\\user\\Desktop\\el_finish_work\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\KOSMOS\\fileupload\\notice";

	// 파일(이미지) 업로드(경로 이클립스마다 계속 다시 설정해야 함.)
	//public static final String NOTICE_IMG_UPLOAD_PATH = "C:\\Users\\user\\Desktop\\el_finish_work\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\KOSMOS\\fileupload\\notice";

	public static final int NOTICE_IMG_FILE_SIZE = 2*1024*1024; // 2MB
	public static final String NOTICE_EN_CODE = "UTF-8";
	
	// 공지사항 목록 페이징 
	public static final int NOTICE_PAGE_SIZE = 10;		// 한 페이지에 보이는 게시글 수
	public static final int NOTICE_GROUP_SIZE = 10;		// 그룹 크기
	public static final int NOTICE_CUR_PAGE = 1;		// 현재 페이지
	public static final int NOTICE_TOTAL_COUNT = 0;		// 전체 게시물 개수
	
}
