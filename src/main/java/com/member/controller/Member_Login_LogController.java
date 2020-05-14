package com.member.controller;

import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.member.service.Member_Login_LogService;
import com.member.vo.Member_Login_LogVo;

@Controller
public class Member_Login_LogController {
	@Resource(name="member_login_logService")
	private Member_Login_LogService member_login_logService;
	
	// 로그인시 로그가 기록됨
	@RequestMapping("/insertLog.do")
	public ModelAndView insertLog(Member_Login_LogVo mll, HttpServletRequest request) {
		ModelAndView m = new ModelAndView();
		String mem_ip = request.getRemoteAddr();
		String login_datetime = new Date().toLocaleString();
		System.out.println("요청한 ip : " + mem_ip);
		System.out.println("요청한 시간 : " + login_datetime);
		m.addObject("mem_ip", mem_ip);
		m.addObject("login_datetime", login_datetime);
		System.out.println(m);
		return m;
	}
}
