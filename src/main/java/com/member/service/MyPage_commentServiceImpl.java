package com.member.service;

import java.util.List;


import javax.annotation.Resource;
import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.member.dao.MyPage_commentDao;
import com.member.vo.Member_InfoVo;

@Service("myPage_commentService")
public class MyPage_commentServiceImpl implements MyPage_commentService {
	@Inject
	@Resource(name="myPage_commentDao")
	protected MyPage_commentDao myPage_commentDao;
	
	@Override
	public List<Member_InfoVo> myPage_comment() {
		return myPage_commentDao.myPage_comment();
	}

}
