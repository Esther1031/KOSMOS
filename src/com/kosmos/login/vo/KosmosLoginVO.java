package com.kosmos.login.vo;

public class KosmosLoginVO {
	
	// ===============================================================================
	// Variables
	// ===============================================================================	
	
	// 교사 회원가입시 : 인증키
	private String authenticationkey;

	// 회원 로그인, 아이디, 비밀번호 찾기시 
	// 선택하는 유형  : 학생 [01], 교사[02]
	private String login_type;
	
	// 회원 로그인시 입력하는 아이디(e-mail형태), 패스워드
	private String login_id;		
	private String login_pw;
	
	// 회원 아이디 찾기시 입력하는 이름, 생년월일(아이디찾기용 / 비밀번호찾기용)
	private String mname;
	private String mbirthId;
	private String mbirthPw;
	
	// 회원 비밀번호 찾기시 : 휴대폰번호
	private String mcp;
	
	// 학생 로그인시  DB의 학생 테이블에서 조회해온 데이터 : 학생 아이디, 학생 비번, 회원 번호
	private String ms_id;
	private String ms_pw;
	private String ms_num;
	
	// 교사 로그인시  DB의 교사 테이블에서 조회해온 데이터 : 교사 아이디, 교사 비번, 회원 번호
	private String mt_id;
	private String mt_pw;	
	private String mt_num;
	
	
	// 아이디 찾기시 DB의 학생 테이블에서 조회해온 데이터 : 학생 이름, 학생 생년월일  
	private String ms_name;
	private String ms_birth;
	
	// 아이디 찾기시 DB의 교사 테이블에서 조회해온 데이터 : 교사 이름, 교사 생년월일  
	private String mt_name;
	private String mt_birth;
		
	// 비밀번호 찾기시 DB의 학생 테이블에서 조회해온 데이터 : 학생 휴대폰 번호  
	private String ms_cp;
	
	// 비밀번호 찾기시 DB의 교사 테이블에서 조회해온 데이터 : 교사 휴대폰 번호  
	private String mt_cp;
		
	 
	// ===============================================================================
	// Cunstructor + Overloading
	// ===============================================================================	
	
	// 기본 생성자
	public KosmosLoginVO(){
		
	}

	// 교사 인증확인용 : 인증키
	public KosmosLoginVO(String authenticationkey) {
		this.authenticationkey = authenticationkey;
	}
	
	public KosmosLoginVO(String authenticationkey, String login_type, String login_id, String login_pw, String mname,
			String mbirthId, String mbirthPw, String mcp, String ms_id, String ms_pw, String ms_num, String mt_id,
			String mt_pw, String mt_num, String ms_name, String ms_birth, String mt_name, String mt_birth, String ms_cp,
			String mt_cp) {

		this.authenticationkey = authenticationkey;
		this.login_type = login_type;
		this.login_id = login_id;
		this.login_pw = login_pw;
		this.mname = mname;
		this.mbirthId = mbirthId;
		this.mbirthPw = mbirthPw;
		this.mcp = mcp;
		this.ms_id = ms_id;
		this.ms_pw = ms_pw;
		this.ms_num = ms_num;
		this.mt_id = mt_id;
		this.mt_pw = mt_pw;
		this.mt_num = mt_num;
		this.ms_name = ms_name;
		this.ms_birth = ms_birth;
		this.mt_name = mt_name;
		this.mt_birth = mt_birth;
		this.ms_cp = ms_cp;
		this.mt_cp = mt_cp;
	}

	
	// ===============================================================================
	// Getter & Setter
	// ===============================================================================	
	
	public String getAuthenticationkey() {
		return authenticationkey;
	}

	
	public void setAuthenticationkey(String authenticationkey) {
		this.authenticationkey = authenticationkey;
	}

	public String getLogin_type() {
		return login_type;
	}

	public void setLogin_type(String login_type) {
		this.login_type = login_type;
	}

	public String getLogin_id() {
		return login_id;
	}

