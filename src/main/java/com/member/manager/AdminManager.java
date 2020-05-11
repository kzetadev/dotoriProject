package com.member.manager;

import java.io.Reader;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.member.vo.Member_InfoVo;

public class AdminManager {
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
	// 관리자 - 모든 회원정보 리스트 출력 + 페이징처리 + 검색 + 정렬
	public static List<Member_InfoVo> listMemberAll(HashMap map){
		SqlSession session = factory.openSession();
		List<Member_InfoVo> list = null;
		list = session.selectList("admin.selectMemberAll", map);
		session.close();
		return list;
	}
	// 관리자 - 총 페이지 수 
	public static int totalRecord(HashMap map) {
		int cnt = 0;
		SqlSession session = factory.openSession();
		cnt = session.selectOne("admin.totalRecord", map);
		session.close();
		return cnt;
	}
	// 관리자 - 회원 강퇴
	public static int DeleteMember(int mem_no) {
		SqlSession session = factory.openSession();
		int re = -1;
		re = session.delete("admin.deleteMember", mem_no);
		session.commit();
		session.close();
		return re;
	}
}
