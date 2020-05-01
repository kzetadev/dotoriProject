package com.example.demo.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.example.demo.db.Board_PostManager;
import com.example.demo.vo.Board_PostVo;

@Repository
public class Board_PostDao {
	
	//커뮤니티 글 목록
	public List<Board_PostVo> listBoard_Post(){
		return Board_PostManager.listBoard_Post();
	}
	
	//커뮤니티 글 등록
	public int insertBoard_Post(Board_PostVo vo) {
		return Board_PostManager.insertBoard_Post(vo);
	}
	
	//커뮤니티 글 수정
	public int updateBoard_Post(Board_PostVo vo) {
		return Board_PostManager.updateBoard_Post(vo);
	}
	
	//커뮤니티 글 삭제
	public int deleteBoard_Post(Board_PostVo vo) {
		return Board_PostManager.deleteBoard_Post(vo);
	}
}
