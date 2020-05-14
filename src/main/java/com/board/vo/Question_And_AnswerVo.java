package com.board.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Question_And_AnswerVo {
	
	private int board_no; // 글번호
	private int mem_no; // 회원번호
	private int head_tag_no; // 말머리 (없음은 0)
	private int board_kinds; // 게시판 종류 (Q&A는 4로 고정)
	private String board_title; // 글제목
	private Date board_date; // 게시일
	private int board_hit; // 조회수
	private String board_content; // 글내용
	private Date board_update_date; // 수정된 날짜
	
	private int board_ref; // 리댓글시 참조되는 댓글번호
	private int board_level; // 리댓글 순번
	private int board_step; // 댓글 순서
}
