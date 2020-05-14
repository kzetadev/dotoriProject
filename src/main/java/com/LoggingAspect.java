package com;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

@Component // 자동으로 객체 생성
@Aspect // 어노테이션 기반의 객체라는 뜻
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
		
		System.out.println("메소드 동작하기 전");
	}
}
