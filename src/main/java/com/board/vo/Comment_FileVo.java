package com.board.vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Comment_FileVo {
	private int comment_file_no;    //댓글 첨부파일 번호
	private int comment_no;     //댓글번호
	private int mem_no;     //회원번호
	private int board_no;     //글번호
	private MultipartFile comment_file_name;     //댓글 첨부파일명
}
