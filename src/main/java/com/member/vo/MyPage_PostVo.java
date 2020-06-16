package com.member.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class MyPage_PostVo {
	private int board_no; // 글번호
	private String board_title; // 글제목
	private String mem_nickname; // 닉네임
	private Date board_date; // 게시일
	private int board_hit; // 조회수
	
}
