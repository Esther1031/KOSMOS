package com.kosmos.login.vo;

public class KosmosLoginVO {
	
	// ===============================================================================
	// Variables
	// ===============================================================================	
	
	// 선생 회원가입시 : 인증키
	private String authenticationkey;

	// 로그인, 아이디, 비번 찾기시 
	// 선택하는 유형  : 학생 [01], 선생[02]
	private String chkbox;
	
	// 로그인시 : 아이디(e-mail형태), 패스워드
	private String mid;
	private String mpw;
	
	// 아이디 찾기시 : 이름, 생년월일(아이디찾기용 / 비밀번호찾기용)
	private String mname;
	private String mbirthId;
	private String mbirthPw;
	
	// 비밀번호 찾기시 : 휴대폰번호
	private String mcp;
	
	// 학생 로그인시 수강신청으로 보내는(DB에서 바인딩 받는) 데이터 : 학생 아이디, 학생 비번, 회원 번호
	private String MS_ID;
	private String MS_PW;
	private String MS_NUM;
	
	// 선생 로그인시 수강신청으로 보내는(DB에서 바인딩 받는) 데이터 : 선생 아이디, 선생 비번, 회원 번호
	private String MT_ID;
	private String MT_PW;	
	private String MT_NUM;
	
	
	// 아이디 찾기시 DB에서 바인딩 받는 데이터 : 학생  
	private String MS_NAME;
	private String MS_BIRTH;
	
	// 아이디 찾기시 DB에서 바인딩 받는 데이터 : 선생
	private String MT_NAME;
	private String MT_BIRTH;
		
	// 비밀번호 찾기시 DB에서 바인딩 받는 데이터 : 학생
	private String MS_CP;
	
	// 비밀번호 찾기시 DB에서 바인딩 받는 데이터 : 선생
	private String MT_CP;
		
	 
	// ===============================================================================
	// Cunstructor & Overloading
	// ===============================================================================	
	
	// 기본 생성자
	public KosmosLoginVO(){
		
	}

	// 선생 인증확인용 : 인증키
	public KosmosLoginVO(String authenticationkey) {
		this.authenticationkey = authenticationkey;
	}
	
	// 로그인용 : 아이디, 비밀번호
	public KosmosLoginVO(String mid, String mpw) {
		this.mid = mid;
		this.mpw = mpw;
	}

	// 아이디 찾기용 : 회원유형, 이름, 생년월일
	public KosmosLoginVO(String chkbox, String mname, String mbirthId) {
		this.chkbox = chkbox;
		this.mname = mname;
		this.mbirthId = mbirthId;
	}

	// 비밀번호 찾기용 : 회원유형, 아이디, 생년월일, 휴대폰번호
	public KosmosLoginVO(String chkbox, String mid, String mbirthPw, String mcp) {
		this.chkbox = chkbox;
		this.mid = mid;
		this.mbirthPw = mbirthPw;
		this.mcp = mcp;
	}
	
	
	// ===============================================================================
	// Getter & Setter
	// ===============================================================================	
	
	public String getAuthenticationkey() {
		return authenticationkey;
	}

	public String getChkbox() {
		return chkbox;
	}

	public String getMid() {
		return mid;
	}

	public String getMpw() {
		return mpw;
	}

	public String getMname() {
		return mname;
	}

	public String getMbirthId() {
		return mbirthId;
	}

	public String getMbirthPw() {
		return mbirthPw;
	}

	public String getMcp() {
		return mcp;
	}

	public String getMS_ID() {
		return MS_ID;
	}

	public String getMS_PW() {
		return MS_PW;
	}

	public String getMS_NUM() {
		return MS_NUM;
	}

	public String getMT_ID() {
		return MT_ID;
	}

	public String getMT_PW() {
		return MT_PW;
	}

	public String getMT_NUM() {
		return MT_NUM;
	}

	public String getMS_NAME() {
		return MS_NAME;
	}

	public String getMS_BIRTH() {
		return MS_BIRTH;
	}

	public String getMT_NAME() {
		return MT_NAME;
	}

	public String getMT_BIRTH() {
		return MT_BIRTH;
	}

	public String getMS_CP() {
		return MS_CP;
	}

	public String getMT_CP() {
		return MT_CP;
	}

	public void setAuthenticationkey(String authenticationkey) {
		this.authenticationkey = authenticationkey;
	}

	public void setChkbox(String chkbox) {
		this.chkbox = chkbox;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public void setMpw(String mpw) {
		this.mpw = mpw;
	}

	public void setMname(String mname) {
		this.mname = mname;
	}

	public void setMbirthId(String mbirthId) {
		this.mbirthId = mbirthId;
	}

	public void setMbirthPw(String mbirthPw) {
		this.mbirthPw = mbirthPw;
	}

	public void setMcp(String mcp) {
		this.mcp = mcp;
	}

	public void setMS_ID(String mS_ID) {
		MS_ID = mS_ID;
	}

	public void setMS_PW(String mS_PW) {
		MS_PW = mS_PW;
	}

	public void setMS_NUM(String mS_NUM) {
		MS_NUM = mS_NUM;
	}

	public void setMT_ID(String mT_ID) {
		MT_ID = mT_ID;
	}

	public void setMT_PW(String mT_PW) {
		MT_PW = mT_PW;
	}

	public void setMT_NUM(String mT_NUM) {
		MT_NUM = mT_NUM;
	}

	public void setMS_NAME(String mS_NAME) {
		MS_NAME = mS_NAME;
	}

	public void setMS_BIRTH(String mS_BIRTH) {
		MS_BIRTH = mS_BIRTH;
	}

	public void setMT_NAME(String mT_NAME) {
		MT_NAME = mT_NAME;
	}

	public void setMT_BIRTH(String mT_BIRTH) {
		MT_BIRTH = mT_BIRTH;
	}

	public void setMS_CP(String mS_CP) {
		MS_CP = mS_CP;
	}

	public void setMT_CP(String mT_CP) {
		MT_CP = mT_CP;
	}
	

	// ===============================================================================
	// Function : printVO()
	// ===============================================================================

	public static void printVO(KosmosLoginVO lvo) {
		
		// 로그인시 바인딩된 데이터 출력  
		System.out.println("\n===========LoginVO 변수 바인딩 현황=============\n");
		System.out.println("입력된 Authentication key >>> : " + lvo.getAuthenticationkey());
		System.out.println("입력된 mid >>> : " + lvo.getMid());
		System.out.println("입력된 loginPw >>> : " + lvo.getMpw());
		System.out.println("입력된 chkbox >>> : " + lvo.getChkbox());
		System.out.println("DB에서 받아온 학생ID lvo.getMS_ID() >>> : " + lvo.getMS_ID());
		System.out.println("DB에서 받아온 학생ID lvo.getMS_PW() >>> : " + lvo.getMS_PW());
		System.out.println("DB에서 받아온 학생ID lvo.getMS_NUM() >>> : " + lvo.getMS_NUM());
		System.out.println("DB에서 받아온 선생ID lvo.getMT_ID() >>> : " + lvo.getMT_ID());
		System.out.println("DB에서 받아온 선생ID lvo.getMT_PW() >>> : " + lvo.getMT_PW());
		System.out.println("DB에서 받아온 선생ID lvo.getMT_NUM() >>> : " + lvo.getMT_NUM());
		System.out.println("\n============================================\n");

	}
	
}
