package com.example.demo.dao;

import java.sql.SQLException;

import org.apache.ibatis.annotations.Param;

import com.example.demo.vo.Member_InfoVo;

public interface JoinInterface {
	int joinMem(Member_InfoVo vo) throws SQLException;//유저 회원가입 매소드
	int searchPwd(String mem_id, String mem_email, String mem_pwd); //회원임시 비밀번호 변경 메소드
	int checkOverId(String mem_id); //아이디 중복체크
	int checkOverNickName(String mem_nickname); //닉네임 중복체크
	Member_InfoVo loginMem(@Param("mem_id")String mem_id);//유저 로그인 메소드
	Member_InfoVo memInfo(String mem_id);
}
