package com.information.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.information.service.Member_FavoriteService;
import com.information.service.Place_ThemeService;
import com.information.vo.Member_FavoriteVo;
import com.security.config.LoginUser;

@Controller
public class Member_FavoriteController {
	Logger logger = Logger.getLogger(this.getClass());
	
	@Resource(name="member_favoriteService")
	private Member_FavoriteService member_favoriteService;
	
	@Resource(name="place_themeService")
	private Place_ThemeService place_themeService;

	// 마이페이지에 담기 (detailPlace_Info에서 처리함)
	@RequestMapping("/place/insertMember_Favorite.do")
	@ResponseBody
	public int InsertMember_Favorite(Member_FavoriteVo f) {
		f.setMem_no(LoginUser.getMember_no());
		
		int re = member_favoriteService.insertMember_Favorite(f);
		
		System.out.println("찜목록에 담긴 상품번호 : " + f.getFavorite_no());
		System.out.println(re);
		return re;
	}
	
	// 마이페이지 찜 전체 리스트
	@RequestMapping("/member/myPage_Favorite.do")
	public ModelAndView listMember_Favorite(@RequestParam(name="place_type", defaultValue="-1")int place_type) {

		Map map = new HashMap();
		//place_type이 -1이면 파라미터에 place_type이 없이 defaultValue로 지정된것으로 간주.
		//전체 목록을 조회함으로 판단
		if(place_type > -1) {
			map.put("place_type", place_type);
		}
		System.out.println("마이페이지 찜리스트 컨트롤러 동작함");
		// Place_ThemeVo pt = place_themeService.getPlace_Theme(place_type);
		
		ModelAndView m = new ModelAndView();
//		logger.info("list");
		int mem_no = 0;
		if(LoginUser.isLogin()) {
			mem_no = LoginUser.getMember_no();
		}
		
		map.put("mem_no", mem_no);
		m.addObject("favorite_list", member_favoriteService.listMember_Favorite(map));
		// 총 개수 구함
		int AllCount = member_favoriteService.listAllCount(map);
		m.addObject("AllCount",AllCount);
		
		m.addObject("theme", place_themeService.listPlace_Theme());
		
		m.addObject("number", place_type);
		System.out.println("마이페이지 찜리스트 컨트롤러 종료");
		return m;
	}
	
	// 마이페이지 찜 리스트중에서 삭제하고 싶은 것 선택
//	@RequestMapping(value="/member/deleteMember_Favorite.do", method=RequestMethod.GET)
//	public ModelAndView deleteMember_FavoriteGet(int favorite_no) {
//		ModelAndView m = new ModelAndView();
//		m.addObject("favorite_no",favorite_no);
//		return m;
//	}
	
	// 마이페이지 찜 리스트중에서 삭제하고 싶은 것 선택
	@RequestMapping("/member/deleteMember_Favorite.do")
	@ResponseBody
	public int deleteMember_Favorite(int favorite_no) {
		int re = member_favoriteService.deleteMember_Favorite(favorite_no);
		// model.addAttribute("re", re);
		System.out.println("찜 제거 컨트롤러");
		return re;
	}
}
