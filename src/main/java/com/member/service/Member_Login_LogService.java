package com.member.service;

import com.member.vo.Member_Login_LogVo;

public interface Member_Login_LogService {
	// 로그인시 로그가 기록됨
	int insertLog(Member_Login_LogVo mll);
	
}
