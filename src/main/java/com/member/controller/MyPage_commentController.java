package com.member.controller;

import javax.annotation.Resource;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.member.service.MyPage_commentService;

@RestController
public class MyPage_commentController {
	@Resource(name="myPage_commentService")
	private MyPage_commentService commentService;
	
	
	//내가 쓴 댓글 목록
	@RequestMapping(value = "/myPage_comment.do", method = RequestMethod.GET)
	public ModelAndView listMyPage_comment() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", commentService.myPage_comment());
		mav.setViewName("myPage_comment");
		return mav;
	}
}
