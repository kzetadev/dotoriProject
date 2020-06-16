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

	@RequestMapping("/access_denied")
	public String access_denied() throws Exception{
		return "/access_denied";
	}
	@RequestMapping({"/", "/main.do"})
	public ModelAndView main(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("main");
		int pageNUM = 1;
		int place_type = 0;

		Map map = new HashMap();
		map.put("place_type", place_type);
		
		totalRecord = place_infoService.getTotalRecord(map);
		totalPage = (int)Math.ceil(totalRecord / (double)pageSIZE);
		// 페이지 번호가 전체 페이지 수보다 크다면
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
		
		mav.addObject("list", place_infoService.listPlace_InfoPage(map));
		mav.addObject("totalPage", totalPage);
		// 메인 페이지 인기 서울 명소 TOP 6
		mav.addObject("top", place_infoService.mainTop());
		return mav;
	}
	
}
