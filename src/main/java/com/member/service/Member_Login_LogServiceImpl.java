package com.member.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.member.dao.Member_Login_LogDao;
import com.member.vo.Member_Login_LogVo;

@Service("member_login_logService")
public class Member_Login_LogServiceImpl implements Member_Login_LogService {
	@Resource(name="member_login_logDao")
	protected Member_Login_LogDao member_login_logDao;

	@Override
	public int insertLog(Member_Login_LogVo mll) {
		return member_login_logDao.insertLog(mll);
	}
}
