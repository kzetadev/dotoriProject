package com.information.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.information.dao.Member_FavoriteDao;
import com.information.dao.Place_InfoDao;
import com.information.vo.Member_FavoriteVo;

@Controller
public class Member_FavoriteController {
	@Autowired
	private Member_FavoriteDao f_dao;
	@Autowired	
	private Place_InfoDao p_dao;
	
	public void setF_dao(Member_FavoriteDao f_dao) {
		this.f_dao = f_dao;
	}
	public void setP_dao(Place_InfoDao p_dao) {
		this.p_dao = p_dao;
	}

	// ??????
	@Autowired
	private HttpSession session; 
	
	// 찜 장소 추가
	@RequestMapping("/insertMember_Favorite.do")
	public ModelAndView InsertMember_Favorite(Member_FavoriteVo f) {
		System.out.println("찜목록 추가 컨트롤러 동작함");
		// String id = (String)session.getAttribute("memberId");
		
		ModelAndView m = new ModelAndView();
		int re = f_dao.insertMember_Favorite(f);
		System.out.println("찜목록에 담긴 상품번호 : " + f.getFavorite_no());
		System.out.println(re);
		return m;
	}
	
	// 찜목록 리스트
	@RequestMapping("/myPage_Favorite.do")
	public ModelAndView listMember_Favorite(HashMap map) {
		System.out.println("컨트롤러 동작함");
		ModelAndView m = new ModelAndView();
		m.addObject("Flist", f_dao.listMember_Favorite());
		m.addObject("Plist", p_dao.listPlace_InfoPage(map));
		return m;
	}
	
	// 찜목록 상세보기 (해당 정보게시판 상세페이지로 이동) // 필요 없을수도?
//	@RequestMapping("/detailPlace_Info.do")
//	public ModelAndView detailMember_Favorite(int favorite_no) {
//		ModelAndView m = new ModelAndView();
//		m.addObject("f",f_dao.detailMember_Favorite(favorite_no));
//		return m;
//	}
	
	// 해당 찜한 것 삭제
	@RequestMapping("/deleteMember_Favorite.do")
	public ModelAndView deleteMember_Favorite(int favorite_no) {
		ModelAndView m = new ModelAndView();
		m.setViewName("redirect:/listMember_Favorite");
		return m;
	}
}