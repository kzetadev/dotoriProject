package com.member.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.member.dao.AdminDao;
import com.member.manager.AdminManager;

@Controller
public class AdminController {
	public static int totalRecord = 0; // 전체 레코드 수를 저장하기 위한 변수
	public static int pageSIZE = 10; // 한 화면에 보여줄 레코드 수를 제한하기 위한 변수
	public static int totalPage = 1; // 전체 페이지 수를 저장하기 위한 변수
	public static int pageGroup = 5; // 한 화면에 보여줄 페이지의 수를 제한하기 위한 변수
	
	public int getTotalRecord(HashMap map) {
		return AdminManager.totalRecord();
	}
	
	@Autowired
	private AdminDao m_dao;
	
	public void setM_dao(AdminDao m_dao) {
		this.m_dao = m_dao;
	}
	// 관리자 - 회원 목록
	@RequestMapping("/adminListMember.do") 
	public ModelAndView allMemberList(@RequestParam(value="pageNUM", defaultValue="1") int pageNUM, HttpSession session) {
		ModelAndView m = new ModelAndView();
		HashMap map = new HashMap();
		
		totalRecord = getTotalRecord(map);
		totalPage = (int)Math.ceil(totalRecord / (double)pageSIZE);
		System.out.println("전체 페이지 수 : " + totalPage);
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
		
		m.addObject("list", m_dao.listMemberAll(map));
		m.addObject("totalPage", totalPage);
		
		int startPage = (pageNUM - 1) / pageGroup * pageGroup + 1;
		int endPage = startPage + pageGroup - 1;
		if(endPage > totalPage) {
			endPage = totalPage;
		}
		m.addObject("startPage", startPage);
		m.addObject("endPage", endPage);
		return m;
	}
	
	// 관리자 - 회원 강퇴
	@RequestMapping(value="/adminDeleteMember.do", method=RequestMethod.GET)
	public ModelAndView deleteMemberForm(int mem_no) {
		ModelAndView m = new ModelAndView();
		m.addObject("mem_no",mem_no);
		return m;
	}
	
	// 관리자 - 회원 강퇴
	@RequestMapping(value="/adminDeleteMember.do", method=RequestMethod.POST)
	@ResponseBody
	public int deleteMemberSubmit(int mem_no) {
//		ModelAndView m = new ModelAndView();
		int re = m_dao.deleteMember(mem_no);
//		if(re > 0) {
//			m.setViewName("redirect:/adminListMember.do");
//		}
		return re;
	}
}
