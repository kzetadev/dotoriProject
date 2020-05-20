package com.security.filter;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.web.authentication.www.BasicAuthenticationFilter;
public class CustomAuthenticationFilter extends BasicAuthenticationFilter {

	public CustomAuthenticationFilter(AuthenticationManager authenticationManager) {
		super(authenticationManager);
		// TODO Auto-generated constructor stub
	}
	@Override
	protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		/*
         * 쿠키 인증 토큰을 검사한다.
         * 만약 토큰 및 헤더에 대한 검사에 실패한다면,
         * AuthenticationEntryPoint에 위임하거나 혹은 HttpResponse에 적절한
         * 상태코드와 메시지를 담아서 리턴해준다.
         */
		System.out.println(request.getRequestURI());
		super.doFilterInternal(request, response, chain);
		System.out.println(request);
		System.out.println(response);
		System.out.println(chain);
		System.out.println("CustomAuthenticationFilter doFilterInternal");
	}
	
}
