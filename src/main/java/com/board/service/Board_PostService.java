package com.board.service;

import java.util.List;

import com.board.vo.Board_PostVo;

public interface Board_PostService {
	// 게시글 목록
	List<Board_PostVo> listBoard_Post();
	// 게시글 등록
	int insertBoard_Post(Board_PostVo vo);
	// 게시글 상세
	Board_PostVo detailBoard_Post(int board_no);
	// 게시글 수정
	int updateBoard_Post(Board_PostVo vo);
	// 게시글 삭제
	int deleteBoard_Post(Board_PostVo vo);
	// 게시글 조회수 증가
	void updateHit(int board_no);
}
