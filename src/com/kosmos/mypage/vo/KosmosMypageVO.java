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
	//private String me_dorodetail;	// 공통 변수
	private String admissionyear;	// 학생 전용
	private String grade;			// 학생 전용
	private String st_class;		// 학생 전용
	private String number;			// 학생 전용
	
	
	// ===============================================================================
	// Variables : 학생이 로그인중인 경우 
	// ===============================================================================	
	 
	// 학생 아이디(이메일주소), 학생 비번, 회원 번호
	private String ms_id;			// 1. 학생 아이디(이메일주소)
	private String ms_name;			// 2. 학생 이름
	private String ms_num;			// 3. 학생 회원 번호
	private String ms_cp;			// 4. 휴대폰 번호
	private String ms_zipcode; 		// 5. 우편번호
	private String ms_doro;   		// 6. 도로명주소
	//private String ms_dorodetail;  	// 7. 상세주소
	private String ms_insdate;  	// 8. 가입일
	private String ms_grade;   		// 9. 학년
	private String ms_class;  		// 10. 반
	private String ms_number;   	// 11. 번호
	
	
	// ===============================================================================
	// Variables : 교사가 로그인중인 경우 
	// ===============================================================================	
	 
	// 교사 로그인시  DB의 교사 테이블에서 조회해온 데이터 : 교사 아이디, 교사 비번, 회원 번호
	private String mt_id;			// 1. 교사 아이디(이메일주소)
	private String mt_name;			// 2. 교사 이름
	private String mt_num;			// 3. 교사 회원 번호
	private String mt_cp;			// 4. 휴대폰 번호
	private String mt_zipcode; 		// 5. 우편번호
	private String mt_doro;   		// 6. 도로명주소
	//private String mt_dorodetail;  	// 7. 상세주소
	
	
	// ===============================================================================
	// Cunstructor
	// ===============================================================================	
	
	public KosmosMypageVO() {
		
	}

	public KosmosMypageVO(String mid, String mnum, String stname, String stmail, String stcp, String tename,
			String temail, String tecp, String me_zipcode, String me_doro, String me_dorodetail, String admissionyear,
			String grade, String st_class, String number, String ms_id, String ms_name, String ms_num, String ms_cp,
			String ms_zipcode, String ms_doro, String ms_dorodetail, String ms_insdate, String ms_grade,
			String ms_class, String ms_number, String mt_id, String mt_name, String mt_num, String mt_cp,
			String mt_zipcode, String mt_doro, String mt_dorodetail) {

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
		//this.me_dorodetail = me_dorodetail;
		this.admissionyear = admissionyear;
		this.grade = grade;
		this.st_class = st_class;
		this.number = number;
		this.ms_id = ms_id;
		this.ms_name = ms_name;
		this.ms_num = ms_num;
		this.ms_cp = ms_cp;
		this.ms_zipcode = ms_zipcode;
		this.ms_doro = ms_doro;
		//this.ms_dorodetail = ms_dorodetail;
		this.ms_insdate = ms_insdate;
		this.ms_grade = ms_grade;
		this.ms_class = ms_class;
		this.ms_number = ms_number;
		this.mt_id = mt_id;
		this.mt_name = mt_name;
		this.mt_num = mt_num;
		this.mt_cp = mt_cp;
		this.mt_zipcode = mt_zipcode;
		this.mt_doro = mt_doro;
		//this.mt_dorodetail = mt_dorodetail;
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

	public String getMs_id() {
		return ms_id;
	}

	public void setMs_id(String ms_id) {
		this.ms_id = ms_id;
	}

	public String getMs_name() {
		return ms_name;
	}

	public void setMs_name(String ms_name) {
		this.ms_name = ms_name;
	}

	public String getMs_num() {
		return ms_num;
	}

	public void setMs_num(String ms_num) {
		this.ms_num = ms_num;
	}

	public String getMs_cp() {
		return ms_cp;
	}

	public void setMs_cp(String ms_cp) {
		this.ms_cp = ms_cp;
	}

	public String getMs_zipcode() {
		return ms_zipcode;
	}

	public void setMs_zipcode(String ms_zipcode) {
		this.ms_zipcode = ms_zipcode;
	}

	public String getMs_doro() {
		return ms_doro;
	}

	public void setMs_doro(String ms_doro) {
		this.ms_doro = ms_doro;
	}

	//public String getMs_dorodetail() {
	//	return ms_dorodetail;
	//}

	//public void setMs_dorodetail(String ms_dorodetail) {
	//	this.ms_dorodetail = ms_dorodetail;
	//}

	public String getMs_insdate() {
		return ms_insdate;
	}

	public void setMs_insdate(String ms_insdate) {
		this.ms_insdate = ms_insdate;
	}

	public String getMs_grade() {
		return ms_grade;
	}

	public void setMs_grade(String ms_grade) {
		this.ms_grade = ms_grade;
	}

	public String getMs_class() {
		return ms_class;
	}

	public void setMs_class(String ms_class) {
		this.ms_class = ms_class;
	}

	public String getMs_number() {
		return ms_number;
	}

	public void setMs_number(String ms_number) {
		this.ms_number = ms_number;
	}

	public String getMt_id() {
		return mt_id;
	}

	public void setMt_id(String mt_id) {
		this.mt_id = mt_id;
	}

	public String getMt_name() {
		return mt_name;
	}

	public void setMt_name(String mt_name) {
		this.mt_name = mt_name;
	}

	public String getMt_num() {
		return mt_num;
	}

	public void setMt_num(String mt_num) {
		this.mt_num = mt_num;
	}

	public String getMt_cp() {
		return mt_cp;
	}

	public void setMt_cp(String mt_cp) {
		this.mt_cp = mt_cp;
	}

	public String getMt_zipcode() {
		return mt_zipcode;
	}

	public void setMt_zipcode(String mt_zipcode) {
		this.mt_zipcode = mt_zipcode;
	}

	public String getMt_doro() {
		return mt_doro;
	}

	public void setMt_doro(String mt_doro) {
		this.mt_doro = mt_doro;
	}

	//public String getMt_dorodetail() {
	//	return mt_dorodetail;
	//}

	//public void setMt_dorodetail(String mt_dorodetail) {
	//	this.mt_dorodetail = mt_dorodetail;
	//}

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

	//public String getMe_dorodetail() {
	//	return me_dorodetail;
	//}

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

	//public void setMe_dorodetail(String me_dorodetail) {
	//	this.me_dorodetail = me_dorodetail;
	//}

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
		System.out.println("1. 학생 아이디        ms_id >>> : " + mvo.getMs_id());
		System.out.println("2. 학생 비밀번호     ms_name >>> : " + mvo.getMs_name());
		System.out.println("3. 학생 회원번호     ms_num >>> : " + mvo.getMs_num());
		System.out.println("4. 학생 휴대폰번호  ms_cp >>> : " + mvo.getMs_cp());
		System.out.println("5. 학생 우편번호     ms_zipcode >>> : " + mvo.getMs_zipcode());
		System.out.println("6. 학생 도로명주소  ms_doro >>> : " + mvo.getMs_doro());
		//System.out.println("7. 학생 상세주소     ms_dorodetail >>> : " + mvo.getMs_dorodetail());
		System.out.println("8. 학생 가입일        ms_insdate >>> : " + mvo.getMs_insdate());
		System.out.println("9. 학생 학년   	   ms_grade >>> : " + mvo.getMs_grade());
		System.out.println("10. 학생 반   	   ms_class >>> : " + mvo.getMs_class());
		System.out.println("11. 학생 번호   	   ms_number >>> : " + mvo.getMs_number());
		System.out.println("\n============================================\n");
		System.out.println("1. 교사 아이디        mt_id >>> : " + mvo.getMt_id());
		System.out.println("2. 교사 이름           mt_name >>> : " + mvo.getMt_name());
		System.out.println("3. 교사 회원번호     mt_num >>> : " + mvo.getMt_num());
		System.out.println("4. 교사 휴대폰번호  mt_cp >>> : " + mvo.getMt_cp());
		System.out.println("5. 교사 우편번호     mt_zipcode >>> : " + mvo.getMt_zipcode());
		System.out.println("6. 교사 도로명주소  mt_doro >>> : " + mvo.getMt_doro());
		//System.out.println("7. 교사 상세주소     mt_dorodetail >>> : " + mvo.getMt_dorodetail());
		System.out.println("\n============================================\n");
	}
	
}
