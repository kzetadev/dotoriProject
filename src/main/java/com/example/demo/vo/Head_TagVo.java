package com.example.demo.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Head_TagVo {
	private int head_tag_no;		// 말머리번호
	private String head_tag_name;	// 말머리명
	private int board_kinds;		// 게시판종류(자유:1, 후기:2, 동행:3)
}
