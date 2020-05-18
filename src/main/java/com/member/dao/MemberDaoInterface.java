package com.member.dao;

import java.sql.SQLException;
import java.util.HashMap;

import org.apache.ibatis.annotations.Param;

import com.member.vo.Member_InfoVo;

public interface MemberDaoInterface {
	//유저정보관련
	int regMem(Member_InfoVo vo) throws SQLException;//유저 회원가입 메소드
	Member_InfoVo loginUser(@Param("mem_id")String mem_id);//유저 로그인 메소드
	String searchId(@Param("mem_name")String mem_name,@Param("mem_email")String mem_email);//유저 id찾기
	Member_InfoVo userInfo(String mem_id);
//	MemberVo searchPwd(String memId);//유저 pwd찾기
	Member_InfoVo getMyPage(String mem_id);//마이페이지 메소드
	int editMemNickName(HashMap<String, String>map);//유저 닉네임 수정
	int editMemContent(HashMap<String, String>map);//유저 자기소개 수정
	int editMemPwd(HashMap<String, String>map);//유저 비밀번호 수정
	int deleteMem(String mem_id);//유저삭제
	
	int checkOverId(String mem_id);//id중복체크
	int checkOverNickName(String mem_nickname);//닉네임 중복체크
	int checkOverEmail(String mem_email);//닉네임 중복체크
	
	

}
