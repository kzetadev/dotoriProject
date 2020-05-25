package com.member.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor

public class MyPage_CommentVo {
	private int comment_no;
	private int board_no;
	private String board_title;
	private String mem_nickname;
	private Date comment_date;
	private String comment_content;
}
