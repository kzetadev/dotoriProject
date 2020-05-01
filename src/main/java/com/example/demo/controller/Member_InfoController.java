package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.dao.Member_InfoDao;

@Controller
public class Member_InfoController {
	
	@Autowired
	private Member_InfoDao m_dao;

	public void setM_dao(Member_InfoDao m_dao) {
		this.m_dao = m_dao;
	}
	
	@RequestMapping("/listMember_info")
	public ModelAndView listMember_info() {
		System.out.println("listMember_info 컨트롤러 동작");
		ModelAndView m = new ModelAndView();
		m.setViewName("listMember_info");
		m.addObject("list", m_dao.login());
		return m;
	}
	
}
