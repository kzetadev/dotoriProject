package com.security.component;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.security.authentication.AccountExpiredException;
import org.springframework.security.authentication.AuthenticationCredentialsNotFoundException;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.CredentialsExpiredException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.InternalAuthenticationServiceException;
import org.springframework.security.authentication.LockedException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

import com.security.config.UserDetailsServiceImpl;
//인증된 사용자인지 검사하는 서비스
@Component
public class AuthenticationProviderImpl implements AuthenticationProvider {
	//passwordEncoder.matches 메소드를 사용하기 위해 의존성 주입
	@Autowired
	PasswordEncoder passwordEncoder;
	//UserDetailService의 loadUserByUsername메소드를 사용하기 위해 의존성 주입
	@Autowired
	UserDetailsServiceImpl userDetailsServiceImpl;
	
	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		// TODO Auto-generated method stub
		//인증여부. null이면 인증되지 않음?
		System.out.println("authentication : " + authentication);
		if(authentication == null) {
			throw new InternalAuthenticationServiceException("인증된 사용자가 존재하지 않습니다.");
		}
		String username = authentication.getName();
		System.out.println("username : " + username);
		//비밀번호
		if(authentication.getCredentials() == null) {
			throw new AuthenticationCredentialsNotFoundException("비밀번호가 입력되지 않았습니다.");
		}
		String password = authentication.getCredentials().toString();
		System.out.println("password : " + password);
		UserDetails loadedUser = userDetailsServiceImpl.loadUserByUsername(username);
		if(loadedUser == null) {
			throw new InternalAuthenticationServiceException("사용자 인증 서비스에 오류가 발생하였습니다.");
		}
		System.out.println("loadedUser : " + loadedUser);
		//checker
		//잠긴 계정인지?
		if(!loadedUser.isAccountNonLocked()) {
			throw new LockedException("해당 계정은 잠긴 계정입니다.");
		}
		System.out.println("isAccountNonLocked : " + loadedUser.isAccountNonLocked());
		//사용가능한 계정인지?
		if(!loadedUser.isEnabled()) {
			throw new DisabledException("해당 계정은 사용할 수 없습니다.");
		}
		System.out.println("isEnabled : " + loadedUser.isEnabled());
		//만료된 계정인지?
		if(!loadedUser.isAccountNonExpired()) {
			throw new AccountExpiredException("해당 계정은 만료되었습니다.");
		}
		System.out.println("isAccountNonExpired : " + loadedUser.isAccountNonExpired());
		//실질적인 인증
		if(!passwordEncoder.matches(password, loadedUser.getPassword())) {
			throw new BadCredentialsException("비밀번호가 일치하지 않습니다.");
		}
		System.out.println("passwordEncoder.matches : " + passwordEncoder.matches(password, loadedUser.getPassword()));
		//checker
		//비밀번호가 만료되었는지?
		if(!loadedUser.isCredentialsNonExpired()) {
			throw new CredentialsExpiredException("비밀번호가 만료되었습니다.");
		}
		System.out.println("isCredentialsNonExpired : " + loadedUser.isCredentialsNonExpired());
		//인증완료
		UsernamePasswordAuthenticationToken result = new UsernamePasswordAuthenticationToken(
				loadedUser, null, loadedUser.getAuthorities());
		result.setDetails(authentication.getDetails());
		System.out.println("UsernamePasswordAuthenticationToken : " + result);
		return result;
	}

	@Override
	public boolean supports(Class<?> authentication) {
		// TODO Auto-generated method stub
		System.out.println("AuthenticationProviderImpl supports autentication : " + authentication);
		return UsernamePasswordAuthenticationToken.class.isAssignableFrom(authentication);
	}

}
