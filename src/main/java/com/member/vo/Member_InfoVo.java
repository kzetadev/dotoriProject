package com.member.vo;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;

import lombok.Getter;
import lombok.Setter;

//@AllArgsConstructor
//@NoArgsConstructor
//@Data
@Getter
@Setter
//인증객체로 사용하기 위해 User클래스 확장
public class Member_InfoVo extends User { 
	
	private static final long serialVersionUID = 1L;
	private int mem_no; // 회원번호
	private String mem_id; // 아이디
	private String mem_pwd; // 비밀번호
	private String mem_email; // 이메일
	private int mem_email_agree; // 이메일 수신동의
	private String mem_name; // 이름
	private int mem_info_open; // 개인정보 공개여부
	private String mem_regidate; // 가입일자
	private String mem_nickname; // 닉네임
	private String mem_content; // 자기소개
	private String mem_img; // 프로필 사진
	private String mem_role; // 사용자/관리자
	private int mem_auth;	//인증여부
	//loginById로 단순 조회용 생성자
	public Member_InfoVo(int mem_no, String mem_id, String mem_pwd, String mem_email, int mem_email_agree, String mem_name,
			int mem_info_open, String mem_regidate, String mem_nickname, String mem_content, String mem_img, String mem_role, int mem_auth) {
		super(mem_id, mem_pwd, new ArrayList<GrantedAuthority>());
		this.mem_no = mem_no;
		this.mem_id = mem_id;
		this.mem_pwd = mem_pwd;
		this.mem_email = mem_email;
		this.mem_email_agree = mem_email_agree;
		this.mem_name = mem_name;
		this.mem_info_open = mem_info_open;
		this.mem_regidate = mem_regidate;
		this.mem_nickname = mem_nickname;
		this.mem_content = mem_content;
		this.mem_img = mem_img;
		this.mem_role = mem_role;
		this.mem_auth = mem_auth;
	}
	//UserDetails 서비스에서 사용될 생성자. 권한 적용.
	public Member_InfoVo(int mem_no, String mem_id, String mem_pwd, String mem_email, int mem_email_agree, String mem_name,
			int mem_info_open, String mem_regidate, String mem_nickname, String mem_content, String mem_img, String mem_role, int mem_auth, List<GrantedAuthority> authorities) {
		super(mem_id, mem_pwd, authorities);
		this.mem_no = mem_no;
		this.mem_id = mem_id;
		this.mem_pwd = mem_pwd;
		this.mem_email = mem_email;
		this.mem_email_agree = mem_email_agree;
		this.mem_name = mem_name;
		this.mem_info_open = mem_info_open;
		this.mem_regidate = mem_regidate;
		this.mem_nickname = mem_nickname;
		this.mem_content = mem_content;
		this.mem_img = mem_img;
		this.mem_role = mem_role;
		this.mem_auth = mem_auth;
	}
	
	public Member_InfoVo(String username, String password, Collection<? extends GrantedAuthority> authorities) {
		super(username, password, authorities);
		// TODO Auto-generated constructor stub
	}
	
	
}
