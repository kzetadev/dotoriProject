package com.security.config;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.WebAuthenticationDetails;

import com.member.vo.Member_InfoVo;

//로그인된 유저 정보 반환하는 클래스
public class LoginUser {
	//로그인한 유저인지 확인
	public static boolean isLogin() {
		boolean auth = false;
		//시큐리티에서 사용되는 컨텍스트를 가져옴
		SecurityContext context = SecurityContextHolder.getContext();
		//컨텍스트에서 인증객체를 가져옴.
		Authentication authentication = context.getAuthentication();
		System.out.println(authentication);
		//세션등 기타 정보를 가져오기 위한 변수
		WebAuthenticationDetails details = (WebAuthenticationDetails)authentication.getDetails();
		System.out.println("sessionId : " + details.getSessionId());
		//자격증명 또는 인증에 사용되는 주체를 가져옴
		Object principal = authentication.getPrincipal();
		//해당 객체가 Member_InfoVo 클래스이면 로그인되었다고 판단.
		if(principal instanceof Member_InfoVo) {
			System.out.println("Member_InfoVo");
			auth = true;
		}
		return auth;
	}
	//로그인된 유저인 경우 Member_InfoVo 가져오기
	public static Member_InfoVo getMember_InfoVo() {
		Member_InfoVo vo = null;
		SecurityContext context = SecurityContextHolder.getContext();
		//컨텍스트에서 Member_InfoVo를 가져옴.
		vo = (Member_InfoVo)context.getAuthentication().getPrincipal();
		return vo;
	}
	//회원번호만 가져오는 메소드
	public static int getMember_no() {
		int mem_no = 0;
		Member_InfoVo vo = null;
		SecurityContext context = SecurityContextHolder.getContext();
		//컨텍스트에서 Member_InfoVo를 가져옴.
		vo = (Member_InfoVo)context.getAuthentication().getPrincipal();
		mem_no = vo.getMem_no();
		return mem_no;
	}
}
