package com.example.demo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.service.JoinService;
import com.example.demo.vo.Member_InfoVo;
import com.example.demo.UserSha256;
import com.example.demo.dao.Member_InfoDao;

@Controller
public class JoinAccountController {
//	@Autowired
//	private JoinService reg_service;
	@Autowired
	private Member_InfoDao m_dao;
	public void setM_dao(Member_InfoDao m_dao) {
		this.m_dao = m_dao;
	}


//	@RequestMapping("/listMember_info.do")
//	public ModelAndView listMember_info() {
//		System.out.println("listMember_info 컨트롤러 동작");
//		ModelAndView m = new ModelAndView();
//		m.setViewName("listMember_info");
//		m.addObject("login", m_dao.login());
//		return m;
//	}
	@RequestMapping("/joinForm.do")
	public void joinForm() {
		
	}
	
	//회원가입 컨트롤러
	@RequestMapping(value = "/join.do", method = RequestMethod.POST)
	public ModelAndView joinMem(Member_InfoVo vo, Model model, HttpServletRequest request, HttpSession session) {
		ModelAndView mav = new ModelAndView("joinForm");
		//비밀번호 암호화
		String encryPwd = UserSha256.encrypt(vo.getMem_pwd());//받아온 값을 암호화 한다
		vo.setMem_pwd(encryPwd); //그 값을 저장시킨다
		
		// 회원가입 메소드
		m_dao.insert(vo); //저장된 객체 그대로 DB로 보낸다
		mav.addObject("ok", vo.getMem_name());
		return mav;
	}
//	public ModelAndView joinMem(Member_InfoVo vo, Model model, HttpServletRequest request, HttpSession session) {
//		ModelAndView mav = new ModelAndView("joinForm");
//		
//		//비밀번호 암호화
//		String encryPwd = UserSha256.encrypt(vo.getMem_pwd());//받아온 값을 암호화 한다
//		vo.setMem_pwd(encryPwd); //그 값을 저장시킨다
//		
//		// 회원가입 메소드
//		reg_service.join_servie(vo); //저장된 객체 그대로 DB로 보낸다
//		mav.addObject("ok", vo.getMem_name());
//		return mav;
//	}
	// id 중복 체크 컨트롤러
	@RequestMapping(value = "/idCheck.do", method = RequestMethod.GET)
	@ResponseBody
	public int idCheck(@RequestParam("mem_id") String mem_id) {

		return m_dao.checkOverId(mem_id);
	}

//	// 닉네임 중복 체크 컨트롤러
//	@RequestMapping(value = "/user/nickCheck", method = RequestMethod.GET)
//	@ResponseBody
//	public int nickName(@RequestParam("nickName") String mem_nickname) {
//		return reg_service.memNickCheck(mem_nickname);
//	}
//	
//	@RequestMapping(value = "/user/nickCheck", method = RequestMethod.POST)
//	public String joinNick(Member_InfoVo vo) {
//		// 회원가입 메소드
//		reg_service.join_servie(vo);
//
//		// 인증메일 보내기 메소드
//		// 찾아봐야함
//
//		return "redirect:/";
//	}

}
