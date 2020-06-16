package com.member.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.member.dao.AdminDao;
import com.member.vo.Member_InfoVo;
@Service("adminService")
public class AdminServiceImpl implements AdminService {
	@Resource(name="adminDao")
	protected AdminDao adminDao;
	
	// 관리자 - 모든 회원 리스트 출력 + 페이징 처리 + 검색 + 정렬
	@Override
	public List<Member_InfoVo> listMemberAll(Map map) {
		return adminDao.listMemberAll(map);
	}

	// 관리자 - 회원 강퇴
	@Override
	public int deleteMember(int mem_no) {
		return adminDao.deleteMember(mem_no);
	}
	
	// 총 페이지 수 구하기
	@Override
	public int totalRecord(Map map) {
		return adminDao.totalRecord(map);
	}
}
