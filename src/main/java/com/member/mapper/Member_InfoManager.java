package com.member.mapper;

import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.member.vo.Member_InfoVo;

public class Member_InfoManager {
	private static SqlSessionFactory factory;
	static {
		try {
			Reader reader = Resources.getResourceAsReader("com/db/config/sqlMapConfig.xml");
			factory = new SqlSessionFactoryBuilder().build(reader);
			reader.close();
		} catch (Exception e) {
			System.out.println(e.getMessage());
			// TODO: handle exception
		}
	}
	public static Member_InfoVo login(Member_InfoVo vo) {
		Member_InfoVo infovo = null;
		SqlSession session = factory.openSession();
		infovo = session.selectOne("mem_info.login", vo);
		session.close();
		return infovo;
	}
	public static Member_InfoVo selectMember(String username) {
		SqlSession session = factory.openSession();
		Member_InfoVo vo = session.selectOne("mem_info.selectMember", username);
		session.close();
		return vo;
	}
	public static int insertJoin(Member_InfoVo vo) { //회원가입
		int re = -1;
		SqlSession session = factory.openSession();
		re = session.insert("mem_info.insert", vo);
		session.commit();
		session.close();
		return re;
	}
	public static int updateMem(Member_InfoVo vo) { //회원정보 수정
		int re = -1;
		SqlSession session = factory.openSession();
		re = session.update("mem_info.update", vo);
		session.commit();
		session.close();
		return re;
	}
	public static int deleteMem(int mem_no) { //회원 탈퇴
		int re = -1;
		SqlSession session = factory.openSession();
		re = session.delete("mem_info.delete", mem_no);
		session.commit();
		session.close();
		return re;
	}
	public static int chageTempPwd(Member_InfoVo vo) {
		int re = -1;
		SqlSession session = factory.openSession();
		re = session.update("mem_info.changeTempPwd", vo);
		session.commit();
		session.close();
		return re;
	}
	public static int checkOverId(String mem_id) {
		int re = -1;
		SqlSession session = factory.openSession();
		re = session.selectOne("mem_info.checkOverId", mem_id);
		session.close();
		return re;
	}
	// @을 눌렀을때 로그인 하라고 창이 뜨게끔 함
	public static Member_InfoVo isMember(Member_InfoVo i) {
		Member_InfoVo r = null;
		SqlSession session = factory.openSession();
		r = session.selectOne("mem_info.isMember", i);
		session.close();
		return r; 
	}
	
}
