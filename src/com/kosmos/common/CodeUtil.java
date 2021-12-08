package com.kosmos.common;

public class CodeUtil {

	// 성별 라벨
	public static final String[] gen_value = {"여자","남자"};
	
	// 핸드폰 라벨
	public static final String[] cp_value = {"010", "011", "016", "017"};
		
	
	// 생년월일 
	public static String birth(String s) {

		String s0 = "";
		String s1 = "";
		String s2 = "";
		String ss = "";
		
		if (s !=null && s.length() > 0){			
			int sLen = s.length();			
			if (8 == sLen) {
				s0 = s.substring(0, 4);
				s1 = s.substring(4, 6);
				s2 = s.substring(6);				
				ss = s0 + "-" + s1 + "-" + s2;
			}
		}		
		return ss;
	}
	
	// 전화번호 
	public static String tel(String s) {

		String s0 = "";
		String s1 = "";
		String s2 = "";
		String ss = "";
		
		if (s !=null && s.length() > 0){			
			int sLen = s.length();			
			if (10 == sLen) {
				s0 = s.substring(0, 2);
				s1 = s.substring(2, 6);
				s2 = s.substring(6);
				ss = s0 + "-" + s1 + "-" + s2;
			}		
			if (11 == sLen) {
				s0 = s.substring(0, 3);
				s1 = s.substring(3, 7);
				s2 = s.substring(7);
				ss = s0 + "-" + s1 + "-" + s2;
			}
		}
		return ss;
	}
	
	// 성별
	public static String gen(String s) {
		return "01".equals(s.toUpperCase()) ? "여자" : "남자";

	}	
		
	public static void main(String args[]) {
		
		// 생년월일
		String b = CodeUtil.birth("20210801");		
		System.out.println("b >>> : " + b);
		
		// 핸드폰
		String cp = CodeUtil.tel("01012341234");		
		System.out.println("cp >>> : " + cp);		
		
		// 성별
		String g = CodeUtil.gen("02");
		System.out.println("g >>> : " + g);
	}	
}
