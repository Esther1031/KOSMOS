package com.kosmos.mypage.vo;

public class KosmosMypageVO {
	
	// ===============================================================================
	// DB에서 현재 로그인한 회원 정보를 비교하기 위해 만든 변수 
	// ===============================================================================
	private String mid;				// 이메일주소
	private String mnum;			// 회원번호
	
	// ===============================================================================
	// form에서 보낸 데이터 변수 담기
	// ===============================================================================
	private String stname;			// 학생 전용
	private String stmail;			// 학생 전용
	private String stcp;			// 학생 전용
	private String tename;			// 교사 전용
	private String temail;			// 교사 전용
	private String tecp;			// 교사 전용
	private String me_zipcode;		// 공통 변수
	private String me_doro;			// 공통 변수
	private String me_dorodetail;	// 공통 변수
	private String admissionyear;	// 학생 전용
	private String grade;			// 학생 전용
	private String st_class;		// 학생 전용
	private String number;			// 학생 전용
	
	
	// ===============================================================================
	// Variables : 학생이 로그인중인 경우 
	// ===============================================================================	
	 
	// 학생 아이디(이메일주소), 학생 비번, 회원 번호
	private String MS_ID;			// 1. 학생 아이디(이메일주소)
	private String MS_NAME;			// 2. 학생 이름
	private String MS_NUM;			// 3. 학생 회원 번호
	private String MS_CP;			// 4. 휴대폰 번호
	private String MS_ZIPCODE; 		// 5. 우편번호
	private String MS_DORO;   		// 6. 도로명주소
	private String MS_DORODETAIL;  	// 7. 상세주소
	private String MS_INSDATE;  	// 8. 가입일
	private String MS_GRADE;   		// 9. 학년
	private String MS_CLASS;  		// 10. 반
	private String MS_NUMBER;   	// 11. 번호
	
	
	// ===============================================================================
	// Variables : 교사가 로그인중인 경우 
	// ===============================================================================	
	 
	// 교사 로그인시  DB의 교사 테이블에서 조회해온 데이터 : 교사 아이디, 교사 비번, 회원 번호
	private String MT_ID;			// 1. 교사 아이디(이메일주소)
	private String MT_NAME;			// 2. 교사 이름
	private String MT_NUM;			// 3. 교사 회원 번호
	private String MT_CP;			// 4. 휴대폰 번호
	private String MT_ZIPCODE; 		// 5. 우편번호
	private String MT_DORO;   		// 6. 도로명주소
	private String MT_DORODETAIL;  	// 7. 상세주소
	
	
	// ===============================================================================
	// Cunstructor
	// ===============================================================================	
	
	public KosmosMypageVO() {
		
	}

	public KosmosMypageVO(String mid, String mnum, String stname, String stmail, String stcp, String tename,
			String temail, String tecp, String me_zipcode, String me_doro, String me_dorodetail, String admissionyear,
			String grade, String st_class, String number, String mS_ID, String mS_NAME, String mS_NUM, String mS_CP,
			String mS_ZIPCODE, String mS_DORO, String mS_DORODETAIL, String mS_INSDATE, String mS_GRADE,
			String mS_CLASS, String mS_NUMBER, String mT_ID, String mT_NAME, String mT_NUM, String mT_CP,
			String mT_ZIPCODE, String mT_DORO, String mT_DORODETAIL) {
		
		this.mid = mid;
		this.mnum = mnum;
		this.stname = stname;
		this.stmail = stmail;
		this.stcp = stcp;
		this.tename = tename;
		this.temail = temail;
		this.tecp = tecp;
		this.me_zipcode = me_zipcode;
		this.me_doro = me_doro;
		this.me_dorodetail = me_dorodetail;
		this.admissionyear = admissionyear;
		this.grade = grade;
		this.st_class = st_class;
		this.number = number;
		MS_ID = mS_ID;
		MS_NAME = mS_NAME;
		MS_NUM = mS_NUM;
		MS_CP = mS_CP;
		MS_ZIPCODE = mS_ZIPCODE;
		MS_DORO = mS_DORO;
		MS_DORODETAIL = mS_DORODETAIL;
		MS_INSDATE = mS_INSDATE;
		MS_GRADE = mS_GRADE;
		MS_CLASS = mS_CLASS;
		MS_NUMBER = mS_NUMBER;
		MT_ID = mT_ID;
		MT_NAME = mT_NAME;
		MT_NUM = mT_NUM;
		MT_CP = mT_CP;
		MT_ZIPCODE = mT_ZIPCODE;
		MT_DORO = mT_DORO;
		MT_DORODETAIL = mT_DORODETAIL;
	}




