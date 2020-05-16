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
	private int mem_no;				// 회원번호
	private int head_tag_no;		// 말머리번호
	private int board_kinds;		// 게시판 종류(자유, 후기, 동행)
	private String board_title;		// 글제목
	private Date board_date;		// 게시일
	private Date board_update_date;	// 수정된 시각
	private int board_hit;			// 조회수
	private String board_content;	// 글내용
	private int board_copy;			// 복사기능
	private String mem_nickname;	// 회원 닉네임
	private String head_tag_name;	// 말머리명
}
