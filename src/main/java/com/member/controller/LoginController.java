package com.member.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.member.service.LoginService;
import com.member.vo.Member_InfoVo;

@Controller
public class LoginController {
	@Resource(name="loginService")
	private LoginService loginService;
	@RequestMapping("/member/loginCheck.do")
	public Member_InfoVo loginCheck(HttpServletRequest request, Member_InfoVo vo) {
		System.out.println(vo);
		Member_InfoVo infovo = loginService.login(vo);
		System.out.println(infovo);
		return infovo;
	}
	
	@RequestMapping("/member/login.do")
	public void login(HttpServletRequest request) {
		
	}
	
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	public ModelAndView login(@RequestParam(value="error",required = false)String error,
			@RequestParam (value="logout",required =false)String logout) {
		ModelAndView mav = new ModelAndView();
		System.out.println("asd");
		if(error != null) {
			mav.addObject("error", "아이디와 비밀번호를 다시 확인해주세요");
		}
		if(logout != null){
			mav.addObject("msg", "로그아웃 완료");
		}
		// mav.setViewName("login");
		
		return mav;
	}
	//회원정보 수정처리
	@RequestMapping("/member/updateMem.do")
	public String updateMem(@ModelAttribute Member_InfoVo vo, Model model) {
		//비밀번호 체크
		boolean re = loginService.checkPwd(vo.getMem_id(), vo.getMem_pwd());
		if(re) { //비밀번호가 일치할 경우 수정 처리후, 마이페이지로 리다렉
			loginService.updateMem(vo);
			return "redirect:/myPage/myPage_update.do";
		}else {//비밀번호가 일치하지 않는 경우, div에 불일치 문구 출력
			model.addAttribute("vo", vo);
			model.addAttribute("message", "비밀번호 불일치");
			return "member/myPage";
	
	}
	
	}
	//회원정보 삭제 처리
	@RequestMapping("/member/delMem.do")
	public String delMem(@RequestParam String mem_id, @RequestParam String mem_pwd, Model model) {
		//비밀번호 체크
		boolean re = loginService.checkPwd(mem_id, mem_pwd);
		if(re) { //비밀번호가 맞다면 삭제처리후, 로그인 화면으로 이동
			loginService.delMem(mem_id);
			return "redirect:/member/login.do";
			
		}else { //비밀번호가 일치하지 않으면, div에 불일치 문구 출력
			model.addAttribute("message", "비밀번호 불일치");
			return "member/myPage";
			
		}
	}
}
