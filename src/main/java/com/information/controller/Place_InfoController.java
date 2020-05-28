package com.information.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.information.service.Place_InfoService;
import com.information.service.Place_ThemeService;
import com.information.vo.Place_ThemeVo;
@Controller
public class Place_InfoController {
	@Resource(name="place_infoService")
	private Place_InfoService place_infoService;
	
	@Resource(name="place_themeService")
	private Place_ThemeService place_themeService;
	
	public static int totalRecord = 0; // 전체 레코드 수를 저장하기 위한 변수
	public static int pageSIZE = 8; // 한 화면에 보여줄 레코드 수를 제한하기 위한 변수
	public static int totalPage = 1; // 전체 페이지 수를 저장하기 위한 변수
	public static int pageGroup = 5; // 한 화면에 보여줄 페이지의 수를 제한하기 위한 변수

	// 여행 장소 테마 - 정렬 
	@RequestMapping(value="/place/listPlace_Theme", method={RequestMethod.GET}, produces="application/json")
	@ResponseBody
	public String listPlace_Theme() {
		String str = "";
		List<Place_ThemeVo> list = place_themeService.listPlace_Theme();
		Gson gson = new Gson();
		str = gson.toJson(list);
		return str;
	}
	
	// place_type별 정보 리스트 보기 + 페이징 처리 + 검색 + 정렬
	@RequestMapping("/place/listPlace_Info.do")	// null이면 1을 바로 설정, 올 때 int pageNUM으로 받는다는 뜻
	public ModelAndView listPlace_InfoPage(@RequestParam(value="pageNUM", defaultValue="1") int pageNUM, @RequestParam(value="place_type", defaultValue="0") int place_type, String keyword, String searchColumn, String sortColumn, HttpSession session) {
		System.out.println("컨트롤러 동작함");
		System.out.println("검색어 : " + keyword);
		Place_ThemeVo pt = place_themeService.getPlace_Theme(place_type);
//		if(keyword == null) {
//			keyword = (String)session.getAttribute("keyword");
//			searchColumn = (String)session.getAttribute("searchColumn");
//		}
		
//		if(all != null) {
//			keyword = null;
//			searchColumn = null;
//		}
		// 조회수 증가
		// place_infoService.updateHit(place_no);
		
		ModelAndView m = new ModelAndView();
		Map map = new HashMap();
		
		map.put("keyword", keyword);
		map.put("searchColumn", searchColumn);
		map.put("sortColumn", sortColumn);
		map.put("place_type", place_type);
		
		System.out.println(sortColumn);
		
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
//		System.out.println(map);
//		session.setAttribute("keyword", keyword);
//		session.setAttribute("searchColumn", searchColumn);

		m.addObject("list", place_infoService.listPlace_InfoPage(map));
		System.out.println(map);
		System.out.println("전체 페이지 수 : " + totalPage);
		m.addObject("totalPage", totalPage);
		
		int startPage = (pageNUM - 1) / pageGroup * pageGroup + 1;
		int endPage = startPage + pageGroup - 1;
		if(endPage > totalPage) {
			endPage = totalPage;
		}
		m.addObject("startPage", startPage);
		m.addObject("endPage", endPage);
		m.addObject("place_type", place_type);
		if(keyword != null && !keyword.equals("")) {
			m.addObject("searchColumn", "&searchColumn=" + searchColumn);
			m.addObject("keyword", "&keyword=" + keyword);
			m.addObject("sortColumn", "&sortColumn=" + sortColumn);
		}
		m.addObject("pt", pt);
		//theme
		return m;
	}
	
	// 여행장소번호가 x번인걸 눌렀을때 상세화면으로 이동
	@RequestMapping("/place/detailPlace_Info.do")
	public ModelAndView detailPlace_Info(int place_no) {
		System.out.println("컨트롤러 작동");
		// 조회수 증가
		place_infoService.updateHit(place_no);
		
		ModelAndView m = new ModelAndView();
		m.addObject("p", place_infoService.detailPlace_Info(place_no));
		return m;
	}
	
}