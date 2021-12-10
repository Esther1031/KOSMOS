package com.kosmos.common;

public abstract class ChabunUtil {

	public static final String BIZ_GUBUN_S	= "S"; // 
	public static final String BIZ_GUBUN_T 	= "T"; // 
	public static final String BIZ_GUBUN_RB = "RB"; // 
	public static final String BIZ_GUBUN_N 	= "NB"; // 
	public static final String BIZ_GUBUN_B 	= "B"; // 
	
	
	// type : D : 20210001, M : YYYYMM, Y : YYYY, N : 
	public static String numPad(String t, String c){
	
		for (int i=c.length(); i < 4; i++) {
			c = "0" + c;
		}				
		String ymd = DateFormatUtil.ymdFormats(t);
		
		return ymd.concat(c);
	}
	
	public static String tnumPad(String t, String c){
		
		for (int i=c.length(); i < 4; i++) {
			c = "0" + c;
		}				
		String ymd = DateFormatUtil.ymdFormats(t);
		
		return ymd.concat(c);
	}
	
	 
	public static String getMemChabun(String type, String memNum) {
		
		return BIZ_GUBUN_S.concat(ChabunUtil.numPad(type, memNum));
	}
	
	
	public static String getTeacherChabun(String type, String memNum) {
		
		return BIZ_GUBUN_T.concat(ChabunUtil.tnumPad(type, memNum));
	}
	
	// 게시판 댓글 글 번호
		public static String getRboardChabun(String type, String memNum) {
			
			return BIZ_GUBUN_RB.concat(ChabunUtil.numPad(type, memNum));
		}
		
		// 게시판 글 번호
		public static String getBoardChabun(String type, String memNum) {
			
			return BIZ_GUBUN_B.concat(ChabunUtil.numPad(type, memNum));
		}
	
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		String c = "1";
		System.out.println(">>> : " + ChabunUtil.getMemChabun("m", c));
		System.out.println(">>> : " + ChabunUtil.getTeacherChabun("N", c));
		System.out.println(">>> : " + ChabunUtil.getBoardChabun("N", c));
		System.out.println(">>> : " + ChabunUtil.getRboardChabun("N", c));
	}
}
