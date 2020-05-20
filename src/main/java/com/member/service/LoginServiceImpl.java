package com.member.service;

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
	public void updateMem(Member_InfoVo vo) {
		member_infoDao.updateMem(vo);
		
	}
	@Override
	public void delMem(String mem_id) {
		member_infoDao.delMem(mem_id);
		
	}
	@Override
	public boolean checkPwd(String mem_id, String mem_pwd) {
		// TODO Auto-generated method stub
		return member_infoDao.checkPwd(mem_id, mem_pwd);
	}

}
