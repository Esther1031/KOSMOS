package com.kosmos.school.vo;

public class KosmosSchoolVO {
	
	// 시간표
	private String mon;
	private String tue;
	private String wen;
	private String thu;
	private String fri;
	
	// 회원번호
	private String ms_num;
	
	// 생성자
	public KosmosSchoolVO() {
	
	}

	public KosmosSchoolVO(String mon, String tue, String wen,
						  String thu, String fri, String ms_num) {

		this.mon = mon;
		this.tue = tue;
		this.wen = wen;
		this.thu = thu;
		this.fri = fri;
		this.ms_num = ms_num;
	}

	// getter
	public String getMon() {
		return mon;
	}
	public String getTue() {
		return tue;
	}
	public String getWen() {
		return wen;
	}
	public String getThu() {
		return thu;
	}
	public String getFri() {
		return fri;
	}
	public String getMs_num() {
		return ms_num;
	}
	
	// setter
	public void setMon(String mon) {
		this.mon = mon;
	}
	public void setTue(String tue) {
		this.tue = tue;
	}
	public void setWen(String wen) {
		this.wen = wen;
	}
	public void setThu(String thu) {
		this.thu = thu;
	}
	public void setFri(String fri) {
		this.fri = fri;
	}
	public void setMs_num(String ms_num) {
		this.ms_num = ms_num;
	}
}
