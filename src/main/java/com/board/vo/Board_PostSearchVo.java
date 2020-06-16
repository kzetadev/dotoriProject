package com.board.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor

public class Board_PostSearchVo {
	private String board_kinds_str;		// 게시판 종류(자유, 후기, 동행)
	private int board_no;				// 글번호
	private String head_tag_name;		// 말머리번호
	private String mem_nickname;		// 회원번호
	private String board_title;			// 글제목
	private String board_plain_content;	//검색용 본문 내용(평문)
	private int board_hit;				// 조회수
	private String board_date;			// 게시일
}