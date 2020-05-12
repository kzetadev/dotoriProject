package com.example.demo.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.example.demo.db.Board_PostManager;
import com.example.demo.vo.Board_PostVo;

@Repository
public class Board_PostDao {

	// 게시판 글 목록  //은진; 매개변수 추가
	public List<Board_PostVo> listBoard_Post(int start, int end, String searchOption, String keyword) {
		return Board_PostManager.listBoard_Post(start,end,searchOption, keyword);
	}

	//은진 추가; 게시글 레코드 갯수
	public int countArticle(String searchOption, String keyword) {
		return Board_PostManager.countArticle(searchOption, keyword);
	}
	
	// 게시판 글 등록
	public int insertBoard_Post(Board_PostVo vo) {
		return Board_PostManager.insertBoard_Post(vo);
	}

	// 게시판 글 상세
	public Board_PostVo detailBoard_Post(int board_no) {
		return Board_PostManager.detailBoard_Post(board_no);
	}

	// 게시판 글 수정
	public int updateBoard_Post(Board_PostVo vo) {
		return Board_PostManager.updateBoard_Post(vo);
	}

	// 게시판 글 삭제
	public int deleteBoard_Post(Board_PostVo vo) {
		return Board_PostManager.deleteBoard_Post(vo);
	}
}
