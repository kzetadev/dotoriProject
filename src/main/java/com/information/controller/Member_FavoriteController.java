package com.information.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.information.dao.Member_FavoriteDao;
import com.information.dao.Place_InfoDao;
import com.information.vo.Place_InfoVo;

@Controller
public class Member_FavoriteController {
	@Autowired
	private Member_FavoriteDao f_dao;
	@Autowired
	private Place_InfoDao p_dao;

	public void setM_dao(Member_FavoriteDao f_dao) {
		this.f_dao = f_dao;
	}
	public void setP_dao(Place_InfoDao p_dao) {
		this.p_dao = p_dao;
	}
	
	// ??????
	@Autowired
	private HttpSession session; 

	// 별표시를 누르면 member_favorite에 추가됨
	// @RequestMapping(value="cartAdd.do", method=RequestMethod.POST)
	@RequestMapping("/myPage/cartAdd.do")
	@ResponseBody
	public boolean insertMember_Favorite(HttpSession session, @RequestParam int place_no) {
		int mem_no = (Integer)session.getAttribute("mem_no");
		place_no = (Integer)session.getAttribute("place_no");
		System.out.println(mem_no);
		
		boolean data = false;

			data = true;
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("mem_no", mem_no);
			map.put("place_no", place_no);

		return data;
	}
	
	
	// 찜목록 리스트
	@RequestMapping("/listMember_Favorite.do")
	public ModelAndView listMember_Favorite() {
		System.out.println("컨트롤러 동작함");
		ModelAndView m = new ModelAndView();
		m.addObject("list", f_dao.listMember_Favorite());
		return m;
	}
	
	// 찜목록 상세보기 (해당 정보게시판 상세페이지로 이동) // 필요 없을수도?
//	@RequestMapping("/detailPlace_Info.do")
//	public ModelAndView detailMember_Favorite(int favorite_no) {
//		ModelAndView m = new ModelAndView();
//		m.addObject("f",f_dao.detailMember_Favorite(favorite_no));
//		return m;
//	}
	
//	// 로그인 확인
//	
//	@RequestMapping(value="/goMyPage.do", method=RequestMethod.POST)
//	@ResponseBody
//	public String goMyPage(HttpSession session, @RequestParam String place_name, @RequestParam String place_tel, @RequestParam String place_img) {
//		String id = (String)session.getAttribute("memberId");
//		String exist = null;
//		
//		// 로그인 확인
//		if(id == null) {
//			return exist;
//		}
//		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("id", id);
//		map.put("place_name", place_name);
//		map.put("place_tel", place_tel);
//		map.put("place_img", place_img);
//		
//		exist = m_dao.
//				
//		return exist;
//	}
	
	// 찜한 장소
	@RequestMapping("/myPage/insert")
	public ModelAndView myPage(HttpSession session) {
		System.out.println("마이페이지 컨트롤러 동작함");
		
		// String id = (String)session.getAttribute("memberId");
		
		ModelAndView m = new ModelAndView();
		
		return m;
	}
	
	// 해당 찜한 것 삭제
	@RequestMapping("/deleteMember_Favorite.do")
	public ModelAndView deleteMember_Favorite(int favorite_no) {
		ModelAndView m = new ModelAndView();
		m.setViewName("redirect:/listMember_Favorite");
		return m;
	}
}
