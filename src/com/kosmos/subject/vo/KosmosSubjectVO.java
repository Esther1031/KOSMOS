package com.kosmos.subject.vo;

import org.apache.log4j.Logger;

public class KosmosSubjectVO {
	private static Logger logger = Logger.getLogger(KosmosSubjectVO.class);
	
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
	
	// 검색 구분자 및 검색어
	private String key_sbname;
	private String key_sbteacher;
	private String key_sbgrade;
	private String key_selectgrade;
	private String key_sbday;
	private String key_sbtime;
	private String key_sbsemester;
	private String key_sbyear;
	
	// 페이징 이동 필드
	private String pageSize;
	private String groupSize;
	private String curPage;
	private String totalCount;
	
	//vars for ajax
	private String group;
	private String name;
	
	public KosmosSubjectVO() {
		
	}

	public KosmosSubjectVO(String sb_num, String sb_group, String sb_code, String sb_type, String sb_name,
			String sb_creditunit, String sb_grade, String sb_year, String sb_semester, String sb_teacher,
			String sb_maxstu, String sb_day, String sb_time, String sb_beforeyn, String sb_beforename,
			String sb_insdate, String sb_upddate, String sb_delyn, String key_sbname, String key_sbteacher,
			String key_sbgrade, String key_selectgrade, String key_sbday, String key_sbtime, String key_sbsemester,
			String key_sbyear, String pageSize, String groupSize, String curPage, String totalCount, String group,
			String name) {
		super();
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
		this.key_sbname = key_sbname;
		this.key_sbteacher = key_sbteacher;
		this.key_sbgrade = key_sbgrade;
		this.key_selectgrade = key_selectgrade;
		this.key_sbday = key_sbday;
		this.key_sbtime = key_sbtime;
		this.key_sbsemester = key_sbsemester;
		this.key_sbyear = key_sbyear;
		this.pageSize = pageSize;
		this.groupSize = groupSize;
		this.curPage = curPage;
		this.totalCount = totalCount;
		this.group = group;
		this.name = name;
	}


	public String getGroup() {
		return group;
	}

	public void setGroup(String group) {
		this.group = group;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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
	
	// 검색용
	public String getKey_sbname() {
		return key_sbname;
	}

	public void setKey_sbname(String key_sbname) {
		this.key_sbname = key_sbname;
	}
	
	public String getKey_sbteacher() {
		return key_sbteacher;
	}

	public void setKey_sbteacher(String key_sbteacher) {
		this.key_sbteacher = key_sbteacher;
	}

	public String getKey_sbgrade() {
		return key_sbgrade;
	}

	public void setKey_sbgrade(String key_sbgrade) {
		this.key_sbgrade = key_sbgrade;
	}

	public String getKey_sbday() {
		return key_sbday;
	}

	public void setKey_sbday(String key_sbday) {
		this.key_sbday = key_sbday;
	}

	public String getKey_sbtime() {
		return key_sbtime;
	}

	public void setKey_sbtime(String key_sbtime) {
		this.key_sbtime = key_sbtime;
	}

	public String getKey_selectgrade() {
		return key_selectgrade;
	}

	public void setKey_selectgrade(String key_selectgrade) {
		this.key_selectgrade = key_selectgrade;
	}

	public String getKey_sbsemester() {
		return key_sbsemester;
	}

	public void setKey_sbsemester(String key_sbsemester) {
		this.key_sbsemester = key_sbsemester;
	}

	public String getKey_sbyear() {
		return key_sbyear;
	}

	public void setKey_sbyear(String key_sbyear) {
		this.key_sbyear = key_sbyear;
	}
	
	// 페이징 이동 필드

	public String getPageSize() {
		return pageSize;
	}

	public void setPageSize(String pageSize) {
		this.pageSize = pageSize;
	}

	public String getGroupSize() {
		return groupSize;
	}

	public void setGroupSize(String groupSize) {
		this.groupSize = groupSize;
	}

	public String getCurPage() {
		return curPage;
	}

	public void setCurPage(String curPage) {
		this.curPage = curPage;
	}

	public String getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(String totalCount) {
		this.totalCount = totalCount;
	}


	public static void subjectPrintVO(KosmosSubjectVO svo) {
		logger.info("KosmosSubjectVO 데이터 체크 시작 >>> : ");
		logger.info("svo.getSb_num() >>> : " + svo.getSb_num());;
		logger.info("svo.getSb_group() >>> : " + svo.getSb_group());
		logger.info("svo.getSb_code() >>> : " + svo.getSb_code());
		logger.info("svo.getSb_type() >>> : " + svo.getSb_type());
		logger.info("svo.getSb_name() >>> : " + svo.getSb_name());
		
		logger.info("svo.getSb_creditunit() >>> : " + svo.getSb_creditunit());
		logger.info("svo.getSb_grade() >>> : " + svo.getSb_grade());
		logger.info("svo.getSb_year() >>> : " + svo.getSb_year());
		logger.info("svo.getSb_semester() >>> : " + svo.getSb_semester());
		logger.info("svo.getSb_teacher() >>> : " + svo.getSb_teacher());
		
		logger.info("svo.getSb_maxstu() >>> : " + svo.getSb_maxstu());
		logger.info("svo.getSb_day() >>> : " + svo.getSb_day());
		logger.info("svo.getSb_time() >>> : " + svo.getSb_time());
		logger.info("svo.getSb_beforeyn() >>> : " + svo.getSb_beforeyn());
		logger.info("svo.getSb_beforename() >>> : " + svo.getSb_beforename());
		
		logger.info("KosmosSubjectVO 데이터 체크 끝 >>> : ");
	}

	public static void subjectCodeCallPrintVO(KosmosSubjectVO svo) {
		logger.info("svo.getSb_beforename() >>> : " + svo.getGroup());
		logger.info("svo.getSb_beforename() >>> : " + svo.getName());
	}
	
	public static void subjectKeyPrintVO(KosmosSubjectVO svo) {
		logger.info("KosmosSubjectVO 데이터 체크 시작 >>> : ");
		logger.info("svo.getKey_sbname() >>> : " + svo.getKey_sbname());
		logger.info("svo.getKey_sbteacher() >>> : " + svo.getKey_sbteacher());
		logger.info("svo.getKey_sbgrade() >>> : " + svo.getKey_sbgrade());
		logger.info("svo.getKey_sbday() >>> : " + svo.getKey_sbday());
		logger.info("svo.getKey_sbtime() >>> : " + svo.getKey_sbtime());
		logger.info("svo.getKey_sbsemester() >>> : " + svo.getKey_sbsemester());
		logger.info("svo.getKey_sbyear() >>> : " + svo.getKey_sbyear());
		logger.info("KosmosSubjectVO 데이터 체크 끝 >>> : ");
	}
}
