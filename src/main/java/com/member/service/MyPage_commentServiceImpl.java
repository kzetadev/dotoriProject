package com.member.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.member.dao.MyPage_commentDao;
import com.member.vo.Member_InfoVo;
import com.member.vo.MyPage_CommentVo;
import com.member.vo.MyPage_PostVo;

@Service("myPage_commentService")
public class MyPage_commentServiceImpl implements MyPage_commentService {
	@Inject
	private MyPage_commentDao dao;
	
	//내가 쓴 댓글 목록
	@Override
	public List<MyPage_CommentVo> list(int mem_no) throws Exception {
		// TODO Auto-generated method stub
		return dao.list(mem_no);
	}
	
	//내가 쓴 글 목록
	@Override
	public List<MyPage_PostVo> list_post(int mem_no) throws Exception{
		return dao.list_post(mem_no);
	
	}

}
