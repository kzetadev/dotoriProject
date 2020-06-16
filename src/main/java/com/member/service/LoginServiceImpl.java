package com.member.service;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.member.dao.Member_InfoDao;
import com.member.vo.Member_InfoVo;
@Service("loginService")
public class LoginServiceImpl implements LoginService {
	@Resource(name="member_infoDao")
	protected Member_InfoDao member_infoDao;
	// 유저 로그인 메소드
	@Override
	public Member_InfoVo login(Member_InfoVo vo) {
		return member_infoDao.login(vo);
	}
	// 시큐리티용 로그인
	@Override
	public Member_InfoVo loginById(String mem_id) {
		return member_infoDao.loginById(mem_id);
	}
	//비밀번호 변경
	@Override
	public int pass_change(Map<String, Object> map) throws Exception {
		return member_infoDao.pass_change(map);		
	}
	//아이디 찾기
	@Override
	public String find_idCheck(Member_InfoVo vo) {
		String mem_id = member_infoDao.find_idCheck(vo);
		return mem_id;
	}
	//비밀번호 찾기
	@Override
	public String find_pwdCheck(Member_InfoVo vo) {
		String mem_pwd = member_infoDao.find_pwdCheck(vo);
		return mem_pwd;
	}
	//비밀번호 찾기 인증번호
	@Override
	public int updateCode(Member_InfoVo vo) throws Exception {
		return member_infoDao.updateCode(vo);
		
	}
	//인증코드 중복 서비스
	@Override
	public int checkCode(int mem_check_code) {
		return member_infoDao.checkCode(mem_check_code);
	}
	
}
