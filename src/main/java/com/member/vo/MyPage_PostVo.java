package com.member.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class MyPage_PostVo {
	private int board_no;
	private String board_title;
	private String mem_nickname;
	private String board_date;
	private int board_hit;

}
