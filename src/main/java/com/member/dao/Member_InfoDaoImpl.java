package com.member.dao;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.member.vo.Member_InfoVo;
@Repository("member_infoDao")
public class Member_InfoDaoImpl implements Member_InfoDao {
	@Inject
	protected SqlSessionTemplate sqlSessionTemplate;
	@Override
	public Member_InfoVo login(Member_InfoVo vo) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("mem_info.login", vo);
	}

	@Override
	public int update(Member_InfoVo vo) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.update("mem_info.update", vo);
	}

	@Override
	public int delete(int mem_no) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.delete("mem_info.delete", mem_no);
	}

	@Override
	public int joinMember(Member_InfoVo vo) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.insert("mem_info.insert", vo);
	}

	@Override
	public int changeTempPwd(Member_InfoVo vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int checkOverId(String mem_id) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("mem_info.checkOverId", mem_id);
	}

	@Override
	public int checkOverNickName(String mem_nickname) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("mem_info.checkOverNickname", mem_nickname);
	}
	@Override
	public int checkOverEmail(String mem_email) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("mem_info.checkOverEmail", mem_email);
	}

}
