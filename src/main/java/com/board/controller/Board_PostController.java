package com.board.controller;

import javax.annotation.Resource;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.board.service.Board_PostService;
import com.board.service.Head_TagService;
import com.board.vo.Board_PostVo;

@RestController 
public class Board_PostController {
	@Resource(name="board_postService")
	private Board_PostService board_postService;
	@Resource(name="head_tagService")
	private Head_TagService head_tagService;
//	@Resource(name="member_infoService")
//	private Member_InfoService member_infoService;

	// 게시글 목록
	@RequestMapping(value = "/listBoard_Post.do", method = RequestMethod.GET)
	public ModelAndView listBoard_Post() {
		ModelAndView mav = new ModelAndView();
		// 해당 부분에 Member_Info 추가해야 함
		mav.addObject("list", board_postService.listBoard_Post());
		mav.addObject("headtag", head_tagService.listHead_Tag());
		mav.setViewName("listBoard_Post");
		return mav;
	}
	
	// 게시글 등록
	@RequestMapping("/insertBoard_Post.do")
	public ModelAndView insertBoard_Post(Board_PostVo vo) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("insertBoard_Post");
		mav.addObject("insert", board_postService.insertBoard_Post(vo));
		return mav;
	}
	
	// 게시글 상세
	@RequestMapping(value = "/detailBoard_Post.do")
	public ModelAndView detailBoard_Post(int board_no) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("detailBoard_Post");
		mav.addObject("detail", board_postService.detailBoard_Post(board_no));
		return mav;
	}
	
	// 게시글 수정
	@RequestMapping("/updateBoard_Post.do")
	public ModelAndView updateBoard_Post(Board_PostVo vo) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("updateBoard_Post");
		mav.addObject("update", board_postService.updateBoard_Post(vo));
		return mav;
	}
	
	// 게시글 삭제
	@RequestMapping("/deleteBoard_Post.do")
	public ModelAndView deleteBoard_Post(Board_PostVo vo) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("deleteBoard_Post");
		mav.addObject("delete", board_postService.deleteBoard_Post(vo));
		return mav;
	}
}

