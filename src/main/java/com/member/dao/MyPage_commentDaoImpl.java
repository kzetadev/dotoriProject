package com.member.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.member.vo.Member_InfoVo;
import com.member.vo.MyPage_CommentVo;
import com.member.vo.MyPage_PostVo;

@Repository("myPage_commentDao")
public class MyPage_commentDaoImpl implements MyPage_commentDao {

	@Inject
	private SqlSession sqlSession;
	
	@Override
	public List<MyPage_CommentVo> list(int mem_no){
		// TODO Auto-generated method stub
		return sqlSession.selectList("myPage.list", mem_no);
	}
	
	@Override
	public List<MyPage_PostVo> list_post(int mem_no){
		return sqlSession.selectList("myPage.myList", mem_no);
	}

}
