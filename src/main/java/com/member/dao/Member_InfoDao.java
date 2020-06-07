package com.member.dao;

import java.util.Map;

import com.member.vo.Member_InfoVo;

public interface Member_InfoDao {
	//유저 로그인 메소드
	Member_InfoVo login(Member_InfoVo vo);
	//시큐리티용 로그인
	Member_InfoVo loginById(String mem_id);
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
	//이메일 중복 체크
	int checkOverEmail(String mem_email);
	
	//인증코드 해당 id 인증코드에 업데이트
	int updateCode(Member_InfoVo vo) throws Exception;
	
	//이메일 인증코드 중복 체크
	int checkCode(int mem_check_code);
	
	//이메일 인증
	int emailAuth(Member_InfoVo vo);
	
	//비밀번호 변경
	public int pass_change(Map<String, Object>map) throws Exception;
	
	//아이디 찾기
	public String find_idCheck(Member_InfoVo vo);
	
	//비밀번호 찾기
	public String find_pwdCheck(Member_InfoVo vo);
	//비밀번호 체크
//		boolean checkPwd(String mem_id, String mem_pwd);
	
	
////	//유저 로그인 메소드
//	Member_InfoVo loginMem(String mem_id);

	// @을 눌렀을때 로그인 하라고 창이 뜨게끔 함
//	public Member_InfoVo isMember(Member_InfoVo i) {
//		return Member_InfoManager.isMember(i);
//	}
}
