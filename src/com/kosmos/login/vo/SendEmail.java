// 매개변수로 받은 메일주소(id)로 메일을 발송하고 결과를 알려주는 클래스 

package com.kosmos.login.vo;

public class SendEmail {

	public static String sendEmail(String id, String pw){
		String address = id;
		System.out.println("address 출력 >>> : " + address);
		String password = pw;
		String result = address + "로 비밀번호 ["+ password + "]를 발송했습니다.";
		
		return result;
	}
}