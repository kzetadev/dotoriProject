package com.board.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor

public class Board_PostVo {
	private int board_no;			// 글번호
	private int board_kinds;		// 게시판 분류(자유, 후기, 동행)
	private String head_tag_name;	// 말머리명
	private String board_title;		// 글제목
	private int mem_nickname;		// 회원 닉네임
	private Date board_date;		// 게시일
	private int board_hit;			// 조회수
}