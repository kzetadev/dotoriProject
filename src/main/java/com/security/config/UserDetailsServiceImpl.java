package com.security.config;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.member.service.LoginServiceImpl;
import com.member.vo.Member_InfoVo;
import com.member.vo.User_InfoVo;

//인증에 사용될 사용자 정보를 생성하는 서비스
@Service
public class UserDetailsServiceImpl implements UserDetailsService {
	@Resource(name="loginService")
	LoginServiceImpl loginService;
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		// TODO Auto-generated method stub
		//인증 전 로그인화면에서 입력한 아이디로 db에 해당 계정이 존재하는지 조회.
		Member_InfoVo vo = loginService.loginById(username);
		if(vo == null) {
			throw new UsernameNotFoundException("존재하지 않는 회원입니다.");
		}
		//이메일 인증된 회원인지
		if (vo.getMem_auth() != 1) {
			throw new EmailNotAuthenticationException("이메일 인증되지 않은 회원입니다.");
		}
		User_InfoVo user = new User_InfoVo(vo);	//UserDetails 인터페이스를 구현한 User_Info 클래스에 vo를 넘겨서 mem_role, mem_pwd, mem_id를 사용
		return user;
	}

}
