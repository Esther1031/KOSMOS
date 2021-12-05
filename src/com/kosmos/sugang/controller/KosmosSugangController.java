/*
 *		테스트용 더미 클래스입니다. 
 */

package com.kosmos.sugang.controller;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.kosmos.login.vo.KosmosLoginVO;

@Controller
public class KosmosSugangController {
	
	Logger logger = Logger.getLogger(KosmosSugangController.class);
	
	// 수강신청 버튼 클릭시 로직
	@GetMapping("registration")
	public String registration(HttpSession hs) {
		logger.info("KosmosSugangController.registration()진입 >>> : 학생 수강신청 페이지로 이동시킵니다.");

		return "sugang/sgRegistration";
	}
	
}
