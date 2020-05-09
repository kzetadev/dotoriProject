package com.etc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class YoutubeAndFAQController {
	// FAQ (자주 묻는 질문들)
	@RequestMapping("/faq.do")
	public ModelAndView faq() {
		System.out.println("컨트롤러");
		ModelAndView m = new ModelAndView();
		return m;
	}
	// contents (유튜브 영상)
	@RequestMapping("/youtube.do")
	public ModelAndView youtube() {
		System.out.println("동작");
		ModelAndView m = new ModelAndView();
		return m;
	}
}
