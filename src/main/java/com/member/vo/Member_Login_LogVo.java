package com.member.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Member_Login_LogVo {

	private int log_no;    //로그번호
	private int mem_no;    //회원번호
	private String mem_ip;    //아이피주소
	private Date login_datetime;    //로그인시간
	private String login_result;    //로그인 성공여부
}
