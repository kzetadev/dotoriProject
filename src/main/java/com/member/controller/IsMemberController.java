package com.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.member.dao.Member_InfoDao;
import com.member.vo.Member_InfoVo;

@Controller
public class IsMemberController {
	private Member_InfoDao m_dao;
	
	public void setM_dao(Member_InfoDao m_dao) {
		this.m_dao = m_dao;
	}

	// 찜버튼 눌렀을때 로그인 여부 묻기
	@RequestMapping("/isMember.do")
	public ModelAndView login(Member_InfoVo i) {
		ModelAndView m = new ModelAndView();
		m.addObject("mem", m_dao.isMember(i));
		return m;
	}
}
