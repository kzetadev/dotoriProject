package com.example.demo.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor

public class Board_PostVo {
	
	private int board_no;
	private int mem_no;
	private int board_kinds;
	private String board_title;
	private Date board_date;
	private int board_hit;
	private String board_content;
	private int board_copy;
	private int board_head;
	
}
