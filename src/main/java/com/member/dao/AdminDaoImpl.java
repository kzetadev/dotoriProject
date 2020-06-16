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
	// 관리자 - 모든 회원 리스트 출력 + 페이징 처리 + 검색 + 정렬
	@Override
	public List<Member_InfoVo> listMemberAll(Map map) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("admin.selectMemberAll", map);
	}
	// 관리자 - 회원 강퇴
	@Override
	public int deleteMember(int mem_no) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.delete("admin.deleteMember", mem_no);
	}
	// 총 페이지 수 구하기
	@Override
	public int totalRecord(Map map) {
		return sqlSessionTemplate.selectOne("admin.totalRecord", map);
	}

}
