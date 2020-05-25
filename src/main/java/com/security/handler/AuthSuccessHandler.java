package com.security.handler;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.WebAttributes;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.security.web.savedrequest.SavedRequest;
import org.springframework.stereotype.Component;
//인증 성공 시 동작하는 핸들러
@Component
public class AuthSuccessHandler implements AuthenticationSuccessHandler{
	//로그인 성공, 실패 시 단순 리디렉션하는 것 보다 request 객체를 사용할 수 있는 AuthenticationSuccessHandler를 사용하기로 함.
	//request 객체로 RequestDispatcher를 사용하려고 했으나 잘못사용하였는지 에러
	//SimpleUrlAuthenticationSuccessHandler 사용한 예제 중 RequestCache, RedirectStrategy 사용하는 예제 참고
	//https://to-dy.tistory.com/94
	//https://zgundam.tistory.com/52
	//리퀘스트 캐시라는 객체로 SavedRequest라는 객체를 얻어옴.
	private RequestCache requestCache =  new HttpSessionRequestCache();
	//리디렉션용 객체
	private RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();
	//SavedRequest가 없을 경우 사용하는 기본 url
	private String defaultUrl = "/";
	//인증 성공 시 동작하는 메소드
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		// TODO Auto-generated method stub
		System.out.println("AuthSuccessHandler onAuthenticationSuccess authentication : " + authentication);
		clearAuthenticationAttributes(request);
		resultRedirectStrategy(request, response, authentication);
	}
	//인증 성공 후 이전 요청으로 리디렉션 해줌.
	protected void resultRedirectStrategy(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		SavedRequest savedRequest = requestCache.getRequest(request, response);
		if(savedRequest != null) {
			String targetUrl = savedRequest.getRedirectUrl();
			redirectStrategy.sendRedirect(request,  response, targetUrl);
		}else {
			redirectStrategy.sendRedirect(request, response, defaultUrl);
		}
	}
	protected void clearAuthenticationAttributes(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		if(session == null) {
			return;
		}
		session.removeAttribute(WebAttributes.AUTHENTICATION_EXCEPTION);
	}
}
