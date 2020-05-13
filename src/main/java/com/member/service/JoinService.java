package com.member.service;

import com.member.vo.Member_InfoVo;

public interface JoinService { 
	//회원가입 서비스
	int joinMember(Member_InfoVo vo);
	//중복 아이디 체크
	int checkOverId(String mem_id);
//	//중복 닉네임 체크
//	public int memNickCheck(String mem_nickname) {
//		joinInterface = sessionTemplate.getMapper(JoinInterface.class);
//		
//		return joinInterface.checkOverNickName(mem_nickname);
//	}
}
