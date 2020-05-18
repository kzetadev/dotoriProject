package com.member.dao;

import java.util.List;


import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.member.vo.Member_InfoVo;

@Repository("myPage_commentDao")

public class MyPage_commentDaoImpl implements MyPage_commentDao {
	@Inject
	protected SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public List<Member_InfoVo> myPage_comment() {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("myPage.comment");
	}

}
