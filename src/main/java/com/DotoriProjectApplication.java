package com;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.EnableAspectJAutoProxy;

@SpringBootApplication
@EnableAspectJAutoProxy // aop
public class DotoriProjectApplication {

//	// 패스워드 암호화를 위한 객체를 생성
//	@Bean
//	public PasswordEncoder passwordEncoder() {
//		System.out.println();
//		return PasswordEncoderFactories.createDelegatingPasswordEncoder();
//	}
	
//	@Bean
//	public RedundantLoginService loginManager() {
//		return new RedundantLoginService();
//	}
//	@Bean
//	public LoginService login_service(){
//		return new LoginService();
//	}

	public static void main(String[] args) {
		SpringApplication.run(DotoriProjectApplication.class, args);

	}
}
