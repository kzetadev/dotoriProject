package com.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.board.dao.Board_PostDao;
import com.board.dao.Head_TagDao;
import com.board.vo.Board_PostViewVo;
import com.member.dao.Member_InfoDao;

@RestController
public class Board_PostController {
	
	@Autowired
	private Member_InfoDao m_dao;
	
	@Autowired
	private Board_PostDao b_dao;
	
	@Autowired
	private Head_TagDao h_dao;

	public void setM_dao(Member_InfoDao m_dao) {
		this.m_dao = m_dao;
	}

	public void setB_dao(Board_PostDao b_dao) {
		this.b_dao = b_dao;
	}

	public void setH_dao(Head_TagDao h_dao) {
		this.h_dao = h_dao;
	}

	// 게시글 목록
	@RequestMapping(value="/listBoard_Post.do", method=RequestMethod.GET)
	public ModelAndView listBoard_Post() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("listBoard_Post");
		// 해당 부분에 Member_Info 추가해야 함
		mav.addObject("list", b_dao.listBoard_Post());
		mav.addObject("headtag", h_dao.listHead_Tag());
		return mav;
	}
	
//	// 게시글 등록
//	@RequestMapping("/insertBoard_Post.do")
//	public ModelAndView insertBoard_Post(Board_PostVo vo) {
//		ModelAndView mav = new ModelAndView();
//		mav.setViewName("insertBoard_Post");
//		mav.addObject("insert", b_dao.insertBoard_Post(vo));
//		return mav;
//	}
	
	// 게시글 작성 폼
	@RequestMapping(value = "/insertBoard_Post.do", method = RequestMethod.GET)
	public ModelAndView insertBoard_PostForm() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("bList", b_dao.listBoard_Post());
		return mav;
	}
	
	// 게시글 작성
	@RequestMapping(value = "/insertBoard_Post.do", method = RequestMethod.POST)
	public ModelAndView insertBoard_PostSubmit(Board_PostViewVo vo) {
		ModelAndView mav = new ModelAndView();
		int re = b_dao.insertBoard_Post(vo);
		if(re > 0) {
			mav.setViewName("redirect:/listBoard_Post.do");
		}
//		mav.addObject("re", re);
		return mav;
	}
	
	// 게시글 상세
	@RequestMapping(value = "/detailBoard_Post.do")
	public ModelAndView detailBoard_Post(int board_no) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("detailBoard_Post");
		mav.addObject("detail", b_dao.detailBoard_Post(board_no));
		return mav;
	}
	
//	// 게시글 수정
//	@RequestMapping("/updateBoard_Post.do")
//	public ModelAndView updateBoard_Post(Board_PostVo vo) {
//		ModelAndView mav = new ModelAndView();
//		mav.setViewName("updateBoard_Post");
//		mav.addObject("update", b_dao.updateBoard_Post(vo));
//		return mav;
//	}
	
	// 게시글 수정 폼
	@RequestMapping(value = "/updateBoard_Post.do", method = RequestMethod.GET)
	public ModelAndView updateBoard_PostForm(int board_no) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("bList", b_dao.detailBoard_Post(board_no));
		return mav;
	}
	
	// 게시글 수정
	@RequestMapping(value = "/updateBoard_Post.do", method = RequestMethod.POST)
	public ModelAndView updateBoard_Post(Board_PostViewVo vo) {
		ModelAndView mav = new ModelAndView();
		int re = b_dao.updateBoard_Post(vo);
		if(re > 0) {
			mav.setViewName("redirect:/listBoard_Post.do");
		}
		return mav;
	}
	
//	// 게시글 삭제
//	@RequestMapping("/deleteBoard_Post.do")
//	public ModelAndView deleteBoard_Post(Board_PostVo vo) {
//		ModelAndView mav = new ModelAndView();
//		mav.setViewName("deleteBoard_Post");
//		mav.addObject("delete", b_dao.deleteBoard_Post(vo));
//		return mav;
//	}
	
	// 게시글 삭제
	@RequestMapping("/deleteBoard_Post.do")
	public ModelAndView deleteBoard_Post(int board_no) {
		ModelAndView mav = new ModelAndView();
		int re = b_dao.deleteBoard_Post(board_no);
		if(re > 0) {
			mav.setViewName("redirect:/listBoard_Post.do");
		}
		return mav;
	}
}
