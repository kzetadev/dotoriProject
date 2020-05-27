package com.member.vo;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.apache.ibatis.javassist.compiler.ast.Member;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import lombok.Getter;
import lombok.Setter;

//@AllArgsConstructor
//@NoArgsConstructor
//@Data
@Getter
@Setter
//인증객체로 사용하기 위해 User클래스 확장
public class User_InfoVo implements UserDetails { 
	
	private static final long serialVersionUID = 1L;
	private Member_InfoVo member;

	public User_InfoVo(Member_InfoVo member) {
		this.member = member;
	}
	
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		// TODO Auto-generated method stub
		List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
		authorities.add(new SimpleGrantedAuthority(member.getMem_role()));
		return authorities;
	}

	@Override
	public String getPassword() {
		// TODO Auto-generated method stub
		return member.getMem_pwd();
	}

	@Override
	public String getUsername() {
		// TODO Auto-generated method stub
		return member.getMem_id();
	}

	@Override
	public boolean isAccountNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isEnabled() {
		// TODO Auto-generated method stub
		return true;
	}
	
	
}
