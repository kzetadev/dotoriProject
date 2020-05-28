package com.member.service;

import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.member.dao.MyPage_commentDao;
import com.member.vo.Member_InfoVo;
import com.member.vo.MyPage_CommentVo;
import com.member.vo.MyPage_PostVo;

@Service("myPage_commentService")
public class MyPage_commentServiceImpl implements MyPage_commentService {
	@Inject
	private MyPage_commentDao myPage_commentDao;

	// 내가 쓴 댓글 목록
	@Override
	public List<MyPage_CommentVo> list(int mem_no) throws Exception {
		// TODO Auto-generated method stub
		return myPage_commentDao.list(mem_no);
	}

	// 내가 쓴 글 목록
	@Override
	public List<MyPage_PostVo> list_post(int mem_no) throws Exception {
		return myPage_commentDao.list_post(mem_no);
	}

	@Override
	public int updateMem(Member_InfoVo vo) {
		return myPage_commentDao.updateMem(vo);

	}

	@Override
	public void delMem(String mem_id) {
		myPage_commentDao.delMem(mem_id);

	}

	@Override
	public boolean checkPwd(String mem_id, String mem_pwd) {
		// TODO Auto-generated method stub
		return myPage_commentDao.checkPwd(mem_id, mem_pwd);
	}

}
