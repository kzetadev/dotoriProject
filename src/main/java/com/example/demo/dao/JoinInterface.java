package com.example.demo.dao;

import java.sql.SQLException;

import com.example.demo.vo.Member_InfoVo;

public interface JoinInterface {
	int joinMem(Member_InfoVo vo) throws SQLException;//유저 회원가입 매소드
	int searchPwd(String mem_id, String mem_email, String mem_pwd);
	int checkOverId(String mem_id);
	int checkOverNickName(String mem_nickname);
}
