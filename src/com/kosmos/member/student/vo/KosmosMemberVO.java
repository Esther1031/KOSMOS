package com.kosmos.member.student.vo;

import org.apache.log4j.Logger;

public class KosmosMemberVO {
	private static Logger logger = Logger.getLogger(KosmosMemberVO.class);
	
	private String ms_num; //회원번호
	private String ms_id; //아이디(이메일)
	private String ms_name; //이름
	private String ms_gen; //성별
	private String ms_birth; // 생년월일
	private String ms_pw; // 비밀번호
	private String ms_cp; // 핸드폰번호
	private String ms_zipcode; // 우편번호
	private String ms_doro; // 도로명 주소
	private String ms_photo; // 사진
	private String ms_grade;
	private String ms_semester;
	private String ms_class;
	private String ms_number;
	private String ms_admyear;
	private String ms_joinyn;//회원가입 승인여부
	private String ms_insdate; //등록일
	private String ms_upddate; // 수정일
	private String ms_delyn; // 삭제여부
	

	
	public KosmosMemberVO() {
		
	}
	
	public KosmosMemberVO(String ms_num, String ms_id, String ms_name, 
						  String ms_gen, String ms_birth, String ms_pw,
						  String ms_cp, String ms_zipcode, String ms_doro, 
						  String ms_photo, String ms_grade,
						  String ms_semester, String ms_class, String ms_number, 
						  String ms_admyear, String ms_joinyn, String ms_insdate, 
						  String ms_upddate, String ms_delyn) {

		this.ms_num = ms_num;
		this.ms_id = ms_id;
		this.ms_name = ms_name;
		this.ms_gen = ms_gen;
		this.ms_birth = ms_birth;
		this.ms_pw = ms_pw;
		this.ms_cp = ms_cp;
		this.ms_zipcode = ms_zipcode;
		this.ms_doro = ms_doro;
		this.ms_photo = ms_photo;
		this.ms_grade = ms_grade;
		this.ms_semester = ms_semester;
		this.ms_class = ms_class;
		this.ms_number = ms_number;
		this.ms_admyear = ms_admyear;
		this.ms_joinyn = ms_joinyn;
		this.ms_insdate = ms_insdate;
		this.ms_upddate = ms_upddate;
		this.ms_delyn = ms_delyn;
	}

	
	public String getMs_num() {
		return ms_num;
	}

	public void setMs_num(String ms_num) {
		this.ms_num = ms_num;
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

	public String getMs_gen() {
		return ms_gen;
	}

	public void setMs_gen(String ms_gen) {
		this.ms_gen = ms_gen;
	}

	public String getMs_birth() {
		return ms_birth;
	}

	public void setMs_birth(String ms_birth) {
		this.ms_birth = ms_birth;
	}

	public String getMs_pw() {
		return ms_pw;
	}

	public void setMs_pw(String ms_pw) {
		this.ms_pw = ms_pw;
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

	public String getMs_photo() {
		return ms_photo;
	}

	public void setMs_photo(String ms_photo) {
		this.ms_photo = ms_photo;
	}

	public String getMs_grade() {
		return ms_grade;
	}

	public void setMs_grade(String ms_grade) {
		this.ms_grade = ms_grade;
	}

	public String getMs_semester() {
		return ms_semester;
	}

	public void setMs_semester(String ms_semester) {
		this.ms_semester = ms_semester;
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

	public String getMs_admyear() {
		return ms_admyear;
	}

	public void setMs_admyear(String ms_admyear) {
		this.ms_admyear = ms_admyear;
	}

	public String getMs_joinyn() {
		return ms_joinyn;
	}

	public void setMs_joinyn(String ms_joinyn) {
		this.ms_joinyn = ms_joinyn;
	}

	public String getMs_insdate() {
		return ms_insdate;
	}

	public void setMs_insdate(String ms_insdate) {
		this.ms_insdate = ms_insdate;
	}

	public String getMs_upddate() {
		return ms_upddate;
	}

	public void setMs_upddate(String ms_upddate) {
		this.ms_upddate = ms_upddate;
	}

	public String getMs_delyn() {
		return ms_delyn;
	}

	public void setMs_delyn(String ms_delyn) {
		this.ms_delyn = ms_delyn;
	}


	// 매개변수 확인
	public static void printVO(KosmosMemberVO mvo){
		logger.info("KosmosMemberVO 데이터 확인 시작 >>>");
			
		logger.info("회원번호 >>> : " + mvo.getMs_num());
		logger.info("회원이름 >>> : " + mvo.getMs_id());
		logger.info("아이디 >>> : " + mvo.getMs_name());
		logger.info("비밀번호 >>> : " + mvo.getMs_gen());
		logger.info("성별 >>> : " + mvo.getMs_birth());	
		logger.info("생년월일 >>> : " + mvo.getMs_pw());
		logger.info("핸드폰 번호 >>> : " + mvo.getMs_cp());
		logger.info("전화번호 >>> : " + mvo.getMs_zipcode());
		logger.info("이메일 >>> : " + mvo.getMs_doro());			
		logger.info("주소(도로명) >>> : " + mvo.getMs_photo());
		logger.info("주소(지번주소) >>> : " + mvo.getMs_grade());
		logger.info("취미 >>> : " + mvo.getMs_semester());
		logger.info("취미 >>> : " + mvo.getMs_class());
		logger.info("취미 >>> : " + mvo.getMs_number());
		logger.info("취미 >>> : " + mvo.getMs_admyear());
		logger.info("취미 >>> : " + mvo.getMs_joinyn());
		logger.info("취미 >>> : " + mvo.getMs_insdate());
		logger.info("취미 >>> : " + mvo.getMs_upddate());
		logger.info("취미 >>> : " + mvo.getMs_delyn());

		logger.info("KosmosMemberVO 데이터 확인 끝  >>> : ");	
	}
}