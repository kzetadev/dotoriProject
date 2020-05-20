package com.member.service;

import com.member.vo.Member_InfoVo;

public interface LoginService {
	// 유저 로그인 메소드
	Member_InfoVo login(Member_InfoVo vo);

	// 시큐리티용 로그인
	Member_InfoVo loginById(String mem_id);

	// 회원정보수정
	void updateMem(Member_InfoVo vo);

	// 회원 정보 삭제
	void delMem(String mem_id);

	// 비밀번호 체크
	boolean checkPwd(String mem_id, String mem_pwd);

}
