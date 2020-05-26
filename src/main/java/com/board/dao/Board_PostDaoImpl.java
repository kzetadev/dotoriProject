package com.board.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.board.vo.Board_PostSearchVo;
import com.board.vo.Board_PostVo;
import com.information.vo.SearchConditionVo;
@Repository("board_postDao")
public class Board_PostDaoImpl implements Board_PostDao {
	@Inject
	protected SqlSessionTemplate sqlSessionTemplate;
	@Override
	   public List<Board_PostVo> listBoard_Post(String search) {
	      // TODO Auto-generated method stub
	      String word = search;
	      String searchOption = "";
	      String keyword = "";      
	      
	      if(search != null) {
	         String getSearch[] = word.split("@");
	         for(int i=0; i<getSearch.length; i++) {
	        	 searchOption = getSearch[0];
	            
	            if(i == 1) {
	            	keyword = getSearch[1];
	            }   
	         }
	         
	         Map map = new HashMap();
	         map.put("searchOption", searchOption);
	         if(!"".equals(keyword)) {
	            map.put("keyword", keyword);
	         }
	         return sqlSessionTemplate.selectList("board_post.select", map);         
	         
	      }else {
	         List<Board_PostVo> aaa = sqlSessionTemplate.selectList("board_post.select", search);      
	         return sqlSessionTemplate.selectList("board_post.select", search);            
	         
	      }
	      
	   }

//	public List<Board_PostVo> listBoard_Post() {
//		// TODO Auto-generated method stub
//		return sqlSessionTemplate.selectList("board_post.select");
//	}

	@Override
	public int insertBoard_Post(Board_PostVo vo) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.insert("board_post.insert", vo);
	}

	@Override
	public Board_PostVo detailBoard_Post(int board_no) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("board_post.detail", board_no);
	}

	@Override
	public int updateBoard_Post(Board_PostVo vo) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.update("board_post.update", vo);
	}

	@Override
	public int deleteBoard_Post(Board_PostVo vo) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.delete("board_post.delete", vo);
	}

	@Override
	public void updateHit(int board_no) {
		// TODO Auto-generated method stub
		sqlSessionTemplate.update("board_post.updateHit", board_no);
	}
	
	@Override
	public List<Board_PostVo> mainBoard_Post1(Board_PostVo vo){
		return sqlSessionTemplate.selectList("board_post.selectMain1", vo);
	}
	
	@Override
	public List<Board_PostVo> mainBoard_Post2(Board_PostVo vo){
		return sqlSessionTemplate.selectList("board_post.selectMain2", vo);
	}

	@Override
	public List<Board_PostVo> mainBoard_Post3(Board_PostVo vo){
		return sqlSessionTemplate.selectList("board_post.selectMain3", vo);
	}

	@Override
	public List<Board_PostVo> mainBoard_Post4(Board_PostVo vo){
		return sqlSessionTemplate.selectList("board_post.selectMain4", vo);
	}
	// 통합검색화면에서 검색된 게시판정보
	@Override
	public List<Map> unifiedBoardSearch(Map map) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("unified_search.unifiedBoardSearch", map);
	}
	// 통합검색화면에서 게시판으로 조회된 검색조건
	@Override
	public List<SearchConditionVo> unifiedBoardCondition(Map map) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("unified_search.unifiedBoardCondition", map);
	}
	// 게시판, 검색조건(제목, 본문, 댓글, 말머리)에 해당하는 게시글 리스트 가져오기
	@Override
	public List<Board_PostSearchVo> searchBoard(Map map) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("unified_search.searchBoard", map);
	}
}
