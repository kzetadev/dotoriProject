package com.member.service;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.member.interfacee.JoinInterface;
import com.member.vo.Member_InfoVo;

@Service
public class LoginService {
	
	private SqlSessionTemplate sqlTemplate;
	
	private JoinInterface joinInterface;
	
	public int memLogin_service(Member_InfoVo infovo, HttpSession session, String mem_check,HttpServletResponse response) {
		String mem_id = infovo.getMem_id();
		String mem_pwd = infovo.getMem_pwd();
		
		joinInterface = sqlTemplate.getMapper(JoinInterface.class);
		Member_InfoVo vo = joinInterface.loginMem(mem_id);
		
		//로그인 결과값
		int re = 0;
		
		//회원 정보가 없을시
		if(vo == null) {
			re = 0;
			return re;
		}
		return re;
	}
	
}
