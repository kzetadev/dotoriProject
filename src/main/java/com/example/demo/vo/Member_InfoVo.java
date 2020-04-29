package com.example.demo.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Member_InfoVo { 
private int mem_no; // 회원번호
private String mem_id; // 아이디
private String mem_pwd; // 비밀번호
private String mem_email; // 이메일
private int mem_email_agree; // 이메일 수신동의
private String name; // 이름
private int mem_info_open; // 개인정보 공개여부
private String mem_regidate; // 가입일자
private String mem_nickname; // 닉네임
private String mem_content; // 자기소개
private String mem_img; // 프로필 사진
}
