package com.member.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.member.dao.Member_InfoDao;
import com.member.vo.Member_InfoVo;
@Service("joinService")
public class JoinServiceImpl implements JoinService {
	@Resource(name="member_infoDao")
	protected Member_InfoDao member_infoDao;
	@Override
	public int joinMember(Member_InfoVo vo) {
		// TODO Auto-generated method stub
		return member_infoDao.joinMember(vo);
	}

	@Override
	public int checkOverId(String mem_id) {
		// TODO Auto-generated method stub
		return member_infoDao.checkOverId(mem_id);
	}

}
