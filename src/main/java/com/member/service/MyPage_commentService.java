package com.member.service;

import java.util.List;
import java.util.Map;

import com.member.vo.Member_InfoVo;
import com.member.vo.MyPage_CommentVo;

public interface MyPage_commentService {
	//내가 쓴 댓글 목록
	public List<MyPage_CommentVo> list(int mem_no) throws Exception;



}
