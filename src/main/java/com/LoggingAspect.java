package com;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;

public class LoggingAspect {							// 어떤 메소드라도, 어떤 매개변수라도
	@Pointcut("execution(public * com.member.controller..*(..))")
	private void contMethod() {}
	
	@Before("contMethod()")
	public void before(JoinPoint joinPoint) {
		String methodName = joinPoint.getSignature().toShortString();
		HttpServletRequest request = (HttpServletRequest)joinPoint.getArgs()[0];
																			// 0번째를 HttpServletRequest로 받아옴
		String mem_ip = request.getRemoteAddr();
		String login_datetime = new Date().toLocaleString();
		
		Date date = new Date();
		int yy = date.getYear()+1900;
		int mm = date.getMonth()+1;
		int dd = date.getDay();
		int hh = date.getMinutes();
		int ss = date.getSeconds();
		
//		String fname = yy + "" + mm + "" + dd + "" + hh + "" + m + "" + ss + ".txt"; // .txt를 안붙이면 일반 파일이 만들어진다.
//		String path = ""; // 파일을 담을 위치
	}
}
