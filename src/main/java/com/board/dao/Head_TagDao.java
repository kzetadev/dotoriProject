package com.board.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.board.mapper.Board_PostManager;
import com.board.vo.Head_TagVo;

@Repository
public class Head_TagDao {

	// 말머리 목록
	public List<Head_TagVo> listHead_Tag() {
		return Board_PostManager.listHead_Tag();
	}
}
