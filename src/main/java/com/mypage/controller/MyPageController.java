package com.mypage.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.member.service.MyPage_commentService;
import com.member.vo.MyPage_CommentVo;

@Controller
public class MyPageController {
	
	Logger logger = Logger.getLogger(this.getClass());
	
	@Resource(name="myPage_commentService")
	private MyPage_commentService commentService;
	
	// 마이페이지 메인
	@RequestMapping("/myPage.do")
	public ModelAndView myPage() {
		ModelAndView m = new ModelAndView();
		return m;
	}
	
	//내가 쓴 댓글 목록
	@RequestMapping(value = "/myPage_Content.do", method = RequestMethod.GET)
	public ModelAndView list(HttpServletRequest request) throws Exception{
		ModelAndView mav = new ModelAndView("myPage_Contents");
		logger.info("list");
		int mem_no  = 1;
		List<MyPage_CommentVo> list = commentService.list(mem_no);
		mav.addObject("list", list);
		return mav;
	}
	
//	// 내가 쓴 글댓글 목록
//	@RequestMapping("/myPage_Contents.do")
//	public ModelAndView myPage_Contents() {
//		ModelAndView m = new ModelAndView();
//		return m;
//	}
	
//	// 내가 찜한 장소 목록
//	@RequestMapping("/myPage_Favorite.do")
//	public ModelAndView myPage_Favorite() {
//		ModelAndView m = new ModelAndView();
//		return m;
//	}	

	// 내가 받은 쪽지 목록
	@RequestMapping("/myPage_Message.do")
	public ModelAndView myPage_Message() {
		ModelAndView m = new ModelAndView();
		return m;
	}
}
