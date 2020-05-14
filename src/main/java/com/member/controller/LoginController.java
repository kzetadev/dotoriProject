package com.member.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.member.dao.Member_InfoDao;
import com.member.vo.Member_InfoVo;

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
	
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	public ModelAndView login(@RequestParam(value="error",required = false)String error,
			@RequestParam (value="logout",required =false)String logout) {
		ModelAndView mav = new ModelAndView();
		
		if(error != null) {
			mav.addObject("error", "아이디와 비밀번호를 다시 확인해주세요");
		}
		if(logout != null){
			mav.addObject("msg", "로그아웃 완료");
		}
		// mav.setViewName("login");
		
		return mav;
	}
	
		
}
