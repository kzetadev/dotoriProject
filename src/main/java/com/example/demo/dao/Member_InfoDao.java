package com.example.demo.dao;

import org.springframework.stereotype.Repository;

import com.example.demo.db.Member_InfoManager;
import com.example.demo.vo.Member_InfoVo;

@Repository
public class Member_InfoDao {
	
	private static Member_InfoDao instance;
	//싱글톤 패턴
		public Member_InfoDao() {}
		public static Member_InfoDao getInstance() {
			if(instance == null)
				instance = new Member_InfoDao();
			return instance;
		}
	
	
	public Member_InfoVo login(Member_InfoVo vo) {
		return Member_InfoManager.login(vo);
	}
	public int insert(Member_InfoVo vo) { //회원가입
		return Member_InfoManager.insertJoin(vo);
	}
	public int update(Member_InfoVo vo) {
		return Member_InfoManager.updateMem(vo);
	}
	public int delete(int mem_no) {
		return Member_InfoManager.deleteMem(mem_no);
	}
}
