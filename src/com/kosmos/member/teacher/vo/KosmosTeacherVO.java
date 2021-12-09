package com.kosmos.member.teacher.vo;

import org.apache.log4j.Logger;

public class KosmosTeacherVO {
	private static Logger logger = Logger.getLogger(KosmosTeacherVO.class);
	
	private String mt_num;
	private String mt_id;
	private String mt_name;
	private String mt_gen;
	private String mt_birth;
	private String mt_pw;
	private String mt_cp;
	private String mt_zipcode;
	private String mt_doro;
	private String mt_photo;
	private String mt_insdate;
	private String mt_upddate;
	private String mt_delyn;
	
	public KosmosTeacherVO() {
		
	}
	
public KosmosTeacherVO(String mt_num, String mt_id, String mt_name,
					   String mt_gen, String mt_birth, String mt_pw, 
					   String mt_cp, String mt_zipcode, String mt_doro,
					   String mt_dorodetail, String mt_photo, String mt_insdate, 
					   String mt_upddate, String mt_delyn) {

	this.mt_num = mt_num;
	this.mt_id = mt_id;
	this.mt_name = mt_name;
	this.mt_gen = mt_gen;
	this.mt_birth = mt_birth;
	this.mt_pw = mt_pw;
	this.mt_cp = mt_cp;
	this.mt_zipcode = mt_zipcode;
	this.mt_doro = mt_doro;
	this.mt_photo = mt_photo;
	this.mt_insdate = mt_insdate;
	this.mt_upddate = mt_upddate;
	this.mt_delyn = mt_delyn;
}

	public String getMt_num() {
		return mt_num;
	}
	
	public void setMt_num(String mt_num) {
		this.mt_num = mt_num;
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
	
	public String getMt_gen() {
		return mt_gen;
	}
	
	public void setMt_gen(String mt_gen) {
		this.mt_gen = mt_gen;
	}
	
	public String getMt_birth() {
		return mt_birth;
	}
	
	public void setMt_birth(String mt_birth) {
		this.mt_birth = mt_birth;
	}
	
	public String getMt_pw() {
		return mt_pw;
	}
	
	public void setMt_pw(String mt_pw) {
		this.mt_pw = mt_pw;
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
	
	public String getMt_photo() {
		return mt_photo;
	}
	
	public void setMt_photo(String mt_photo) {
		this.mt_photo = mt_photo;
	}
	
	public String getMt_insdate() {
		return mt_insdate;
	}
	
	public void setMt_insdate(String mt_insdate) {
		this.mt_insdate = mt_insdate;
	}
	
	public String getMt_upddate() {
		return mt_upddate;
	}
	
	public void setMt_upddate(String mt_upddate) {
		this.mt_upddate = mt_upddate;
	}
	
	public String getMt_delyn() {
		return mt_delyn;
	}
	
	public void setMt_delyn(String mt_delyn) {
		this.mt_delyn = mt_delyn;
	}

	// 매개변수 확인
	public static void printVO(KosmosTeacherVO mvo){
		logger.info("KosmosTeacherVO 데이터 확인 시작 >>>");

		logger.info("취미 >>> : " + mvo.getMt_num());
		logger.info("취미 >>> : " + mvo.getMt_id());
		logger.info("취미 >>> : " + mvo.getMt_name());
		logger.info("취미 >>> : " + mvo.getMt_gen());
		logger.info("취미 >>> : " + mvo.getMt_birth());
		logger.info("취미 >>> : " + mvo.getMt_pw());
		logger.info("취미 >>> : " + mvo.getMt_cp());
		logger.info("취미 >>> : " + mvo.getMt_zipcode());
		logger.info("취미 >>> : " + mvo.getMt_photo());
		logger.info("취미 >>> : " + mvo.getMt_insdate());
		logger.info("취미 >>> : " + mvo.getMt_upddate());
		logger.info("취미 >>> : " + mvo.getMt_delyn());
	
	
		logger.info("KosmosTeacherVO 데이터 확인 끝  >>> : ");	
	}
}

