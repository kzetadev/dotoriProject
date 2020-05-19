package com.member.dao;

import java.util.List;


import com.member.vo.Member_InfoVo;
import com.member.vo.MyPage_CommentVo;

public interface MyPage_commentDao {

	public List<MyPage_CommentVo> list(int mem_no) throws Exception;
}
