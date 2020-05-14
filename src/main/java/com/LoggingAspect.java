package com;

import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

@Component // 자동으로 객체 생성
@Aspect // 어노테이션 기반의 객체라는 뜻
public class LoggingAspect {
	@Pointcut("execution(public * com.member.controller")
	private void contMethod() {}
}
