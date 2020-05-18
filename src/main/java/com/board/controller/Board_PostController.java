package com.board.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.board.service.Board_CommentService;
import com.board.service.Board_PostService;
import com.board.service.Head_TagService;
import com.board.vo.Board_CommentVo;
import com.board.vo.Board_PostVo;

@RestController 
public class Board_PostController {
	@Resource(name="board_postService")
	private Board_PostService board_postService;
	@Resource(name="head_tagService")
	private Head_TagService head_tagService;
//	@Resource(name="member_infoService")
//	private Member_InfoService member_infoService;
	@Resource(name="board_commentService")
	private Board_CommentService board_commentService;

//	// 게시글 목록
//	@RequestMapping(value = "/listBoard_Post.do", method = RequestMethod.GET)
//	public ModelAndView listBoard_Post() {
//		List<Board_PostVo> list = board_postService.listBoard_Post();
//		ModelAndView mav = new ModelAndView();
//		// 해당 부분에 Member_Info 추가해야 함
//		mav.setViewName("listBoard_Post");
//		mav.addObject("list", list);
//		mav.addObject("headtag", head_tagService.listHead_Tag());
//		return mav;
//	}
	
	   // 게시글 목록
	   @RequestMapping(value = "/listBoard_Post.do", method = RequestMethod.GET)
	   public ModelAndView listBoard_Post(String search) {
	      List<Board_PostVo> list = board_postService.listBoard_Post(search);
	      ModelAndView mav = new ModelAndView();
	      // 해당 부분에 Member_Info 추가해야 함
	      mav.setViewName("listBoard_Post");
	      mav.addObject("list", list);
	      mav.addObject("headtag", head_tagService.listHead_Tag());
	      return mav;
	   }

	
//	// 게시글 등록
//	@RequestMapping("/insertBoard_Post.do")
//	public ModelAndView insertBoard_Post(Board_PostVo vo) {
//		ModelAndView mav = new ModelAndView();
//		mav.setViewName("insertBoard_Post");
//		mav.addObject("insert", board_postService.insertBoard_Post(vo));
//		return mav;
//	}
	
	// 게시글 작성 폼
	@RequestMapping(value = "/insertBoard_Post.do", method = RequestMethod.GET)
	public ModelAndView insertBoard_PostForm(@RequestParam(value = "board_no", defaultValue = "0") int board_no) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("board_no", board_no);
		return mav;
	}
	
	// 게시글 작성
	@RequestMapping(value = "/insertBoard_Post.do", method = RequestMethod.POST)
	public ModelAndView insertBoard_PostSubmit(Board_PostVo vo) {
		String msg = "게시물 등록에 실패했습니다.";
		ModelAndView mav = new ModelAndView();
		int re = board_postService.insertBoard_Post(vo);
		if(re > 0) {
			mav.setViewName("redirect:/listBoard_Post.do");
			msg = "게시물 등록에 성공했습니다.";
		}
//		mav.addObject("re", re);
		return mav;
	}
	
	/*
	// 게시글 상세
	@RequestMapping(value = "/detailBoard_Post.do")
	public ModelAndView detailBoard_Post(int board_no) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("detailBoard_Post");
		mav.addObject("detail", board_postService.detailBoard_Post(board_no));
		board_postService.updateHit(board_no);
		return mav;
	}
	*/
	
	// 게시글 상세
	@RequestMapping(value = "/detailBoard_Post.do")
	public ModelAndView detailBoard_Post(int board_no) {
		ModelAndView mav = new ModelAndView(); 
		mav.setViewName("detailBoard_Post");
		mav.addObject("detail", board_postService.detailBoard_Post(board_no));
		board_postService.updateHit(board_no);
		List<Board_CommentVo> clist = board_commentService.listComment(board_no);
		mav.addObject("clist",board_commentService.listComment(board_no));
		return mav;
	}
	
//	// 게시글 수정
//	@RequestMapping("/updateBoard_Post.do")
//	public ModelAndView updateBoard_Post(Board_PostVo vo) {
//		ModelAndView mav = new ModelAndView();
//		mav.setViewName("updateBoard_Post");
//		mav.addObject("update", board_postService.updateBoard_Post(vo));
//		return mav;
//	}
	
	// 게시글 수정 폼
	@RequestMapping(value = "/updateBoard_Post.do", method = RequestMethod.GET)
	public ModelAndView updateBoard_PostForm(int board_no) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("bList", board_postService.detailBoard_Post(board_no));
		return mav;
	}
	
	// 게시글 수정
	@RequestMapping(value = "/updateBoard_Post.do", method = RequestMethod.POST)
	public ModelAndView updateBoard_Post(Board_PostVo vo) {
		ModelAndView mav = new ModelAndView();
		int re = board_postService.updateBoard_Post(vo);
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
//		mav.addObject("delete", board_postService.deleteBoard_Post(vo));
//		return mav;
//	}
	
	// 게시글 삭제
	@RequestMapping("/deleteBoard_Post.do")
	public ModelAndView deleteBoard_Post(Board_PostVo vo) {
		ModelAndView mav = new ModelAndView();
		int re = board_postService.deleteBoard_Post(vo);
		if(re > 0) {
			mav.setViewName("redirect:/listBoard_Post.do");
		}
		return mav;
	}
	
	//커뮤니티 메인 / 1.최신글  2.인기글  3.후기  4.동행
		@RequestMapping("/mainBoard_Post.do")
		public ModelAndView mainBoard_Post1(Board_PostVo vo) {
			ModelAndView mav = new ModelAndView();
			List<Board_PostVo> mlist1 = board_postService.mainBoard_Post1(vo);
			List<Board_PostVo> mlist2 = board_postService.mainBoard_Post2(vo);
			List<Board_PostVo> mlist3 = board_postService.mainBoard_Post3(vo);
			List<Board_PostVo> mlist4 = board_postService.mainBoard_Post4(vo);
			mav.setViewName("mainBoard_Post");
			mav.addObject("mlist1", mlist1);
			mav.addObject("mlist2", mlist2);
			mav.addObject("mlist3", mlist3);
			mav.addObject("mlist4", mlist4);
			return mav;
		}
}

