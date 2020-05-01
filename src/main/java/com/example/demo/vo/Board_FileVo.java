package com.example.demo.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor

public class Board_FileVo {

	private int board_file_no;     //글 첨부파일 번호
	private int board_no;     //글번호
	private int mem_no;     //회원번호
	private String board_file_name;     //글 첨부파일명
}
