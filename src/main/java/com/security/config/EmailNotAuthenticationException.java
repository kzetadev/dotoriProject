package com.security.config;

import org.springframework.security.core.AuthenticationException;
//이메일 인증되지 않은 사용자인 경우 예외로 판단
public class EmailNotAuthenticationException extends AuthenticationException {
	private static final long serialVersionUID = 1L;

	public EmailNotAuthenticationException(String exceptionMsg) {
		super(exceptionMsg);
	}
}
