package com.security.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.logout.LogoutHandler;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Component;
//로그아웃 요청 시 동작하는 핸들러.
@Component
public class LogoutHandlerImpl implements LogoutHandler {

	@Override
	public void logout(HttpServletRequest request, HttpServletResponse response, Authentication authentication) {
		// TODO Auto-generated method stub
		System.out.println("LogoutHandlerImpl logout authentication : " + authentication);
		//인증된 사용자가 있으면
		if(authentication != null) {
			//로그아웃 핸들러로부터 컨텍스트 객체를 받아옴.
			SecurityContextLogoutHandler context = new SecurityContextLogoutHandler();
			//컨텍스트로 해당 인증된 사용자를 로그아웃 시킴.
			context.logout(request, response, authentication);
			System.out.println("logout after authentication : " + authentication);
		}
	}

}
