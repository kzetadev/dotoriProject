package com.example.demo.service;

import java.util.List;

import com.example.demo.vo.Board_PostVo;

public interface Board_PostService {

	//게시글 등록
	public void insertBoard_Post(Board_PostVo vo) throws Exception;
	
	//게시글 상세
	public Board_PostVo detailBoard_Post(int board_no) throws Exception;
	
	//게시글 수정
	public void updateBoard_Post(Board_PostVo vo) throws Exception;
	
	//게시글 삭제
	public void deleteBoard_Post(int board_no) throws Exception;
	
	//게시글 목록
	public List<Board_PostVo> listBoard_Post() throws Exception;
	
}
