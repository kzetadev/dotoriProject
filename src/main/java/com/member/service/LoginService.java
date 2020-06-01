package com.member.service;

import java.util.Map;

import com.member.vo.Member_InfoVo;

public interface LoginService {
	// 유저 로그인 메소드
	Member_InfoVo login(Member_InfoVo vo);

	// 시큐리티용 로그인
	Member_InfoVo loginById(String mem_id);

	// 비밀번호 체크
//	boolean checkPwd(String mem_id, String mem_pwd);
	
	//비밀번호 변경
	void pass_change(Map<String, Object> map, Member_InfoVo vo) throws Exception;
	
	String find_idCheck(Member_InfoVo vo); //아이디 찾기
	
	String find_pwdCheck(Member_InfoVo vo);//비밀번호 찾기

}
