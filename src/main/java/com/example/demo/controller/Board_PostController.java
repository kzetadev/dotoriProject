package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.dao.Board_PostDao;
import com.example.demo.dao.Member_InfoDao;
import com.example.demo.vo.Board_PostVo;

@RestController
public class Board_PostController {
	
	@Autowired
	private Board_PostDao b_dao;

	public void setB_dao(Board_PostDao b_dao) {
		this.b_dao = b_dao;
	}

	//커뮤니티 글 목록
	@RequestMapping("/listBoard_Post.do")
	public ModelAndView listBoard_Post() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("listBoard_Post");
		mav.addObject("list", b_dao.listBoard_Post());
		return mav;
	}
	
	//커뮤니티 글 등록
	@RequestMapping("/insertBoard_Post.do")
	public ModelAndView insertBoard_Post(Board_PostVo vo) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("insertBoard_Post");
		mav.addObject("insert", b_dao.insertBoard_Post(vo));
		return mav;
	}
	
	//커뮤니티 글 상세
	@RequestMapping("/detailBoard_Post.do")
	public ModelAndView detailBoard_Post(int board_no) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("detailBoard_Post");
		mav.addObject("detail", b_dao.detailBoard_Post(board_no));
		return mav;
	}
	
	//커뮤니티 글 수정
	@RequestMapping("/updateBoard_Post.do")
	public ModelAndView updateBoard_Post(Board_PostVo vo) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("updateBoard_Post");
		mav.addObject("update", b_dao.updateBoard_Post(vo));
		return mav;
	}
	
	//커뮤니티 글 삭제
	@RequestMapping("/deleteBoard_Post.do")
	public ModelAndView deleteBoard_Post(Board_PostVo vo) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("deleteBoard_Post");
		mav.addObject("delete", b_dao.deleteBoard_Post(vo));
		return mav;
	}
}
