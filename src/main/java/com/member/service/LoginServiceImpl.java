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
	@Override
	public Member_InfoVo login(Member_InfoVo vo) {
		// TODO Auto-generated method stub
		return member_infoDao.login(vo);
	}
	@Override
	public Member_InfoVo loginById(String mem_id) {
		// TODO Auto-generated method stub
		return member_infoDao.loginById(mem_id);
	
	
	
	}
	@Override
	public void pass_change(Map<String, Object> map, Member_InfoVo vo) throws Exception {
		member_infoDao.pass_change(map, vo);		
	}
	@Override
	public String find_idCheck(Member_InfoVo vo) {
		String mem_id = member_infoDao.find_idCheck(vo);
		return mem_id;
	}
	@Override
	public String find_pwdCheck(Member_InfoVo vo) {
		String mem_pwd = member_infoDao.find_pwdCheck(vo);
		return mem_pwd;
	}
	
	
}
