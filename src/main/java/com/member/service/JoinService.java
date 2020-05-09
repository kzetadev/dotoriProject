package com.member.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.member.interfacee.JoinInterface;
import com.member.vo.Member_InfoVo;

@Service
public class JoinService { 
	
	@Autowired
	private SqlSessionTemplate sessionTemplate;
	private JoinInterface joinInterface;
	
	//회원가입 서비스
	public int join_servie(Member_InfoVo vo) {
		int re = 0;
		
		joinInterface = sessionTemplate.getMapper(JoinInterface.class);
		try {
			re = joinInterface.joinMem(vo);
		} catch (Exception e) {
			System.out.println(e.getMessage());
			// TODO: handle exception
		}
		return re;
	}
	//중복 아이디 체크
	public int memIdCheck(String mem_id) {
		joinInterface = sessionTemplate.getMapper(JoinInterface.class);
		
		return joinInterface.checkOverId(mem_id);
	}
	
//	//중복 닉네임 체크
//	public int memNickCheck(String mem_nickname) {
//		joinInterface = sessionTemplate.getMapper(JoinInterface.class);
//		
//		return joinInterface.checkOverNickName(mem_nickname);
//	}
}
