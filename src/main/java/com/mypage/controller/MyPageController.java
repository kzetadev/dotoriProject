package com.mypage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MyPageController {
	// 마이페이지 메인
	@RequestMapping("/myPage.do")
	public ModelAndView myPage() {
		ModelAndView m = new ModelAndView();
		return m;
	}
	
	// 내가 쓴 글 & 댓글 목록
	@RequestMapping("/myPage_Contents.do")
	public ModelAndView myPage_Contents() {
		ModelAndView m = new ModelAndView();
		return m;
	}
	
	// 내가 찜한 장소 목록
	@RequestMapping("/myPage_Favorite.do")
	public ModelAndView myPage_Favorite() {
		ModelAndView m = new ModelAndView();
		return m;
	}	

	// 내가 받은 쪽지 목록
	@RequestMapping("/myPage_Message.do")
	public ModelAndView myPage_Message() {
		ModelAndView m = new ModelAndView();
		return m;
	}
}