	public void setLogin_id(String login_id) {
		this.login_id = login_id;
	}

	public String getLogin_pw() {
		return login_pw;
	}

	public void setLogin_pw(String login_pw) {
		this.login_pw = login_pw;
	}

	public String getMname() {
		return mname;
	}

	public void setMname(String mname) {
		this.mname = mname;
	}

	public String getMbirthId() {
		return mbirthId;
	}

	public void setMbirthId(String mbirthId) {
		this.mbirthId = mbirthId;
	}

	public String getMbirthPw() {
		return mbirthPw;
	}

	public void setMbirthPw(String mbirthPw) {
		this.mbirthPw = mbirthPw;
	}

	public String getMcp() {
		return mcp;
	}

	public void setMcp(String mcp) {
		this.mcp = mcp;
	}

	public String getMs_id() {
		return ms_id;
	}

	public void setMs_id(String ms_id) {
		this.ms_id = ms_id;
	}

	public String getMs_pw() {
		return ms_pw;
	}

	public void setMs_pw(String ms_pw) {
		this.ms_pw = ms_pw;
	}

	public String getMs_num() {
		return ms_num;
	}

	public void setMs_num(String ms_num) {
		this.ms_num = ms_num;
	}

	public String getMt_id() {
		return mt_id;
	}

	public void setMt_id(String mt_id) {
		this.mt_id = mt_id;
	}

	public String getMt_pw() {
		return mt_pw;
	}

	public void setMt_pw(String mt_pw) {
		this.mt_pw = mt_pw;
	}

	public String getMt_num() {
		return mt_num;
	}

	public void setMt_num(String mt_num) {
		this.mt_num = mt_num;
	}

	public String getMs_name() {
		return ms_name;
	}

	public void setMs_name(String ms_name) {
		this.ms_name = ms_name;
	}

	public String getMs_birth() {
		return ms_birth;
	}

	public void setMs_birth(String ms_birth) {
		this.ms_birth = ms_birth;
	}

	public String getMt_name() {
		return mt_name;
	}

	public void setMt_name(String mt_name) {
		this.mt_name = mt_name;
	}

	public String getMt_birth() {
		return mt_birth;
	}

	public void setMt_birth(String mt_birth) {
		this.mt_birth = mt_birth;
	}

	public String getMs_cp() {
		return ms_cp;
	}

	public void setMs_cp(String ms_cp) {
		this.ms_cp = ms_cp;
	}

	public String getMt_cp() {
		return mt_cp;
	}

	public void setMt_cp(String mt_cp) {
		this.mt_cp = mt_cp;
	}

	
	// ===============================================================================
	// Function : printVO()
	// ===============================================================================
	
	public static void printVO(KosmosLoginVO lvo) {
		
		// 로그인시 바인딩된 데이터 출력  
		System.out.println("\n===========LoginVO 변수 바인딩 현황=============\n");
		System.out.println("입력된 Authentication key >>> : " + lvo.getAuthenticationkey());
		System.out.println("입력된 login_id >>> : " + lvo.getLogin_id());
		System.out.println("입력된 login_Pw >>> : " + lvo.getLogin_pw());
		System.out.println("입력된 login_type >>> : " + lvo.getLogin_type());
		System.out.println("DB에서 받아온 학생ID lvo.getMs_id() >>> : " + lvo.getMs_id());
		System.out.println("DB에서 받아온 학생ID lvo.getMs_pw() >>> : " + lvo.getMs_pw());
		System.out.println("DB에서 받아온 학생ID lvo.getMs_num() >>> : " + lvo.getMs_num());
		System.out.println("DB에서 받아온 교사ID lvo.getMt_id() >>> : " + lvo.getMt_id());
		System.out.println("DB에서 받아온 교사ID lvo.getMt_pw() >>> : " + lvo.getMt_pw());
		System.out.println("DB에서 받아온 교사ID lvo.getMt_num() >>> : " + lvo.getMt_num());
		System.out.println("\n============================================\n");

	}
	
}
