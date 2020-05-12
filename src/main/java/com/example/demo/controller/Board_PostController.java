package com.example.demo.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.dao.Board_PostDao;
import com.example.demo.dao.Head_TagDao;
import com.example.demo.dao.Member_InfoDao;
import com.example.demo.db.Board_PostManager;
import com.example.demo.vo.Board_PostVo;
import com.example.demo.service.Board_PostPager;

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
	@RequestMapping(value = "/listBoard_Post.do", method = RequestMethod.GET)
	public ModelAndView listBoard_Post
	//은진     (){
	//@RequestParam(defaultValue=" " 기본값 할당
	(@RequestParam(defaultValue="title") String searchOption,
			@RequestParam(defaultValue = "") String keyword,
			@RequestParam(defaultValue = "1") int curPage) throws Exception{
		
		//레코드의 갯수 계산
		int count = Board_PostManager.countArticle(searchOption,keyword);
				
		//페이지 나누기 관련 처리
		Board_PostPager boardPager = new Board_PostPager(count, curPage);
		int start = boardPager.getPageBegin();
		int end = boardPager.getPageEnd();
				
		List<Board_PostVo> blist = Board_PostManager.listBoard_Post(start, end, searchOption,keyword);
		//
		
		ModelAndView mav = new ModelAndView();
		//은진
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("blist", blist);
		map.put("count", count);
		map.put("start",start);
		map.put("end", end);
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		//
		// 해당 부분에 Member_Info 추가해야 함
		//mav.addObject("list", b_dao.listBoard_Post(searchOption,keyword));
		mav.addObject("map",map);
		mav.addObject("headtag", h_dao.listHead_Tag());
		mav.setViewName("listBoard_Post");
		return mav;
	}
	
	// 게시글 등록
	@RequestMapping("/insertBoard_Post.do")
	public ModelAndView insertBoard_Post(Board_PostVo vo) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("insertBoard_Post");
		mav.addObject("insert", b_dao.insertBoard_Post(vo));
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
	
	// 게시글 수정
	@RequestMapping("/updateBoard_Post.do")
	public ModelAndView updateBoard_Post(Board_PostVo vo) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("updateBoard_Post");
		mav.addObject("update", b_dao.updateBoard_Post(vo));
		return mav;
	}
	
	// 게시글 삭제
	@RequestMapping("/deleteBoard_Post.do")
	public ModelAndView deleteBoard_Post(Board_PostVo vo) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("deleteBoard_Post");
		mav.addObject("delete", b_dao.deleteBoard_Post(vo));
		return mav;
	}
}
