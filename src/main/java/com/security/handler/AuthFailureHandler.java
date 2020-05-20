package com.security.handler;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationFailureHandler;
import org.springframework.stereotype.Component;
//인증 실패 시 동작하는 핸들러
@Component
public class AuthFailureHandler extends SimpleUrlAuthenticationFailureHandler {
	private String defaultUrl = "/";
	//로그인 실패 시 기본 url 설정
	public AuthFailureHandler() {
		this.setDefaultFailureUrl("/member/login.do");
	}
	//실패 후 예외내용을 가지고 기본 url로 이동
	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
		// TODO Auto-generated method stub
		super.onAuthenticationFailure(request, response, exception);

	}
}