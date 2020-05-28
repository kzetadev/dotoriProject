package com.member.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class MyPage_MainVo {
	// 마이페이지 메인 화면에 나올 닉네임, 사진, 자기소개
	// private int mem_no;
	private String mem_nickname;
	private String mem_img;
	private String mem_content;
	
}
