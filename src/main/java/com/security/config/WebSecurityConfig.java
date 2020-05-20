package com.security.config;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.ProviderManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.password.PasswordEncoder;

import com.security.component.AuthenticationProviderImpl;
import com.security.filter.CustomAuthenticationFilter;
import com.security.handler.AuthFailureHandler;
import com.security.handler.AuthSuccessHandler;
import com.security.handler.LogoutHandlerImpl;
import com.security.handler.LogoutSuccessHandlerImpl;
@Configuration
@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {
	@Autowired
	PasswordEncoder passwordEncoder;
	//authProvider 연결. 인증된 사용자인지 검사하는 서비스
	@Autowired
	AuthenticationProviderImpl authProvider;
	//AuthFailureHandler 연결. 인증 실패 시 동작하는 핸들러
	@Autowired
	AuthFailureHandler authFailureHandler;
	//AuthSuccessHandler 연결. 인증 성공 시 동작하는 핸들러
	@Autowired
	AuthSuccessHandler authSuccessHandler;
	//LogoutHandlerImpl 로그아웃 핸들러 연결. 로그아웃 요청 시 동작하는 핸들러.
	@Autowired
	LogoutHandlerImpl logoutHandler;
	//LogoutSuccessHandlerImpl 연결. 로그아웃 성공 후 동작하는 핸들러
	@Autowired
	LogoutSuccessHandlerImpl logoutSuccessHandler;
	//AuthenticationManager 추가. CustomAuthenticationFilter에 사용
	@Override
	public AuthenticationManager authenticationManagerBean() throws Exception {
		// TODO Auto-generated method stub
		List<AuthenticationProvider> authenticationProviderList = new ArrayList<AuthenticationProvider>();
		authenticationProviderList.add(authProvider);
		AuthenticationManager authenticationManager = new ProviderManager(authenticationProviderList);
		return authenticationManager;
	}
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		// TODO Auto-generated method stub
		auth.authenticationProvider(authProvider);
	}
	@Override
	public void configure(WebSecurity web) throws Exception {
		// TODO Auto-generated method stub
		web.ignoring().antMatchers("/member/joinForm.do", "/member/join.do");
	}
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		// TODO Auto-generated method stub
		http.authorizeRequests()
		.antMatchers("/admin/**").hasRole("ADMIN")
		.antMatchers("/member/**").hasRole("USER")
			
			.antMatchers("/", "/css/**", "/fonts/**", "/img/**", "/js/**"
					, "/login.do", "/member/joinForm.do", "/member/join.do", "/member/login.do"
					, "/main.do", "/mailAuth.do"
					, "/board/mainBoard_Post.do", "/board/listBoard_Post.do"
					, "/place/listPlace_Info.do", "/main/mainTop.do").permitAll()
			.anyRequest().authenticated();
//		http.exceptionHandling().accessDeniedPage("/403");	//접근 거부 페이지 추가해야됨.
		http.formLogin()
			.loginPage("/member/login.do")						//사용자정의 로그인 페이지명 설정
			.usernameParameter("mem_id")				//로그인 페이지에서 사용할 username 파라미터명을 다른 식별자로 사용(사용자 정의 로그인 페이지에 설정한 아이디 필드의 식별자)
			.passwordParameter("mem_pwd")				//로그인 페이지에서 사용할 password 파라미터명을 다른 식별자로 사용(사용자 정의 로그인 페이지에 설정한 아이디 필드의 식별자)
			.loginProcessingUrl("/member/login.do")
//			.failureUrl("/loginError.do")				//로그인 실패시 처리할 url 설정
			.failureHandler(authFailureHandler)			//로그인 실패 시 동작하는 핸들러 설정
			.defaultSuccessUrl("/main.do")				//로그인 성공 후 리디렉션 시킬 기본 url 설정
			.successHandler(authSuccessHandler)			//로그인 성공 후 동작하는 핸들러 설정
			.permitAll()								//위에 해당하는 url들에 모든 접근 권한 부여 
			.and()
			.addFilter(new CustomAuthenticationFilter(authenticationManagerBean()))	//페이지 접근 전 동작하는 필터.
			.sessionManagement()					//세션관련 작업 추가 필요.
			.maximumSessions(1)
			.maxSessionsPreventsLogin(true);
		http.logout()									//로그아웃 사용
			.logoutUrl("/logout.do")					//로그아웃 요청 url 설정
			.addLogoutHandler(logoutHandler)			//로그아웃 처리 핸들러 설정
			.logoutSuccessHandler(logoutSuccessHandler)	//로그아웃 성공 시 동작할 핸들러 설정
			.permitAll();								//위에 해당하는 url들에 모든 접근 권한 부여
		http.httpBasic();								//http 기본 설정 사용.
	}
	
}