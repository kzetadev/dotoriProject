package com.member.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class MyPage_MainVo {
	// 마이페이지 메인 화면에 나올 닉네임, 사진, 자기소개
	private int mem_no; // 회원 번호
	private String mem_name; // 이름
	private String mem_id; // 아이디
	private String mem_email; // 이메일
	private String mem_nickname; // 닉네임
	private String mem_img; // 프로필 사진
	private String mem_content; // 자기소개
	
}
