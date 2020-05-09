package com.example.demo.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Member_MessageVo {

	private int post_no;    //쪽지번호
	private int mem_no;    //회원번호
	private String post_from;    //발신자
	private String post_to;    //수신자
	private String post_content;    //내용
	private Date post_regidate;    //쪽지 작성일
}
