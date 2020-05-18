package com.board.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.board.service.Board_CommentService;
import com.board.service.Board_PostService;
import com.board.vo.Board_CommentVo;

@Controller
public class Board_CommentController {
	@Resource(name="board_commentService")
	private Board_CommentService board_commentService;
	@Resource(name="board_postService")
	private Board_PostService board_postService;
	//@Resource(name="member_infoService")
	//private Member_InfoService member_infoService;
	
	// 마이페이지에서 회원id가 #{mem_id}인 사람이 쓴 댓글들 보기
	@RequestMapping("/myPageListBoard_Comment.do")
	public ModelAndView myPageListBoard_Comment() {
		ModelAndView m = new ModelAndView();
		m.addObject("c_list", board_commentService.listBoard_Comment());
		
		// 회원 테이블도 고려해야할듯
		// m.addObject("m_list", member_infoService.메소드명();
		
		return m;
	}
	
	// 댓글 번호가 x번인 사람이 게시글에 올린 댓글(들) (부정확)
	@RequestMapping("/detailListBoard_Comment.do")
	public ModelAndView listBoard_Comment(int comment_no) {
		ModelAndView m = new ModelAndView();
		m.addObject("c_list", board_commentService.detailBoard_Comment(comment_no));
		// m.addObject("b_list", board_postService.detailBoard_Post());
		
		// 회원 테이블도 고려해야할듯
		// m.addObject("m_list", member_infoService.메소드명();
		
		return m;
	}
	
	// x번 회원이 x번 게시물에 대한 댓글을 달음 (부정확)
	@RequestMapping(value="/insertBoard_Comment.do", method=RequestMethod.POST)
	public ModelAndView insertBoard_Comment(Board_CommentVo vo) {
		ModelAndView m = new ModelAndView();
		int re = board_commentService.insertBoard_Comment(vo);
		return m;
	}
	
	// x번 회원이 x번 게시글에 쓴 댓글을 수정 (첨부파일 수정은 고려 안함)
	@RequestMapping("/updateBoard_Comment.do")
	public ModelAndView updateBoard_Comment(Board_CommentVo vo) {
		ModelAndView m = new ModelAndView();
		int re = board_commentService.updateBoard_Comment(vo);
		return m;
	}
	
	// x번 회원이 x번 게시글에 쓴 댓글을 삭제 (첨부파일 삭제는 고려 안함)
	@RequestMapping("/deleteBoard_Comment.do")
	public ModelAndView deleteBoard_Comment(Board_CommentVo vo) {
		ModelAndView m = new ModelAndView();
		int re = board_commentService.deleteBoard_Comment(vo);
		return m;
	}
}
