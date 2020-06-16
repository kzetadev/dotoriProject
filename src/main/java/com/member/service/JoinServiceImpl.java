package com.member.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.member.dao.Member_InfoDao;
import com.member.vo.Member_InfoVo;
@Service("joinService")
public class JoinServiceImpl implements JoinService {
	@Resource(name="member_infoDao")
	protected Member_InfoDao member_infoDao;
	//회원가입 서비스
	@Override
	public int joinMember(Member_InfoVo vo) {
		return member_infoDao.joinMember(vo);
	}
	//중복 아이디 체크
	@Override
	public int checkOverId(String mem_id) {
		return member_infoDao.checkOverId(mem_id);
	}
	//닉네임 중복체크
	@Override
	public int checkOverNickName(String mem_nickname) {
		return member_infoDao.checkOverNickName(mem_nickname);
	}
	//이메일 중복 체크
	@Override
	public int checkOverEmail(String mem_email) {
		return member_infoDao.checkOverEmail(mem_email);
	}
	//이메일 인증
	@Override
	public int emailAuth(Member_InfoVo vo) {
		return member_infoDao.emailAuth(vo);
	}


}
