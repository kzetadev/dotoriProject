package com.board.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.board.mapper.Board_PostManager;
import com.board.vo.Board_PostViewVo;
import com.board.vo.Board_PostVo;

@Repository
public class Board_PostDao {

	// 게시글 목록
	public List<Board_PostViewVo> listBoard_Post() {
		return Board_PostManager.listBoard_Post();
	}

	// 게시글 등록
	public int insertBoard_Post(Board_PostViewVo vo) {
		return Board_PostManager.insertBoard_Post(vo);
	}

	// 게시글 상세
	public Board_PostVo detailBoard_Post(int board_no) {
		return Board_PostManager.detailBoard_Post(board_no);
	}

	// 게시글 수정
	public int updateBoard_Post(Board_PostViewVo vo) {
		return Board_PostManager.updateBoard_Post(vo);
	}

//	// 게시글 삭제
//	public int deleteBoard_Post(Board_PostVo vo) {
//		return Board_PostManager.deleteBoard_Post(vo);
//	}
	
	// 게시글 삭제
	public int deleteBoard_Post(int board_no) {
		return Board_PostManager.deleteBoard_Post(board_no);
	}
	
}
