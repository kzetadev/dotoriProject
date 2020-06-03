package com.board.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.board.dao.Board_PostDao;
import com.board.vo.Board_PostListVo;
import com.board.vo.Board_PostSearchVo;
import com.board.vo.Board_PostVo;
import com.information.vo.SearchConditionVo;
@Service("board_postService")
public class Board_PostServiceImpl implements Board_PostService {
	@Inject
	@Resource(name="board_postDao")
	protected Board_PostDao board_postDao;
	@Override
	public List<Board_PostListVo> listBoard_Post(String search) {
		// TODO Auto-generated method stub
		return board_postDao.listBoard_Post(search);
	}

	@Override
	public int insertBoard_Post(Board_PostVo vo) {
		// TODO Auto-generated method stub
		return board_postDao.insertBoard_Post(vo);
	}

	@Override
	public Board_PostVo detailBoard_Post(int board_no) {
		// TODO Auto-generated method stub
		return board_postDao.detailBoard_Post(board_no);
	}

	@Override
	public int updateBoard_Post(Board_PostVo vo) {
		// TODO Auto-generated method stub
		return board_postDao.updateBoard_Post(vo);
	}

	@Override
	public int deleteBoard_Post(Board_PostVo vo) {
		// TODO Auto-generated method stub
		return board_postDao.deleteBoard_Post(vo);
	}

	@Override
	public void updateHit(int board_no) {
		board_postDao.updateHit(board_no);
	}
	
	@Override
	public List<Board_PostVo> mainBoard_Post1(Board_PostVo vo){
		return board_postDao.mainBoard_Post1(vo);
	}
	
	@Override
	public List<Board_PostVo> mainBoard_Post2(Board_PostVo vo){
		return board_postDao.mainBoard_Post2(vo);
	}
	
	@Override
	public List<Board_PostVo> mainBoard_Post3(Board_PostVo vo){
		return board_postDao.mainBoard_Post3(vo);
	}
	 
	@Override
	public List<Board_PostVo> mainBoard_Post4(Board_PostVo vo){
		return board_postDao.mainBoard_Post4(vo);
	}
	// 통합검색화면에서 검색된 게시판정보
	@Override
	public List<Map> unifiedBoardSearch(Map map) {
		// TODO Auto-generated method stub
		return board_postDao.unifiedBoardSearch(map);
	}
	// 통합검색화면에서 게시판으로 조회된 검색조건
	@Override
	public List<SearchConditionVo> unifiedBoardCondition(Map map) {
		// TODO Auto-generated method stub
		return board_postDao.unifiedBoardCondition(map);
	}
	// 게시판, 검색조건(제목, 본문, 댓글, 말머리)에 해당하는 게시글 리스트 가져오기
	@Override
	public List<Board_PostSearchVo> searchBoard(Map map) {
		// TODO Auto-generated method stub
		return board_postDao.searchBoard(map);
	}
	//각 게시판별 총 레코드 카운트 조회
	@Override
	public int galleryBoardRecordCount(int board_kinds) {
		// TODO Auto-generated method stub
		return board_postDao.galleryBoardRecordCount(board_kinds);
	}
	// 갤러리. 이미지가 포함된 게시판 종류 조회
	@Override
	public List<Map> galleryBoardkinds() {
		// TODO Auto-generated method stub
		return board_postDao.galleryBoardkinds();
	}
	// 갤러리. 이미지가 포함된 게시판 종류 조회
	@Override
	public List<Board_PostVo> galleryBoardImage(Map map) {
		// TODO Auto-generated method stub
		return board_postDao.galleryBoardImage(map);
	}
}
