package com.member.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.member.vo.Member_InfoVo;
@Repository("adminDao")
public class AdminDaoImpl implements AdminDao {
	@Inject
	protected SqlSessionTemplate sqlSessionTemplate;
	@Override
	public List<Member_InfoVo> listMemberAll(Map map) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("admin.selectMemberAll", map);
	}

	@Override
	public int deleteMember(int mem_no) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.delete("admin.deleteMember", mem_no);
	}
	@Override
	public int totalRecord(Map map) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("admin.totalRecord", map);
	}

}
