package com.member.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor

public class MyPage_CommentVo {
	private int comment_no;			//댓글 번호
	private int board_no;			//글 번호
	private String board_title;		//글 제목
	private String mem_nickname;	//닉네임
	private Date comment_date;		//댓글 작성일
	private String comment_content;	//댓글 내용
}
