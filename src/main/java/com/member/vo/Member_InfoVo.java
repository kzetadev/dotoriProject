package com.member.vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Member_InfoVo { 
	private int mem_no; 			// 회원번호
	private String mem_id; 			// 아이디
	private String mem_pwd; 		// 비밀번호
	private String mem_email; 		// 이메일
	private int mem_email_agree; 	// 이메일 수신동의
	private String mem_name; 		// 이름
	private int mem_info_open; 		// 개인정보 공개여부
	private String mem_regidate; 	// 가입일자
	private String mem_nickname; 	// 닉네임
	private String mem_content; 	// 자기소개
	private String mem_img; 		// 프로필 사진
	private String mem_role; 		// 사용자/관리자
	private int mem_auth;			// 이메일 인증여부
	private int mem_check_code;		// 비밀번호 찾기 인증번호
	
	private MultipartFile uploadFile; // 파일의 내용을 
	
}
