package com.example.demo.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RestController;

import com.example.demo.dao.Member_InfoDao;
import com.example.demo.vo.Member_InfoVo;

@Controller
public class LoginController {
	@Autowired
	private Member_InfoDao dao;

	public void setDao(Member_InfoDao dao) {
		this.dao = dao;
	}
	@RequestMapping("/loginCheck.do")
	public Member_InfoVo loginCheck(HttpServletRequest request, Member_InfoVo vo) {
		System.out.println(vo);
		Member_InfoVo infovo = dao.login(vo);
		System.out.println(infovo);
		return infovo;
	}
	
	@RequestMapping("/login.do")
	public void login() {
		
	}
		
}
