package com.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.member.vo.Member_InfoVo;

@Controller
public class IsMemberController {
	// 찜버튼 눌렀을때 로그인 여부 묻기
	@RequestMapping("/login.do")
	public ModelAndView login(Member_InfoVo i) {
		ModelAndView m = new ModelAndView();
		
		return m;
	}
}
