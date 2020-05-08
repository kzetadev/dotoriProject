package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MyPageController {
	@RequestMapping("/myPage.do")
	public ModelAndView myPage() {
		ModelAndView m = new ModelAndView();
		
		return m;
	}
}
