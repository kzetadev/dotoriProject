package com.member.dao;

import com.member.vo.Member_InfoVo;

public interface Member_InfoDao {
	//유저 로그인 메소드
	Member_InfoVo login(Member_InfoVo vo);
	int update(Member_InfoVo vo);
	int delete(int mem_no);
	//유저 회원가입 매소드
	int joinMember(Member_InfoVo vo);
	//회원임시 비밀번호 변경 메소드
	int changeTempPwd(Member_InfoVo vo);
	//아이디 중복체크
	int checkOverId(String mem_id);
//	//닉네임 중복체크
	int checkOverNickName(String mem_nickname);
////	//유저 로그인 메소드
//	Member_InfoVo loginMem(String mem_id);

	// @을 눌렀을때 로그인 하라고 창이 뜨게끔 함
//	public Member_InfoVo isMember(Member_InfoVo i) {
//		return Member_InfoManager.isMember(i);
//	}
}
