package com.member.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.member.service.JoinService;
import com.member.service.MemSha256;
import com.member.vo.Member_InfoVo;


@Controller
public class JoinController {
	private static final Logger logger = LoggerFactory.getLogger(JoinController.class);
	@Resource(name="joinService")
	private JoinService joinService;

	@RequestMapping("/joinForm.do")
	public void joinForm(HttpServletRequest request) {
		
	}
	
	//회원가입 컨트롤러
	@RequestMapping(value = "/join.do", method = RequestMethod.POST)
	public ModelAndView joinMem(HttpServletRequest request,Member_InfoVo vo, Model model,  HttpSession session) {
		ModelAndView mav = new ModelAndView();
		System.out.println(vo.getMem_id());
		System.out.println(vo.getMem_name());
		System.out.println(vo.getMem_nickname());
		System.out.println(vo.getMem_pwd());
		System.out.println(vo.getMem_email());
		//비밀번호 암호화
		String encryPwd = MemSha256.encrypt(vo.getMem_pwd());//받아온 값을 암호화 한다
		vo.setMem_pwd(encryPwd); //그 값을 저장시킨다
		
		// 회원가입 메소드
		int re = joinService.joinMember(vo); //저장된 객체 그대로 DB로 보낸다
		if (re > 1) {
			mav.setViewName("joinSuccess");
			mav.addObject("ok", vo.getMem_name());
		}
		return mav;
	}

	// id 중복 체크 컨트롤러
	@RequestMapping(value = "/idCheck", method = RequestMethod.GET)
	@ResponseBody
	public int idCheck(HttpServletRequest request,@RequestParam("mem_id") String mem_id) {
		System.out.println("아이디 중복 컨트롤러 실행");
		return joinService.checkOverId(mem_id);
	}

//	 닉네임 중복 체크 컨트롤러
	@RequestMapping(value = "/nickCheck", method = RequestMethod.GET)
	@ResponseBody
	public int nickNameCheck(HttpServletRequest request,@RequestParam("mem_nickname") String mem_nickname) {
		System.out.println("닉네임중복 컨트롤러 실행");
		return joinService.checkOverNickName(mem_nickname);
	}
	
//	 이메일 중복 체크 컨트롤러
	@RequestMapping(value = "/emailCheck", method = RequestMethod.GET)
	@ResponseBody
	public int emailCheck(HttpServletRequest request,@RequestParam("mem_email") String mem_email) {
		System.out.println("이메일중복 컨트롤러 실행");
		return joinService.checkOverEmail(mem_email);
	}
	
	
}
