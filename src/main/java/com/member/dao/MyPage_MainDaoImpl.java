package com.member.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.member.vo.MyPage_MainVo;

@Repository("mypage_mainDao")
public class MyPage_MainDaoImpl implements MyPage_MainDao {
	@Inject
	protected SqlSession sqlSession;
	
	// 마이페이지 메인 화면
	@Override
	public MyPage_MainVo myPage_Main(int mem_no) {
		return sqlSession.selectOne("myPage.main", mem_no);
	}

}
