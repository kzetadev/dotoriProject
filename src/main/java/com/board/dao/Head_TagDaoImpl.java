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
	@Override
	public List<Head_TagVo> listHead_Tag() {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("board_post.selectHead_Tag");
	}

}
