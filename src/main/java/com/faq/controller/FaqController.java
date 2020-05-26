package com.faq.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.faq.service.FaqService;
import com.faq.vo.FaqVo;
import com.security.config.LoginUser;

@Controller
public class FaqController {
	@Resource(name="faqService")
	private FaqService faqService;
	// @Resource(name="member_infoService")
	// private Member_InfoService member_infoService;
	
	// faq 목록
	@RequestMapping("/faq/listFaq.do")
	public ModelAndView listFaq() {
		ModelAndView m = new ModelAndView();
		m.addObject("f_list", faqService.listFaq());
		return m;
	}
	
	// faq 추가
	@RequestMapping(value="/faq/insertFaq.do", method=RequestMethod.GET)
	public void insertFaqForm() {
	}
	@RequestMapping(value="/faq/insertFaq.do", method=RequestMethod.POST)
	public ModelAndView insertFaqSubmit(FaqVo fv) {
		ModelAndView m = new ModelAndView();
		fv.setMem_no(LoginUser.getMember_no());
		int re = faqService.insertFaq(fv);
		if(re > 0) {
			m.setViewName("redirect:/faq/listFaq.do");
		}
		return m;
	}
	
	// faq 수정
	@RequestMapping(value="/faq/updateFaq.do", method=RequestMethod.GET)
	public ModelAndView updateFaqForm(int faq_no) {
		ModelAndView m = new ModelAndView();
		m.addObject("f", faqService.detailFaq(faq_no));
		return m;
	}
	@RequestMapping(value="/faq/updateFaq.do", method=RequestMethod.POST)
	public ModelAndView updateFaqSubmit(FaqVo fv) {
		ModelAndView m = new ModelAndView();
		int re = faqService.updateFaq(fv);
		if(re > 0) {
			m.setViewName("redirect:/faq/listFaq.do");
		}
		return m;
	}
	
	// faq 삭제
	@RequestMapping(value="/faq/deleteFaq.do", method=RequestMethod.GET)
	public ModelAndView deleteFaqForm(int faq_no) {
		ModelAndView m = new ModelAndView();
		m.addObject("faq_no", faq_no);
		return m;
	}
	@RequestMapping(value="/faq/deleteFaq.do", method=RequestMethod.POST)
	@ResponseBody
	public int deleteFaqSubmit(int faq_no) {
		int re = faqService.deleteFaq(faq_no);
		return re;
	}
	
	// FAQ (자주 묻는 질문들)
	@RequestMapping("/faq.do")
	public ModelAndView faq() {
		System.out.println("컨트롤러");
		ModelAndView m = new ModelAndView();
		return m;
	}
	
}
