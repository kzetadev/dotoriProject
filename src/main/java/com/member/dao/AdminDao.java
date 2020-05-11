package com.member.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.member.manager.AdminManager;
import com.member.vo.Member_InfoVo;
@Repository
public class AdminDao {
	// 관리자 - 모든 회원 리스트 출력
	public List<Member_InfoVo> listMemberAll(HashMap map){
		return AdminManager.listMemberAll(map);
	}
	
	// 관리자 - 회원 강퇴
	public int deleteMember(int mem_no) {
		return AdminManager.DeleteMember(mem_no);
	}
}
