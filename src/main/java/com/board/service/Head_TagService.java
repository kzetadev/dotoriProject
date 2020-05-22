package com.board.service;

import java.util.List;

import com.board.vo.Head_TagVo;

public interface Head_TagService {
	// 말머리 목록
	List<Head_TagVo> listHead_Tag() ;
	// 게시판 구분에 따른 말머리 목록 
	List<Head_TagVo> listHead_TagByBoard_Kinds(int board_kinds);
}
