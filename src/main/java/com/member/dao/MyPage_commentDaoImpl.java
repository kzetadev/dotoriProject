package com.member.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.member.vo.Member_InfoVo;
import com.member.vo.MyPage_CommentVo;

@Repository("myPage_commentDao")
public class MyPage_commentDaoImpl implements MyPage_commentDao {

	@Inject
	private SqlSession sqlsession;
	
	@Override
	public List<MyPage_CommentVo> list(int mem_no) throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.selectList("myPage.list",mem_no);
	}

}
