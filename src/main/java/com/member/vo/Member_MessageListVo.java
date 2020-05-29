package com.member.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Member_MessageListVo {

	private int post_no;    //쪽지번호
	private int mem_no;    //회원번호
	private String mem_nickname;    //닉네임
	private String post_title;		//제목
	private String post_content;    //내용
	private int post_ref_no;		//참조 쪽지 번호
	private String post_read;			//쪽지 읽음 여부
	private int post_reply;			//답장 여부
	private Date post_regidate;    //쪽지 작성일
}
