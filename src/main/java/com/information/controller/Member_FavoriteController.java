package com.information.controller;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.information.service.Member_FavoriteService;
import com.information.service.Place_InfoService;
import com.information.vo.Member_FavoriteVo;

@Controller
public class Member_FavoriteController {
	@Resource(name="member_favoriteService")
	private Member_FavoriteService member_favoriteService;
	@Resource(name="place_infoService")
	private Place_InfoService place_infoService;

	// 마이페이지에 담기
	@RequestMapping("/place/insertMember_Favorite.do")
	public ModelAndView InsertMember_Favorite(Member_FavoriteVo f) {
		System.out.println("찜목록 추가 컨트롤러 동작함");
		// String id = (String)session.getAttribute("memberId");
		
		ModelAndView m = new ModelAndView();
		int re = member_favoriteService.insertMember_Favorite(f);
		System.out.println("찜목록에 담긴 상품번호 : " + f.getFavorite_no());
		System.out.println(re);
		return m;
	}
	
	// 마이페이지 찜 리스트를 보여줌
	@RequestMapping("/myPage/myPage_Favorite.do")
	public ModelAndView listMember_Favorite(Map map) {
		System.out.println("컨트롤러 동작함");
		ModelAndView m = new ModelAndView();
		m.addObject("Flist", member_favoriteService.listMember_Favorite());
		m.addObject("Plist", place_infoService.listPlace_InfoPage(map));
		return m;
	}
	
	// 마이페이지 찜 리스트중에서 삭제하고 싶은 것 선택
	@RequestMapping("/myPage/deleteMember_Favorite.do")
	public ModelAndView deleteMember_Favorite(int favorite_no) {
		ModelAndView m = new ModelAndView();
		m.setViewName("redirect:/myPage/listMember_Favorite");
		return m;
	}
}
