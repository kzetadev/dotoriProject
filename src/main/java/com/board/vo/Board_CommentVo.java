package com.board.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Board_CommentVo {

	private int comment_no;    //댓글번호
	private int mem_no;     //회원번호
	private String mem_nickname;	//회원 닉네임
	private int board_no;      //글번호
	private String comment_content;    //댓글내용
	private Date comment_date;    //댓글 단 날짜
	private int comment_secret;    //비밀댓글 여부
	private int board_ref;    //리댓글시 참조되는 댓글번호
	private int board_level;     //리댓글 넘버
	private int board_step;     //댓글 순서
}
