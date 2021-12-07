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
}
