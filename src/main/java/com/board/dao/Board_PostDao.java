package com.board.dao;

import java.util.List;

import com.board.vo.Board_PostVo;

public interface Board_PostDao {
	// 게시판 글 목록
	List<Board_PostVo> listBoard_Post();
	// 게시판 글 등록
	int insertBoard_Post(Board_PostVo vo);
	// 게시판 글 상세
	Board_PostVo detailBoard_Post(int board_no);
	// 게시판 글 수정
	int updateBoard_Post(Board_PostVo vo);
	// 게시판 글 삭제
	int deleteBoard_Post(Board_PostVo vo);
}

