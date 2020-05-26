package com.main.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.information.service.Place_InfoService;
import com.information.service.Place_ThemeService;
import com.information.vo.Place_InfoVo;
import com.information.vo.SearchConditionVo;

@Controller
public class MainController {
	@Resource(name="place_infoService")
	private Place_InfoService place_infoService;
	@Resource(name="place_themeService")
	private Place_ThemeService place_themeService;
	public static int totalRecord = 0; // 전체 레코드 수를 저장하기 위한 변수
	public static int pageSIZE = 8; // 한 화면에 보여줄 레코드 수를 제한하기 위한 변수
	public static int totalPage = 1; // 전체 페이지 수를 저장하기 위한 변수
	public static int pageGroup = 5; // 한 화면에 보여줄 페이지의 수를 제한하기 위한 변수
	
	@RequestMapping({"/", "/main.do"})
	public ModelAndView main(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("main");
		int pageNUM = 1;
		int place_type = 0;
//		Place_ThemeVo pt = place_themeService.getPlace_Theme(place_type);
//		if(keyword == null) {
//			keyword = (String)session.getAttribute("keyword");
//			searchColumn = (String)session.getAttribute("searchColumn");
//		}
		
//		if(all != null) {
//			keyword = null;
//			searchColumn = null;
//		}
		Map map = new HashMap();
		
//		map.put("keyword", keyword);
//		map.put("searchColumn", searchColumn);
		map.put("place_type", place_type);
		
		totalRecord = place_infoService.getTotalRecord(map);
		totalPage = (int)Math.ceil(totalRecord / (double)pageSIZE);
		System.out.println("전체 페이지 수 : " + totalPage);
		if (pageNUM > totalPage) {
			pageNUM = totalPage;
		}
		int start = (pageNUM - 1) * pageSIZE + 1;
		int end = start + pageSIZE - 1;
		if(end > totalRecord) {
			end = totalRecord;
		}
	
		map.put("start", start);
		map.put("end", end);
		System.out.println(map);
//		session.setAttribute("keyword", keyword);
//		session.setAttribute("searchColumn", searchColumn);

		mav.addObject("list", place_infoService.listPlace_InfoPage(map));

		System.out.println(map);
		System.out.println("전체 페이지 수 : " + totalPage);
		mav.addObject("totalPage", totalPage);
		
//		int startPage = (pageNUM - 1) / pageGroup * pageGroup + 1;
//		int endPage = startPage + pageGroup - 1;
//		if(endPage > totalPage) {
//			endPage = totalPage;
//		}
//		m.addObject("startPage", startPage);
//		m.addObject("endPage", endPage);
//		m.addObject("place_type", place_type);
//		if(keyword != null && !keyword.equals("")) {
//			m.addObject("searchColumn", "&searchColumn=" + searchColumn);
//			m.addObject("keyword", "&keyword=" + keyword);
//		}
//		m.addObject("pt", pt);
		
		mav.addObject("top", place_infoService.mainTop());
		return mav;
	}
}
