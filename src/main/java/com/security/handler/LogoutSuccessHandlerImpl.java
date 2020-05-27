package com.security.handler;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.authentication.logout.LogoutSuccessHandler;
import org.springframework.stereotype.Component;
//로그아웃 성공 후 동작하는 핸들러
@Component
public class LogoutSuccessHandlerImpl implements LogoutSuccessHandler {
	private RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();
	private String defaultUrl = "/main.do";
	//로그아웃 성공 후 동작하는 메소드
	@Override
	public void onLogoutSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication)
			throws IOException, ServletException {
		System.out.println("LogoutSuccessHandlerImpl onLogoutSuccess authentication : " + authentication);
		resultRedirectStrategy(request, response, authentication);
	}
	protected void resultRedirectStrategy(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		//로그아웃에 성공하면 메인으로 리디렉션시킴.
		redirectStrategy.sendRedirect(request,  response, defaultUrl);
	}

}
