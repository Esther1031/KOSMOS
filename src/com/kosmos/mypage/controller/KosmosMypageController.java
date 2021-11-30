package com.kosmos.mypage.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.kosmos.mypage.service.KosmosMypageService;

@Controller
public class KosmosMypageController {
	
	// Logger 세팅
	Logger logger = Logger.getLogger(KosmosMypageController.class);
	
	// 서비스 선언
	private KosmosMypageService kosmosMypageService;
	
	// 학생이 홈에서 카테고리 '마이페이지' 클릭시 나오는 랜딩 페이지
	@GetMapping("myPageStudent")
	public String myPageSelectStudent() {
		logger.info("KosmosMypageController.myPageSelectStudent() 진입 >>> : 학생 회원의 데이터를 조회해 불러옵니다.");
		return "mypage/myPageSelectStudent";
	}
	
	// 학생이 회원정보 수정하기 버튼을 누른 경우
	@GetMapping("myPageUpdateStudent")
	public String myPageUpdateStudent() {
		logger.info("KosmosMypageController.myPageUpdateStudent() 진입 >>> : 학생 회원의 정보수정을 위해 팝업창을 불러옵니다.");
		return "popUp/myPageUpdateStudent";
	}
	
	// 선생이 홈에서 카테고리 '마이페이지' 클릭시 나오는 랜딩 페이지
	@GetMapping("myPageTeacher")
	public String myPageSelectTeacher() {
		logger.info("KosmosMypageController.myPageSelectTeacher() 진입 >>> : 선생 회원의 데이터를 조회해 불러옵니다.");
		return "mypage/myPageSelectTeacher";
	}
	
	// 선생이 회원정보 수정하기 버튼을 누른 경우
	@GetMapping("myPageUpdateTeacher")
	public String myPageUpdateTeacher() {
		logger.info("KosmosMypageController.myPageUpdateTeacher() 진입 >>> : 선생 회원의 정보수정을 위해 팝업창을 불러옵니다.");
		return "popUp/myPageUpdateTeacher";
	}
	
	
}
