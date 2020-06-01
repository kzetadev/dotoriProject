package com.member.service;

import java.util.Map;

import com.member.vo.Member_InfoVo;

public interface JoinService { 
	//회원가입 서비스
	int joinMember(Member_InfoVo vo);
	//중복 아이디 체크
	int checkOverId(String mem_id);
//	//닉네임 중복체크
	int checkOverNickName(String mem_nickname);
	//이메일 중복 체크
	int checkOverEmail(String mem_email);
	//이메일 인증
	int emailAuth(Member_InfoVo vo);
	
	
}
