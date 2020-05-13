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

}
