package com.member.service;

import com.member.vo.Member_InfoVo;

public interface LoginService {
	//유저 로그인 메소드
	Member_InfoVo login(Member_InfoVo vo);
}
