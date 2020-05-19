//package com.member.controller;
//
//import java.util.List;
//
//import javax.annotation.Resource;
//import javax.servlet.http.HttpServletRequest;
//
//import org.apache.log4j.Logger;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.bind.annotation.RestController;
//import org.springframework.web.servlet.ModelAndView;
//
//import com.member.service.MyPage_commentService;
//import com.member.vo.Member_InfoVo;
//
//@RestController
//public class MyPage_commentController {
//	
//	Logger logger = Logger.getLogger(this.getClass());
//	
//	@Resource(name="myPage_commentService")
//	private MyPage_commentService commentService;
//	
//	
//	//내가 쓴 댓글 목록
//	@RequestMapping(value = "/myPage_Contents.do", method = RequestMethod.GET)
//	public String list(HttpServletRequest request, Model model) throws Exception{
//		logger.info("list");
//		model.addAttribute("list", commentService.list());
//		
//		return "myPage_Contents";
//	}
//}
