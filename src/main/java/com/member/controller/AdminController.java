package com.member.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.member.service.AdminService;

@Controller
public class AdminController {
	@Resource(name="adminService") 
	private AdminService adminService;
	
	public static int totalRecord = 0; // 전체 레코드 수를 저장하기 위한 변수
	public static int pageSIZE = 10; // 한 화면에 보여줄 레코드 수를 제한하기 위한 변수
	public static int totalPage = 1; // 전체 페이지 수를 저장하기 위한 변수
	public static int pageGroup = 5; // 한 화면에 보여줄 페이지의 수를 제한하기 위한 변수

	// 관리자 - 회원 목록 (페이징 + 검색 + 정렬)
	@RequestMapping("/admin/adminListMember.do") 
	public ModelAndView allMemberList(HttpServletRequest request, @RequestParam(value="pageNUM", defaultValue="1") int pageNUM, HttpSession session, String keyword, String searchColumn, String sortColumn) {		
		ModelAndView m = new ModelAndView();
		Map map = new HashMap();
		map.put("sortColumn", sortColumn);
		map.put("keyword", keyword);
		map.put("searchColumn", searchColumn);
		
		totalRecord = adminService.totalRecord(map);
		// 전체 페이지수 구하기
		totalPage = (int)Math.ceil(totalRecord / (double)pageSIZE);
		if(pageNUM > totalPage) {
			pageNUM = totalPage;
		}
		int start = (pageNUM - 1) * pageSIZE + 1;
		int end = start + pageSIZE - 1;
		if(end > totalRecord) {
			end = totalRecord;
		}
		map.put("start", start);
		map.put("end", end);
		
		m.addObject("list", adminService.listMemberAll(map));
		m.addObject("totalPage", totalPage);
		
		int startPage = (pageNUM - 1) / pageGroup * pageGroup + 1;
		int endPage = startPage + pageGroup - 1;
		if(endPage > totalPage) {
			endPage = totalPage;
		}
		m.addObject("startPage", startPage);
		m.addObject("endPage", endPage);
		
		// keyword값이 있으면
		if(keyword != null && !keyword.equals("")) {
			m.addObject("searchColumn", "&searchColumn=" + searchColumn);
			m.addObject("keyword", "&keyword=" + keyword);
			m.addObject("sortColumn", "&sortColumn=" + sortColumn);
		}
		return m;
	}
	
	// 관리자 - 회원 강퇴
	@RequestMapping(value="/admin/adminDeleteMember.do", method=RequestMethod.GET)
	public ModelAndView deleteMemberForm(int mem_no) {
		ModelAndView m = new ModelAndView();
		m.addObject("mem_no",mem_no);
		return m;
	}
	// 관리자 - 회원 강퇴
	@RequestMapping(value="/admin/adminDeleteMember.do", method=RequestMethod.POST)
	@ResponseBody
	public int deleteMemberSubmit(int mem_no) {
//		ModelAndView m = new ModelAndView();
		int re = adminService.deleteMember(mem_no);
//		if(re > 0) {
//			m.setViewName("redirect:/adminListMember.do");
//		}
		return re;
	}
	
}
