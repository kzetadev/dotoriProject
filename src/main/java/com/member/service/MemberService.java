package com.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.member.mapper.Member_InfoManager;
import com.member.vo.Member_InfoVo;

@Service
public class MemberService implements UserDetailsService {

	@Autowired
	private PasswordEncoder PasswordEncoder;

	// 패스워드 인코딩을 위한 객체를 맴버로 선언한다
	// 이 객체는 Application클래스에서 제공되는 객체를 자동으로 의존관계 설정

	public void setPwd(PasswordEncoder passwordEncoder) {
		this.PasswordEncoder = passwordEncoder;
	}

	// vo에 들어있는 패스워드를 인코딩하여 다시 vo에 담는다
	public int insertMember(Member_InfoVo vo) {
		String encPwd = PasswordEncoder.encode(vo.getMem_pwd());
		vo.setMem_pwd(encPwd);
		int re = Member_InfoManager.insertJoin(vo);
		return re;
	}

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		// TODO Auto-generated method stub
		// 매개변수로 전달받은 username에 해당하는 회원의 정보를 db로부터 꺼내온다
		Member_InfoVo vo = Member_InfoManager.selectMember(username);

		// 만약 username에 해당하는 회원이 없으면 예외 발생
		if (vo == null) {
			throw new UsernameNotFoundException(username);
		}
		// 우리가 db로 부터 뽑아온 회원의 정보를
		// 스프링시큐리가 인증절차를 할 수 있는 객체로
		// 만들어 일을 맡긴다
		
		return User.builder().username(vo.getMem_id()).password(vo.getMem_pwd()).build();

	}

}
