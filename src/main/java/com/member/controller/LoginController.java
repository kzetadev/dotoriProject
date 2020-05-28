package com.member.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.member.service.LoginService;
import com.member.vo.Member_InfoVo;

@Controller
public class LoginController {
	@Resource(name="loginService")
	private LoginService loginService;
	@RequestMapping("/member/loginCheck.do")
	public Member_InfoVo loginCheck(HttpServletRequest request, Member_InfoVo vo) {
		System.out.println(vo);
		Member_InfoVo infovo = loginService.login(vo);
		System.out.println(infovo);
		return infovo;
	}
	
	@RequestMapping("/member/login.do")
	public void login(HttpServletRequest request) {
		
	}
	
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	public ModelAndView login(@RequestParam(value="error",required = false)String error,
			@RequestParam (value="logout",required =false)String logout) {
		ModelAndView mav = new ModelAndView();
		System.out.println("asd");
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
