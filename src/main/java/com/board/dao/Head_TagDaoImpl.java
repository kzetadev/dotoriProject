package com.board.dao;

import java.util.List;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.board.vo.Head_TagVo;
@Repository("head_tagDao")
public class Head_TagDaoImpl implements Head_TagDao {
	@Inject
	protected SqlSessionTemplate sqlSessionTemplate;
	// 말머리 목록
	@Override
	public List<Head_TagVo> listHead_Tag() {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("board_post.selectHead_Tag");
	}
	// 게시판 구분에 따른 말머리 목록 
	@Override
	public List<Head_TagVo> listHead_TagByBoard_Kinds(int board_kinds) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("board_post.selectHead_TagByBoard_Kinds", board_kinds);
	}
}
