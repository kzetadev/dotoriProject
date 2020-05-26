package com.board.service;

import java.util.List;
import java.util.Map;

import com.board.vo.Board_PostSearchVo;
import com.board.vo.Board_PostVo;
import com.information.vo.SearchConditionVo;

public interface Board_PostService {
	// 게시글 목록
	List<Board_PostVo> listBoard_Post(String search);
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
	// 커뮤니티 메인 / 최신글
	List<Board_PostVo> mainBoard_Post1(Board_PostVo vo);
	// 커뮤니티 메인 / 인기글
	List<Board_PostVo> mainBoard_Post2(Board_PostVo vo);
	// 커뮤니티 메인 / 후기
	List<Board_PostVo> mainBoard_Post3(Board_PostVo vo);
	// 커뮤니티 메인 / 동행
	List<Board_PostVo> mainBoard_Post4(Board_PostVo vo);
	// 통합검색화면에서 검색된 게시판정보
	List<Map> unifiedBoardSearch(Map map);
	// 통합검색화면에서 게시판으로 조회된 검색조건
	List<SearchConditionVo> unifiedBoardCondition(Map map);
	// 게시판, 검색조건(제목, 본문, 댓글, 말머리)에 해당하는 게시글 리스트 가져오기
	List<Board_PostSearchVo> searchBoard(Map map);
}
