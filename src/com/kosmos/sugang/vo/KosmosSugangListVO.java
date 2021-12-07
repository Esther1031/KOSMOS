package com.kosmos.sugang.vo;

public class KosmosSugangListVO {
	
	private String sl_num; 				
	private String ms_num;	
	private String sb_group;		
	private String sb_name;
	private String sb_grade;
	private String sb_creditunit; 			
	private String sb_day; 				
	private String sb_timetable; 
	private String sb_beforeyn; 
	private String sb_beforename;
	private String sb_maxstu;
	private String sl_insdate; 			
	private String sl_update; 			
	private String sl_delyn;
	
	
	public KosmosSugangListVO() {
		super();
	}
	public KosmosSugangListVO(String sl_num, String ms_num, String sb_group, String sb_name, String sb_grade,
			String sb_creditunit, String sb_day, String sb_timetable, String sb_beforeyn, String sb_beforename,
			String sb_maxstu, String sl_insdate, String sl_update, String sl_delyn) {
		super();
		this.sl_num = sl_num;
		this.ms_num = ms_num;
		this.sb_group = sb_group;
		this.sb_name = sb_name;
		this.sb_grade = sb_grade;
		this.sb_creditunit = sb_creditunit;
		this.sb_day = sb_day;
		this.sb_timetable = sb_timetable;
		this.sb_beforeyn = sb_beforeyn;
		this.sb_beforename = sb_beforename;
		this.sb_maxstu = sb_maxstu;
		this.sl_insdate = sl_insdate;
		this.sl_update = sl_update;
		this.sl_delyn = sl_delyn;
	}
	

	
	
	
	public String getSl_num() {
		return sl_num;
	}
	public void setSl_num(String sl_num) {
		this.sl_num = sl_num;
	}
	public String getMs_num() {
		return ms_num;
	}
	public void setMs_num(String ms_num) {
		this.ms_num = ms_num;
	}
	public String getSb_group() {
		return sb_group;
	}
	public void setSb_group(String sb_group) {
		this.sb_group = sb_group;
	}
	public String getSb_name() {
		return sb_name;
	}
	public void setSb_name(String sb_name) {
		this.sb_name = sb_name;
	}
	public String getSb_grade() {
		return sb_grade;
	}
	public void setSb_grade(String sb_grade) {
		this.sb_grade = sb_grade;
	}
	public String getSb_creditunit() {
		return sb_creditunit;
	}
	public void setSb_creditunit(String sb_creditunit) {
		this.sb_creditunit = sb_creditunit;
	}
	public String getSb_day() {
		return sb_day;
	}
	public void setSb_day(String sb_day) {
		this.sb_day = sb_day;
	}
	public String getSb_timetable() {
		return sb_timetable;
	}
	public void setSb_timetable(String sb_timetable) {
		this.sb_timetable = sb_timetable;
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
	public String getSb_maxstu() {
		return sb_maxstu;
	}
	public void setSb_maxstu(String sb_maxstu) {
		this.sb_maxstu = sb_maxstu;
	}
	public String getSl_insdate() {
		return sl_insdate;
	}
	public void setSl_insdate(String sl_insdate) {
		this.sl_insdate = sl_insdate;
	}
	public String getSl_update() {
		return sl_update;
	}
	public void setSl_update(String sl_update) {
		this.sl_update = sl_update;
	}
	public String getSl_delyn() {
		return sl_delyn;
	}
	public void setSl_delyn(String sl_delyn) {
		this.sl_delyn = sl_delyn;
	}

}