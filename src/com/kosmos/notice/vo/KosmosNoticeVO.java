package com.kosmos.notice.vo;



public class KosmosNoticeVO {
	
	// 공지사항 테이블: 일대일 매칭
	private String no_num;		// 공지사항 글 번호
	private String mt_num;		// 작성자
	private String no_subject;	// 제목
	private String no_contents;	// 내용
	private String no_file;		// (실제 서버에 저장한) 파일명
	private	int no_hit;			// 조회수
	private String no_insdate;	// 등록일
	private String no_upddate;	// 수정일
	private String no_delyn;	// 삭제여부

	// 교사회원 테이블: 가져올 데이터
	private String mt_name;		// 교사 이름
	// 학생회원 테이블: 가져올 데이터
	private String ms_name;		// 학생 이름
	
	// 세션에서 받을 교사 아이디
	private String mt_id;

	// 검색
	private String searchType;	// 말머리
	private String keyword;		// 검색어
	
	// 페이징
	private String pageSize;
	private String groupSize;
	private String curPage;
	private String totalCount;		// 전체 게시글 개수
	
	
	// 기본 생성자
	public KosmosNoticeVO() {}

	// 오버로딩 생성자
	public KosmosNoticeVO(String no_num, String mt_num, String no_subject,
						String no_contents,	String no_file, int no_hit,
						String no_insdate, String no_upddate, String no_delyn, 
						String searchType, String keyword,
						String pageSize, String groupSize, String curPage, String totalCount, // 페이징
						String mt_name, String ms_name) {

		// 공지사항
		this.no_num = no_num;
		this.mt_num = mt_num;
		this.no_subject = no_subject;
		this.no_contents = no_contents;
		this.no_file = no_file;
		this.no_hit = no_hit;
		this.no_insdate = no_insdate;
		this.no_upddate = no_upddate;
		this.no_delyn = no_delyn;
		
		// 검색
		this.searchType = searchType;
		this.keyword = keyword;
		
		// 페이징
		this.pageSize = pageSize;
		this.groupSize = groupSize;
		this.curPage = curPage;
		this.totalCount = totalCount;
		
		// 받는 값
		this.mt_name = mt_name;
		this.ms_name = ms_name;
	}


	// ===============================================================================
	// getter()
	// ===============================================================================

	public String getNo_num() {
		return no_num;
	}

	public String getMt_num() {
		return mt_num;
	}

	public String getNo_subject() {
		return no_subject;
	}

	public String getNo_contents() {
		return no_contents;
	}

	public String getNo_file() {
		return no_file;
	}

	public int getNo_hit() {
		return no_hit;
	}
	
	public String getNo_insdate() {
		return no_insdate;
	}

	public String getNo_upddate() {
		return no_upddate;
	}

	public String getNo_delyn() {
		return no_delyn;
	}

	public String getSearchType() {
		return searchType;
	}

	public String getKeyword() {
		return keyword;
	}

	public String getPageSize() {
		return pageSize;
	}

	public String getGroupSize() {
		return groupSize;
	}

	public String getCurPage() {
		return curPage;
	}

	public String getTotalCount() {
		return totalCount;
	}
		
	public String getMt_name() {
		return mt_name;
	}
	
	public String getMs_name() {
		return ms_name;
	}

	public String getMt_id() {
		return mt_id;
	}

	
	// ===============================================================================
	// setter()
	// ===============================================================================


	public void setNo_num(String no_num) {
		this.no_num = no_num;
	}

	public void setMt_num(String mt_num) {
		this.mt_num = mt_num;
	}

	public void setNo_subject(String no_subject) {
		this.no_subject = no_subject;
	}

	public void setNo_contents(String no_contents) {
		this.no_contents = no_contents;
	}

	public void setNo_file(String no_file) {
		this.no_file = no_file;
	}

	public void setNo_hit(int no_hit) {
		this.no_hit = no_hit;
	}
	
	public void setNo_insdate(String no_insdate) {
		this.no_insdate = no_insdate;
	}

	public void setNo_upddate(String no_upddate) {
		this.no_upddate = no_upddate;
	}

	public void setNo_delyn(String no_delyn) {
		this.no_delyn = no_delyn;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public void setPageSize(String pageSize) {
		this.pageSize = pageSize;
	}

	public void setGroupSize(String groupSize) {
		this.groupSize = groupSize;
	}

	public void setCurPage(String curPage) {
		this.curPage = curPage;
	}

	public void setTotalCount(String totalCount) {
		this.totalCount = totalCount;
	}
	
	public void setMt_name(String mt_name) {
		this.mt_name = mt_name;
	}

	public void setMs_name(String ms_name) {
		this.ms_name = ms_name;
	}
	
	public void setMt_id(String mt_id) {
		this.mt_id = mt_id;
	}

	
	// vo 출력
	public static void printVO(KosmosNoticeVO nvo) {
		
		// 로그인시 바인딩된 데이터 출력  
		System.out.println("\n===========KosmosNoticeVO 변수 바인딩 현황=============\n");
		System.out.println("입력된 제목 >>> : " + nvo.getNo_subject());
		System.out.println("입력된 내용 >>> : " + nvo.getNo_contents());
		System.out.println("업로드된 파일(명) >>> : " + nvo.getNo_file());
		System.out.println("\n");
		System.out.println("교사 테이블에서 받은 교사 이름 : " + nvo.getMt_name() );
		System.out.println("학생 테이블에서 받은 학생 이름 : " + nvo.getMs_name() );
		System.out.println("\n============================================\n");

	}
	
}
