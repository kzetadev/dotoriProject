package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.dao.Member_FavoriteDao;
import com.example.demo.dao.Place_InfoDao;

@Controller
public class Member_FavoriteController {
	@Autowired
	private Member_FavoriteDao f_dao;

	public void setM_dao(Member_FavoriteDao f_dao) {
		this.f_dao = f_dao;
	}
	// 찜목록 리스트
	@RequestMapping("/listMember_Favorite")
	public ModelAndView listMember_Favorite() {
		System.out.println("컨트롤러 동작함");
		ModelAndView m = new ModelAndView();
		// m.setViewName("listPlace_Info");
		m.addObject("list", f_dao.listMember_Favorite());
		return m;
	}
	// 찜목록 상세보기 (해당 정보게시판 상세페이지로 이동) // 필요 없을수도?
//	@RequestMapping("/detailPlace_Info")
//	public ModelAndView detailMember_Favorite(int favorite_no) {
//		ModelAndView m = new ModelAndView();
//		m.addObject("f",f_dao.detailMember_Favorite(favorite_no));
//		return m;
//	}
	// 해당 찜한 것 삭제
	@RequestMapping("/deleteMember_Favorite")
	public ModelAndView deleteMember_Favorite(int favorite_no) {
		ModelAndView m = new ModelAndView();
		m.setViewName("redirect:/listMember_Favorite");
		return m;
	}
}