	// ===============================================================================
	// Getter & Setter
	// ===============================================================================	
	
	public String getMid() {
		return mid;
	}

	public String getMnum() {
		return mnum;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public void setMnum(String mnum) {
		this.mnum = mnum;
	}

	public String getMS_ID() {
		return MS_ID;
	}

	public String getMS_NAME() {
		return MS_NAME;
	}

	public String getMS_NUM() {
		return MS_NUM;
	}

	public String getMS_CP() {
		return MS_CP;
	}

	public String getMS_ZIPCODE() {
		return MS_ZIPCODE;
	}

	public String getMS_DORO() {
		return MS_DORO;
	}

	public String getMS_DORODETAIL() {
		return MS_DORODETAIL;
	}

	public String getMS_INSDATE() {
		return MS_INSDATE;
	}

	public String getMS_GRADE() {
		return MS_GRADE;
	}

	public String getMS_CLASS() {
		return MS_CLASS;
	}

	public String getMS_NUMBER() {
		return MS_NUMBER;
	}

	public String getMT_ID() {
		return MT_ID;
	}

	public String getMT_NAME() {
		return MT_NAME;
	}

	public String getMT_NUM() {
		return MT_NUM;
	}

	public String getMT_CP() {
		return MT_CP;
	}

	public String getMT_ZIPCODE() {
		return MT_ZIPCODE;
	}

	public String getMT_DORO() {
		return MT_DORO;
	}

	public String getMT_DORODETAIL() {
		return MT_DORODETAIL;
	}

	public void setMS_ID(String mS_ID) {
		MS_ID = mS_ID;
	}

	public void setMS_NAME(String mS_NAME) {
		MS_NAME = mS_NAME;
	}

	public void setMS_NUM(String mS_NUM) {
		MS_NUM = mS_NUM;
	}

	public void setMS_CP(String mS_CP) {
		MS_CP = mS_CP;
	}

	public void setMS_ZIPCODE(String mS_ZIPCODE) {
		MS_ZIPCODE = mS_ZIPCODE;
	}

	public void setMS_DORO(String mS_DORO) {
		MS_DORO = mS_DORO;
	}

	public void setMS_DORODETAIL(String mS_DORODETAIL) {
		MS_DORODETAIL = mS_DORODETAIL;
	}

	public void setMS_INSDATE(String mS_INSDATE) {
		MS_INSDATE = mS_INSDATE;
	}

	public void setMS_GRADE(String mS_GRADE) {
		MS_GRADE = mS_GRADE;
	}

	public void setMS_CLASS(String mS_CLASS) {
		MS_CLASS = mS_CLASS;
	}

	public void setMS_NUMBER(String mS_NUMBER) {
		MS_NUMBER = mS_NUMBER;
	}

	public void setMT_ID(String mT_ID) {
		MT_ID = mT_ID;
	}

	public void setMT_NAME(String mT_NAME) {
		MT_NAME = mT_NAME;
	}

	public void setMT_NUM(String mT_NUM) {
		MT_NUM = mT_NUM;
	}

	public void setMT_CP(String mT_CP) {
		MT_CP = mT_CP;
	}

	public void setMT_ZIPCODE(String mT_ZIPCODE) {
		MT_ZIPCODE = mT_ZIPCODE;
	}

	public void setMT_DORO(String mT_DORO) {
		MT_DORO = mT_DORO;
	}

	public void setMT_DORODETAIL(String mT_DORODETAIL) {
		MT_DORODETAIL = mT_DORODETAIL;
	}

	public String getStname() {
		return stname;
	}

	public String getStmail() {
		return stmail;
	}

	public String getStcp() {
		return stcp;
	}

	public String getTename() {
		return tename;
	}

	public String getTemail() {
		return temail;
	}

	public String getTecp() {
		return tecp;
	}

	public String getMe_zipcode() {
		return me_zipcode;
	}

	public String getMe_doro() {
		return me_doro;
	}

	public String getMe_dorodetail() {
		return me_dorodetail;
	}

	public String getAdmissionyear() {
		return admissionyear;
	}

	public String getGrade() {
		return grade;
	}

	public String getSt_class() {
		return st_class;
	}

	public String getNumber() {
		return number;
	}

	public void setStname(String stname) {
		this.stname = stname;
	}

	public void setStmail(String stmail) {
		this.stmail = stmail;
	}

	public void setStcp(String stcp) {
		this.stcp = stcp;
	}

	public void setTename(String tename) {
		this.tename = tename;
	}

	public void setTemail(String temail) {
		this.temail = temail;
	}

	public void setTecp(String tecp) {
		this.tecp = tecp;
	}

	public void setMe_zipcode(String me_zipcode) {
		this.me_zipcode = me_zipcode;
	}

	public void setMe_doro(String me_doro) {
		this.me_doro = me_doro;
	}

	public void setMe_dorodetail(String me_dorodetail) {
		this.me_dorodetail = me_dorodetail;
	}

	public void setAdmissionyear(String admissionyear) {
		this.admissionyear = admissionyear;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public void setSt_class(String st_class) {
		this.st_class = st_class;
	}

	public void setNumber(String number) {
		this.number = number;
	}

	
	// ===============================================================================
	// Function : printVO()
	// ===============================================================================

	public static void printVO(KosmosMypageVO mvo) {
		
		// 호출시 바인딩된 데이터 출력
		System.out.println("\n===========KosmosMypageVO 변수 바인딩 현황=============\n");
		System.out.println("1. 학생 아이디       MS_ID >>> : " + mvo.getMS_ID());
		System.out.println("2. 학생 비밀번호    MS_NAME >>> : " + mvo.getMS_NAME());
		System.out.println("3. 학생 회원번호    MS_NUM >>> : " + mvo.getMS_NUM());
		System.out.println("4. 학생 휴대폰번호 MS_CP >>> : " + mvo.getMS_CP());
		System.out.println("5. 학생 우편번호    MS_ZIPCODE >>> : " + mvo.getMS_ZIPCODE());
		System.out.println("6. 학생 도로명주소 MS_DORO >>> : " + mvo.getMS_DORO());
		System.out.println("7. 학생 상세주소    MS_DORODETAIL >>> : " + mvo.getMS_DORODETAIL());
		System.out.println("8. 학생 가입일       MS_INSDATE >>> : " + mvo.getMS_INSDATE());
		System.out.println("9. 학생 학년   	   MS_GRADE >>> : " + mvo.getMS_GRADE());
		System.out.println("10. 학생 반   	   MS_CLASS >>> : " + mvo.getMS_CLASS());
		System.out.println("11. 학생 번호   	   MS_NUMBER >>> : " + mvo.getMS_NUMBER());
		System.out.println("\n============================================\n");
		System.out.println("1. 교사 아이디             MT_ID >>> : " + mvo.getMT_ID());
		System.out.println("2. 교사 이름                MT_NAME >>> : " + mvo.getMT_NAME());
		System.out.println("3. 교사 회원번호          MT_NUM >>> : " + mvo.getMT_NUM());
		System.out.println("4. 교사 휴대폰번호       MT_CP >>> : " + mvo.getMT_CP());
		System.out.println("5. 교사 우편번호          MT_ZIPCODE >>> : " + mvo.getMT_ZIPCODE());
		System.out.println("6. 교사 도로명주소       MT_DORO >>> : " + mvo.getMT_DORO());
		System.out.println("7. 교사 상세주소          MT_DORODETAIL >>> : " + mvo.getMT_DORODETAIL());
		System.out.println("\n============================================\n");
	}
	
}
