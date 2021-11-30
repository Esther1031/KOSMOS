package com.kosmos.sugang.vo;

import org.apache.log4j.Logger;

public class SugangVO {

	private static Logger logger = Logger.getLogger(SugangVO.class);
	
	private String sb_num;
	private String sb_group;
	private String sb_code;
	private String sb_type;
	private String sb_name;
	private String sb_creditunit;
	private String sb_grade;
	private String sb_year;
	private String sb_semester;
	private String sb_teacher;
	private String sb_maxstu;
	private String sb_day;
	private String sb_time;
	private String sb_beforeyn;
	private String sb_beforename;
	private String sb_insdate;
	private String sb_upddate;
	private String sb_delyn;
	
	private String me_num;
	private String sb_ncreditunit;
	
	// 검색 구분자 및 검색어
	private String keyfilter;
	private String keyword;
	
	
	public SugangVO() {

	}
	
	public SugangVO(String sb_num, String sb_group, String sb_code, 
					String sb_type, String sb_name, String sb_creditunit, 
					String sb_grade, String sb_year, String sb_semester, 
					String sb_teacher, String sb_maxstu, String sb_day, 
					String sb_time, String sb_beforeyn, String sb_beforename,
					String sb_insdate, String sb_upddate, String sb_delyn,
					String me_num, String sb_ncreditunit, String keyfilter,
					String keyword) {

		this.sb_num = sb_num;
		this.sb_group = sb_group;
		this.sb_code = sb_code;
		this.sb_type = sb_type;
		this.sb_name = sb_name;
		this.sb_creditunit = sb_creditunit;
		this.sb_grade = sb_grade;
		this.sb_year = sb_year;
		this.sb_semester = sb_semester;
		this.sb_teacher = sb_teacher;
		this.sb_maxstu = sb_maxstu;
		this.sb_day = sb_day;
		this.sb_time = sb_time;
		this.sb_beforeyn = sb_beforeyn;
		this.sb_beforename = sb_beforename;
		this.sb_insdate = sb_insdate;
		this.sb_upddate = sb_upddate;
		this.sb_delyn = sb_delyn;
		this.me_num = me_num;
		this.sb_ncreditunit = sb_ncreditunit;
		this.keyfilter = keyfilter;
		this.keyword = keyword;
	}

	
	public String getSb_num() {
		return sb_num;
	}
	public void setSb_num(String sb_num) {
		this.sb_num = sb_num;
	}
	public String getSb_group() {
		return sb_group;
	}
	public void setSb_group(String sb_group) {
		this.sb_group = sb_group;
	}
	public String getSb_code() {
		return sb_code;
	}
	public void setSb_code(String sb_code) {
		this.sb_code = sb_code;
	}
	public String getSb_type() {
		return sb_type;
	}
	public void setSb_type(String sb_type) {
		this.sb_type = sb_type;
	}
	public String getSb_name() {
		return sb_name;
	}
	public void setSb_name(String sb_name) {
		this.sb_name = sb_name;
	}
	public String getSb_creditunit() {
		return sb_creditunit;
	}
	public void setSb_creditunit(String sb_creditunit) {
		this.sb_creditunit = sb_creditunit;
	}
	public String getSb_grade() {
		return sb_grade;
	}
	public void setSb_grade(String sb_grade) {
		this.sb_grade = sb_grade;
	}
	public String getSb_year() {
		return sb_year;
	}
	public void setSb_year(String sb_year) {
		this.sb_year = sb_year;
	}
	public String getSb_semester() {
		return sb_semester;
	}
	public void setSb_semester(String sb_semester) {
		this.sb_semester = sb_semester;
	}
	public String getSb_teacher() {
		return sb_teacher;
	}
	public void setSb_teacher(String sb_teacher) {
		this.sb_teacher = sb_teacher;
	}
	public String getSb_maxstu() {
		return sb_maxstu;
	}
	public void setSb_maxstu(String sb_maxstu) {
		this.sb_maxstu = sb_maxstu;
	}
	public String getSb_day() {
		return sb_day;
	}
	public void setSb_day(String sb_day) {
		this.sb_day = sb_day;
	}
	public String getSb_time() {
		return sb_time;
	}
	public void setSb_time(String sb_time) {
		this.sb_time = sb_time;
	}
	public String getSb_beforeyn() {
		return sb_beforeyn;
	}
	public void setSb_beforeyn(String sb_beforeyn) {
		this.sb_beforeyn = sb_beforeyn;
	}
	public String getSb_beforename() {
		return sb_beforename;
	}
	public void setSb_beforename(String sb_beforename) {
		this.sb_beforename = sb_beforename;
	}
	public String getSb_insdate() {
		return sb_insdate;
	}
	public void setSb_insdate(String sb_insdate) {
		this.sb_insdate = sb_insdate;
	}
	public String getSb_upddate() {
		return sb_upddate;
	}
	public void setSb_upddate(String sb_upddate) {
		this.sb_upddate = sb_upddate;
	}
	public String getSb_delyn() {
		return sb_delyn;
	}
	public void setSb_delyn(String sb_delyn) {
		this.sb_delyn = sb_delyn;
	}
	
	public String getMe_num() {
		return me_num;
	}
	public void setMe_num(String me_num) {
		this.me_num = me_num;
	}
	
	public String getSb_ncreditunit() {
		return sb_ncreditunit;
	}
	public void setSb_ncreditunit(String sb_ncreditunit) {
		this.sb_ncreditunit = sb_ncreditunit;
	}
	

	// 검색
	public String getKeyfilter() {
		return keyfilter;
	}
	public void setKeyfilter(String keyfilter) {
		this.keyfilter = keyfilter;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
	// 매개변수 확인
	public static void printVO(SugangVO svo) {
		logger.info("SugangVO printVO() 함수 진입 >>> : ");
		logger.info("printVO svo >>> : " + svo);
		logger.info("sb_num >>> : " + svo.getSb_num());
		logger.info("sb_group >>> : " + svo.getSb_group());
		logger.info("sb_code >>> : " + svo.getSb_code());
		logger.info("sb_type >>> : " + svo.getSb_type());
		logger.info("sb_name >>> : " + svo.getSb_name());
		logger.info("sb_creditunit >>> : " + svo.getSb_creditunit());
		logger.info("sb_grade >>> : " + svo.getSb_grade());
		logger.info("sb_year >>> : " + svo.getSb_year());
		logger.info("sb_semester >>> : " + svo.getSb_semester());
		logger.info("sb_teacher >>> : " + svo.getSb_teacher());
		logger.info("sb_maxstu >>> : " + svo.getSb_maxstu());
		logger.info("sb_day >>> : " + svo.getSb_day());
		logger.info("sb_time >>> : " + svo.getSb_time());
		logger.info("sb_beforeyn >>> : " + svo.getSb_beforeyn());
		logger.info("sb_beforename >>> : " + svo.getSb_beforename());
		logger.info("sb_insdate >>> : " + svo.getSb_insdate());
		logger.info("sb_upddate >>> : " + svo.getSb_upddate());
		logger.info("sb_delyn >>> : " + svo.getSb_delyn());
		logger.info("me_num >>> : " + svo.getMe_num());
		logger.info("sb_ncreditunit >>> : " + svo.getSb_ncreditunit());
	}
}
