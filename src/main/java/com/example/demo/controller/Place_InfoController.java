package com.example.demo.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.dao.Place_InfoDao;
import com.example.demo.db.DBManager;
@Controller
public class Place_InfoController {
	public static int totalRecord = 0; // 전체 레코드 수를 저장하기 위한 변수
	public static int pageSIZE = 8; // 한 화면에 보여줄 레코드 수를 제한하기 위한 변수
	public static int totalPage = 1; // 전체 페이지 수를 저장하기 위한 변수
	public static int pageGroup = 5; // 한 화면에 보여줄 페이지의 수를 제한하기 위한 변수
	
	public int getTotalRecord() {
		return DBManager.totalRecord();
	}
	
	@Autowired
	private Place_InfoDao p_dao;

	public void setP_dao(Place_InfoDao p_dao) {
		this.p_dao = p_dao;
	}
	
	// 여행 장소 페이징 + 검색 처리 
	@RequestMapping("/listPlace_Info")										// null이면 1을 바로 설정, 올 때 int pageNUM으로 받는다는 뜻
	public ModelAndView listPlace_InfoPage(@RequestParam(value="pageNUM", defaultValue="1") int pageNUM, String all, String keyword, String searchColumn, HttpSession session) {
		System.out.println("컨트롤러 동작함");
		System.out.println("검색어 : " + keyword);
		if(keyword == null) {
			keyword = (String)session.getAttribute("keyword");
			searchColumn = (String)session.getAttribute("searchColumn");
		}
		if(all != null) {
			keyword = null;
			searchColumn = null;
		}
		ModelAndView m = new ModelAndView();
		HashMap map = new HashMap();
		
		totalRecord = getTotalRecord();
		totalPage = (int)Math.ceil(totalRecord / (double)pageSIZE);
		System.out.println("전체 페이지 수 : " + totalPage);
		
		int start = (pageNUM - 1) * pageSIZE + 1;
		int end = start + pageSIZE - 1;
		if(end > totalRecord) {
			end = totalRecord;
		}
	
		map.put("keyword", keyword);
		map.put("searchColumn", searchColumn);
		map.put("start", start);
		map.put("end", end);
		System.out.println(map);
		session.setAttribute("keyword", keyword);
		session.setAttribute("searchColumn", searchColumn);

		//m.addObject("list", p_dao.listPlace_Info());
		m.addObject("list", p_dao.listPlace_InfoPage(map));
		System.out.println(map);
		System.out.println("전체 페이지 수 : " + totalPage);
		m.addObject("totalPage", totalPage);
		
		int startPage = (pageNUM - 1) / pageGroup * pageGroup + 1;
		int endPage = startPage + pageGroup - 1;
		m.addObject("startPage", startPage);
		m.addObject("endPage", endPage);
		
		return m;
	}
	// 여행 장소 상세
	@RequestMapping("/detailPlace_Info")
	public ModelAndView detailPlace_Info(int place_no) {
		ModelAndView m = new ModelAndView();
		m.addObject("p", p_dao.detailPlace_Info(place_no));
		return m;
	}
	
	// FAQ (자주 묻는 질문들)
	@RequestMapping("/faq")
	public ModelAndView faq() {
		ModelAndView m = new ModelAndView();
		return m;
	}
}
