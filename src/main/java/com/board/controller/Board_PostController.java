package com.board.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.board.service.Board_CommentService;
import com.board.service.Board_PostService;
import com.board.service.Head_TagService;
import com.board.vo.Board_PostListVo;
import com.board.vo.Board_PostVo;
import com.google.gson.Gson;
import com.member.service.LoginService;
import com.security.config.LoginUser;

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
	
	@Resource(name="loginService")
	private LoginService loginService;
	
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
	public static int totalRecord = 0; //전체 레코드 수를 저장하기 위한 변수
	public static int pageSIZE = 10; //한 화면에 보여줄 레코드 수를 제한하기 위한 변수
	public static int totalPage = 1; //전체 페이지 수를 저장하기 위한 변수
	public static int pageGroup = 10; //한 화면에 보여줄 페이지의 수를 제한하기 위한 변수

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
	
	//게시판 구분에 따른 말머리 목록
	@RequestMapping(value="/board/listHead_Tag.do/{board_kinds}", method=RequestMethod.GET)
	@ResponseBody
	public String listHead_Tag(@PathVariable("board_kinds")int board_kinds) {
		String headTagList = "";
		System.out.println(board_kinds);
		headTagList = (new Gson()).toJson(head_tagService.listHead_TagByBoard_Kinds(board_kinds));
		System.out.println(headTagList);
		return headTagList;
	}
	// 게시글 목록
	   @RequestMapping(value = "/board/listBoard_Post.do", method = RequestMethod.GET)
	   public ModelAndView listBoard_Post(String str) {
	      
	      String stotalRecord = "";
	      String sNum = "";
	      String eMum = "";
	      String keyWord = str;
	      String sel1 = "";
	      String sel2 = "";
	      
	      int startNum = 0;
	      int endNum = 0;
	      int listCount = 0;
	      int curPage = 1;      // 현재페이지
	      float pageSize = (float)pageSIZE;    
	      
	      ModelAndView mav = new ModelAndView();
	      // 해당 부분에 Member_Info 추가해야 함

	      if(str != null) {
	         String getStr[] = keyWord.split("@");
	         for(int i=0; i<getStr.length; i++) {
	            
	            if(i == 0) {
	               sel1 = getStr[0];      // 말머리   
	            }
	            
	            if(i == 1) {
	               sel2 = getStr[1];      // 검색키워드
	            }
	            
	            if(i == 2) {
	               curPage = Integer.parseInt(getStr[2]);
	            }
	         }   
	      }
	      	      
	      List<Board_PostListVo> list = board_postService.listBoard_Post(str);

	      mav.setViewName("/board/listBoard_Post");
	      mav.addObject("list", list);
	      
	      sNum = list.get(0).getRnum();      // 시작페이지
	      sNum = sNum.substring(0, 1);      // 첫번째 값으로 페이지 앞번호를 찾는다.
	      startNum = Integer.parseInt(sNum);   // int로 캐스팅한 변수에 삽입
	      listCount = list.size();         // 현재 리스트에 몇건이 있는지 확인
	      stotalRecord = list.get(0).getTotcnt();
	      totalRecord = Integer.parseInt(stotalRecord);
	       
	      int devide = (int) Math.ceil(((float)(curPage+1)/(float)pageGroup));  //기준체크      
	      int start = ((devide)*pageGroup) - (pageGroup-1); // 해당페이지에서 시작번호(step2) 
	      int end = ((devide)*pageGroup); // 해당페이지에서 끝번호(step2)
	      int pgCnt = (int) Math.floor(totalRecord / pageSize);  
	      if(end > pgCnt){  //최종 넘어가는 갯수 오버 방지
	         end = pgCnt;
	      }
	      
	      totalPage = (int)Math.ceil(totalRecord / (double)pageSIZE);
	      
	      totalPage = totalPage-1;
	      
	      mav.addObject("totalRecord", totalRecord);
	      mav.addObject("totalPage", totalPage);
	      mav.addObject("pageGroup", pageGroup);
	      mav.addObject("curPage", curPage);
	      mav.addObject("start", start);
	      mav.addObject("end", end);
	      mav.addObject("sel1", sel1);   // 말머리
	      mav.addObject("sel2", sel2);   // 검색키워드  
	      
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
	@RequestMapping(value = "/board/insertBoard_Post.do", method = RequestMethod.GET)
	public ModelAndView insertBoard_PostForm(@RequestParam(value = "board_no", defaultValue = "0") int board_no) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("board_no", board_no);
		if(LoginUser.isLogin()) {
			mav.addObject("member", loginService.loginById(LoginUser.getMember_InfoVo().getMem_id()));
		}
		return mav;
	}
	
	// 게시글 작성
	@RequestMapping(value = "/board/insertBoard_Post.do", method = RequestMethod.POST)
	@ResponseBody
	public int insertBoard_PostSubmit(Board_PostVo vo, HttpServletRequest req) {
//		String msg = "게시물 등록에 실패했습니다.";
		System.out.println(vo);
		ModelAndView mav = new ModelAndView("redirect:/board/listBoard_Post.do");
		int re = -1;
		re = board_postService.insertBoard_Post(vo);
//		if(re > 0) {
//			mav.setViewName("redirect:/listBoard_Post.do");
//			msg = "게시물 등록에 성공했습니다.";
//		}
//		mav.addObject("re", re);
		return re;
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
	@RequestMapping(value = "/board/detailBoard_Post.do")
	@Transactional
	public ModelAndView detailBoard_Post(int board_no) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/board/detailBoard_Post");
		mav.addObject("detail", board_postService.detailBoard_Post(board_no));
		if(LoginUser.isLogin()) {
			mav.addObject("mem_no", LoginUser.getMember_no());
		}
		board_postService.updateHit(board_no);
//		List<Board_CommentVo> clist = board_commentService.listComment(board_no);
//		mav.addObject("clist", clist);
		return mav;
	}
	@RequestMapping(value="/board/getBoardPost.do/{board_no}", method=RequestMethod.GET)
	@ResponseBody
	public String getBoardPost(@PathVariable("board_no")int board_no) {
		String board_str = "";
//		System.out.println("/board/getBoardPost.do/" + board_no);
		board_str = (new Gson()).toJson(board_postService.detailBoard_Post(board_no));
//		System.out.println(board_str);
		return board_str;
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
	@RequestMapping(value = "/board/updateBoard_Post.do", method = RequestMethod.GET)
	public ModelAndView updateBoard_PostForm(Board_PostVo vo) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("update", board_postService.detailBoard_Post(vo.getBoard_no()));
		return mav;
	}
	
	// 게시글 수정
	@RequestMapping(value = "/board/updateBoard_Post.do", method = RequestMethod.POST)
	@ResponseBody
	public int updateBoard_PostSubmit(Board_PostVo vo, HttpServletRequest req) {
//		ModelAndView mav = new ModelAndView("redirect:/board/listBoard_Post.do");
		int re = -1;
		re = board_postService.updateBoard_Post(vo);
//		if(re > 0) {
//			mav.setViewName("redirect:/listBoard_Post.do");
//		}
		return re;
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
	@RequestMapping("/board/deleteBoard_Post.do")
	public ModelAndView deleteBoard_Post(Board_PostVo vo) {
		ModelAndView mav = new ModelAndView("redirect:/board/listBoard_Post.do");
		int re = board_postService.deleteBoard_Post(vo);
//		if(re > 0) {
//			mav.setViewName("redirect:/listBoard_Post.do");
//		}
		mav.addObject("re", re);
		return mav;
	}
	
	//커뮤니티 메인 / 1.최신글  2.인기글  3.후기  4.동행
	@RequestMapping("/board/mainBoard_Post.do")
	public ModelAndView mainBoard_Post1(Board_PostVo vo) {
		ModelAndView mav = new ModelAndView();
		List<Board_PostVo> mlist1 = board_postService.mainBoard_Post1(vo);
		List<Board_PostVo> mlist2 = board_postService.mainBoard_Post2(vo);
		List<Board_PostVo> mlist3 = board_postService.mainBoard_Post3(vo);
		List<Board_PostVo> mlist4 = board_postService.mainBoard_Post4(vo);
		mav.setViewName("/board/mainBoard_Post");
		mav.addObject("mlist1", mlist1);
		mav.addObject("mlist2", mlist2);
		mav.addObject("mlist3", mlist3);
		mav.addObject("mlist4", mlist4);
		return mav;
	}
}

