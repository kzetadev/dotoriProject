package com.member.vo;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import lombok.Getter;
import lombok.Setter;
@Getter
@Setter
//인증객체로 사용하기 위해 User클래스 확장
public class User_InfoVo implements UserDetails { 
	
	private static final long serialVersionUID = 1L;
	private Member_InfoVo member;

	public User_InfoVo(Member_InfoVo member) {
		this.member = member;
	}
	
	//사용자 권한 검사
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		// TODO Auto-generated method stub
		List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
		authorities.add(new SimpleGrantedAuthority(member.getMem_role()));	//member_info 테이블의 mem_role을 이용해서 권한 검사
		return authorities;
	}
	//UserDetails에서 사용하는 비밀번호
	@Override
	public String getPassword() {
		return member.getMem_pwd();
	}
	//UserDetails에서 사용하는 아이디
	@Override
	public String getUsername() {
		return member.getMem_id();
	}

	@Override
	public boolean isAccountNonExpired() {
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}

	@Override
	public boolean isEnabled() {
		return true;
	}

}
